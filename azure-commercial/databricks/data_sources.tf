data "azurerm_virtual_network" "spi_vnet" {
  name                = var.spi_vnet_name
  resource_group_name = var.spi_vnet_resource_group_name
}