locals {
  dns_address_spaces = toset(concat(
    data.azurerm_virtual_network.hub.address_space,
    data.azurerm_virtual_network.spokevnet.address_space
  ))
}

#MDP App Gateway
resource "azurerm_network_security_rule" "inbound_mdp_nsg_rule_agw_kpmg_trusted" {
  name                        = "inbound_mdp_nsg_rule_agw_kpmg_trusted"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.kpmg_trusted_address_prefixes
  destination_address_prefix  = module.mdp_subnet_agw.subnet_address_prefix
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_agw.network_security_group_name
}

# Source and destination are given as ANY in the TAP
#tfsec:ignore:AZU001
module "inbound_mdp_nsg_rule_agw_service_tag_gateway_manager" {
  source                      = "../../modules/network_security_rules"
  name                        = "inbound_mdp_nsg_rule_agw_service_tag_gateway_manager"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "65200-65535"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_agw.network_security_group_name
}

#Apim network security rules
resource "azurerm_network_security_rule" "inbound_mdp_nsg_rule_apim_managementendpoint" {
  name                        = "inbound_mdp_nsg_rule_apim_managementendpoint"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_ranges      = ["3443"]
  source_address_prefix       = "ApiManagement"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_apim.network_security_group_name
}
resource "azurerm_network_security_rule" "inbound_mdp_nsg_rule_apim_azureloadbalancer" {
  name                        = "inbound_mdp_nsg_rule_apim_azureloadbalancer"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_apim.network_security_group_name
}

resource "azurerm_network_security_rule" "inbound_mdp_nsg_rule_apim_internet" {
  name                        = "inbound_mdp_nsg_rule_apim_internet"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_ranges      = ["443","80"]
  source_address_prefix       = "Internet"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_apim.network_security_group_name
}

resource "azurerm_network_security_rule" "inbound_mdp_nsg_rule_apim_agw" {
  name                        = "inbound_mdp_nsg_rule_apim_agw"
  priority                    = 130
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = module.mdp_subnet_agw.subnet_address_prefix
  destination_address_prefix  = module.mdp_subnet_apim.subnet_address_prefix
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_apim.network_security_group_name
}
#resource "azurerm_network_security_rule" "inbound_mdp_nsg_rule_apim_deny" {
#  name                        = "DenyAllOtherInboundTraffic"
#  priority                    = 4090
#  direction                   = "inbound"
#  access                      = "Deny"
#  protocol                    = "*"
#  source_port_range           = "*"
#  destination_port_range      = "*"
#  source_address_prefix       = "*"
#  destination_address_prefix  = "*"
#  resource_group_name         = module.mdp_rg_main.resource_group_name
#  network_security_group_name = module.mdp_nsg_apim.network_security_group_name
#}

resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_apim_pep" {
  name                        = "outbound_mdp_nsg_rule_apim_pep"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = module.mdp_subnet_apim.subnet_address_prefix
  destination_address_prefix  = module.mdp_subnet_pep.subnet_address_prefix
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_apim.network_security_group_name
}
resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_apim_storage" {
  name                        = "outbound_mdp_nsg_rule_apim_storage"
  priority                    = 110
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = module.mdp_subnet_apim.subnet_address_prefix
  destination_address_prefix  = "Storage"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_apim.network_security_group_name
}
resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_apim_sql" {
  name                        = "outbound_mdp_nsg_rule_apim_sql"
  priority                    = 120
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "1433"
  source_address_prefix       = module.mdp_subnet_apim.subnet_address_prefix
  destination_address_prefix  = "SQL"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_apim.network_security_group_name
}
/*
once AKS subnet gets created update the destination address prefix
resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_apim_aks" {
  name                        = "AllowInterSubnetTraffic"
  priority                    = 170
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = module.mdp_subnet_apim.subnet_address_prefix
  destination_address_prefix  = "sub-${var.location_acronym}-${var.application_acronym}-aks-${var.environment_acronym}"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_apim.network_security_group_name
}
*/

resource "azurerm_network_security_rule" "outbound_mdp_nsg_apim_dns_tcp" {
  name                        = "outbound_mdp_nsg_apim_dns_tcp"
  priority                    = 160
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "53"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefixes  = local.dns_address_spaces
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_apim.network_security_group_name
}


