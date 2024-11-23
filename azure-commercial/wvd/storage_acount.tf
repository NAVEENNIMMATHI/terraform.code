module "ablasa"
{
  source                  = "../../modules/storage_account"
  storage_account_name    = "${var.storage_account_name}"
  resource_group_location = "${module.applicationrg.resource_group_location}"
  resource_group_name     = "${module.applicationrg.resource_group_name}"
  tags                    = "${var.tags}"
}