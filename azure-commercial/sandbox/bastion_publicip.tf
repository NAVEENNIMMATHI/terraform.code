resource "azurerm_public_ip" "bastionpip" {
  name                = "${local.public-ip-bastion-name}"
  location            = "${local.rg-default-location}"
  resource_group_name = "${module.applicationrg.resource_group_name}"
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = "${var.tags}"
}