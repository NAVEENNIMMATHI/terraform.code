# KPIM Inbound
resource "azurerm_network_security_rule" "kpimcapiq_allow_port_22" {
  name                        = "Port_22"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "Allow  CAPIQ ip"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "12.185.49.66"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.kpimcapiqnsg.name
}

# Appplication Gateway Inbound

resource "azurerm_network_security_rule" "bmpagw1_allow_port_443_from_KART_ASE" {
  name                        = "allow_port_443_from_KART_ASE"
  priority                    = 103
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "To access MEP REST from KART."
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.kart_ase_public_ip
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpagw1nsg.name
}

resource "azurerm_network_security_rule" "bmpagw1_allow_port_443_from_AZ_FW_PIPs" {
  name                        = "allow_port_443_from_AZ_FW_PIPs"
  priority                    = 104
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "To access BMP URLs behind AZ FW"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.az_fw_public_ips
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpagw1nsg.name
}

resource "azurerm_network_security_rule" "bmpagw1_allow_port_443" {
  name                        = "Port_443"
  priority                    = 105
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.KPMG_PIP
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpagw1nsg.name
}

# Monitor Application Gateway Backend
resource "azurerm_network_security_rule" "bmpagw1_allow_port_65503-65534" {
  name                        = "Port_65503-65534"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "65503-65534"
  source_address_prefix       = "GatewayManager"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpagw1nsg.name
}

# MI DB Inbound
resource "azurerm_network_security_rule" "bmpdb1_allow_management" {
  count                       = var.environment == "production" ? "1" : "0"

  name                        = "Management"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "mgmt_port"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_ranges     = ["9000", "9003", "1438", "1440", "1452"]
  source_address_prefix       = "*"
  destination_address_prefix  = var.bmpdb1_subnet_adress_space
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpdb1nsg[0].name
}

resource "azurerm_network_security_rule" "bmpdb1_allow_mi_subnet" {
  count                       = var.environment == "production" ? "1" : "0"

  name                        = "mi_subnet"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = azurerm_subnet.bmpdb1subnet.address_prefix
  destination_address_prefix  = var.bmpdb1_subnet_adress_space
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpdb1nsg[0].name
}

resource "azurerm_network_security_rule" "bmpdb1_allow_health_probe" {
  count                       = var.environment == "production" ? "1" : "0"

  name                        = "health_probe"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = var.bmpdb1_subnet_adress_space
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpdb1nsg[0].name
}

# MI DB Outbound
resource "azurerm_network_security_rule" "outbound_bmpdb1_allow_mi_subnet" {
  count                       = var.environment == "production" ? "1" : "0"

  name                        = "prepare-allow-mi_subnet-outbound"
  priority                    = 160
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = "Allow outbound inter-node traffic"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = var.bmpdb1_subnet_adress_space
  destination_address_prefix  = azurerm_subnet.bmpdb1subnet.address_prefix
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpdb1nsg[0].name
}

resource "azurerm_network_security_rule" "outbound_bmpdb1_allow_management" {
  count                       = var.environment == "production" ? "1" : "0"

  name                        = "Outbound_Management"
  priority                    = 150
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_ranges     = ["80", "443", "12000"]
  source_address_prefix       = var.bmpdb1_subnet_adress_space
  destination_address_prefix  = "AzureCloud"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpdb1nsg[0].name
}

#DB1 NSG Rules

