resource "azurerm_private_dns_zone" "kipprivatedns" {
  name                = var.kipprivatedns
  resource_group_name = module.applicationrg.resource_group_name
  tags                = var.tags
}