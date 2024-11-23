resource "azurerm_app_service_plan" "asp_general_fap" {
  name                         = "asp-${var.location_acronym}-${var.application_acronym}-func-${var.environment_acronym}"
  resource_group_name          = module.mdp_rg_main.resource_group_name
  location                     = module.mdp_rg_main.resource_group_location
  kind                         = "FunctionApp"
  maximum_elastic_worker_count = 1
  

  tags                         = var.tags
  

  sku {
    capacity = 1
    size     = var.app_service_plan_size
    tier     = var.app_service_plan_tier
    
  }

  timeouts {
    create = "3h"
    delete = "120m"
  }
}

resource "azurerm_app_service_plan" "asp_avscan_fap" {
  name                         = "asp-${var.location_acronym}-${var.application_acronym}-avfap-${var.environment_acronym}"
  resource_group_name          = module.mdp_rg_main.resource_group_name
  location                     = module.mdp_rg_main.resource_group_location
  kind                         = "FunctionApp"
  maximum_elastic_worker_count = 1
  

  tags                         = var.tags
  

  sku {
    capacity = 1
    size     = var.app_service_plan_size
    tier     = var.app_service_plan_tier
    
  }

  timeouts {
    create = "3h"
    delete = "120m"
  }
}

#App Service Plan for Clamav

resource "azurerm_app_service_plan" "asp_avscan_wap" {
  name                         = "asp-${var.location_acronym}-${var.application_acronym}-avwap-${var.environment_acronym}"
  resource_group_name          = module.mdp_rg_main.resource_group_name
  location                     = module.mdp_rg_main.resource_group_location
  kind                         = "Linux"
  reserved = true
  maximum_elastic_worker_count = 1

  tags                         = var.tags

  sku {
    capacity = 1
    size     = var.app_service_plan_size
    tier     = var.app_service_plan_tier
    
  }

  timeouts {
     create = "3h"
     delete = "120m"
   }
}

#App Service Plan for App Integration

resource "azurerm_app_service_plan" "asp_appintg" {
  name                         = "asp-${var.location_acronym}-${var.application_acronym}-appintg-${var.environment_acronym}"
  resource_group_name          = module.mdp_rg_main.resource_group_name
  location                     = module.mdp_rg_main.resource_group_location
  kind                         = "App"
  reserved                     = false
  maximum_elastic_worker_count = 1

  tags                         = var.tags

  sku {
    capacity = 1
    size     = var.app_service_plan_size
    tier     = var.app_service_plan_tier
    
  }

  timeouts {
     create = "3h"
     delete = "120m"
   }
}