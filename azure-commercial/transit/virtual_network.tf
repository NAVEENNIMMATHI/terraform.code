resource "azurerm_virtual_network" "transit" {
  name                = "CO-${var.environment}-${var.location}-${var.applicationname}-vnet"
  address_space       = ["${var.transitvnet_address_space}"]
  resource_group_name = "${azurerm_resource_group.transitvnet.name}"
  location            = "${azurerm_resource_group.transitvnet.location}"

  tags = "${var.tags}"

  lifecycle {
    ignore_changes = [
      ddos_protection_plan
    ]
  }
}

resource "azurerm_subnet" "mgmttransit"{
  name                      = "co-${lower(var.environment)}-${var.location}-mgmt${var.applicationname}-subnet"
  address_prefix            = "${var.subnet_adress_space_mgmttransit}"
  virtual_network_name      = "${azurerm_virtual_network.transit.name}"
  resource_group_name       = "${azurerm_resource_group.transitvnet.name}"
  network_security_group_id = "${azurerm_network_security_group.fwmgmtnsg.id}"
  service_endpoints         = ["Microsoft.Storage"]
}


resource "azurerm_subnet" "trusttransit"{
  name                      = "co-${lower(var.environment)}-${var.location}-trust${var.applicationname}-subnet"
  address_prefix            = "${var.subnet_adress_space_trusttransit}"
  virtual_network_name      = "${azurerm_virtual_network.transit.name}"
  resource_group_name       = "${azurerm_resource_group.transitvnet.name}"
  service_endpoints         = ["Microsoft.Storage"]
}


resource "azurerm_subnet" "appgwtransit"{
  name                      = "co${lower(var.environment)}-${var.location}-appgw${var.applicationname}-subnet"
  address_prefix            = "${var.subnet_adress_space_appgwtransit}"
  virtual_network_name      = "${azurerm_virtual_network.transit.name}"
  resource_group_name       = "${azurerm_resource_group.transitvnet.name}"
  service_endpoints         = ["Microsoft.Storage"]
}


resource "azurerm_subnet" "untrusttransit"{
  name                      = "co-${lower(var.environment)}-${var.location}-untrust${var.applicationname}-subnet"
  address_prefix            = "${var.subnet_adress_space_untrusttransit}"
  virtual_network_name      = "${azurerm_virtual_network.transit.name}"
  resource_group_name       = "${azurerm_resource_group.transitvnet.name}"
  network_security_group_id = "${azurerm_network_security_group.fwuntrustnsg.id}"
  service_endpoints         = ["Microsoft.Storage"]
}