resource "azurerm_private_dns_zone" "kipprivatedns" {
  name                = var.environment == "production" ? "privatelink.search.windows.net" : "pdz.${var.location_acronym}.${var.application_acronym}.${var.environment_acronym}"
  resource_group_name = module.applicationrg.resource_group_name

  tags                = var.tags
}