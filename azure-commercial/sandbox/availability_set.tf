module "availabilityset"{
    source="../modules/availability_set"
    availability_set_name = "${local.availability-set-default-name}"
    resource_group_location = "${module.applicationrg.resource_group_location}"
    resource_group_name = "${module.applicationrg.resource_group_name}"
    tags ="${var.tags}"
}