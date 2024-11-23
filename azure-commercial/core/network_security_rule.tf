# resource "azurerm_network_security_rule" "AllowSyncWithAzureAD" {
#   name                        = "AllowSyncWithAzureAD"
#   priority                    = 100
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "TCP"
#   source_port_range           = "*"
#   destination_port_range      = "443"
#   source_address_prefix       = "*" #tfsec:ignore:AZU001
#   destination_address_prefix  = "*"
#   resource_group_name         = azurerm_resource_group.aadds.name
#   network_security_group_name = azurerm_network_security_group.UEMCAAD.name
# }

# resource "azurerm_network_security_rule" "AllowPSRemotingSliceP" {
#   name                        = "AllowPSRemotingSliceP"
#   priority                    = 300
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "TCP"
#   source_port_range           = "*"
#   destination_port_range      = "5986"
#   source_address_prefixes     = var.ip_list_1
#   destination_address_prefix  = "*"
#   resource_group_name         = azurerm_resource_group.aadds.name
#   network_security_group_name = azurerm_network_security_group.UEMCAAD.name
# }

# resource "azurerm_network_security_rule" "AllowPSRemotingSliceT" {
#   name                        = "AllowPSRemotingSliceT"
#   priority                    = 400
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "TCP"
#   source_port_range           = "*"
#   destination_port_range      = "5986"
#   source_address_prefixes     = var.ip_list_2
#   destination_address_prefix  = "*"
#   resource_group_name         = azurerm_resource_group.aadds.name
#   network_security_group_name = azurerm_network_security_group.UEMCAAD.name
# }

resource "azurerm_network_security_rule" "Allow_RDP3389_bstn1" {
  name                        = "Allow_RDP_3389"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefixes     = var.allow_rdp_3389_bastion1_sec_rule_prefixes
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.bstnhosts.name
  network_security_group_name = azurerm_network_security_group.uemcbstn1.name
}

resource "azurerm_network_security_rule" "Allow_443_panorama" {
  count = var.environment_acronym == "qa" ? 0 : 1

  name              = "Allow_443"
  priority          = 100
  direction         = "Inbound"
  access            = "Allow"
  protocol          = "Tcp"
  source_port_range = "*"

  # destination_port_range      = ""
  destination_port_ranges     = var.allow_443_panorama_dest_port_range
  source_address_prefixes     = var.allow_443_panorama_sec_rule_prefixes
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.panorama.name
  network_security_group_name = azurerm_network_security_group.panoramansg[0].name
}
resource "azurerm_network_security_rule" "Deny_443_packer" {
  count                       =(var.environment_acronym == "dv" || var.environment_acronym == "qa") ? 1 : 0
  name                        = "Deny_443"
  priority                    = 543
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "64.39.96.0/20"
  resource_group_name         = azurerm_resource_group.packer.name
  network_security_group_name = azurerm_network_security_group.packer.name
}

/*
resource "azurerm_network_security_rule" "aks_agw_manager_rule" {}
resource "azurerm_network_security_rule" "aks_agw_inbound_allow_rule" {}
*/
## Moved to Core-AKS folder ##


#### DM ASE NSG Rules

resource "azurerm_network_security_rule" "inbound_management" {
  name                        = "inbound_management"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "454-455"
  source_address_prefix       = "AppServiceManagement"
  destination_address_prefix  = var.core_ase_subnet_ip
  resource_group_name         = azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.dm_ase.name
}

resource "azurerm_network_security_rule" "inbound_allow_app_gateway" {
  name                        = "inbound_allow_from_app_gateway"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = var.dm_app_gateway_subnet_ip
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.dm_ase.name
}

