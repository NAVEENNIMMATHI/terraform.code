module "applicationvnet" {
  source                  = "../../modules12/virtual_network"
  virtual_network_name    = var.virtual_network_name
  resource_group_location = module.applicationrg.resource_group_location
  resource_group_name     = module.applicationrg.resource_group_name
  address_space           = var.address_space
  dns_server              = var.dns_server
  tags                    = var.tags
}

module "krtagw1subnet" {
  source                    = "../../modules12/subnet"
  subnet_name               = var.krtagw1_subnet_name
  virtual_network_name      = module.applicationvnet.virtual_network_name
  resource_group_name       = module.applicationrg.resource_group_name
  address_prefix            = var.krtagw1_subnet_adress_space
  # network_security_group_id = module.krtagw1nsg.network_security_group_id
  service_endpoints         = ["Microsoft.Storage"]
}

module "krtapp1subnet" {
  source                    = "../../modules12/subnet"
  subnet_name               = var.krtapp1_subnet_name
  virtual_network_name      = module.applicationvnet.virtual_network_name
  resource_group_name       = module.applicationrg.resource_group_name
  address_prefix            = var.krtapp1_subnet_adress_space
  # network_security_group_id = module.krtapp1nsg.network_security_group_id
  # route_table_id            = data.azurerm_route_table.spi_route_table.id
  service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage"]
}

module "krtase1subnet" {
  source                    = "../../modules12/subnet"
  subnet_name               = var.krtase1_subnet_name
  virtual_network_name      = module.applicationvnet.virtual_network_name
  resource_group_name       = module.applicationrg.resource_group_name
  address_prefix            = var.krtase1_subnet_adress_space
  # network_security_group_id = module.krtase1nsg.network_security_group_id
  # route_table_id            = azurerm_route_table.aseroutetable.id
  service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage"]
}


### Network Security Group Associations

resource "azurerm_subnet_network_security_group_association" "krtagw1subnet" {
  subnet_id                 = module.krtagw1subnet.subnet_id
  network_security_group_id = module.krtagw1nsg.network_security_group_id
}

resource "azurerm_subnet_network_security_group_association" "krtapp1subnet" {
  subnet_id                 = module.krtapp1subnet.subnet_id
  network_security_group_id = module.krtapp1nsg.network_security_group_id
}

resource "azurerm_subnet_network_security_group_association" "krtase1subnet" {
  subnet_id                 = module.krtase1subnet.subnet_id
  network_security_group_id = module.krtase1nsg.network_security_group_id
}


### Route Table Associations

resource "azurerm_subnet_route_table_association" "krtapp1subnet" {
  subnet_id      = module.krtapp1subnet.subnet_id
  route_table_id = data.azurerm_route_table.spi_route_table.id
}

resource "azurerm_subnet_route_table_association" "krtase1subnet" {
  subnet_id      = module.krtase1subnet.subnet_id
  route_table_id = azurerm_route_table.aseroutetable.id
}
