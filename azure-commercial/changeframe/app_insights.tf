resource "azurerm_application_insights" "app_insights_test" {
  count               = var.restrict_gateway_endpoint == "true" ? 0 : 1
  
  name                = var.app_service_name_test
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  application_type    = "web"
  retention_in_days   = 90
  sampling_percentage = 0

  tags                = var.tags
  
}

module "app_insights_final" {
  source                    = "../../modules/application_insights"
  name                      = var.app_service_name_final
  resource_group_name       = module.applicationrg.resource_group_name
  location                  = module.applicationrg.resource_group_location

  tags                      = var.tags
}

module "app_insights_fun_app" {
  source                    = "../../modules/application_insights"
  name                      = "fun-usc-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
  resource_group_name       = module.applicationrg.resource_group_name
  location                  = module.applicationrg.resource_group_location

  tags                      = var.tags
}

module "app_insights_java_converter" {
  source                    = "../../modules/application_insights"
  name                      = "fun-use-${lower(var.application_acronym)}-java-${lower(var.environment_acronym)}"
  resource_group_name       = module.applicationrg.resource_group_name
  location                  = module.applicationrg.resource_group_location

  tags                      = var.tags
}