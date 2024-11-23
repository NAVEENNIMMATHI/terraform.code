resource "azurerm_storage_data_lake_gen2_filesystem" "kipstodlgfilesystem" {
  name               = "synapsefiles"
  storage_account_id = module.rawandcuratedsa.id
}

resource "azurerm_synapse_workspace" "kipsynapse" {
  name                                 = var.environment == "production" ? "saw${var.location_acronym}${var.application_acronym}${var.environment_acronym}" : "saw${var.location_acronym}${var.application_acronym}${var.environment_acronym}v2"
  resource_group_name				           = module.applicationrg.resource_group_name
  location							               = module.applicationrg.resource_group_location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.kipstodlgfilesystem.id
  sql_administrator_login              = "${var.application_acronym}sqladmin01"
  sql_administrator_login_password     = var.sqlserveradmin_password
  managed_virtual_network_enabled      = true
  data_exfiltration_protection_enabled = false
  sql_identity_control_enabled         = false

  azure_devops_repo {
    account_name    = "CO-AzureCore"
    branch_name     = "main"
    project_name    = "KpmgAdvisoryCloud"
    repository_name = "kip-synapse"
    root_folder     = "/"
  }

  tags								                 = var.tags
}

resource "azurerm_synapse_sql_pool" "kipsqldw" {
  name                 = var.environment == "production" ? "ssp${var.location_acronym}${var.application_acronym}" : "ssp${var.location_acronym}${var.application_acronym}${var.environment_acronym}v2"
  synapse_workspace_id = azurerm_synapse_workspace.kipsynapse.id
  sku_name             = var.kip_synapse_dwh_performance_level
  create_mode          = "Default"
  
  tags								 = var.tags
}

resource "azurerm_synapse_sql_pool" "tpddwh" {
  count                = var.environment == "development" || var.environment == "production" ? "1" : "0"
  name                 = "sspusekiptpd"
  synapse_workspace_id = azurerm_synapse_workspace.kipsynapse.id
  sku_name             = var.thirdpartydata_synapse_dwh_performance_level
  create_mode          = "Default"
  
  tags								 = var.tags
}

resource "azurerm_synapse_sql_pool" "kpddwh" {
  count                = var.environment == "production" ? "1" : "0"
  name                 = "sspusekipkpd"
  synapse_workspace_id = azurerm_synapse_workspace.kipsynapse.id
  sku_name             = var.kpmgproprietarydata_synapse_dwh_performance_level
  create_mode          = "Default"
  
  tags								 = var.tags
}

resource "azurerm_synapse_spark_pool" "spark" {
  name                 = var.environment == "production" ? "sqp${var.location_acronym}${var.application_acronym}" : "sqp${var.location_acronym}${var.application_acronym}${var.environment_acronym}"
  synapse_workspace_id = azurerm_synapse_workspace.kipsynapse.id
  node_size_family     = "MemoryOptimized"
  node_size            = "Medium"
  
  auto_scale {
    max_node_count = 20
    min_node_count = 3
  }

  tags                 = var.tags
}

resource "azurerm_synapse_integration_runtime_self_hosted" "kipsyn_ir_self_hosted" {
  name                 = "Self-hosted"
  synapse_workspace_id = azurerm_synapse_workspace.kipsynapse.id
}

####Private DNS Zone#####
data "azurerm_private_dns_zone" "synapse_private_link_file" {
  name                = "privatelink.dev.azuresynapse.net"
  resource_group_name = var.private_dns_zone_resource_group
  provider            = azurerm.dnscore
}

