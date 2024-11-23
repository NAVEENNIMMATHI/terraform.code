resource "azurerm_public_ip" "transit-elb-cyberarkippip" {
        name                         = "elb-cyberark-pip${var.uniqueresourcesuffix1}"
        resource_group_name          = "${azurerm_resource_group.transitpalofw.name}"
        location                     = "${azurerm_resource_group.transitpalofw.location}"
        sku                          = "Standard"
        public_ip_address_allocation = "static"
        idle_timeout_in_minutes      = 4
        domain_name_label            = "extlb1${var.unique_id}${var.uniqueresourcesuffix1}"

  tags = "${var.tags}"
}


resource "azurerm_public_ip" "palo1untrustpip" {
        name                         = "${var.palo1_vm_name}-untrust-pip${var.uniqueresourcesuffix1}"
        resource_group_name          = "${azurerm_resource_group.transitpalofw.name}"
        location                     = "${azurerm_resource_group.transitpalofw.location}"
        sku                          = "Standard"
        public_ip_address_allocation = "static"
        idle_timeout_in_minutes      = 4
        domain_name_label            = "fw1untrust${var.unique_id}${var.uniqueresourcesuffix1}"

  tags = "${var.tags}"
}

resource "azurerm_public_ip" "palo1managementpip" {
        name                         = "${var.palo1_vm_name}-management-pip${var.uniqueresourcesuffix1}"
        resource_group_name          = "${azurerm_resource_group.transitpalofw.name}"
        location                     = "${azurerm_resource_group.transitpalofw.location}"
        sku                          = "Standard"
        public_ip_address_allocation = "static"
        idle_timeout_in_minutes      = 4
        domain_name_label            = "fw1management${var.unique_id}${var.uniqueresourcesuffix1}"

  tags = "${var.tags}"
}


resource "azurerm_public_ip" "palo2untrustpip" {
        name                         = "${var.palo2_vm_name}-untrust-pip${var.uniqueresourcesuffix1}"
        resource_group_name          = "${azurerm_resource_group.transitpalofw.name}"
        location                     = "${azurerm_resource_group.transitpalofw.location}"
        sku                          = "Standard"
        public_ip_address_allocation = "static"
        idle_timeout_in_minutes      = 4
        domain_name_label            = "fw2untrust${var.unique_id}${var.uniqueresourcesuffix1}"

  tags = "${var.tags}"
}

resource "azurerm_public_ip" "palo2managementpip" {
        name                         = "${var.palo2_vm_name}-management-pip${var.uniqueresourcesuffix1}"
        resource_group_name          = "${azurerm_resource_group.transitpalofw.name}"
        location                     = "${azurerm_resource_group.transitpalofw.location}"
        sku                          = "Standard"
        public_ip_address_allocation = "static"
        idle_timeout_in_minutes      = 4
        domain_name_label            = "fw2management${var.unique_id}${var.uniqueresourcesuffix1}"

  tags = "${var.tags}"
}

