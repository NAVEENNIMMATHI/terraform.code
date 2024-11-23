module "asensg"{
    source                      = "../../modules/network_security_group"
    name                        = "nsg-${var.location_acronym}-ase-${var.environment_acronym}"
    location                    = module.sharedrg.resource_group_location
    resource_group_name         = module.sharedrg.resource_group_name
    tags                        = var.tags
}

#module "appgatewaynsg"{
#     source                      = "../../modules/network_security_group"
#     name                        = "${var.appgateway_network_security_group_name}"
#     location                    = "${module.sharedrg.resource_group_location}"
#     resource_group_name         = "${module.sharedrg.resource_group_name}"
#     tags                        = "${var.tags}"
# }

module "powerapptoappgatewaynsg"{
     source                      =  "../../modules/network_security_group"
     name                        =  "nsg-${var.location_acronym}-kpmgonly-${var.environment_acronym}"
     location                    =  module.sharedrg.resource_group_location
     resource_group_name         =  module.sharedrg.resource_group_name

     tags                        = var.tags
 }

module "agwnsg"{
    source                      = "../../modules/network_security_group"
    name                        = "nsg-usc-agw-${var.environment_acronym}"
    location                    = module.sharedrg.resource_group_location
    resource_group_name         = module.sharedrg.resource_group_name
    tags                        = var.tags
}

module "mgmtnsg"{
    source                      = "../../modules/network_security_group"
    name                        = "nsg-${var.location_acronym}-mgmt-${var.environment_acronym}"
    location                    = module.sharedrg.resource_group_location
    resource_group_name         = module.sharedrg.resource_group_name
    tags                        = var.tags
}

module "buildnsg"{
    source                      = "../../modules/network_security_group"
    name                        = "nsg-${var.location_acronym}-build-${var.environment_acronym}"
    location                    = module.sharedrg.resource_group_location
    resource_group_name         = module.sharedrg.resource_group_name
    tags                        = var.tags
}