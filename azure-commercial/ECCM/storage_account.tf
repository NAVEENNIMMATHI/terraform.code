
### Storage account for ECCM - Logic App 
resource "azurerm_storage_account" "eccm_app"{
  #source                            = "../../modules/storage_account"
  name                              = "sto${var.location_acronym}${var.application_acronym}lap${var.environment_acronym}"
  resource_group_name               = module.eccm_rg.resource_group_name
  location                          = var.resource_location
  account_tier                      = "Standard"
  account_replication_type          = "LRS"
  account_kind                      = "StorageV2"
  is_hns_enabled                    = "true"

  identity {
    type = "SystemAssigned"
  }

  network_rules {
    default_action                    = "Allow"
  #  virtual_network_subnet_ids        = [module.eccm_lap_pvt_subnet.subnet_id]
  }
 
  tags = var.tags
}

##Storage Queues
resource "azurerm_storage_queue" "lap_email" {
  name                 = "emailccmqueue"
  storage_account_name = azurerm_storage_account.eccm_app.name
}

resource "azurerm_storage_queue" "lap_report" {
  name                 = "reportmanagerqueue"
  storage_account_name = azurerm_storage_account.eccm_app.name
}

# Storge account ECCM - Ethics Case Study
resource "azurerm_storage_account" "eccm_cstr"{
  #source                            = "../../modules/storage_account"
  name                              = "sto${var.location_acronym}${var.application_acronym}${var.environment_acronym}"
  resource_group_name               = module.eccm_rg.resource_group_name
  location                          = var.resource_location
  account_tier                      = "Standard"
  account_replication_type          = "LRS"
  account_kind                      = "StorageV2"
  is_hns_enabled                    = "true"

  identity {
    type = "SystemAssigned"
  }

  network_rules {
    default_action                    = "Allow"
    # virtual_network_subnet_ids        = [module.eccm_pep_subnet.subnet_id]
  }
 
  #tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "stg_app_diag" {
  name                       = "stg${var.location_acronym }${var.application_acronym}-app-${var.environment_acronym}-diag"
  target_resource_id         = azurerm_storage_account.eccm_app.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id
  log_analytics_destination_type = "AzureDiagnostics"
 

   metric {
     category = "AllMetrics"

     retention_policy {
       enabled = false
     }
   }
    lifecycle {
     ignore_changes = [
       metric,
       log_analytics_destination_type
     ]
   }

}


resource "azurerm_monitor_diagnostic_setting" "stg_eccmdiag" {
  name                       = "stg${var.location_acronym }${var.application_acronym}-eccm-${var.environment_acronym}-diag"
  target_resource_id         = azurerm_storage_account.eccm_cstr.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.spoke_law.id
  log_analytics_destination_type = "AzureDiagnostics"
 

   metric {
     category = "AllMetrics"

     retention_policy {
       enabled = false
     }
   }
    lifecycle {
     ignore_changes = [
       metric,
       log_analytics_destination_type
     ]
   }

}

