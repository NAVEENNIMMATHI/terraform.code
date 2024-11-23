locals {
  
  legacy_prefix       = "CO-${var.environment_acronym}-${var.location}"
  legacy_prefix_app   = "CO-${var.environment_acronym}-${var.location}-${var.application_acronym}"
  common_prefix       = "avs-${var.location_acronym}-${var.application_acronym}"
}
resource "azurerm_availability_set" "aset_fish" {
  name                = var.environment == "production" ? "${local.legacy_prefix}-fish-as" : "${local.common_prefix}-fish-${var.environment_acronym}"
  location            = azurerm_resource_group.cospivnetrg.location
  resource_group_name = azurerm_resource_group.cospivnetrg.name
  managed             = true

  tags                = var.tags
}

resource "azurerm_availability_set" "aset_prodsql" {
  name                = var.environment == "production" ? "${local.legacy_prefix}-prodsql-as" : "${local.common_prefix}-sql-${var.environment_acronym}"
  location            = azurerm_resource_group.cospivnetrg.location
  resource_group_name = azurerm_resource_group.cospivnetrg.name
  managed             = true

  tags                = var.tags
}

resource "azurerm_availability_set" "aset_repgen" {
  name                = var.environment == "production" ? "${local.legacy_prefix}-repgen-as" : "${local.common_prefix}-repgen-${var.environment_acronym}"
  location            = azurerm_resource_group.cospivnetrg.location
  resource_group_name = azurerm_resource_group.cospivnetrg.name
  managed             = true

  tags                = var.tags
}

resource "azurerm_availability_set" "aset_spiapdb" {
  name                = var.environment == "production" ? "${local.legacy_prefix_app}apdb-as" : "${local.common_prefix}-apdb-${var.environment_acronym}"
  location            = azurerm_resource_group.cospivnetrg.location
  resource_group_name = azurerm_resource_group.cospivnetrg.name
  managed             = true

  tags                = var.tags
}

resource "azurerm_availability_set" "aset_spiappdb" {
  name                = var.environment == "production" ? "${local.legacy_prefix_app}appdb-as" : "${local.common_prefix}-appdb-${var.environment_acronym}"
  location            = azurerm_resource_group.cospivnetrg.location
  resource_group_name = azurerm_resource_group.cospivnetrg.name
  managed             = true

  tags                = var.tags
}

resource "azurerm_availability_set" "aset_spibstn" {
  name                = var.environment == "production" ? "${local.legacy_prefix_app}bstn-as" : "${local.common_prefix}-bstn-${var.environment_acronym}"
  location            = azurerm_resource_group.cospivnetrg.location
  resource_group_name = azurerm_resource_group.cospivnetrg.name
  managed             = true

  tags                = var.tags
}

resource "azurerm_availability_set" "aset_spidbserver" {
  name                = var.environment == "production" ? "${local.legacy_prefix_app}dbserver-as" : "${local.common_prefix}-dbserver-${var.environment_acronym}"
  location            = azurerm_resource_group.cospivnetrg.location
  resource_group_name = azurerm_resource_group.cospivnetrg.name
  managed             = true

  tags                = var.tags
}

resource "azurerm_availability_set" "aset_spissas" {
  name                = var.environment == "production" ? "${local.legacy_prefix_app}ssas-as" : "${local.common_prefix}-ssas-${var.environment_acronym}"
  location            = azurerm_resource_group.cospivnetrg.location
  resource_group_name = azurerm_resource_group.cospivnetrg.name
  managed             = true

  tags                = var.tags
}

resource "azurerm_availability_set" "aset_spistagingsql" {
  name                = var.environment == "production" ? "${local.legacy_prefix_app}stagingsql-as" : "${local.common_prefix}-stagingsql-${var.environment_acronym}"
  location            = azurerm_resource_group.cospivnetrg.location
  resource_group_name = azurerm_resource_group.cospivnetrg.name
  managed             = true

  tags                = var.tags
}

resource "azurerm_availability_set" "aset_spiwebserver" {
  name                = var.environment == "production" ? "${local.legacy_prefix_app}webserver-as" : "${local.common_prefix}-webserver-${var.environment_acronym}"
  location            = azurerm_resource_group.cospivnetrg.location
  resource_group_name = azurerm_resource_group.cospivnetrg.name
  managed             = true

  tags                = var.tags
}

resource "azurerm_availability_set" "aset_srvr" {
  name                = var.environment == "production" ? "${local.legacy_prefix}-srvr-as" : "${local.common_prefix}-srvr-${var.environment_acronym}"
  location            = azurerm_resource_group.cospivnetrg.location
  resource_group_name = azurerm_resource_group.cospivnetrg.name
  managed             = true

  tags                = var.tags
}

resource "azurerm_availability_set" "aset_wkstn" {
  name                = var.environment == "production" ? "${local.legacy_prefix}-wkstn-as" : "${local.common_prefix}-wkstn-${var.environment_acronym}"
  location            = azurerm_resource_group.cospivnetrg.location
  resource_group_name = azurerm_resource_group.cospivnetrg.name
  managed             = true

  tags                = var.tags
}

resource "azurerm_availability_set" "aset_wrkst" {
  name                = var.environment == "production" ? "${local.legacy_prefix}-wrkst-as" : "${local.common_prefix}-wrkst-${var.environment_acronym}"
  location            = azurerm_resource_group.cospivnetrg.location
  resource_group_name = azurerm_resource_group.cospivnetrg.name
  managed             = true

  tags                = var.tags
}

