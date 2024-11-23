resource "azurerm_app_service" "appservice_bmpfa" {
    name                            = "bmpfa${var.app_url_acronym}"
    location                        = module.applicationrg.resource_group_location
    resource_group_name             = module.applicationrg.resource_group_name
    app_service_plan_id             = azurerm_app_service_plan.appserviceplan.id
    https_only                      = "true"
    client_affinity_enabled         = true
    
    identity {
        type                        = "SystemAssigned"
    }

    tags                             = var.tags

#    lifecycle {
#        ignore_changes = [
#            backup
#        ]
#    }    
}