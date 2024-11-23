resource "azurerm_network_security_group" "ignite_agw_nsg" {
  name                = "nsg-${var.location}-agw-${var.engagement_name}${var.separator}${var.environment}"
  location            = module.ignite_rg.resource_group_location
  resource_group_name = module.ignite_rg.resource_group_name

  tags                = var.tags
}

resource "azurerm_subnet_network_security_group_association" "ignite_agw_nsg_assoc" {
  subnet_id                 = module.ignite_agw_subnet.subnet_id
  network_security_group_id = azurerm_network_security_group.ignite_agw_nsg.id
}

resource "azurerm_network_security_group" "ignite_aks_nsg" {
  name                = "nsg-${var.location}-${var.application_acronym}-${var.engagement_name}${var.separator}${var.environment}"
  location            = module.ignite_rg.resource_group_location
  resource_group_name = module.ignite_rg.resource_group_name

  tags                = var.tags
}

resource "azurerm_subnet_network_security_group_association" "ignite_aks_nsg_assoc" {
  subnet_id                 = module.ignite_aks_subnet.subnet_id
  network_security_group_id = azurerm_network_security_group.ignite_aks_nsg.id
}

resource "azurerm_network_security_group" "ignite_ingress_nsg" {
  name                = "nsg-${var.location}-ingress-${var.engagement_name}${var.separator}${var.environment}"
  location            = module.ignite_rg.resource_group_location
  resource_group_name = module.ignite_rg.resource_group_name
  
  tags                = var.tags
}

resource "azurerm_subnet_network_security_group_association" "ignite_ingress_nsg_assoc" {
  subnet_id                 = module.ignite_ingress_subnet.subnet_id
  network_security_group_id = azurerm_network_security_group.ignite_ingress_nsg.id
}