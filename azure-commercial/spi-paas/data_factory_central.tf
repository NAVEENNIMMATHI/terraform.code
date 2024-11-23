resource "azurerm_data_factory" "spipaasadf_central" {
  name                          = "dtf-${var.location_acronym}-${var.application_acronym}-central-${var.environment_acronym}"
  resource_group_name           = module.applicationrg_central.resource_group_name
  location                      = module.applicationrg_central.resource_group_location
  managed_virtual_network_enabled = true
  identity {
    type                        = "SystemAssigned"
  }

 global_parameter {
    name  = "SPI_Analytics_Database" 
    type  = "String"
    value = "SPI_Analytics"
  }
  global_parameter {
    name  = "SPI_App_Server" 
    type  = "String"
    value = module.sqlserver01_central.sql_server_fqdn
  }
   global_parameter {
    name  = "SPI_SMTP_Server" 
    type  = "String"
    value = "smtpoutdmz.us.kworld.kpmg.com"
  }
  global_parameter {
    name  = "SPI_SSIS_EmailServer" 
    type  = "String"
    value = "tcp:srv-${var.location_acronym}-${var.application_acronym}-us-app-${var.environment_acronym}.database.windows.net,1433"
  }
 depends_on = [module.sqlserver01_central]
tags                   		    = var.tags
}

resource "azurerm_data_factory_integration_runtime_azure" "azureintegrationr_spipaas_us" {
  name                = "AZURE-IR-SPIPAAS-US"
  data_factory_name   = azurerm_data_factory.spipaasadf_central.name
  resource_group_name = module.applicationrg_central.resource_group_name
  location            = "AutoResolve"
  core_count          = "32"
  time_to_live_min    = "10"
  virtual_network_enabled = true
}


resource "azurerm_data_factory_integration_runtime_azure_ssis" "spipaas_azureIR" {
  for_each = var.sql_server_app
  name                = "SSIS-IR-SPIPAAS-${upper(each.value.region)}"
  data_factory_name   = azurerm_data_factory.spipaasadf_central.name
  resource_group_name = module.applicationrg_central.resource_group_name
  location            = "${each.value.location}"
  node_size = "Standard_D32_v3"
  number_of_nodes = "2"
  max_parallel_executions_per_node = "10"
  edition = "Standard"
  license_type ="BasePrice"

 catalog_info {
   server_endpoint    = module.sqlserverapp[each.key].sql_server_fqdn
   pricing_tier       ="S1"
  }
  vnet_integration {
    vnet_id           = azurerm_virtual_network.virtual_network[each.key].id
    subnet_name       = azurerm_subnet.spipaasssis_subnet[each.key].name
    public_ips        = [azurerm_public_ip.ssis_pip1[each.key].id,azurerm_public_ip.ssis_pip2[each.key].id]
  }
  depends_on = [ azurerm_public_ip.ssis_pip1,azurerm_subnet.spipaasssis_subnet,azurerm_public_ip.ssis_pip2 ]
}

resource "azurerm_monitor_diagnostic_setting" "spipaasadf_central_logs" {
  name               = "settings1"
  target_resource_id = azurerm_data_factory.spipaasadf_central.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.central_loganalytics.id

  log {
    category = "ActivityRuns"
    retention_policy {
      enabled = true
      days=90
    }
  }
   log {
    category = "PipelineRuns"
    retention_policy {
      enabled = true
      days=90
    }
  }
   log {
    category = "TriggerRuns"
    retention_policy {
      enabled = true
      days=90
    }
  }
   log {
    category = "SandboxPipelineRuns"
    retention_policy {
      enabled = true
      days=90
    }
  }
   log {
    category = "SandboxActivityRuns"
    retention_policy {
      enabled = true
      days=90
    }
  }
   log {
    category = "SSISPackageEventMessages"
    retention_policy {
      enabled = true
      days=90
    }
  }
log {
    category = "SSISPackageExecutableStatistics"
    retention_policy {
      enabled = true
      days=90
    }
  }
  log {
    category = "SSISPackageEventMessageContext"
    retention_policy {
      enabled = true
      days=90
    }
  }
  log {
    category = "SSISPackageExecutionComponentPhases"
    retention_policy {
      enabled = true
      days=90
    }
  }
  log {
    category = "SSISPackageExecutionDataStatistics"
    retention_policy {
      enabled = true
      days=90
    }
  }
   log {
    category = "SSISIntegrationRuntimeLogs"
    retention_policy {
      enabled = true
      days=90
    }
  }
  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
      days=90
    }
  }
}