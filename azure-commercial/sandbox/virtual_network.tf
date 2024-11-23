module "applicationvnet"{
    source="../modules/virtual_network"
    virtual_network_name ="co-${var.environment}-${var.application_rg_location}-${var.application_acronym}-vnet"
    resource_group_location = "${module.applicationrg.resource_group_location}"
    resource_group_name ="${module.applicationrg.resource_group_name}"
    address_space       = "${var.address_space}"
    tags                = "${var.tags}"
}

resource "azurerm_subnet" "firewallsubnet"{
  name                      = "AzureFirewallSubnet"
  virtual_network_name      ="${module.applicationvnet.virtual_network_name}"
  resource_group_name       = "${module.applicationrg.resource_group_name}"
  address_prefix            = "${var.firewall_subnet_adress_space}"
  service_endpoints         = ["Microsoft.Sql","Microsoft.Storage","Microsoft.KeyVault"]
}

resource "azurerm_subnet" "workersubnet"{
  name                      = "co-${var.environment}-${var.application_rg_location}-${var.application_acronym}-worker-subnet"
  virtual_network_name      ="${module.applicationvnet.virtual_network_name}"
  resource_group_name       = "${module.applicationrg.resource_group_name}"
  address_prefix            = "${var.worker_subnet_adress_space}"
  network_security_group_id = "${azurerm_network_security_group.workernsg.id}"
  route_table_id            = "${module.route-table.route_table_id}"
  service_endpoints         = ["Microsoft.Sql","Microsoft.Storage","Microsoft.KeyVault"]
}

resource "azurerm_subnet" "bastionsubnet"{
  name                      = "AzureBastionSubnet"
  virtual_network_name      ="${module.applicationvnet.virtual_network_name}"
  resource_group_name       = "${module.applicationrg.resource_group_name}"
  address_prefix            = "${var.bastion_subnet_adress_space}"
  network_security_group_id = "${azurerm_network_security_group.bastionnsg.id}"
  service_endpoints         = ["Microsoft.Sql","Microsoft.Storage","Microsoft.KeyVault"]
}

