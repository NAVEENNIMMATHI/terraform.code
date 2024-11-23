module "ablaagw1subnet" {
  source                    = "../../modules/subnet"
  subnet_name               = "${var.ablaagw1_subnet_name}"
  virtual_network_name      = "${module.applicationvnet.virtual_network_name}"
  resource_group_name       = "${module.applicationrg.resource_group_name}"
  address_prefix            = "${var.ablaagw1_subnet_address_prefix}"
  network_security_group_id = "${var.ablaagw1_nsg_id}"
  route_table_id            = ""
  service_endpoints         = ["Microsoft.Sql","Microsoft.Storage","Microsoft.KeyVault"]
}

module "ablaapp1subnet" {
  source                    = "../../modules/subnet"
  subnet_name               = "${var.ablaapp1_subnet_name}"
  virtual_network_name      = "${module.applicationvnet.virtual_network_name}"
  resource_group_name       = "${module.applicationrg.resource_group_name}"
  address_prefix            = "${var.ablaapp1_subnet_address_prefix}"
  network_security_group_id = "${var.ablaapp1_nsg_id}"
  route_table_id            = ""
  service_endpoints         = ["Microsoft.Sql","Microsoft.Storage","Microsoft.KeyVault"]
}

module "ablaase1subnet" {
  source                    = "../../modules/subnet"
  subnet_name               = "${var.ablaase1_subnet_name}"
  virtual_network_name      = "${module.applicationvnet.virtual_network_name}"
  resource_group_name       = "${module.applicationrg.resource_group_name}"
  address_prefix            = "${var.ablaase1_subnet_address_prefix}"
  network_security_group_id = "${var.ablaase1_nsg_id}"
  route_table_id            = ""
  service_endpoints         = ["Microsoft.Sql","Microsoft.Storage","Microsoft.KeyVault"]
}


#resource "azurerm_subnet" "ablamgmtsubnet"{
#  name                      = "${var.ablamgmt_subnet_name}"
#  virtual_network_name      ="${module.applicationvnet.vnet_name}"
#  resource_group_name       = "${module.applicationrg.resource_group_name}"
#  address_prefix            = "${var.ablamgmt_subnet_adress_space}"
#  network_security_group_id = "${var.ablamgmt_nsg_id}"
#  route_table_id            = ""
#  service_endpoints         = ["Microsoft.Storage","Microsoft.KeyVault"]
#}
#
#
#resource "azurerm_subnet" "conpeastusablaase-subnet"{
#  name                      = "conpeastusablaase-subnet"
#  virtual_network_name      ="${module.aseapplicationvnet.vnet_name}"
#  resource_group_name       = "${module.applicationrg.resource_group_name}"
#  address_prefix            = "192.168.250.0/24"
#  network_security_group_id = "conpeastusablaase-NSG"
#  route_table_id            = ""
#}