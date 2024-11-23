module "application_insights" {
  source              = "../../modules12/application_insights"
  name                = "ais-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.ofr.name
  location            = azurerm_resource_group.ofr.location

  tags                = var.tags
}