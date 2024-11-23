module "applicationrg"
{
  source                  = "../../modules/resource_group"
  resource_group_name     = "${var.resource_group_name}"
  resource_group_location = "${var.resource_group_location}"
  tags                    = "${var.tags}"
}

module "backuprecoveryrg"
{
  source                  = "../../modules/resource_group"
  resource_group_name     = "${var.backuprecovery_resource_group_name}"
  resource_group_location = "${var.resource_group_location}"
  tags                    = "${var.tags}"
}

module "loganalyticsrg"
{
  source                  = "../../modules/resource_group"
  resource_group_name     = "${var.loganalytics_resource_group_name}"
  resource_group_location = "${var.resource_group_location}"
  tags                    = "${var.tags}"
}