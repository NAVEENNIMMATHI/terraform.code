module "applicationvnet"{
    source                  = "../../modules/virtual_network"
    virtual_network_name    = "${var.virtual_network_name}"
    resource_group_location = "${module.applicationrg.resource_group_location}"
    resource_group_name     = "${module.applicationrg.resource_group_name}"
    address_space           = "${var.address_space}"
    dns_server              = "${var.dns_server}"
    tags                    = "${var.tags}"
}


#module "aseapplicationvnet"{
#    source="modules/virtual_network"
#    vnet_name="co${var.environment}${var.application_rg_location}-${var.application_acronym}ase-vnet"
#    resource_group_location = "${module.applicationrg.resource_group_location}"
#    resource_group_name ="${module.applicationrg.resource_group_name}"
#    address_space       = "${var.ablease_address_space}"
#        tags  = "${var.tags}"
#}