resource "azurerm_network_security_rule" "outbound_mdp_nsg_apim_dns_udp" {
  name                        = "outbound_mdp_nsg_apim_dns_udp"
  priority                    = 170
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "53"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefixes  = local.dns_address_spaces
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_apim.network_security_group_name
}


resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_apim_virtual_network" {
  name                        = "AllowVirtualNetworkTraffic"
  priority                    = 210
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_apim.network_security_group_name
}

# Source and destination are given as ANY in the TAP
#tfsec:ignore:AZU002
resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_apim_internet" {
  name                        = "AllowTrafficToTheInternet"
  priority                    = 180
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "Internet"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_apim.network_security_group_name
}

#resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_apim_deny" {
#  name                        = "DenyAllOtherOutboundTraffic"
#  priority                    = 4095
#  direction                   = "Outbound"
#  access                      = "Deny"
#  protocol                    = "*"
#  source_port_range           = "*"
#  destination_port_range      = "*"
#  source_address_prefix       = "*"
#  destination_address_prefix  = "*"
#  resource_group_name         = module.mdp_rg_main.resource_group_name
#  network_security_group_name = module.mdp_nsg_apim.network_security_group_name
#}

#FunctionApp network security rules
/*
Inbound	All	All	All	All	Deny	No inbound connectivity required. Subnet is for outbound vnet integration only.
*/
resource "azurerm_network_security_rule" "inbound_mdp_nsg_rule_func_all" {
  name                        = "no_inbound_connectivity"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_func.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_func_pep" {
  name                        = "AllowHTTPSconnections"
  priority                    = 210
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "443"
  destination_port_range      = "*"
  source_address_prefix       = module.mdp_subnet_funapp.subnet_address_prefix
  destination_address_prefix  = module.mdp_subnet_pep.subnet_address_prefix
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_func.network_security_group_name
}
/*
Outbound	443	TCP	sub-use-mdp-func-<dv/qa/uat/pd>	<WVD Core Host pool VM>	Allow 	Allow Host pool connections from Function apps to private endpoints in the Hostpool vm subnet

This we need to check and work later

resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_func_hostpool" {
  name                        = "AllowHostpoolConnections"
  priority                    = 220
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "443"
  destination_port_range      = "*"
  source_address_prefix       = module.mdp_subnet_funapp.subnet_address_prefix 
  destination_address_prefix  = var.vnet_address_space
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_func.network_security_group_name
}
*/


resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_func_database_clamav" {
  name                        = "AllowDatasetClamav"
  priority                    = 230
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = module.mdp_subnet_funapp.subnet_address_prefix 
  destination_address_prefix  = module.iicssubnet.subnet_address_prefix
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_func.network_security_group_name
}



 resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_func_CoreVnetHostingdnstcp" {
  name                        = "AllowCoreVnetHostingTcp"
  priority                    = 240
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "53"
  source_address_prefix       = "*"
  destination_address_prefixes  = local.dns_address_spaces
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_func.network_security_group_name
}




 resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_func_CoreVnetHostingdnsudp" {
  name                        = "AllowCoreVnetHostingudp"
  priority                    = 250
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "53"
  source_address_prefix       = "*"
  destination_address_prefixes  = local.dns_address_spaces
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_func.network_security_group_name
}




resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_func_CoreVnetHosting" {
  name                        = "AllowCoreVnetHosting"
  priority                    = 260
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = module.mdp_subnet_funapp.subnet_address_prefix 
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_func.network_security_group_name
}


/*

Outbound	All	All	sub-use-mdp-func-<dv/qa/uat/pd>	All	Deny	Deny all other outbound connectivity from function apps.
*/

resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_func_deny" {
  name                        = "mdp_nsg_rule_func_deny"
  priority                    = 270
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = module.mdp_subnet_funapp.subnet_address_prefix 
  destination_address_prefix  = "*"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_func.network_security_group_name
}


/* Network security rule for AKS */


