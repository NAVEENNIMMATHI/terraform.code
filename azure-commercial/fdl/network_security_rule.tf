module "inbound_allow_443" {
  source                      = "../../modules12/network_security_rules"
  name                        = "HD_Insights"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.application-rg.resource_group_name
  network_security_group_name = module.insightsnsg.network_security_group_name
}