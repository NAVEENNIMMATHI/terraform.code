module "rdpusers" {
  source       = "../../modules/ad_group"
  adgroup_name = "CO-FASTPATHRDPUsers-${upper(var.environment_acronym)}"
}

module "buildvmadmins" {
  source       = "../../modules/ad_group"
  adgroup_name = "CO-FASTPATHBuildVMAdmins-${upper(var.environment_acronym)}"
}

module "sqladmins" {
  source       = "../../modules/ad_group"
  adgroup_name = "CO-FASTPATHSqlAdmins-${upper(var.environment_acronym)}"
}