resource "azurerm_key_vault_access_policy" "synapsePolicy" {
  key_vault_id = module.keyvaultapplication.key_vault_id
  tenant_id = var.tenant_id
  object_id = azurerm_synapse_workspace.kipsynapse.identity[0].principal_id
  secret_permissions = ["Get",] 
}
resource "azurerm_private_endpoint" "synapse" {
  name                = lower("synapse-${var.location_acronym}-pe-${var.application_acronym}-${var.environment_acronym}")
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  subnet_id           = module.privatelinksubnet.subnet_id
  private_service_connection {
    name                           = lower("datavault-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
    private_connection_resource_id = azurerm_synapse_workspace.kipsynapse.id
    subresource_names              = ["Dev"]#,"file","queue","table","web"]
    is_manual_connection           = false
  }
  private_dns_zone_group     {
    name                           = "privatelink.dev.azuresynapse.net"
    private_dns_zone_ids           = [data.azurerm_private_dns_zone.synapse_private_link_file.id]
     
  }
  tags               = var.tags
}

/*
# Synapse Administrator
resource "azurerm_synapse_workspace_aad_admin" "synapse_admin" {
  synapse_workspace_id = azurerm_synapse_workspace.kipsynapse.id
  login                = azuread_group.SynapseAdministrators.display_name
  object_id            = azuread_group.SynapseAdministrators.object_id
  tenant_id            = var.tenant_id
}
*/

# Synapse Firewall Rules
resource "azurerm_synapse_firewall_rule" "AzureServicesEnable" {
  name                 = "AllowAllWindowsAzureIps"
  synapse_workspace_id = azurerm_synapse_workspace.kipsynapse.id
  start_ip_address     = "0.0.0.0"
  end_ip_address       = "0.0.0.0"
}

resource "azurerm_synapse_firewall_rule" "workstationsubnetfirewall" {
  name                 = "AllowWorkstation"
  synapse_workspace_id = azurerm_synapse_workspace.kipsynapse.id
  start_ip_address     = var.synapseStartRange
  end_ip_address       = var.synapseEndRange
}

resource "azurerm_synapse_firewall_rule" "AllowKPMGVPN" {
  name                 = "AllowKPMGVPN"
  synapse_workspace_id = azurerm_synapse_workspace.kipsynapse.id
  start_ip_address     = "199.207.253.0"
  end_ip_address       = "199.207.253.255"
}

resource "azurerm_synapse_firewall_rule" "AllowKGS" {
  name                 = "AllowKGS"
  synapse_workspace_id = azurerm_synapse_workspace.kipsynapse.id
  start_ip_address     = "103.58.118.0"
  end_ip_address       = "103.58.118.255"
}

resource "azurerm_synapse_firewall_rule" "AllowAZFWPublicIP" {
  count                = length(var.AZFW_PIP)
  name                 = "AllowAZFWPublicIP${count.index}"
  synapse_workspace_id = azurerm_synapse_workspace.kipsynapse.id
  start_ip_address     = var.AZFW_PIP[count.index]
  end_ip_address       = var.AZFW_PIP[count.index]
}

# Role Assignments
resource "azurerm_synapse_role_assignment" "SynapseCredentialUsers" {
  synapse_workspace_id = azurerm_synapse_workspace.kipsynapse.id
  role_name            = "Synapse Credential User"
  principal_id         = azuread_group.SynapseCredentialUsers.object_id
  depends_on = [azurerm_synapse_firewall_rule.AzureServicesEnable,azurerm_synapse_firewall_rule.AllowAZFWPublicIP]
}

resource "azurerm_synapse_role_assignment" "SynapseAdministrators" {
  synapse_workspace_id = azurerm_synapse_workspace.kipsynapse.id
  role_name            = "Synapse Administrator"
  principal_id         = azuread_group.SynapseAdministrators.object_id
  depends_on = [azurerm_synapse_firewall_rule.AzureServicesEnable,azurerm_synapse_firewall_rule.AllowAZFWPublicIP]
}

resource "azurerm_synapse_role_assignment" "SynapseContributors" {
  synapse_workspace_id = azurerm_synapse_workspace.kipsynapse.id
  role_name            = "Synapse Contributor"
  principal_id         = azuread_group.SynapseContributors.object_id
  depends_on = [azurerm_synapse_firewall_rule.AzureServicesEnable,azurerm_synapse_firewall_rule.AllowAZFWPublicIP]
}

resource "azurerm_synapse_role_assignment" "SynapseComputeOperators" {
  synapse_workspace_id = azurerm_synapse_workspace.kipsynapse.id
  role_name            = "Synapse Compute Operator"
  principal_id         = azuread_group.SynapseComputeOperators.object_id
  depends_on = [azurerm_synapse_firewall_rule.AzureServicesEnable,azurerm_synapse_firewall_rule.AllowAZFWPublicIP]
}

resource "azurerm_synapse_role_assignment" "SynapseSQLAdministrator" {
  synapse_workspace_id = azurerm_synapse_workspace.kipsynapse.id
  role_name            = "Synapse SQL Administrator"
  principal_id         = azuread_group.SynapseSQLAdministrator.object_id
  depends_on = [azurerm_synapse_firewall_rule.AzureServicesEnable,azurerm_synapse_firewall_rule.AllowAZFWPublicIP]
}

resource "azurerm_role_assignment" "SynapseWorkSpaceContributor" {
  scope  = module.rawandcuratedsa.id
  role_definition_name = "Contributor"
  principal_id = azurerm_synapse_workspace.kipsynapse.identity[0].principal_id
  depends_on = [azurerm_synapse_firewall_rule.AzureServicesEnable,azurerm_synapse_firewall_rule.AllowAZFWPublicIP]
}

resource "azurerm_role_assignment" "SynapseWorkspaceBlobDataContributor" {
  scope  = module.rawandcuratedsa.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id = azurerm_synapse_workspace.kipsynapse.identity[0].principal_id
  depends_on = [azurerm_synapse_firewall_rule.AzureServicesEnable,azurerm_synapse_firewall_rule.AllowAZFWPublicIP]
}