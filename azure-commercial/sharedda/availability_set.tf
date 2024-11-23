module "aset_build" {
  source                       = "../../modules/availability_set"
  availability_set_name        = "avs-usc-build-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
  resource_group_location      = "${module.applicationrg.resource_group_location}"
  resource_group_name          = "${module.applicationrg.resource_group_name}"
  platform_fault_domain_count  = "2"
  tags                         = "${var.tags}"
}

module "aset_admin" {
  source                       = "../../modules/availability_set"
  availability_set_name        = "avs-usc-admin-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
  resource_group_location      = "${module.applicationrg.resource_group_location}"
  resource_group_name          = "${module.applicationrg.resource_group_name}"
  platform_fault_domain_count  = "2"
  tags                         = "${var.tags}"
}

module "aset_pbi" {
  source                       = "../../modules/availability_set"
  availability_set_name        = "avs-${var.location_acronym}-pbi-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
  resource_group_location      = "${module.applicationrg.resource_group_location}"
  resource_group_name          = "${module.applicationrg.resource_group_name}"
  platform_fault_domain_count  = "2"
  tags                         = "${var.tags}"
}

module "aset_wst" {
  source                       = "../../modules/availability_set"
  availability_set_name        = "avs-${var.location_acronym}-wst-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
  resource_group_location      = "${module.applicationrg.resource_group_location}"
  resource_group_name          = "${module.applicationrg.resource_group_name}"
  platform_fault_domain_count  = "2"
  tags                         = "${var.tags}"
}