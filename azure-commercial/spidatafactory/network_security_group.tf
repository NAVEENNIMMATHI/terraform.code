locals {
  legacy_prefix_dlnsg      = "co-${var.environment_acronym}-${var.location}-datalake"
  legacy_prefix_dfnsg      = "co-${var.environment_acronym}-${var.location}-datafactory"
  common_prefix_nsg_dl     = "nsg-${var.location_acronym}-dl-${var.application_acronym}-${var.environment_acronym}"
  common_prefix_nsg_df     = "nsg-${var.location_acronym}-df-${var.application_acronym}-${var.environment_acronym}"
                          
}

resource "azurerm_network_security_group" "datalakensg" {
  name                = var.environment == "production" ? "${local.legacy_prefix_dlnsg}-nsg" : "${local.common_prefix_nsg_dl}"
  location            = var.location
  resource_group_name = azurerm_resource_group.cospidatalakerg.name

  tags                = var.environment == "production" ? var.tags_vm : var.tags

}

resource "azurerm_network_security_group" "datafactorynsg" {
  name                = var.environment == "production" ? "${local.legacy_prefix_dfnsg}-nsg" : "${local.common_prefix_nsg_df}"
  location            = var.location
  resource_group_name = azurerm_resource_group.cospidatafactoryrg.name

  tags                = var.environment == "production" ? var.tags_vm : var.tags

}
