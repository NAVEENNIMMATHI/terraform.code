module "abla_application_insights" {
  source              = "../../modules/application_insights"
  name                = "${var.abla_ase_app_insights_name}"
  resource_group_name = "${module.applicationrg.resource_group_name}"
  location            = "${module.applicationrg.resource_group_location}"
  tags                = "${var.tags}"
}
