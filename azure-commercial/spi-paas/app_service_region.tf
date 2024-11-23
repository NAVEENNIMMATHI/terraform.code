resource "azurerm_app_service" "appservice_spipaasrepgenrest" {
  for_each = var.appservice
    name                             = "${var.application_name}repgenrest${each.value.region}${var.app_url_acronym}"
    location                         = module.applicationrg[each.key].resource_group_location
    resource_group_name              = module.applicationrg[each.key].resource_group_name
    app_service_plan_id              = azurerm_app_service_plan.appserviceplan[each.key].id
    https_only                       = "true"
    client_affinity_enabled          = true

    identity {
        type                         = "SystemAssigned"
    }

    backup {
        enabled                      = true
        name                         = "${var.application_name}repgenrest${each.value.region}${var.app_url_acronym}"
        storage_account_url          = "${module.spipaaswebappbackup01sa[each.key].primary_blob_endpoint}${azurerm_storage_container.webappbackup_container[each.key].name}/${data.azurerm_storage_account_sas.storage_account_sas[each.key].sas}"

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

resource "azurerm_app_service_virtual_network_swift_connection" "appservice_spipaasrepgenrest" {
  for_each = var.appservice
  app_service_id = azurerm_app_service.appservice_spipaasrepgenrest[each.key].id
  subnet_id      = azurerm_subnet.spipaasvnetint_subnet[each.key].id
}