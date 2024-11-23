module "applicationvnet" {
  source                    = "../../modules/virtual_network"
  virtual_network_name      = var.environment == "production" ? "co-pd-eastus-kip-vnet" : "vnt-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_location   = module.applicationrg.resource_group_location
  resource_group_name       = module.applicationrg.resource_group_name
  address_space             = var.address_space
  dns_server                = var.environment_acronym == "dv" ? [var.azfirewall_ip_address] : var.dns_server
  
  tags                      = var.tags
}

module "agw1subnet" {
  source                    = "../../modules/subnet"
  subnet_name               = var.environment == "production" ? "co-pd-eastus-kipagw1-subnet" : "sub-${var.location_acronym}-agw1-subnet-${var.environment_acronym}"
  virtual_network_name      = module.applicationvnet.virtual_network_name
  resource_group_name       = module.applicationrg.resource_group_name
  address_prefix            = var.agw1_subnet_adress_space
  service_endpoints         = ["Microsoft.Storage"]
}

module "app1subnet" {
  source                    = "../../modules/subnet"
  subnet_name               = var.environment == "production" ? "co-pd-eastus-kipapp1-subnet" : "sub-${var.location_acronym}-app1-subnet-${var.environment_acronym}"
  virtual_network_name      = module.applicationvnet.virtual_network_name
  resource_group_name       = module.applicationrg.resource_group_name
  enforce_private_link_endpoint_network_policies =var.enforce_private_link_endpoint_network_policies
  address_prefix            = var.app1_subnet_adress_space
  service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage"]
}

module "wst1subnet" {
  source                    = "../../modules/subnet"
  subnet_name               = var.environment == "production" ? "co-pd-eastus-kipwst1-subnet" : "sub-${var.location_acronym}-wst1-subnet-${var.environment_acronym}"
  virtual_network_name      = module.applicationvnet.virtual_network_name
  resource_group_name       = module.applicationrg.resource_group_name
  address_prefix            = var.wst1_subnet_adress_space
  service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage"]
  enforce_private_link_endpoint_network_policies = true
}

module "ase1subnet" {
  source                    = "../../modules/subnet"
  subnet_name               = var.environment == "production" ? "co-pd-eastus-kipase1-subnet" : "sub-${var.location_acronym}-ase1-subnet-${var.environment_acronym}"
  virtual_network_name      = module.applicationvnet.virtual_network_name
  resource_group_name       = module.applicationrg.resource_group_name
  address_prefix            = var.ase1_subnet_adress_space
  service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage"]
}

module "pbi1subnet" {
  source                    = "../../modules/subnet"
  subnet_name               = var.environment == "production" ? "co-pd-eastus-kippbi1-subnet" : "sub-${var.location_acronym}-pbi1-subnet-${var.environment_acronym}"
  virtual_network_name      = module.applicationvnet.virtual_network_name
  resource_group_name       = module.applicationrg.resource_group_name
  address_prefix            = var.pbi1_subnet_adress_space
  service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage"]
}

module "adxsubnet" {
  source                    = "../../modules/subnet"
  subnet_name               = var.environment == "production" ? "co-pd-eastus-kipadx1-subnet" : "sub-${var.location_acronym}-adx1-subnet-${var.environment_acronym}"
  virtual_network_name      = module.applicationvnet.virtual_network_name
  resource_group_name       = module.applicationrg.resource_group_name
  address_prefix            = var.adx1_subnet_adress_space
  service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage"]
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_subnet" "db1subnet" {
  name                      = var.environment == "production" ? "co-pd-eastus-kipdb1-subnet" : "sub-${var.location_acronym}-db1-subnet-${var.environment_acronym}"
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

resource "azurerm_subnet" "databricks_private_subnet" {
  name                 = "sub-${var.location_acronym}-dbws-private-subnet-${var.environment_acronym}"
  resource_group_name  = module.applicationrg.resource_group_name
  virtual_network_name = module.applicationvnet.virtual_network_name
  address_prefixes     = [var.databricks_subnet_private_address_space]
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.AzureActiveDirectory"]

  delegation {
    name = "private-subnet-databricks-delegation"
    service_delegation {
      name    = "Microsoft.Databricks/workspaces"
      actions = [
                  "Microsoft.Network/virtualNetworks/subnets/join/action",
                  "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
                  "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
                ]
    }
  }
}

resource "azurerm_subnet" "databricks_public_subnet" {
  name                 = "sub-${var.location_acronym}-dbws-public-subnet-${var.environment_acronym}"
  resource_group_name  = module.applicationrg.resource_group_name
  virtual_network_name = module.applicationvnet.virtual_network_name
  address_prefixes     = [var.databricks_subnet_public_address_space]
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.AzureActiveDirectory"]

  delegation {
    name = "Microsoft.Databricks.workspaces"
    service_delegation {
      name    = "Microsoft.Databricks/workspaces"
      actions = [
                  "Microsoft.Network/virtualNetworks/subnets/join/action",
                  "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
                  "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
                ]
    }
  }
}

module "adf1subnet" {
  source                    = "../../modules/subnet"
  subnet_name               = "sub-${var.location_acronym}-adf-${var.environment_acronym}"
  resource_group_name       = module.applicationrg.resource_group_name
  virtual_network_name      = module.applicationvnet.virtual_network_name
  address_prefix            = var.adf_int_runtime_subnet_address_space
  service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage"]
}

module "syn1subnet" {
  source                    = "../../modules/subnet"
  subnet_name               = "sub-${var.location_acronym}-syn-${var.environment_acronym}"
  resource_group_name       = module.applicationrg.resource_group_name
  virtual_network_name      = module.applicationvnet.virtual_network_name
  address_prefix            = var.syn_int_runtime_subnet_address_space
  service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage"]
}

module "pvw1subnet" {
  source                    = "../../modules/subnet"
  subnet_name               = "sub-${var.location_acronym}-pvw-${var.environment_acronym}"
  resource_group_name       = module.applicationrg.resource_group_name
  virtual_network_name      = module.applicationvnet.virtual_network_name
  address_prefix            = var.pvw_int_runtime_subnet_address_space
  service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage"]
}

module "privatelinksubnet" {
  source                  = "../../modules/subnet"
  subnet_name             = "sub-${var.location_acronym}-private-endpoint${var.environment_acronym}"
  resource_group_name     = module.applicationrg.resource_group_name
  virtual_network_name    = module.applicationvnet.virtual_network_name
  address_prefix          = var.private_endpoint_subnet_address_space
  service_endpoints       = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.ServiceBus"]
  enforce_private_link_endpoint_network_policies = true
}

module "kpimcapiqsubnet" {
  source                    = "../../modules/subnet"
  subnet_name               = "sub-${var.location_acronym}-kpim-${var.environment_acronym}"
  resource_group_name       = module.applicationrg.resource_group_name
  virtual_network_name      = module.applicationvnet.virtual_network_name
  address_prefix            = var.kpimcapiq_subnet_address_space
  service_endpoints         = ["Microsoft.Storage", "Microsoft.Sql"]
}