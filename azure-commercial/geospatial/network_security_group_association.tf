# For AGW
module "arcgis_nsg_agw" {
    source              = "../../modules/network_security_group"
    name                = "nsg-${var.location_acronym}-${var.application_acronym}-agw-${var.environment_acronym}"
    resource_group_name = module.geospatial_rg.resource_group_name
    location            = module.geospatial_rg.resource_group_location
   
    tags = var.tags
}

module "arcgis_nsg_association_agw" {
    source                    = "../../modules/network_security_group_association"
    network_security_group_id = module.arcgis_nsg_agw.network_security_group_id
    subnet_id                 = module.geospatial_agw_subnet.subnet_id
}

#For AKS
module "arcgis_nsg_aks" {
    source                          = "../../modules/network_security_group"
    name                            = "nsg-${var.location_acronym}-${var.application_acronym}-aks-${var.environment_acronym}"
    resource_group_name             = module.geospatial_rg.resource_group_name
    location                        = module.geospatial_rg.resource_group_location

    tags = var.tags
}

module "arcgis_nsg_association_aks" {
    source                    = "../../modules/network_security_group_association"
    network_security_group_id = module.arcgis_nsg_aks.network_security_group_id
    subnet_id                 = module.geospatial_aks_subnet.subnet_id
}

#For vm
module "arcgis_nsg_vm" {
    source                          = "../../modules/network_security_group"
    name                            = "nsg-${var.location_acronym}-${var.application_acronym}-vm-${var.environment_acronym}"
    resource_group_name             = module.geospatial_rg.resource_group_name
    location                        = module.geospatial_rg.resource_group_location

    tags = var.tags
}

module "arcgis_nsg_association_vm" {
    source                    = "../../modules/network_security_group_association"
    network_security_group_id = module.arcgis_nsg_vm.network_security_group_id
    subnet_id                 = module.geospatial_vm_subnet.subnet_id
}

##Management_subnet_association
module "arcgis_nsg_association_mgmt" {
    source                    = "../../modules/network_security_group_association"
    network_security_group_id = module.arcgis_nsg_vm.network_security_group_id
    subnet_id                 = module.geospatial_mgmt_subnet.subnet_id
}
