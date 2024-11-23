module "ablaappserviceplan" {
  source                     = "../../modules/app_service_plan"
  name                       = "${var.ablaappserviceplan_name}"
  resource_group_name        = "${module.applicationrg.resource_group_name}"
  resource_group_location    = "${module.applicationrg.resource_group_location}"
  tier                       = "${var.abla_asp01_tier}"
  size                       = "${var.abla_asp01_size}"
  app_service_environment_id = "${var.abla_asp_app_service_environment_id}"
  tags                       = "${var.tags}"
}