module "ablaagw1nsg" {
  source              = "../../modules/network_security_group"
  name                = "${var.ablaagw1_nsg_name}"
  location            = "${module.applicationrg.resource_group_location}"
  resource_group_name = "${module.applicationrg.resource_group_name}"
  tags                = "${var.tags}"
}

module "ablaapp1nsg" {
  source              = "../../modules/network_security_group"
  name                = "${var.ablaapp1_nsg_name}"
  location            = "${module.applicationrg.resource_group_location}"
  resource_group_name = "${module.applicationrg.resource_group_name}"
  tags                = "${var.tags}"
}

module "ablaase1nsg" {
  source              = "../../modules/network_security_group"
  name                = "${var.ablaase1_nsg_name}"
  location            = "${module.applicationrg.resource_group_location}"
  resource_group_name = "${module.applicationrg.resource_group_name}"
  tags                = "${var.tags}"
}