resource "azurerm_network_security_rule" "mdp_agw_to_aks" {
  name                        = "sub-use-mdp-agw"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "Allow intra-subnet to AGW subnet"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = module.mdp_subnet_agw.subnet_address_prefix
  destination_address_prefix  = module.mdp_aks_subnet.subnet_address_prefix
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_aks.network_security_group_name
}

resource "azurerm_network_security_rule" "mdp_apim_to_aks" {
  name                        = "sub-use-mdp-apim"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "Allow APIM inter-subnet traffic"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = module.mdp_subnet_apim.subnet_address_prefix
  destination_address_prefix  = module.mdp_aks_subnet.subnet_address_prefix
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_aks.network_security_group_name
}

resource "azurerm_network_security_rule" "VirtualNetwork_aks" {
  name                        = "VirtualNetwork"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = ""
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_aks.network_security_group_name
}

resource "azurerm_network_security_rule" "AzureLoadBalancer_aks" {
  name                        = "AzureLoadBalancer"
  priority                    = 400
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = ""
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = "*"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_aks.network_security_group_name
}

resource "azurerm_network_security_rule" "deny_all_aks" {
  name                        = "Deny_All"
  priority                    = 500
  direction                   = "Inbound"
  access                      = "Deny"
  description                 = "Deny all other inbound"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_aks.network_security_group_name
  
}
# AKS Network security rule inbound over 

resource "azurerm_network_security_rule" "sub-use-mdp-aks-pep" {
  name                        = "sub-use-mdp-aks-pep"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = "Allow private endpoint subnet traffic"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = module.mdp_aks_subnet.subnet_address_prefix
  destination_address_prefix  = module.mdp_subnet_pep.subnet_address_prefix
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_aks.network_security_group_name
}

resource "azurerm_network_security_rule" "sub-use-mdp-aks-apim_aks" {
  name                        = "sub-use-mdp-aks-apim"
  priority                    = 200
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = "Allow APIM inter subnet traffic"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = module.mdp_aks_subnet.subnet_address_prefix
  destination_address_prefix  = module.mdp_subnet_apim.subnet_address_prefix
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_aks.network_security_group_name
}

# Source and destination are given as ANY in the TAP
#tfsec:ignore:AZU002
resource "azurerm_network_security_rule" "allow_port_9000_aks" {
  name                        = "Port_9000"
  priority                    = 300
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = "For AKS functionality"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "9000"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_aks.network_security_group_name
}

