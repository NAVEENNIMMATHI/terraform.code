resource "azurerm_application_insights" "app_insights_test" {
  name                = "${lower(var.application_acronym)}${lower(var.environment_type_test)}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  application_type    = "web"
  retention_in_days   = 90
  sampling_percentage = 0
  tags                = var.tags
  count               = var.restrict_gateway_endpoint == "true" ? 0 : 1
}
resource "azurerm_application_insights" "app_insights_final" {
  name                = "${lower(var.application_acronym)}${lower(var.environment_type_final)}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  application_type    = "web"
  retention_in_days   = 90
  sampling_percentage = 0
  tags                = var.tags
}
resource "azurerm_application_insights" "app_insights_umt_test" {
  name                = "umt${lower(var.environment_type_test)}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  application_type    = "web"
  retention_in_days   = 90
  sampling_percentage = 0
  tags                = var.tags
  count               = var.restrict_gateway_endpoint == "true" ? 0 : 1
}
resource "azurerm_application_insights" "app_insights_umt_final" {
  name                = "umt${lower(var.environment_type_final)}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  application_type    = "web"
  retention_in_days   = 90
  sampling_percentage = 0
  tags                = var.tags
}

###REST App Insights###

resource "azurerm_application_insights" "app_insights_rest_test" {
  name                = "${lower(var.application_acronym)}rest${lower(var.environment_type_test)}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  application_type    = "web"
  retention_in_days   = 90
  sampling_percentage = 0
  tags                = var.tags
  count               = var.restrict_gateway_endpoint == "true" ? 0 : 1
}
resource "azurerm_application_insights" "app_insights_rest_final" {
  name                = "${lower(var.application_acronym)}rest${lower(var.environment_type_final)}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  application_type    = "web"
  retention_in_days   = 90
  sampling_percentage = 0
  tags                = var.tags
}
resource "azurerm_application_insights" "app_insights_umt_rest_test" {
  name                = "umtrest${lower(var.environment_type_test)}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  application_type    = "web"
  retention_in_days   = 90
  sampling_percentage = 0
  tags                = var.tags
  count               = var.restrict_gateway_endpoint == "true" ? 0 : 1
}
resource "azurerm_application_insights" "app_insights_umt_rest_final" {
  name                = "umtrest${lower(var.environment_type_final)}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  application_type    = "web"
  retention_in_days   = 90
  sampling_percentage = 0
  tags                = var.tags
}

##Function App - App Insights

resource "azurerm_application_insights" "app_insights_fun_app_test" {
  name                = "fun-${var.location_acronym}-${var.application_acronym}-${lower(var.environment_type_test)}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  application_type    = "web"
  retention_in_days   = 90
  sampling_percentage = 100
  tags                = var.tags
  count               = var.restrict_gateway_endpoint == "true" ? 0 : 1
}
resource "azurerm_application_insights" "app_insights_fun_app_final" {
  name                = "fun-${var.location_acronym}-${var.application_acronym}-${lower(var.environment_type_final)}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  application_type    = "web"
  retention_in_days   = 90
  sampling_percentage = 100
  tags                = var.tags
}
