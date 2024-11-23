module "application_insights" {
  source              = "../../modules/application_insights"
  name                = "ais-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.datadogrg.name
  location            = azurerm_resource_group.datadogrg.location

  tags                = var.tags
}