resource "azurerm_bastion_host" "bastion-service" {
  name                = "SandboxBastionService"
  location            = "${module.applicationrg.resource_group_location}"
  resource_group_name = "${module.applicationrg.resource_group_name}"

  ip_configuration {
    name                 = "IpConf"
    subnet_id            = "${azurerm_subnet.bastionsubnet.id}"
    public_ip_address_id = "${azurerm_public_ip.bastionpip.id}"
  }

  tags = "${var.tags}"
}