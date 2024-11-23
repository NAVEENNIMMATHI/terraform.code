resource "azurerm_network_security_rule" "Inbound_Allow_443_From_KPMG_On-Premise_agw1nsg" {
   for_each = var.network_security_group
  name                        = "Inbound_Allow_443_From_KPMG_On-Premise"
  priority                    = 103
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = each.value.KPMG_On-Premise
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg[each.key].resource_group_name
  network_security_group_name = module.agwnsg[each.key].network_security_group_name
}
resource "azurerm_network_security_rule" "Inbound_Allow_443_From_KPMG_VPN_agw1nsg" {
   for_each = var.network_security_group
  name                        = "Inbound_Allow_443_From_KPMG_VPN"
  priority                    = 104
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = each.value.KPMG_VPN
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg[each.key].resource_group_name
  network_security_group_name = module.agwnsg[each.key].network_security_group_name
}

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_KGS_Bangalore_agw1nsg" {
   for_each = var.network_security_group
  name                        = "Inbound_Allow_443_From_KGS_Bangalore"
  priority                    = 105
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = each.value.KGS_Bangalore
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg[each.key].resource_group_name
  network_security_group_name = module.agwnsg[each.key].network_security_group_name
}
resource "azurerm_network_security_rule" "Inbound_Allow_65503-65534_From_Azure_Infrastructure_Communication_agw1nsg" {
   for_each = var.network_security_group
  name                        = "Inbound_Allow_65503-65534_From_Azure_Infrastructure_Communication"
  priority                    = 301
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "65503-65534"
  source_address_prefix       = "GatewayManager"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg[each.key].resource_group_name
  network_security_group_name = module.agwnsg[each.key].network_security_group_name
}
resource "azurerm_network_security_rule" "Inbound_Allow_443_From_AZUREFIREWALL_PIP_agw1nsg" {
   for_each = var.network_security_group
  name                        = "Inbound_Allow_443_From_AZFW_PIP"
  priority                    = 166
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = each.value.AZFW_PIP
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg[each.key].resource_group_name
  network_security_group_name = module.agwnsg[each.key].network_security_group_name
}
/*s
resource "azurerm_network_security_rule" "Inbound_Allow_443_From_Application_Gateway" {
   for_each = var.network_security_group
  name                        = "Inbound_Allow_443_From_Application_Gateway"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = each.value.agw1_subnet_adress_space_us
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg[each.key].resource_group_name
  network_security_group_name = module.appnsg[each.key].network_security_group_name
}*/
resource "azurerm_network_security_rule" "Inbound_Allow_29876-29877_From_Azure_DataFactory_Communication_ssis1nsg" {
   for_each = var.network_security_group
  name                        = "Inbound_Allow_29876-29877_From_Azure_Infrastructure_Communication"
  priority                    = 801
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "29876-29877"
  source_address_prefix       = "BatchNodeManagement"
  destination_address_prefix  = "*"
  resource_group_name         = module.applicationrg[each.key].resource_group_name
  network_security_group_name = module.ssisnsg[each.key].network_security_group_name
}