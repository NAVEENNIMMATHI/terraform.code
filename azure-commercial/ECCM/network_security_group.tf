##NSG for Application Gateway##
resource "azurerm_network_security_group" "eccm_agw_nsg" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-agw-${var.environment_acronym}"
  location            = module.eccm_rg.resource_group_location
  resource_group_name = module.eccm_rg.resource_group_name

  tags                = var.tags
}

##NSG for Logic App Private##
resource "azurerm_network_security_group" "eccm_lap_pvt_nsg" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-lap-pvt-${var.environment_acronym}"
  location            = module.eccm_rg.resource_group_location
  resource_group_name = module.eccm_rg.resource_group_name

  tags                = var.tags
}

##NSG for Logic App Public##
resource "azurerm_network_security_group" "eccm_lap_pub_nsg" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-lap-pub-${var.environment_acronym}"
  location            = module.eccm_rg.resource_group_location
  resource_group_name = module.eccm_rg.resource_group_name

  tags                = var.tags
}

##NSG for Private Endpoint##
resource "azurerm_network_security_group" "eccm_pep_nsg" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-pep-${var.environment_acronym}"
  location            = module.eccm_rg.resource_group_location
  resource_group_name = module.eccm_rg.resource_group_name

  tags                = var.tags
} 

##NSG for Azure Kubernetes Service##
resource "azurerm_network_security_group" "eccm_aks_nsg" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-aks-${var.environment_acronym}"
  location            = module.eccm_rg.resource_group_location
  resource_group_name = module.eccm_rg.resource_group_name

  tags                = var.tags
}

##NSG for Cognitive Service##
resource "azurerm_network_security_group" "eccm_css_nsg" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-css-${var.environment_acronym}"
  location            = module.eccm_rg.resource_group_location
  resource_group_name = module.eccm_rg.resource_group_name

  tags                = var.tags
}

##NSG for Web app and Function App##
resource "azurerm_network_security_group" "eccm_app_nsg" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}"
  location            = module.eccm_rg.resource_group_location
  resource_group_name = module.eccm_rg.resource_group_name

  tags                = var.tags
}