resource "azurerm_network_security_group" "aks" {
  count = 1

  name                = "nsg-${var.location_acronym}-${var.application_acronym}-aks-${var.environment_acronym}"
  location            = azurerm_resource_group.aks[0].location
  resource_group_name = azurerm_resource_group.aks[0].name

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "aks" {
  count = 1

  subnet_id                 = azurerm_subnet.aks[0].id
  network_security_group_id = azurerm_network_security_group.aks[0].id
}

resource "azurerm_network_security_group" "aks_agw" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-aks-agw-${var.environment_acronym}"
  location            = data.azurerm_resource_group.hubvnet.location
  resource_group_name = data.azurerm_resource_group.hubvnet.name

  tags = var.tags_Artifactory
}

resource "azurerm_subnet_network_security_group_association" "aks_agw" {
  subnet_id                 = azurerm_subnet.aks_agw.id
  network_security_group_id = azurerm_network_security_group.aks_agw.id
}