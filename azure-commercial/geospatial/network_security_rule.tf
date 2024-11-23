#Arcgis App Gateway
resource "azurerm_network_security_rule" "inbound_arcgis_nsg_rule_agw" {
  name                        = "inbound_arcgis_nsg_rule_vpn"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.kpmg_trusted_address_prefixes
  destination_address_prefix  = module.geospatial_agw_subnet.subnet_address_prefix
  resource_group_name         = module.geospatial_rg.resource_group_name
  network_security_group_name = module.arcgis_nsg_agw.network_security_group_name
}
# Source and destination are given as ANY in the TAP
#tfsec:ignore:AZU001
module "inbound_Allow_65200-65535_From_Azure_Infrastructure_Communication" {
  source                      = "../../modules/network_security_rules"
  name                        = "inbound_Allow_65200-65535_From_Azure_Infrastructure_Communication"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "65200-65535"
  source_address_prefix       = "GatewayManager"
  destination_address_prefix  = "*"
  resource_group_name         = module.geospatial_rg.resource_group_name
  network_security_group_name = module.arcgis_nsg_agw.network_security_group_name
}
####Network security rule for AKS

resource "azurerm_network_security_rule" "inbound_arcgis_nsg_rule_aks" {
  name                        = "inbound_vm_aks"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "Allow vm to aks"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = module.geospatial_vm_subnet.subnet_address_prefix
  destination_address_prefix  = module.geospatial_aks_subnet.subnet_address_prefix
  resource_group_name         = module.geospatial_rg.resource_group_name
  network_security_group_name = module.arcgis_nsg_aks.network_security_group_name
}

resource "azurerm_network_security_rule" "inbound_arcgis_nsg_rule_agw_ilb" {
  name                        = "inbound_ilb_aks"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "Allow ilb to AKS subnet"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = module.geospatial_agw_subnet.subnet_address_prefix
  destination_address_prefix  = module.geospatial_aks_subnet.subnet_address_prefix
  resource_group_name         = module.geospatial_rg.resource_group_name
  network_security_group_name = module.arcgis_nsg_aks.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_db_aks" {
  name                        = "outbound_db_aks"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = "Allow db"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "1433"
  source_address_prefix       = module.geospatial_pep_subnet.subnet_address_prefix
  destination_address_prefix  = module.geospatial_aks_subnet.subnet_address_prefix
  resource_group_name         = module.geospatial_rg.resource_group_name
  network_security_group_name = module.arcgis_nsg_aks.network_security_group_name
}
/*
####Network security rule for vm
resource "azurerm_network_security_rule" "inbound_arcgis_nsg_rule_vm" {
  name                        = "inbound_arcgis_nsg_rule_vm"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "1433"
  source_address_prefix       = module.geospatial_pep_subnet.subnet_address_prefix
  destination_address_prefix  = module.geospatial_pbi_subnet.subnet_address_prefix
  resource_group_name         = module.geospatial_rg.resource_group_name
  network_security_group_name = module.arcgis_nsg_vm.network_security_group_name
}

resource "azurerm_network_security_rule" "outbound_vm" {
  name                        = "outbound_sql_vm"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = "Allow sql to vm"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = module.geospatial_pbi_subnet.subnet_address_prefix
  destination_address_prefix  = "*"
  resource_group_name         = module.geospatial_rg.resource_group_name
  network_security_group_name = module.arcgis_nsg_vm.network_security_group_name
}
*/