# Source and destination are given as ANY in the TAP
#tfsec:ignore:AZU002
resource "azurerm_network_security_rule" "allow_port_80_433_aks" {
  name                        = "Port_80-433"
  priority                    = 400
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = ""
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_ranges      = ["80", "443"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_aks.network_security_group_name
}

# Source and destination are given as ANY in the TAP
#tfsec:ignore:AZU002
resource "azurerm_network_security_rule" "allow_port_1194_aks" {
  name                        = "Port_1194"
  priority                    = 500
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = ""
  protocol                    = "UDP"
  source_port_range           = "*"
  destination_port_range      = "1194"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_aks.network_security_group_name
}

# Source and destination are given as ANY in the TAP
#tfsec:ignore:AZU002
resource "azurerm_network_security_rule" "allow_port_123_aks" {
  name                        = "Port_123"
  priority                    = 600
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = ""
  protocol                    = "UDP"
  source_port_range           = "*"
  destination_port_range      = "123"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_aks.network_security_group_name
}

# Source and destination are given as ANY in the TAP
# tfsec:ignore:AZU002 tfsec:ignore:AZU017
resource "azurerm_network_security_rule" "allow_port_22_aks" {
  name                        = "Port_22"
  priority                    = 700
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = "Allow port 22"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_aks.network_security_group_name
}

# Source and destination are given as ANY in the TAP
#tfsec:ignore:AZU002
resource "azurerm_network_security_rule" "allow_port_53_aks" {
  name                        = "Port_53"
  priority                    = 800
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = "Allow route 53 DNS"
  protocol                    = "UDP"
  source_port_range           = "*"
  destination_port_range      = "53"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_aks.network_security_group_name
}

resource "azurerm_network_security_rule" "Outbound_VirtualNetwork_aks" {
  name                        = "Outbount_VirtualNetwork"
  priority                    = 900
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = "Allow Virtual Network traffic to aks subnet"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_aks.network_security_group_name
}

resource "azurerm_network_security_rule" "allow_all_outbound_aks" {
  name                        = "allow_all_outbound"
  priority                    = 1000
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = "Allow traffic to the internet"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "Internet"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_aks.network_security_group_name
}

resource "azurerm_network_security_rule" "deny_all_outbound_aks" {
  name                        = "deny_all_outbound"
  priority                    = 4000
  direction                   = "Outbound"
  access                      = "Deny"
  description                 = "Deny all outbound traffic for aks"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_aks.network_security_group_name
}

#NSG Rules for ClamAV WAP
resource "azurerm_network_security_rule" "inbound_mdp_nsg_rule_clamavwap_all" {
  name                        = "DenyAllInboundAccessToClamavwap"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Deny"
  description                 = "Deny All Inbound Connection to vnet integration"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range     = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_clamav_wap.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_clamavwap_pep" {
  name                        = "AllowAccessFromWebappToPrivateEndpoint"
  priority                    = 200
  direction                   = "outbound"
  access                      = "Allow"
  description                 = "Allow Access from ClamavWap to Private Endpoints"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["443", "3310"]
  source_address_prefix       = module.mdp_clamav_wap_subnet.subnet_address_prefix
  destination_address_prefix  = module.mdp_subnet_pep.subnet_address_prefix
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_clamav_wap.network_security_group_name
}

# Need more clarification
/*resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_clamavwap_WVD" {
  name                        = "AllowAccessToWVD"
  priority                    = 210
  direction                   = "outbound"
  access                      = "Allow"
  description                 = "Allow Host pool access from function app to private endpoints in the host pool vm subnet"
  protocol                    = "Tcp"
  source_port_range           = "3310"
  destination_port_range      = "443"
  source_address_prefix       = module.mdp_clamav_wap_subnet.subnet_address_prefix
  destination_address_prefix  = "WindowVirtualDesktop"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_clamav_wap.network_security_group_name
}*/

resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_clamavwap_ClamavDB" {
  name                        = "AllowAccessToClamAVDB"
  priority                    = 220
  direction                   = "outbound"
  access                      = "Allow"
  description                 = "Allow Access to ClamAV Database"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = module.mdp_clamav_wap_subnet.subnet_address_prefix
  destination_address_prefixes  = var.database_clamav_net_prefixes
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_clamav_wap.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_clamavwap_DNS_TCP" {
  name                        = "AllowAccesToDNSTcp"
  priority                    = 230
  direction                   = "outbound"
  access                      = "Allow"
  description                 = "Allow Access to Core Vnet hosting AD DS DNS and Parent spoke vnet"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range     = "53"
  source_address_prefix       = "*"
  destination_address_prefixes  = local.dns_address_spaces
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_clamav_wap.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_clamavwap_DNS" {
  name                        = "AllowAccesToDNS"
  priority                    = 240
  direction                   = "outbound"
  access                      = "Allow"
  description                 = "Allow Access to Core Vnet hosting AD DS DNS and Parent spoke vnet"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range     = "53"
  source_address_prefix       = "*"
  destination_address_prefixes  = local.dns_address_spaces
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_clamav_wap.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_clamavwap_VNET" {
  name                        = "AllowVNETForTroubleshooting"
  priority                    = 250
  direction                   = "outbound"
  access                      = "Allow"
  description                 = "Allow Vnet As Per Microsft Troubleshooting Workaround"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = module.mdp_clamav_wap_subnet.subnet_address_prefix
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_clamav_wap.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_clamavwap_OtherOutbound" {
  name                        = "DenyAnyOtherOutboundConnectivity"
  priority                    = 260
  direction                   = "outbound"
  access                      = "Deny"
  description                 = "Deny Any Other Connectivity From Function App"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = module.mdp_clamav_wap_subnet.subnet_address_prefix
  destination_address_prefix  = "*"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_clamav_wap.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_clamavwap_AllOtherOutbound" {
  name                        = "DenyAllOtherOutboundTraffic"
  priority                    = 270
  direction                   = "outbound"
  access                      = "Deny"
  description                 = "Deny All Other Outbound Traffic"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = module.mdp_clamav_wap_subnet.subnet_address_prefix
  destination_address_prefix  = "*"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_clamav_wap.network_security_group_name
}

