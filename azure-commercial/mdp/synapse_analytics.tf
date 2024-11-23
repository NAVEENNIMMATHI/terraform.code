
resource "azurerm_storage_data_lake_gen2_filesystem" "mdpstodlgfilesystem" {
  name               = "synapsefiles"
  storage_account_id = module.mdp_dls_main.id
}

resource "azurerm_synapse_workspace" "mdpsynapse" {
  name                                 = "saw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name				           = module.mdp_rg_main.resource_group_name
  location							               = module.mdp_rg_main.resource_group_location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.mdpstodlgfilesystem.id
  sql_administrator_login              = "${var.application_acronym}sqladmin01"
  sql_administrator_login_password     = var.mdp_sql_admin_login_password
  managed_virtual_network_enabled      = true
  data_exfiltration_protection_enabled = true
  sql_identity_control_enabled         = true

  aad_admin {
    login     = azuread_group.mdp_synapse_admins.name
    object_id = azuread_group.mdp_synapse_admins.id
    tenant_id = var.tenant_id
  }



  azure_devops_repo {
    account_name    = "CO-AzureCore"
    branch_name     = "main"
    project_name    = "KpmgAdvisoryCloud"
    repository_name = "mdp-synapse"
    root_folder     = "/"
  }

  tags = var.tags
}




resource "azurerm_synapse_sql_pool" "mdpsqldw" {
  name                 = "sql_${var.location_acronym}_${var.application_acronym}_${var.environment_acronym}"
  synapse_workspace_id = azurerm_synapse_workspace.mdpsynapse.id
  sku_name             = var.sypnase_analyticsdev1_performance_level
  create_mode          = "Default"

  tags = var.tags
}

resource "azurerm_synapse_spark_pool" "mdpspark_pool" {
  name                 = "apc${var.location_acronym}${var.application_acronym}${var.environment_acronym}" /* Error: name can contain only letters or numbers, must start with a letter, and be between 1 and 15 characters long */
  synapse_workspace_id = azurerm_synapse_workspace.mdpsynapse.id
  node_size_family     = "MemoryOptimized"
  node_size            = "Medium"
  #cache_size           = 100

  auto_scale {
    max_node_count = 50
    min_node_count = 3
  }
  

  spark_log_folder    = "/logs"
  spark_events_folder = "/events"
  spark_version       = "2.4"


    tags = var.tags
  
}

resource "azurerm_synapse_firewall_rule" "allowAzureservices" {
  name                 = "AllowAllWindowsAzureIps"
  synapse_workspace_id = azurerm_synapse_workspace.mdpsynapse.id
  start_ip_address     = "0.0.0.0"
  end_ip_address       = "0.0.0.0"
}



resource "azurerm_synapse_firewall_rule" "synapse_allow_all" {
  name                 = "AllowAll"
  synapse_workspace_id = azurerm_synapse_workspace.mdpsynapse.id
  start_ip_address     = "0.0.0.0"
  end_ip_address       = "255.255.255.255"
}

resource "azurerm_synapse_firewall_rule" "AKS-Core-Agent" {
  name                 = "AKS-Core-Agentsubnet"
  synapse_workspace_id = azurerm_synapse_workspace.mdpsynapse.id
  start_ip_address     = "10.100.0.0"
  end_ip_address       = "10.100.3.255"
}

resource "azurerm_synapse_firewall_rule" "irrange" {
  name                 = "IRRange"
  synapse_workspace_id = azurerm_synapse_workspace.mdpsynapse.id
  start_ip_address     = "10.51.66.0"
  end_ip_address       = "10.51.66.255"
}


resource "azurerm_synapse_firewall_rule" "WVDranges_0" {
  name                 = "WVDranges_0"
  synapse_workspace_id = azurerm_synapse_workspace.mdpsynapse.id
  start_ip_address     = "20.185.106.213"
  end_ip_address       = "20.185.106.213"
}

resource "azurerm_synapse_firewall_rule" "WVDranges_1" {
  name                 = "WVDranges_1"
  synapse_workspace_id = azurerm_synapse_workspace.mdpsynapse.id
  start_ip_address     = "20.185.109.156"
  end_ip_address       = "20.185.109.156"
}


resource "azurerm_synapse_integration_runtime_azure" "mdp_synpase_integration_runtime" {
  name                 = "AzureIntegratedRuntime"
  synapse_workspace_id = azurerm_synapse_workspace.mdpsynapse.id
  location             = module.mdp_rg_main.resource_group_location
}

/*
resource "azurerm_synapse_managed_private_endpoint" "managedpepfromsawtodls" {
  name                 = "mgd_pep_dls_${var.location_acronym}_${var.application_acronym}_saw_${var.environment_acronym}"
  synapse_workspace_id = azurerm_synapse_workspace.mdpsynapse.id
  target_resource_id   = module.mdp_dls_main.id
  subresource_name     = "blob"
 

  depends_on = [azurerm_synapse_firewall_rule.allowAzureservices,azurerm_synapse_firewall_rule.synapse_allow_all,azurerm_synapse_firewall_rule.AKS-Core-Agent,azurerm_synapse_firewall_rule.irrange,azurerm_synapse_firewall_rule.WVDranges_1,azurerm_synapse_firewall_rule.WVDranges_0]
}

resource "azurerm_synapse_managed_private_endpoint" "managedpepfromsawtokv" {
  name                 = "mgd_pep_kvl_${var.location_acronym}_${var.application_acronym}_saw_${var.environment_acronym}"
  synapse_workspace_id = azurerm_synapse_workspace.mdpsynapse.id
  target_resource_id   = azurerm_key_vault.mdpkv.id
  subresource_name     = "vault"
 
  depends_on = [azurerm_synapse_firewall_rule.allowAzureservices,azurerm_synapse_firewall_rule.synapse_allow_all,azurerm_synapse_firewall_rule.AKS-Core-Agent,azurerm_synapse_firewall_rule.irrange,azurerm_synapse_firewall_rule.WVDranges_1,azurerm_synapse_firewall_rule.WVDranges_0]
}
*/



