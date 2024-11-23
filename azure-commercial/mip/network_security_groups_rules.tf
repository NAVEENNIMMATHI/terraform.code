# License manager
module "allow_port_3389_license_manager" {
  source                      = "../../modules12/network_security_rules"
  name                        = "Allow_port_3389"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "10.0.0.0/16"
  destination_address_prefix  = "*"
  resource_group_name         = module.mathworks_rg_shared.resource_group_name
  network_security_group_name = module.nsg_license_manager.network_security_group_name
}

module "allow_port_27000_license_manager" {
  source                      = "../../modules12/network_security_rules"
  name                        = "Allow_port_27000"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "27000-27001"
  source_address_prefix       = var.address_prefix_aks
  destination_address_prefix  = "*"
  resource_group_name         = module.mathworks_rg_shared.resource_group_name
  network_security_group_name = module.nsg_license_manager.network_security_group_name
}


# App Gateway
resource "azurerm_network_security_rule" "inbound_mdp_nsg_rule_agw_kpmg_trusted" {
  name                        = "inbound_mip_nsg_rule_agw_kpmg_trusted"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes       = var.kpmg_trusted_address_prefixes
  destination_address_prefix  = module.subnet_app_gateway.subnet_address_prefix
  resource_group_name         = module.mathworks_rg_shared.resource_group_name
  network_security_group_name = module.nsg_app_gateway.network_security_group_name
}

module "allow_gateway_manager" {
  source                      = "../../modules12/network_security_rules"
  name                        = "Allow_Gateway_Manager"
  priority                    = 105
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "65200-65535"
  source_address_prefix       = "GatewayManager"
  destination_address_prefix  = "*"
  resource_group_name         = module.mathworks_rg_shared.resource_group_name
  network_security_group_name = module.nsg_app_gateway.network_security_group_name
}

# module "allow_virtual_network" {
#   source                      = "../../modules12/network_security_rules"
#   name                        = "Allow_Virtual_Network"
#   priority                    = 120
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "*"
#   source_port_range           = "*"
#   destination_port_range      = "*"
#   source_address_prefix       = "VirtualNetwork"
#   destination_address_prefix  = "*"
#   resource_group_name         = module.mathworks_rg_shared.resource_group_name
#   network_security_group_name = module.nsg_app_gateway.network_security_group_name
# }

# AKS cluster
module "mip_agw_to_aks" {
  source                      = "../../modules12/network_security_rules"
  name                        = "Allow_agw_to_aks"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = var.address_prefix_agw
  destination_address_prefix  = var.address_prefix_aks
  resource_group_name         = module.mathworks_rg_client.resource_group_name
  network_security_group_name = module.nsg_aks.network_security_group_name
}

module "VirtualNetwork_aks" {
  source                      = "../../modules12/network_security_rules"
  name                        = "VirtualNetwork"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.mathworks_rg_client.resource_group_name
  network_security_group_name = module.nsg_aks.network_security_group_name
}

module "AzureLoadBalancer_aks" {
  source                      = "../../modules12/network_security_rules"
  name                        = "AzureLoadBalancer"
  priority                    = 400
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = "*"
  resource_group_name         = module.mathworks_rg_client.resource_group_name
  network_security_group_name = module.nsg_aks.network_security_group_name
}

module "deny_all_aks" {
  source                      = "../../modules12/network_security_rules"
  name                        = "Deny_All"
  priority                    = 500
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.mathworks_rg_client.resource_group_name
  network_security_group_name = module.nsg_aks.network_security_group_name

}

# AKS Network security rule inbound over 
module "sub-use-mip-aks-pep" {
  source                      = "../../modules12/network_security_rules"
  name                        = "sub-use-mip-aks-pep"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = var.address_prefix_aks
  destination_address_prefix  = var.address_prefix_pep
  resource_group_name         = module.mathworks_rg_client.resource_group_name
  network_security_group_name = module.nsg_aks.network_security_group_name
}

module "allow_port_9000_aks" {
  source                      = "../../modules12/network_security_rules"
  name                        = "Port_9000"
  priority                    = 300
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "9000"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.mathworks_rg_client.resource_group_name
  network_security_group_name = module.nsg_aks.network_security_group_name
}

module "allow_port_80_aks" {
  source                      = "../../modules12/network_security_rules"
  name                        = "Allow_Port_80"
  priority                    = 400
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.mathworks_rg_client.resource_group_name
  network_security_group_name = module.nsg_aks.network_security_group_name
}

module "allow_port_433_aks" {
  source                      = "../../modules12/network_security_rules"
  name                        = "Allow Port_433"
  priority                    = 410
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.mathworks_rg_client.resource_group_name
  network_security_group_name = module.nsg_aks.network_security_group_name
}

module "allow_port_1194_aks" {
  source                      = "../../modules12/network_security_rules"
  name                        = "Port_1194"
  priority                    = 500
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "UDP"
  source_port_range           = "*"
  destination_port_range      = "1194"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.mathworks_rg_client.resource_group_name
  network_security_group_name = module.nsg_aks.network_security_group_name
}

module "allow_port_123_aks" {
  source                      = "../../modules12/network_security_rules"
  name                        = "Port_123"
  priority                    = 600
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "UDP"
  source_port_range           = "*"
  destination_port_range      = "123"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.mathworks_rg_client.resource_group_name
  network_security_group_name = module.nsg_aks.network_security_group_name
}

module "allow_port_22_aks" {
  source                      = "../../modules12/network_security_rules"
  name                        = "Port_22"
  priority                    = 700
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.mathworks_rg_client.resource_group_name
  network_security_group_name = module.nsg_aks.network_security_group_name
}

module "allow_port_53_aks" {
  source                      = "../../modules12/network_security_rules"
  name                        = "Port_53"
  priority                    = 800
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "UDP"
  source_port_range           = "*"
  destination_port_range      = "53"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.mathworks_rg_client.resource_group_name
  network_security_group_name = module.nsg_aks.network_security_group_name
}

module "Outbound_VirtualNetwork_aks" {
  source                      = "../../modules12/network_security_rules"
  name                        = "Outbount_VirtualNetwork"
  priority                    = 900
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.mathworks_rg_client.resource_group_name
  network_security_group_name = module.nsg_aks.network_security_group_name
}

module "allow_all_outbound_aks" {
  source                      = "../../modules12/network_security_rules"
  name                        = "allow_all_outbound"
  priority                    = 1000
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "Internet"
  resource_group_name         = module.mathworks_rg_client.resource_group_name
  network_security_group_name = module.nsg_aks.network_security_group_name
}

module "deny_all_outbound_aks" {
  source                      = "../../modules12/network_security_rules"
  name                        = "deny_all_outbound"
  priority                    = 4000
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.mathworks_rg_client.resource_group_name
  network_security_group_name = module.nsg_aks.network_security_group_name
}
