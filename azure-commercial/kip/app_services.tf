resource "azurerm_app_service" "appservice_kip" {
    name                            = "kip${var.app_url_acronym}"
    location                        = module.applicationrg.resource_group_location
    resource_group_name             = module.applicationrg.resource_group_name
    app_service_plan_id             = azurerm_app_service_plan.appserviceplan.id
    https_only                      = "false"
    client_affinity_enabled         = true
    
    identity {
        type                        = "SystemAssigned"
    }

    backup {
        enabled                      = true
        name                         = "kip${var.app_url_acronym}"
        storage_account_url          = "${module.webappbackupsa.primary_blob_endpoint}${azurerm_storage_container.webappbackup.name}/${data.azurerm_storage_account_sas.storage_account_sas.sas}"

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

resource "azurerm_app_service" "appservice_kiprest" {
    name                             = "kiprest${var.app_url_acronym}"
    location                         = module.applicationrg.resource_group_location
    resource_group_name              = module.applicationrg.resource_group_name
    app_service_plan_id              = azurerm_app_service_plan.appserviceplan.id
    https_only                       = "false"
    client_affinity_enabled          = true

    identity {
        type                         = "SystemAssigned"
    }

    backup {
        enabled                      = true
        name                         = "kiprest${var.app_url_acronym}"
        storage_account_url          = "${module.webappbackupsa.primary_blob_endpoint}${azurerm_storage_container.webappbackup.name}/${data.azurerm_storage_account_sas.storage_account_sas.sas}"

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

resource "azurerm_app_service" "appservice_mep-kip" {
    name                             = "mep-kip${var.app_url_acronym}"
    location                         = module.applicationrg.resource_group_location
    resource_group_name              = module.applicationrg.resource_group_name
    app_service_plan_id              = azurerm_app_service_plan.appserviceplan.id
    https_only                       = "false"
    client_affinity_enabled          = true

    backup {
        enabled                      = true
        name                         = "mep-kip${var.app_url_acronym}"
        storage_account_url          = "${module.webappbackupsa.primary_blob_endpoint}${azurerm_storage_container.webappbackup.name}/${data.azurerm_storage_account_sas.storage_account_sas.sas}"

        schedule {
            frequency_interval       = 1
            frequency_unit           = "Day"
            keep_at_least_one_backup = true
            retention_period_in_days = 10
            start_time               = "2020-06-15T17:13:47Z"
        }
    }
        
    identity {
        type                         = "SystemAssigned"
    }

    tags                             = var.tags

#    lifecycle {
#        ignore_changes = [
#            backup
#        ]
#    }
}

resource "azurerm_app_service" "appservice_meprest-kip" {
    name                             = "meprest-kip${var.app_url_acronym}"
    location                         = module.applicationrg.resource_group_location
    resource_group_name              = module.applicationrg.resource_group_name
    app_service_plan_id              = azurerm_app_service_plan.appserviceplan.id
    https_only                       = "false"
    client_affinity_enabled          = true

    backup {
        enabled                      = true
        name                         = "meprest-kip"
        storage_account_url          = "${module.webappbackupsa.primary_blob_endpoint}${azurerm_storage_container.webappbackup.name}/${data.azurerm_storage_account_sas.storage_account_sas.sas}"

        schedule {
            frequency_interval       = 1
            frequency_unit           = "Day"
            keep_at_least_one_backup = true
            retention_period_in_days = 10
            start_time               = "2020-06-16T00:58:39Z"
        }
    }
        
    identity {
        type                         = "SystemAssigned"
    }

    tags                             = var.tags

#    lifecycle {
#        ignore_changes = [
#            backup
#        ]
#    }
}