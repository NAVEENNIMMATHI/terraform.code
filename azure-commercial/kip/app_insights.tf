resource "azurerm_application_insights" "app_insights_kip" {
  name                = var.environment == "production" ? "ais-use-kip-kip" : "ais-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  application_type    = "web"
  retention_in_days   = 90
  sampling_percentage = 0

  tags                = var.tags

}
resource "azurerm_application_insights" "app_insights_kiprest" {
  name                = var.environment == "production" ? "ais-use-kip-kiprest" : "ais-${var.location_acronym}-${var.application_acronym}-rest-${var.environment_acronym}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  application_type    = "web"
  retention_in_days   = 90
  sampling_percentage = 0

  tags                = var.tags
}
resource "azurerm_application_insights" "app_insights_mep-kip" {
  name                = var.environment == "production" ? "ais-use-kip-mep-kip" : "ais-${var.location_acronym}-${var.application_acronym}-mep-${var.environment_acronym}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  application_type    = "web"
  retention_in_days   = 90
  sampling_percentage = 0

  tags                = var.tags

}
resource "azurerm_application_insights" "app_insights_meprest-kip" {
  name                = var.environment == "production" ? "ais-use-kip-meprest-kip" : "ais-${var.location_acronym}-${var.application_acronym}-meprest-${var.environment_acronym}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  application_type    = "web"
  retention_in_days   = 90
  sampling_percentage = 0
  
  tags                = var.tags
}

resource "azurerm_application_insights" "app_insights_funapp" {
  name                = var.environment == "production" ? "fun-use-kip-pd" : "ais-${var.location_acronym}-${var.application_acronym}-funapp-${var.environment_acronym}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  application_type    = "web"
  retention_in_days   = 90
  sampling_percentage = 0
  
  tags                = var.tags
}