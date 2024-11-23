locals {
  legacy_prefix_rg      = "CO-${var.environment_acronym}-${var.location}-co${var.application_acronym}"
  common_prefix_rg      = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}"
}

resource "azurerm_resource_group" "cospivnetrg" {
  name                  = var.environment ==  "production" ? "${local.legacy_prefix_rg}vnet-rg" : "${local.common_prefix_rg}-VNET-${upper(var.environment_acronym)}"
  location              = var.location

  tags                  = var.tags

}

resource "azurerm_resource_group" "cospiloganalytics" {
  name                  = var.environment ==  "production" ? "${local.legacy_prefix_rg}loganalytics-rg" : "${local.common_prefix_rg}-LOGANALYTICS-${upper(var.environment_acronym)}"
  location              = var.location

  tags                  = var.tags

}

resource "azurerm_resource_group" "rstudio" {
  name                  = var.environment ==  "production" ? "co-${lower(var.environment_acronym)}-${var.location}-${var.application_rs}-rg" : "${local.common_prefix_rg}-RSTUDIO-${upper(var.environment_acronym)}"
  location              = var.location

  tags                  = var.tags_rs

}

