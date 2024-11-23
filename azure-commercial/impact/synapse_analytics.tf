
resource "azurerm_storage_data_lake_gen2_filesystem" "impactfilesystem" {
  name               = "synapsefiles"
  storage_account_id = module.impactdatalake01sa.id
}
resource "azurerm_synapse_workspace" "impact_synapse" {
  name                                 = "saw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name                  = module.impact_rg.resource_group_name
  location                             = module.impact_rg.resource_group_location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.impactfilesystem.id
  sql_administrator_login              = "${var.application_acronym}sqladmin01"
  sql_administrator_login_password     = var.sql_server_admin_password
  managed_virtual_network_enabled      = true
  data_exfiltration_protection_enabled = false
  sql_identity_control_enabled         = false

  tags = var.tags
}

# Spark

resource "azurerm_synapse_spark_pool" "sparkpool1" {
  name                 = "asp${var.location_acronym}${var.application_acronym}${var.environment_acronym}"
  synapse_workspace_id = azurerm_synapse_workspace.impact_synapse.id
  node_size_family     = "MemoryOptimized"
  node_size            = "Medium"

  auto_scale {
    max_node_count = 20
    min_node_count = 3
  }

  tags = var.tags
}

# Synapse Firewall Rules

resource "azurerm_synapse_firewall_rule" "AzureServicesEnable" {
  name                 = "AllowAllWindowsAzureIps"
  synapse_workspace_id = azurerm_synapse_workspace.impact_synapse.id
  start_ip_address     = "0.0.0.0"
  end_ip_address       = "0.0.0.0"
}


resource "azurerm_synapse_firewall_rule" "AllowKPMGVPN" {
  name                 = "AllowKPMGVPN"
  synapse_workspace_id = azurerm_synapse_workspace.impact_synapse.id
  start_ip_address     = "199.207.253.0"
  end_ip_address       = "199.207.253.255"
}

resource "azurerm_synapse_firewall_rule" "AllowKPMGVPN2" {
  name                 = "AllowKPMGVPN2"
  synapse_workspace_id = azurerm_synapse_workspace.impact_synapse.id
  start_ip_address     = "199.206.0.0"
  end_ip_address       = "199.206.0.255"
}

resource "azurerm_synapse_firewall_rule" "AllowKGS" {
  name                 = "AllowKGS"
  synapse_workspace_id = azurerm_synapse_workspace.impact_synapse.id
  start_ip_address     = "103.58.118.0"
  end_ip_address       = "103.58.118.255"
}

resource "azurerm_synapse_firewall_rule" "AllowAZFWPublicIP" {
  count                = length(var.AZFW_PIP)
  name                 = "AllowAZFWPublicIP${count.index}"
  synapse_workspace_id = azurerm_synapse_workspace.impact_synapse.id
  start_ip_address     = var.AZFW_PIP[count.index]
  end_ip_address       = var.AZFW_PIP[count.index]
}
# Role Assignments
resource "azurerm_synapse_role_assignment" "SynapseCredentialUsers" {
  synapse_workspace_id = azurerm_synapse_workspace.impact_synapse.id
  role_name            = "Synapse Credential User"
  principal_id         = azuread_group.SynapseCredentialUsers.object_id
  depends_on = [azurerm_synapse_firewall_rule.AzureServicesEnable,azurerm_synapse_firewall_rule.AllowAZFWPublicIP]
}

resource "azurerm_synapse_role_assignment" "SynapseAdministrators" {
  synapse_workspace_id = azurerm_synapse_workspace.impact_synapse.id
  role_name            = "Synapse Administrator"
  principal_id         = azuread_group.SynapseAdministrators.object_id
  depends_on = [azurerm_synapse_firewall_rule.AzureServicesEnable,azurerm_synapse_firewall_rule.AllowAZFWPublicIP]
}

resource "azurerm_synapse_role_assignment" "SynapseContributors" {
  synapse_workspace_id = azurerm_synapse_workspace.impact_synapse.id
  role_name            = "Synapse Contributor"
  principal_id         = azuread_group.SynapseContributors.object_id
  depends_on = [azurerm_synapse_firewall_rule.AzureServicesEnable,azurerm_synapse_firewall_rule.AllowAZFWPublicIP]
}

resource "azurerm_synapse_role_assignment" "SynapseComputeOperators" {
  synapse_workspace_id = azurerm_synapse_workspace.impact_synapse.id
  role_name            = "Synapse Compute Operator"
  principal_id         = azuread_group.SynapseComputeOperators.object_id
  depends_on = [azurerm_synapse_firewall_rule.AzureServicesEnable,azurerm_synapse_firewall_rule.AllowAZFWPublicIP]
}

resource "azurerm_synapse_role_assignment" "SynapseSQLAdministrator" {
  synapse_workspace_id = azurerm_synapse_workspace.impact_synapse.id
  role_name            = "Synapse SQL Administrator"
  principal_id         = azuread_group.SynapseSQLAdministrator.object_id
  depends_on = [azurerm_synapse_firewall_rule.AzureServicesEnable,azurerm_synapse_firewall_rule.AllowAZFWPublicIP]
}

resource "azurerm_role_assignment" "SynapseWorkSpaceContributor" {
  scope                = module.impactfiledata01sa.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_synapse_workspace.impact_synapse.identity[0].principal_id
  depends_on = [azurerm_synapse_firewall_rule.AzureServicesEnable,azurerm_synapse_firewall_rule.AllowAZFWPublicIP, module.impactfiledata01sa]
}

resource "azurerm_role_assignment" "SynapseWorkspaceBlobDataContributor" {
  scope                = module.impactfiledata01sa.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_synapse_workspace.impact_synapse.identity[0].principal_id
  depends_on = [azurerm_synapse_firewall_rule.AzureServicesEnable,azurerm_synapse_firewall_rule.AllowAZFWPublicIP, module.impactfiledata01sa]
}

resource "azurerm_monitor_diagnostic_setting" "impact_synapse_diag" {
  name                       = "diagnostic-settings1"
  target_resource_id         = azurerm_synapse_workspace.impact_synapse.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id

  log {
    category = "SynapseRBACOperations"
    retention_policy {
      enabled = true
      days    = 90
    }
  }
  log {
    category = "GatewayApiRequests"
    retention_policy {
      enabled = true
      days    = 90
    }
  }
  log {
    category = "BuiltinSqlReqsEnded"
    retention_policy {
      enabled = true
      days    = 90
    }
  }
  log {
    category = "IntegrationPipelineRuns"
    retention_policy {
      enabled = true
      days    = 90
    }
  }
  log {
    category = "IntegrationActivityRuns"
    retention_policy {
      enabled = true
      days    = 90
    }
  }
  log {
    category = "IntegrationTriggerRuns"
    retention_policy {
      enabled = true
      days    = 90
    }
  }
  log {
    category = "SynapseLinkEvent"
    retention_policy {
      enabled = true
      days    = 90
    }
  }
}
