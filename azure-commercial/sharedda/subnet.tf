module "asesubnet" {
    source                    = "../../modules/subnet"
    subnet_name               = "sub-usc-ase-${lower(var.environment_acronym)}"
    virtual_network_name      = module.sharedvnet.virtual_network_name
    resource_group_name       = module.applicationrg.resource_group_name
    address_prefix            = var.ase_subnet_address_space
    service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}

module "mgmtsubnet" {
    source                    = "../../modules/subnet"
    subnet_name               = "sub-usc-mgmt-${lower(var.environment_acronym)}"
    virtual_network_name      = module.sharedvnet.virtual_network_name
    resource_group_name       = module.applicationrg.resource_group_name
    address_prefix            = var.mgmt_subnet_address_space
    service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}
module "buildsubnet" {
    source                    = "../../modules/subnet"
    subnet_name               = "sub-usc-build-${lower(var.environment_acronym)}"
    virtual_network_name      = module.sharedvnet.virtual_network_name
    resource_group_name       = module.applicationrg.resource_group_name
    address_prefix            = var.build_subnet_address_space
    service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}
module "agwsubnet" {
    source                    = "../../modules/subnet"
    subnet_name               = "sub-usc-agw-${lower(var.environment_acronym)}"
    virtual_network_name      = module.sharedvnet.virtual_network_name
    resource_group_name       = module.applicationrg.resource_group_name
    address_prefix            = var.agw_subnet_address_space
    service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}
module "agwsubnet_kpmgonly" {
    source                    = "../../modules/subnet"
    subnet_name               = "sub-use-agw-kpmgonly-${lower(var.environment_acronym)}"
    virtual_network_name      = module.sharedvnet.virtual_network_name
    resource_group_name       = module.applicationrg.resource_group_name
    address_prefix            = var.agw_subnet_address_space_kpmgonly
    service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}
module "pbisubnet" {
    source                    = "../../modules/subnet"
    subnet_name               = "sub-${var.location_acronym}-pbi-${lower(var.environment_acronym)}"
    virtual_network_name      = module.sharedvnet.virtual_network_name
    resource_group_name       = module.applicationrg.resource_group_name
    address_prefix            = var.pbi_subnet_address_space
    service_endpoints         = ["Microsoft.Storage"]
}
module "wstsubnet" {
    source                    = "../../modules/subnet"
    subnet_name               = "sub-${var.location_acronym}-wst-${lower(var.environment_acronym)}"
    virtual_network_name      = module.sharedvnet.virtual_network_name
    resource_group_name       = module.applicationrg.resource_group_name
    address_prefix            = var.wst_subnet_address_space
    service_endpoints         = ["Microsoft.Storage"]
}
module "private_endpoint" {
  source                      = "../../modules/subnet"
  subnet_name                 = "sub-${var.location_acronym}-pe-${var.environment_acronym}"
  virtual_network_name        = module.sharedvnet.virtual_network_name
  resource_group_name         = module.applicationrg.resource_group_name
  address_prefix              = var.pe_subnet_address_space
  service_endpoints           = ["Microsoft.Sql"]
  enforce_private_link_endpoint_network_policies = true
}