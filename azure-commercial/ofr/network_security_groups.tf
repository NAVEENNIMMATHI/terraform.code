resource "azurerm_network_security_group" "app" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.ofr.name
  location            = azurerm_resource_group.ofr.location

  tags                = var.tags
}

resource "azurerm_network_security_group" "build" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-build-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.ofr.name
  location            = azurerm_resource_group.ofr.location

  tags                = var.tags
}

resource "azurerm_network_security_group" "agw" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-agw-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.ofr.name
  location            = azurerm_resource_group.ofr.location

  tags                = var.tags
}

resource "azurerm_subnet_network_security_group_association" "app" {
  subnet_id                 = azurerm_subnet.app.id
  network_security_group_id = azurerm_network_security_group.app.id
}

resource "azurerm_subnet_network_security_group_association" "build" {
  subnet_id                 = azurerm_subnet.build.id
  network_security_group_id = azurerm_network_security_group.build.id
}

resource "azurerm_subnet_network_security_group_association" "agw" {
  subnet_id                 = azurerm_subnet.agw.id
  network_security_group_id = azurerm_network_security_group.agw.id
}