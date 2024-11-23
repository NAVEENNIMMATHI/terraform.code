resource "azurerm_app_service" "appservice_spipaas_central" {
    name                            = "${var.application_name}${var.app_url_acronym}"
    location                        = module.applicationrg_central.resource_group_location
    resource_group_name             = module.applicationrg_central.resource_group_name
    app_service_plan_id             = azurerm_app_service_plan.appserviceplan_central.id
    https_only                      = "true"
    client_affinity_enabled         = true
    
    identity {
        type                        = "SystemAssigned"
    }

    backup {
        enabled                      = true
        name                         = "${var.application_name}${var.app_url_acronym}"
        storage_account_url          = "${module.spipaascentralwebappbackup01sa.primary_blob_endpoint}${azurerm_storage_container.webappbackup_central.name}/${data.azurerm_storage_account_sas.storage_account_sas_central.sas}"

        schedule {
            frequency_interval       = 1
            frequency_unit           = "Day"
            keep_at_least_one_backup = true
            retention_period_in_days = 10
            start_time               = "2020-06-15T17:11:45Z"
        }
    }

    tags                             = var.tags

#    lifecycle {
#        ignore_changes = [
#            backup
#        ]
#    }    
}

resource "azurerm_app_service_virtual_network_swift_connection" "appservice_spipaas_central" {
  app_service_id = azurerm_app_service.appservice_spipaas_central.id
  subnet_id      = azurerm_subnet.spipaasvnetint_subnet_central.id
}

resource "azurerm_app_service" "appservice_spipaasrest_central" {
    name                             = "${var.application_name}rest${var.app_url_acronym}"
    location                         = module.applicationrg_central.resource_group_location
    resource_group_name              = module.applicationrg_central.resource_group_name
    app_service_plan_id              = azurerm_app_service_plan.appserviceplan_central.id
    https_only                       = "true"
    client_affinity_enabled          = true

    identity {
        type                         = "SystemAssigned"
    }

    backup {
        enabled                      = true
        name                         = "${var.application_name}rest${var.app_url_acronym}"
        storage_account_url          = "${module.spipaascentralwebappbackup01sa.primary_blob_endpoint}${azurerm_storage_container.webappbackup_central.name}/${data.azurerm_storage_account_sas.storage_account_sas_central.sas}"

        schedule {
            frequency_interval       = 1
            frequency_unit           = "Day"
            keep_at_least_one_backup = true
            retention_period_in_days = 10
            start_time               = "2020-06-15T17:12:16Z"
        }
    }

    tags                             = var.tags

#    lifecycle {
#        ignore_changes = [
#            backup
#        ]
#    }
}

resource "azurerm_app_service_virtual_network_swift_connection" "appservice_spipaasrest_central" {
  app_service_id = azurerm_app_service.appservice_spipaasrest_central.id
  subnet_id      = azurerm_subnet.spipaasvnetint_subnet_central.id
}