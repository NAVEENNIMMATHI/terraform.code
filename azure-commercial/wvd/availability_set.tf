module "ablaapp1as"{
    source                       = "../../modules/availability_set"
    availability_set_name        = "${var.availability_set_name1}"
    resource_group_location      = "${module.applicationrg.resource_group_location}"
    resource_group_name          = "${module.applicationrg.resource_group_name}"
    platform_update_domain_count = "5"
    platform_fault_domain_count  = "3"
    tags                         = "${var.tags}"
}

module "ablaapp2as"{
    source                       = "../../modules/availability_set"
    availability_set_name        = "${var.availability_set_name2}"
    resource_group_location      = "${module.applicationrg.resource_group_location}"
    resource_group_name          = "${module.applicationrg.resource_group_name}"
    platform_update_domain_count = "5"
    platform_fault_domain_count  = "3"
    tags                         = "${var.tags}"
}
