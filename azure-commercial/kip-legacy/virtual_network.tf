module "applicationvnet" {
  source                    = "../../modules12/virtual_network"
  virtual_network_name      = var.virtual_network_name
  resource_group_location   = module.applicationrg.resource_group_location
  resource_group_name       = module.applicationrg.resource_group_name
  address_space             = var.address_space
  dns_server                = var.dns_server

  # ddos_info = {
  #   ddos_plan_id = azurerm_network_ddos_protection_plan.applicationvnetddosprotectionplan.id
  #   ddos_plan_enabled = true
  # }
  
  tags                      = var.tags
}

module "agw1subnet" {
  source                    = "../../modules12/subnet"
  subnet_name               = var.agw1_subnet_name
  virtual_network_name      = module.applicationvnet.virtual_network_name
  resource_group_name       = module.applicationrg.resource_group_name
  address_prefix            = var.agw1_subnet_adress_space
  service_endpoints         = ["Microsoft.Storage"]
}

module "app1subnet" {
  source                    = "../../modules12/subnet"
  subnet_name               = var.app1_subnet_name
  virtual_network_name      = module.applicationvnet.virtual_network_name
  resource_group_name       = module.applicationrg.resource_group_name
  enforce_private_link_endpoint_network_policies =var.enforce_private_link_endpoint_network_policies
  address_prefix            = var.app1_subnet_adress_space
  service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage"]
}

module "wst1subnet" {
  source                    = "../../modules12/subnet"
  subnet_name               = var.wst1_subnet_name
  virtual_network_name      = module.applicationvnet.virtual_network_name
  resource_group_name       = module.applicationrg.resource_group_name
  address_prefix            = var.wst1_subnet_adress_space
  service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage"]
}

module "ase1subnet" {
  source                    = "../../modules12/subnet"
  subnet_name               = var.ase1_subnet_name
  virtual_network_name      = module.applicationvnet.virtual_network_name
  resource_group_name       = module.applicationrg.resource_group_name
  address_prefix            = var.ase1_subnet_adress_space
  service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage"]
}

module "pbi1subnet" {
  source                    = "../../modules12/subnet"
  subnet_name               = var.pbi1_subnet_name
  virtual_network_name      = module.applicationvnet.virtual_network_name
  resource_group_name       = module.applicationrg.resource_group_name
  address_prefix            = var.pbi1_subnet_adress_space
  service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage"]
}

module "adxsubnet" {
  source                    = "../../modules12/subnet"
  subnet_name               = var.adx1_subnet_name
  virtual_network_name      = module.applicationvnet.virtual_network_name
  resource_group_name       = module.applicationrg.resource_group_name
  address_prefix            = var.adx1_subnet_adress_space
  service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage"]
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_subnet" "db1subnet" {
  name                      = var.db1_subnet_name
  virtual_network_name      = module.applicationvnet.virtual_network_name
  resource_group_name       = module.applicationrg.resource_group_name
  address_prefix            = var.db1_subnet_adress_space

  delegation {
    name                    = "managedinstancedelegation"

    service_delegation {
      name                  = "Microsoft.Sql/managedInstances"
      actions               = ["Microsoft.Network/virtualNetworks/subnets/join/action","Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action","Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
    }
  }
}