resource "azurerm_network_security_rule" "allow_management_inbound" {
  count                       = var.environment == "production" ? "1" : "0"

  name                        = "allow_management_inbound"
  priority                    = 105
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "Allow inbound management traffic"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_ranges     = ["9000", "9003", "1438", "1440", "1452"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpdb1p1nsg[0].name
}

resource "azurerm_network_security_rule" "allow_misubnet_inbound" {
  count                       = var.environment == "production" ? "1" : "0"

  name                        = "allow_misubnet_inbound"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "Allow inbound traffic inside the subnet"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = var.bmpdb1_subnet_adress_space
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpdb1p1nsg[0].name
}

resource "azurerm_network_security_rule" "allow_health_probe_inbound" {
  count                       = var.environment == "production" ? "1" : "0"

  name                        = "allow_health_probe_inbound"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "Allow health probe"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpdb1p1nsg[0].name
}

resource "azurerm_network_security_rule" "allow_tds_inbound" {
  count                       = var.environment == "production" ? "1" : "0"

  name                        = "allow_tds_inbound"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "Allow access to data"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "1433"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpdb1p1nsg[0].name
}

resource "azurerm_network_security_rule" "allow_redirect_inbound" {
  count                       = var.environment == "production" ? "1" : "0"

  name                        = "allow_redirect_inbound"
  priority                    = 1100
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "Allow inbound redirect traffic to Managed Instance inside the virtual network"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "11000-11999"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpdb1p1nsg[0].name
}

resource "azurerm_network_security_rule" "allow_geodr_inbound" {
  count                       = var.environment == "production" ? "1" : "0"

  name                        = "allow_geodr_inbound"
  priority                    = 1200
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "Allow inbound geodr traffic inside the virtual network"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "5022"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpdb1p1nsg[0].name
}

resource "azurerm_network_security_rule" "deny_all_inbound" {
  count                       = var.environment == "production" ? "1" : "0"

  name                        = "deny_all_inbound"
  priority                    = 4096
  direction                   = "Inbound"
  access                      = "Deny"
  description                 = "Deny all other inbound traffic"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpdb1p1nsg[0].name
}

#DB1 outbound NSG Rules

resource "azurerm_network_security_rule" "allow_management_outbound" {
  count                       = var.environment == "production" ? "1" : "0"

  name                        = "allow_management_outbound"
  priority                    = 102
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = "Allow outbound management traffic"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_ranges     = ["80", "443", "12000"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpdb1p1nsg[0].name
}

resource "azurerm_network_security_rule" "allow_misubnet_outbound" {
  count                       = var.environment == "production" ? "1" : "0"

  name                        = "allow_misubnet_outbound"
  priority                    = 200
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = "Allow outbound traffic inside the subnet"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = var.bmpdb1_subnet_adress_space
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpdb1p1nsg[0].name
}

resource "azurerm_network_security_rule" "allow_linkedserver_outbound" {
  count                       = var.environment == "production" ? "1" : "0"

  name                        = "allow_linkedserver_outbound"
  priority                    = 1000
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = "Allow outbound linkedserver traffic inside the virtual network"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "1433"
  source_address_prefix       = "*"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpdb1p1nsg[0].name
}

resource "azurerm_network_security_rule" "allow_redirect_outbound" {
  count                       = var.environment == "production" ? "1" : "0"

  name                        = "allow_redirect_outbound"
  priority                    = 1100
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = "Allow outbound redirect traffic to Managed Instance inside the virtual network"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "11000-11999"
  source_address_prefix       = "*"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpdb1p1nsg[0].name
}

resource "azurerm_network_security_rule" "allow_geodr_outbound" {
  count                       = var.environment == "production" ? "1" : "0"

  name                        = "allow_geodr_outbound"
  priority                    = 1200
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = "Allow outbound geodr traffic inside the virtual network"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "5022"
  source_address_prefix       = "*"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpdb1p1nsg[0].name
}

resource "azurerm_network_security_rule" "deny_all_outbound" {
  count                       = var.environment == "production" ? "1" : "0"

  name                        = "deny_all_outbound"
  priority                    = 4096
  direction                   = "Outbound"
  access                      = "Deny"
  description                 = "Deny all other outbound traffic"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpdb1p1nsg[0].name
}

resource "azurerm_network_security_rule" "Outbound_Allow_443_Kip_app_Application_Gateway" {
  name                         = "Outbound_Allow_443_From_Kip_Application_Gateway"
  priority                     = 1025
  direction                    = "Outbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "443"
  source_address_prefix        = "*"
  destination_address_prefixes = var.KIPAGW_PIP
  resource_group_name          = module.applicationrg.resource_group_name
  network_security_group_name  = azurerm_network_security_group.bmpapp1nsg.name
}
resource "azurerm_network_security_rule" "Outbound_Allow_443_Kip_info_Application_Gateway" {
  name                         = "Outbound_Allow_443_From_Kip_Application_Gateway"
  priority                     = 1025
  direction                    = "Outbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "443"
  source_address_prefix        = "*"
  destination_address_prefixes = var.KIPAGW_PIP
  resource_group_name          = module.applicationrg.resource_group_name
  network_security_group_name  = azurerm_network_security_group.bmpinformaticansg.name
}
resource "azurerm_network_security_rule" "Outbound_Allow_443_Kip_rest_Application_Gateway" {
  name                         = "Outbound_Allow_443_From_Kip_Application_Gateway"
  priority                     = 1025
  direction                    = "Outbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "443"
  source_address_prefix        = "*"
  destination_address_prefixes = var.KIPAGW_PIP
  resource_group_name          = module.applicationrg.resource_group_name
  network_security_group_name  = azurerm_network_security_group.bmprest1nsg.name
}
resource "azurerm_network_security_rule" "Outbound_Allow_443_Kip_kpim_Application_Gateway" {
  name                         = "Outbound_Allow_443_From_Kip_Application_Gateway"
  priority                     = 1025
  direction                    = "Outbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "443"
  source_address_prefix        = "*"
  destination_address_prefixes = var.KIPAGW_PIP
  resource_group_name          = module.applicationrg.resource_group_name
  network_security_group_name  = azurerm_network_security_group.kpimcapiqnsg.name
}
resource "azurerm_network_security_rule" "Inbound_Allow_454-455_App_Service_Management_Addresses_asesubnetnsg" {
  name                        = "Inbound_Allow_454-455_App_Service_Management_Addresses"
  priority                    = 301
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "454-455"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg.resource_group_name
  network_security_group_name = azurerm_network_security_group.bmpasensg.name
}