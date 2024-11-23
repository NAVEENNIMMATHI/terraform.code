#Bastion NSG Rules and Setup
resource "azurerm_network_security_rule" "IngressTraffic_PublicIP_443" {
        access                      = "Allow"
        description		    = "IngressTraffic_PublicIP_443"
        destination_address_prefix =  "*"
        destination_port_range      = "443"
        direction                   = "Inbound"
        name                        = "IngressTraffic_PublicIP_443"
        network_security_group_name = "${azurerm_network_security_group.bastionnsg.name}"
        priority                    = 100
        protocol                    = "*"
        resource_group_name         = "${module.applicationrg.resource_group_name}"
        source_address_prefixes      = ["${var.kpmg_NAT_ips}"]
        source_port_range           = "*"
}

resource "azurerm_network_security_rule" "gatewaymanager443_inbound" {
        access                      = "Allow"
        description		    = "gatewaymanager443_inbound"
        destination_address_prefix  = "*"
        destination_port_range      = "*"
        direction                   = "Inbound"
        name                        = "gatewaymanager443_inbound"
        network_security_group_name = "${azurerm_network_security_group.bastionnsg.name}"
        priority                    = 110
        protocol                    = "*"
        resource_group_name         = "${module.applicationrg.resource_group_name}"
        source_address_prefix      = "GatewayManager"
        source_port_range           = "*"
}

resource "azurerm_network_security_rule" "egress_traffic_to_workersubnet_3389" {
        access                      = "Allow"
        description		    = "egress_traffic_to_workersubnet_3389_22"
        destination_address_prefix = "VirtualNetwork"
        destination_port_ranges      = ["3389","22"]
        direction                   = "Outbound"
        name                        = "egress_traffic_to_workersubnet_3389"
        network_security_group_name = "${azurerm_network_security_group.bastionnsg.name}"
        priority                    = 100
        protocol                    = "*"
        resource_group_name         = "${module.applicationrg.resource_group_name}"
        source_address_prefix      = "*"
        source_port_range           = "*"
}

resource "azurerm_network_security_rule" "azurecloud_tag_outbound_443" {
        access                      = "Allow"
        description		    = "azurecloud_tag_outbound_443"
        destination_address_prefix  = "AzureCloud"
        destination_port_range      = "*"
        direction                   = "Outbound"
        name                        = "azurecloud_tag_outbound_443"
        network_security_group_name = "${azurerm_network_security_group.bastionnsg.name}"
        priority                    = 120
        protocol                    = "*"
        resource_group_name         = "${module.applicationrg.resource_group_name}"
        source_address_prefix       = "*"
        source_port_range           = "*"
}

#Worker NSG Rules and Setup

resource "azurerm_network_security_rule" "Allow_Bastion_to_TargetVMs_3389" {
        access                      = "Allow"
        description		    = "Allow_Bastion_to_TargetVMs_3389"
        destination_address_prefixes  = ["${var.worker_subnet_adress_space}"]
        destination_port_range      = "3389"
        direction                   = "Inbound"
        name                        = "Allow_Bastion_to_TargetVMs_3389"
        network_security_group_name = "${azurerm_network_security_group.workernsg.name}"
        priority                    = 100
        protocol                    = "*"
        resource_group_name         = "${module.applicationrg.resource_group_name}"
        source_address_prefixes      = ["${var.bastion_subnet_adress_space}"]
        source_port_range           = "*"
}
resource "azurerm_network_security_rule" "Allow_Bastion_to_TargetVMs_22" {
        access                      = "Allow"
        description		    = "Allow_Bastion_to_TargetVMs_22"
        destination_address_prefixes  = ["${var.worker_subnet_adress_space}"]
        destination_port_range      = "22"
        direction                   = "Inbound"
        name                        = "Allow_Bastion_to_TargetVMs_22"
        network_security_group_name = "${azurerm_network_security_group.workernsg.name}"
        priority                    = 101
        protocol                    = "*"
        resource_group_name         = "${module.applicationrg.resource_group_name}"
        source_address_prefixes      = ["${var.bastion_subnet_adress_space}"]
        source_port_range           = "*"
}