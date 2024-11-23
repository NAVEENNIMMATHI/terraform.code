resource "azurerm_network_security_rule" "app_gateway_KPMG_allow" {
  name                        = "Allow_443"
  description                 = "Allow 443 for whitelisted IPs"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = ["199.207.253.0/24","199.206.0.5/32","203.199.72.210/32","110.173.180.210/32","115.114.9.131/32","114.143.105.74/32","103.58.118.216/32","103.58.118.215/32","103.58.118.217/32","103.58.118.218/32","103.58.118.219/32","42.104.67.226/32","66.246.63.23/32","103.58.118.80/28","103.216.201.96/28","103.133.112.80/28"]
  destination_address_prefix  = "*"
  resource_group_name         = module.vnetrg.resource_group_name
  network_security_group_name = module.cloappgwnsg.network_security_group_name
}

resource "azurerm_network_security_rule" "app_gateway_management_allow" {
  name                        = "App_gw_management"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "65200-65535"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.vnetrg.resource_group_name
  network_security_group_name = module.cloappgwnsg.network_security_group_name
}

resource "azurerm_network_security_rule" "web_app_allow" {
  name                        = "Port_8080"
  description                 = "test_allowall"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.vnetrg.resource_group_name
  network_security_group_name = module.clowebnsg.network_security_group_name
}
