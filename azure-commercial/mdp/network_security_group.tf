module "mdp_nsg_databricks_public" {
    source = "../../modules/network_security_group"
    name = "nsg-${var.location_acronym}-mdp-adbpub-${var.environment_acronym}"
    resource_group_name = module.mdp_rg_main.resource_group_name
    location = module.mdp_rg_main.resource_group_location
    tags = var.tags
}

module "mdp_nsg_association_databricks_public" {
    source = "../../modules/network_security_group_association"
    network_security_group_id = module.mdp_nsg_databricks_public.network_security_group_id
    subnet_id = module.mdp_subnet_adb_pub.subnet_id
}

module "mdp_nsg_databricks_private" {
    source = "../../modules/network_security_group"
    name = "nsg-${var.location_acronym}-mdp-adbpriv-${var.environment_acronym}"
    resource_group_name = module.mdp_rg_main.resource_group_name
    location = module.mdp_rg_main.resource_group_location
    tags = var.tags
}

module "mdp_nsg_association_databricks_private" {
    source = "../../modules/network_security_group_association"
    network_security_group_id = module.mdp_nsg_databricks_private.network_security_group_id
    subnet_id = module.mdp_subnet_adb_private.subnet_id
}

module "mdp_nsg_avscan" {
    source = "../../modules/network_security_group"
    name = "nsg-${var.location_acronym}-mdp-avscan-${var.environment_acronym}"
    resource_group_name = module.mdp_rg_main.resource_group_name
    location = module.mdp_rg_main.resource_group_location
    tags = var.tags
}

module "mdp_nsg_association_avscan" {
    source = "../../modules/network_security_group_association"
    network_security_group_id = module.mdp_nsg_avscan.network_security_group_id
    subnet_id = module.mdp_subnet_avscan.subnet_id
}

module "mdp_nsg_iics" {
    source = "../../modules/network_security_group"
    name = "nsg-${var.location_acronym}-mdp-iics-${var.environment_acronym}"
    resource_group_name = module.mdp_rg_main.resource_group_name
    location = module.mdp_rg_main.resource_group_location
    tags = var.tags
}

module "mdp_nsg_association_iics" {
    source = "../../modules/network_security_group_association"
    network_security_group_id = module.mdp_nsg_iics.network_security_group_id
    subnet_id = module.iicssubnet.subnet_id
}

module "mdp_nsg_agw" {
    source = "../../modules/network_security_group"
    name = "nsg-${var.location_acronym}-mdp-agw-${var.environment_acronym}"
    resource_group_name = module.mdp_rg_main.resource_group_name
    location = module.mdp_rg_main.resource_group_location
    tags = var.tags
}

module "mdp_nsg_association_agw" {
    source = "../../modules/network_security_group_association"
    network_security_group_id = module.mdp_nsg_agw.network_security_group_id
    subnet_id = module.mdp_subnet_agw.subnet_id
}

module "mdp_nsg_apim" {
    source = "../../modules/network_security_group"
    name = "nsg-${var.location_acronym}-${var.application_acronym}-apim-${var.environment_acronym}"
    resource_group_name = module.mdp_rg_main.resource_group_name
    location = module.mdp_rg_main.resource_group_location

    tags = var.tags
}

module "mdp_nsg_association_apim" {
    source = "../../modules/network_security_group_association"
    network_security_group_id = module.mdp_nsg_apim.network_security_group_id
    subnet_id = module.mdp_subnet_apim.subnet_id
}


module "mdp_nsg_func" {
    source = "../../modules/network_security_group"
    name = "nsg-${var.location_acronym}-${var.application_acronym}-func-${var.environment_acronym}"
    resource_group_name = module.mdp_rg_main.resource_group_name
    location = module.mdp_rg_main.resource_group_location

    tags = var.tags
}

module "mdp_nsg_association_func" {
    source = "../../modules/network_security_group_association"
    network_security_group_id = module.mdp_nsg_func.network_security_group_id
    subnet_id = module.mdp_subnet_funapp.subnet_id
}

module "mdp_nsg_aks" {
    source                          = "../../modules/network_security_group"
    name                            = "nsg-${var.location_acronym}-${var.application_acronym}-aks-${var.environment_acronym}"
    resource_group_name             = module.mdp_rg_main.resource_group_name
    location                        = module.mdp_rg_main.resource_group_location

    tags = var.tags
}

module "mdp_nsg_association_aks" {
    source                          = "../../modules/network_security_group_association"
    network_security_group_id       = module.mdp_nsg_aks.network_security_group_id
    subnet_id                       = module.mdp_aks_subnet.subnet_id
}


#ClamAV NSG for avwap and avfap
module "mdp_nsg_clamav_wap" {
    source                          = "../../modules/network_security_group"
    name                            = "nsg-${var.location_acronym}-${var.application_acronym}-avwap-${var.environment_acronym}"
    resource_group_name             = module.mdp_rg_main.resource_group_name
    location                        = module.mdp_rg_main.resource_group_location

    tags                            = var.tags
}

module "mdp_nsg_association_clamav_wap" {
    source                          = "../../modules/network_security_group_association"
    network_security_group_id       = module.mdp_nsg_clamav_wap.network_security_group_id
    subnet_id                       = module.mdp_clamav_wap_subnet.subnet_id
}

module "mdp_nsg_clamav_fap" {
    source                          = "../../modules/network_security_group"
    name                            = "nsg-${var.location_acronym}-${var.application_acronym}-avfap-${var.environment_acronym}"
    resource_group_name             = module.mdp_rg_main.resource_group_name
    location                        = module.mdp_rg_main.resource_group_location

    tags = var.tags
}

module "mdp_nsg_association_clam_fap" {
    source                          = "../../modules/network_security_group_association"
    network_security_group_id       = module.mdp_nsg_clamav_fap.network_security_group_id
    subnet_id                       = module.mdp_clamav_fap_subnet.subnet_id
}

#Appintg NSG
module "mdp_nsg_appintg" {
    source                          = "../../modules/network_security_group"
    name                            = "nsg-${var.location_acronym}-${var.application_acronym}-appintg-${var.environment_acronym}"
    resource_group_name             = module.mdp_rg_main.resource_group_name
    location                        = module.mdp_rg_main.resource_group_location

    tags                            = var.tags
}

module "mdp_nsg_association_appintg" {
    source                          = "../../modules/network_security_group_association"
    network_security_group_id       = module.mdp_nsg_appintg.network_security_group_id
    subnet_id                       = module.appintgsubnet.subnet_id
}