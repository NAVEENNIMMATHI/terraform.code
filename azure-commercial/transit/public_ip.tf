resource "azurerm_public_ip" "KLTProd-pip" {
        name                         = "co-${lower(var.environment)}-${var.location}-${var.applicationname}-KLTProd-pip${var.uniqueresourcesuffix1}"
        resource_group_name          = "${azurerm_resource_group.transitvnet.name}"
        location                     = "${azurerm_resource_group.transitvnet.location}"
        sku                          = "Standard"
        public_ip_address_allocation = "static"
        idle_timeout_in_minutes      = 4

        tags = "${var.tags}"
        
}
resource "azurerm_public_ip" "KLTProdGW2-pip" {
        name                         = "co-${lower(var.environment)}-${var.location}-${var.applicationname}-KLTProdGW2-pip${var.uniqueresourcesuffix1}"
        resource_group_name          = "${azurerm_resource_group.transitvnet.name}"
        location                     = "${azurerm_resource_group.transitvnet.location}"
        sku                          = "Standard"
        public_ip_address_allocation = "static"
        idle_timeout_in_minutes      = 4

        tags = "${var.tags}"
        
}
resource "azurerm_public_ip" "KLTUATS-pip" {
        name                         = "co-${lower(var.environment)}-${var.location}-${var.applicationname}-KLTUATS-pip${var.uniqueresourcesuffix1}"
        resource_group_name          = "${azurerm_resource_group.transitvnet.name}"
        location                     = "${azurerm_resource_group.transitvnet.location}"
        sku                          = "Standard"
        public_ip_address_allocation = "static"
        idle_timeout_in_minutes      = 4

        tags = "${var.tags}"
        
}
resource "azurerm_public_ip" "KLTUATSGW2-pip" {
        name                         = "co-${lower(var.environment)}-${var.location}-${var.applicationname}-KLTUATSGW2-pip${var.uniqueresourcesuffix1}"
        resource_group_name          = "${azurerm_resource_group.transitvnet.name}"
        location                     = "${azurerm_resource_group.transitvnet.location}"
        sku                          = "Standard"
        public_ip_address_allocation = "static"
        idle_timeout_in_minutes      = 4

        tags = "${var.tags}"
        
}
resource "azurerm_public_ip" "NATTest" {
        name                         = "CO-${var.environment}-NATTest${var.uniqueresourcesuffix1}"
        resource_group_name          = "${azurerm_resource_group.transitvnet.name}"
        location                     = "${azurerm_resource_group.transitvnet.location}"
        sku                          = "Standard"
        public_ip_address_allocation = "static"
        idle_timeout_in_minutes      = 4

       tags = "${var.tags}"
        
}