#NSG Rules for ClamAV FAP
resource "azurerm_network_security_rule" "inbound_mdp_nsg_rule_avfap_allowappinsightsinbound" {
  name                        = "inbound_mdp_nsg_rule_avfap_allowappinsightsinbound"
  priority                    = 140
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "ActionGroup"
  destination_address_prefix  = "*"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_clamav_fap.network_security_group_name
}
resource "azurerm_network_security_rule" "inbound_mdp_nsg_rule_avfap_allowappinsightsavailableinbound" {
  name                        = "inbound_mdp_nsg_rule_avfap_allowappinsightsavailableinbound"
  priority                    = 150
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "ApplicationInsightsAvailability"
  destination_address_prefix  = "*"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_clamav_fap.network_security_group_name
}
resource "azurerm_network_security_rule" "inbound_mdp_nsg_rule_avfap_allowappinsightsmonitorinbound" {
  name                        = "inbound_mdp_nsg_rule_avfap_allowappinsightsmonitorinbound"
  priority                    = 160
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "AzureMonitor"
  destination_address_prefix  = "*"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_clamav_fap.network_security_group_name
}
resource "azurerm_network_security_rule" "inbound_mdp_nsg_rule_clamavfap_all" {
  name                        = "DenyAllInboundAccessToClamavfap"
  priority                    =  280
  direction                   = "Inbound"
  access                      = "Deny"
  description                 = "Deny All Inbound Connection to vnet integration"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_clamav_fap.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_clamavfap_pep" {
  name                        = "AllowAccessFromFunctionAppToPrivateEndpoint"
  priority                    = 290
  direction                   = "outbound"
  access                      = "Allow"
  description                 = "Allow Access from ClamavFap to Private Endpoints"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = module.mdp_clamav_fap_subnet.subnet_address_prefix
  destination_address_prefix  = module.mdp_subnet_pep.subnet_address_prefix
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_clamav_wap.network_security_group_name
}

# Need more clarification
/*resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_clamavfap_WVD" {
  name                        = "AllowAccessToWVD"
  priority                    = 300
  direction                   = "outbound"
  access                      = "Allow"
  description                 = "Allow Host pool access from function app to private endpoints in the host pool vm subnet"
  protocol                    = "Tcp"
  source_port_range           = "3310"
  destination_port_range      = "443"
  source_address_prefix       = module.mdp_clamav_fap_subnet.subnet_address_prefix
  destination_address_prefix  = "WindowVirtualDesktop"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_clamav_fap.network_security_group_name
}*/

resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_clamavfwap_ClamavDB" {
  name                        = "AllowAccessToClamAVDB"
  priority                    = 310
  direction                   = "outbound"
  access                      = "Allow"
  description                 = "Allow Access to ClamAV Database"
  protocol                    = "Tcp"
  source_port_range           = "3310"
  destination_port_range     = "443"
  source_address_prefix       = module.mdp_clamav_fap_subnet.subnet_address_prefix
  destination_address_prefixes  = var.database_clamav_net_prefixes
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_clamav_fap.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_clamavfap_DNS_TCP" {
  name                        = "AllowAccesToDNSTcp"
  priority                    = 320
  direction                   = "outbound"
  access                      = "Allow"
  description                 = "Allow Access to Core Vnet hosting AD DS DNS and Parent spoke vnet"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "53"
  source_address_prefix       = "*"
  destination_address_prefixes  = local.dns_address_spaces
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_clamav_fap.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_clamavfap_DNS" {
  name                        = "AllowAccesToDNS"
  priority                    = 330
  direction                   = "outbound"
  access                      = "Allow"
  description                 = "Allow Access to Core Vnet hosting AD DS DNS and Parent spoke vnet"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "53"
  source_address_prefix       = "*"
  destination_address_prefixes  = local.dns_address_spaces
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_clamav_fap.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_clamavfap_VNET" {
  name                        = "AllowVNETForTroubleshooting"
  priority                    = 340
  direction                   = "outbound"
  access                      = "Allow"
  description                 = "Allow Vnet As Per Microsft Troubleshooting Workaround"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = module.mdp_clamav_fap_subnet.subnet_address_prefix
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_clamav_fap.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_mdp_nsg_rule_clamavfap_OtherOutbound" {
  name                        = "DenyAnyOtherOutboundConnectivity"
  priority                    = 350
  direction                   = "outbound"
  access                      = "Deny"
  description                 = "Deny Any Other Connectivity From Function App"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = module.mdp_clamav_fap_subnet.subnet_address_prefix
  destination_address_prefix  = "*"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_clamav_fap.network_security_group_name
}