#### DM Application Gateway NSG Rules 

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_PaloAlto1_agw1nsg" {
  name                        = "Inbound_Allow_443_From_PaloAlto1"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = var.PaloAlto1
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.dm_app_gateway.name
}

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_PaloAlto2_agw1nsg" {
  name                        = "Inbound_Allow_443_From_PaloAlto2"
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = var.PaloAlto2
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.dm_app_gateway.name
}

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_KPMG_On-Premise_agw1nsg" {
  name                        = "Inbound_Allow_443_From_KPMG_On-Premise"
  priority                    = 103
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = var.KPMG_On-Premise
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.dm_app_gateway.name
}

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_KPMG_VPN_agw1nsg" {
  name                        = "Inbound_Allow_443_From_KPMG_VPN"
  priority                    = 104
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.KPMG_VPN
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.dm_app_gateway.name
}

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_KGS_Bangalore_agw1nsg" {
  name                        = "Inbound_Allow_443_From_KGS_Bangalore"
  priority                    = 105
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.KGS_Bangalore
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.dm_app_gateway.name
}

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_KGS_Gurgaon_agw1nsg" {
  name                        = "Inbound_Allow_443_From_KGS_Gurgaon"
  priority                    = 106
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = var.KGS_Gurgaon
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.dm_app_gateway.name
}

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_ASE_PIP_agw1nsg" {
  name                        = "Inbound_Allow_443_From_ASE_PIP"
  priority                    = 107
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.ASE_PIP
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.dm_app_gateway.name
}

resource "azurerm_network_security_rule" "Inbound_Allow_65503-65534_From_Azure_Infrastructure_Communication_agw1nsg" {
  name                        = "Inbound_Allow_65503-65534_From_Azure_Infrastructure_Communication"
  priority                    = 301
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "65503-65534"
  source_address_prefix       = "GatewayManager"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.dm_app_gateway.name
}

resource "azurerm_network_security_rule" "Inbound_Allow_AZFW" {
  name                        = "Inbound_Allow_AZFW"
  priority                    = 400
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = ["${module.fw_pip_1.public_ip_address}", "${module.fw_pip_2.public_ip_address}", "${module.fw_pip_3.public_ip_address}", "${module.fw_pip_4.public_ip_address}", "${module.fw_pip_5.public_ip_address}"]
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.dm_app_gateway.name
}

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_Core_Firewall" {
  name                        = "Inbound_Allow_443_From_Core_Firewall"
  priority                    = 410
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.core_firewall_public_ip
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.dm_app_gateway.name
}

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_Digital_Matrix_Firewall" {
  name                        = "Inbound_Allow_443_From_Digital_Matrix_Firewall"
  priority                    = 420
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.digital_matrix_firewall_public_ip
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.dm_app_gateway.name
}

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_Core_ASE" {
  name                        = "Inbound_Allow_443_From_Core_ASE"
  priority                    = 430
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.core_ase
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.dm_app_gateway.name
}

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_IDP" {
  name                        = "Inbound_Allow_443_From_IDP"
  priority                    = 440
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.idp_ase
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.dm_app_gateway.name
}

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_Light_house" {
  name                        = "Inbound_Allow_443_From_Light_House"
  priority                    = 450
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.light_house
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.dm_app_gateway.name
}

resource "azurerm_network_security_rule" "inbound_Allow_443_From_CMBS" {
  name                        = "Inbound_Allow_443_From_CMBS"
  priority                    = 460
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.cmbs
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.dm_app_gateway.name
}

resource "azurerm_network_security_rule" "inbound_Allow_443_From_MDP" {
  name                        = "Inbound_Allow_443_From_MDP"
  priority                    = 470
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.mdp
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.dm_app_gateway.name
}

resource "azurerm_network_security_rule" "inbound_Allow_443_From_MALTA" {
  name                        = "Inbound_Allow_443_From_MALTA"
  priority                    = 480
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.malta
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.dm_app_gateway.name
}

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_VMAP_ASE" {
  name                        = "Inbound_Allow_443_From_VMAP_ASE"
  priority                    = 510
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.vmap_ase
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.dm_app_gateway.name
}

resource "azurerm_network_security_rule" "Inbound_Allow_443_From_MS_ODP" {
  name                        = "Inbound_Allow_443_From_MS_ODP"
  priority                    = 520
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.ms_odp
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.hubvnet.name
  network_security_group_name = azurerm_network_security_group.dm_app_gateway.name
}