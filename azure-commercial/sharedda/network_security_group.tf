module "asensg"{
    source                      = "../../modules/network_security_group"
    name                        = "nsg-usc-ase-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
    location                    = module.applicationrg.resource_group_location
    resource_group_name         = module.applicationrg.resource_group_name
    tags                        = var.tags
}

module "buildnsg"{
    source                      = "../../modules/network_security_group"
    name                        = "nsg-usc-build-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
    location                    = module.applicationrg.resource_group_location
    resource_group_name         = module.applicationrg.resource_group_name
    tags                        = var.tags
}

module "adminnsg"{
    source                      = "../../modules/network_security_group"
    name                        = "nsg-usc-admin-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
    location                    = module.applicationrg.resource_group_location
    resource_group_name         = module.applicationrg.resource_group_name
    tags                        = var.tags
}
module "agwnsg"{
    source                      = "../../modules/network_security_group"
    name                        = "nsg-usc-agw-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
    location                    = module.applicationrg.resource_group_location
    resource_group_name         = module.applicationrg.resource_group_name
    tags                        = var.tags
}
module "agwnsg_kpmgonly"{
    source                      = "../../modules/network_security_group"
    name                        = "nsg-use-agw-kpmgonly-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
    location                    = module.applicationrg.resource_group_location
    resource_group_name         = module.applicationrg.resource_group_name
    tags                        = var.tags
}
module "pbinsg"{
    source                      = "../../modules/network_security_group"
    name                        = "nsg-${var.location_acronym}-pbi-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
    location                    = module.applicationrg.resource_group_location
    resource_group_name         = module.applicationrg.resource_group_name
    tags                        = var.tags
}
module "wstnsg"{
    source                      = "../../modules/network_security_group"
    name                        = "nsg-${var.location_acronym}-wst-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
    location                    = module.applicationrg.resource_group_location
    resource_group_name         = module.applicationrg.resource_group_name
    tags                        = var.tags
}