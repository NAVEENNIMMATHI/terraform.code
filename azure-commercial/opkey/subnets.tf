#1 Opkey App Gateway

module "opkey_subnet_agw" {
  source               = "../../modules/subnet"
  subnet_name          = "sub-${var.location_acronym}-${var.application_acronym}-gw-${var.environment_acronym}"
  resource_group_name  = data.azurerm_virtual_network.spoke_vnet.resource_group_name
  address_prefix       = var.opkey_agw_subnet_cidr
  virtual_network_name = var.spoke_vnet_name
  service_endpoints    = ["Microsoft.EventHub"]
}

# Subnet Association
resource "azurerm_subnet_network_security_group_association" "opkeyagwnsg" {
  subnet_id                 = module.opkey_subnet_agw.subnet_id
  network_security_group_id = azurerm_network_security_group.opkeyappgw.id
  depends_on = [ module.opkey_subnet_agw ]
}

#2 Opkey App Server

module "opkey_subnet_app" {
  source               = "../../modules/subnet"
  subnet_name          = "sub-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}"
  resource_group_name  = data.azurerm_virtual_network.spoke_vnet.resource_group_name
  address_prefix       = var.opkey_app_subnet_cidr
  virtual_network_name = var.spoke_vnet_name
  service_endpoints    = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.AzureCosmosDB"]
}

# Subnet Association
resource "azurerm_subnet_route_table_association" "opkeysubapp" {
  subnet_id      = module.opkey_subnet_app.subnet_id
  route_table_id = azurerm_route_table.azfroutetable.id
  depends_on = [ module.opkey_subnet_app ]
}

# NSG Association
resource "azurerm_subnet_network_security_group_association" "opkeyappnsg" {
  subnet_id                 = module.opkey_subnet_app.subnet_id
  network_security_group_id = azurerm_network_security_group.opkeyappserver.id
  depends_on = [ module.opkey_subnet_app ]
}

#3 OpKey Private End point

module "opkey_subnet_pep" {
  source               = "../../modules/subnet"
  subnet_name          = "sub-${var.location_acronym}-${var.application_acronym}-pep-${var.environment_acronym}"
  resource_group_name  = data.azurerm_virtual_network.spoke_vnet.resource_group_name
  address_prefix       = var.opkey_pep_subnet_cidr
  virtual_network_name = var.spoke_vnet_name
  service_endpoints    = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.AzureCosmosDB"]
}

# Subnet Association
resource "azurerm_subnet_route_table_association" "opkeysubpep" {
  subnet_id      = module.opkey_subnet_pep.subnet_id
  route_table_id = azurerm_route_table.azfroutetable.id
  depends_on = [ module.opkey_subnet_pep ]
}

#4 OpKey MySql

module "opkey_subnet_data" {
  source               = "../../modules/subnet"
  subnet_name          = "sub-${var.location_acronym}-${var.application_acronym}-data-${var.environment_acronym}"
  resource_group_name  = data.azurerm_virtual_network.spoke_vnet.resource_group_name
  address_prefix       = var.opkey_data_subnet_cidr
  virtual_network_name = var.spoke_vnet_name
  service_endpoints    = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.AzureCosmosDB"]
    delegations = [{
    delegation_name         = "delegation-${var.location_acronym}-${var.application_acronym}-mysql-db-${var.environment_acronym}"
    service_delegation_name = "Microsoft.DBforMySQL/flexibleServers"
    service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
  }]
}

# Subnet Association
resource "azurerm_subnet_route_table_association" "opkeysubdata" {
  subnet_id      = module.opkey_subnet_data.subnet_id
  route_table_id = azurerm_route_table.azfroutetable.id
  depends_on = [ module.opkey_subnet_data ]
}

# NSG Association
resource "azurerm_subnet_network_security_group_association" "opkeymysqlnsg" {
  subnet_id                 = module.opkey_subnet_data.subnet_id
  network_security_group_id = azurerm_network_security_group.opkeymysql.id
  depends_on = [ module.opkey_subnet_data ]
}