module "ablaappgwpip" {
  source              = "../../modules/public_ip"
  name                = "${var.app_gw_public_ip_name}"
  resource_group_name = "${module.applicationrg.resource_group_name}"
  location            = "${module.applicationrg.resource_group_location}"
  allocation_method   = "Dynamic"
  sku                 = "Basic"
  ip_version          = "IPv4"
  tags                = "${var.tags}"
}