#NSG for APPINTG
resource "azurerm_network_security_rule" "mdp_nsg_rule_appintg_all" {
  name                        = "DenyAllInboundAccessToappintg"
  priority                    =  280
  direction                   = "Inbound"
  access                      = "Deny"
  description                 = "Deny All Inbound Connection to vnet integration"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_appintg.network_security_group_name
}

resource "azurerm_network_security_rule" "mdp_nsg_rule_appintg_Internet" {
  name                        = "AllowappintgsubnettoInternet"
  priority                    = 300
  direction                   = "outbound"
  access                      = "Allow"
  description                 = "Allow traffic to internet"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = module.appintgsubnet.subnet_address_prefix
  destination_address_prefix  = "Internet"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_appintg.network_security_group_name
}

resource "azurerm_network_security_rule" "mdp_nsg_rule_appintg_pep" {
  name                        = "Allowappintgsubnettopep"
  priority                    = 310
  direction                   = "outbound"
  access                      = "Allow"
  description                 = "Allow traffic to pep"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = module.appintgsubnet.subnet_address_prefix
  destination_address_prefix  = module.mdp_subnet_pep.subnet_address_prefix
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_appintg.network_security_group_name
}

resource "azurerm_network_security_rule" "mdp_nsg_rule_appintg_WVD" {
  name                        = "AllowappintgsubnettoWVD"
  priority                    = 320
  direction                   = "outbound"
  access                      = "Allow"
  description                 = "Allow traffic to WVD"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = module.appintgsubnet.subnet_address_prefix
  destination_address_prefix  = module.mdp_subnet_avscan.subnet_address_prefix
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_appintg.network_security_group_name
}

resource "azurerm_network_security_rule" "mdp_nsg_rule_appintg_TCP" {
  name                        = "AllowAccesToDNSTcp"
  priority                    = 330
  direction                   = "outbound"
  access                      = "Allow"
  description                 = "Allow traffic to TCPWVD"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "53"
  source_address_prefix       = "*"
  destination_address_prefixes= local.dns_address_spaces
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_appintg.network_security_group_name
}

resource "azurerm_network_security_rule" "mdp_nsg_rule_appintg_DNS" {
  name                        = "AllowAccestoDNS"
  priority                    = 340
  direction                   = "outbound"
  access                      = "Allow"
  description                 = "Allow traffic to DNSWVD"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "53"
  source_address_prefix       = "*"
  destination_address_prefixes= local.dns_address_spaces
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_appintg.network_security_group_name
}

resource "azurerm_network_security_rule" "mdp_nsg_rule_appintg_Vnet" {
  name                        = "AllowVNETForTroubleshooting"
  priority                    = 350
  direction                   = "outbound"
  access                      = "Allow"
  description                 = "Allow Vnet"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = module.appintgsubnet.subnet_address_prefix
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_appintg.network_security_group_name
}

resource "azurerm_network_security_rule" "mdp_nsg_rule_appintg_Deny" {
  name                        = "DenyAnyOtherOutboundConnectivity"
  priority                    = 360
  direction                   = "outbound"
  access                      = "Deny"
  description                 = "Deny Any Other Connectivity"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = module.appintgsubnet.subnet_address_prefix
  destination_address_prefix  = "*"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  network_security_group_name = module.mdp_nsg_appintg.network_security_group_name
}