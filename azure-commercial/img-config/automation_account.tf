module "ama-core" {
  source                  = "../../modules/automation_account"
  automation_account_name = "${var.automation_account_name}"
  resource_group_location = "${data.azurerm_resource_group.rg-core-shared.location}"
  resource_group_name     = "${data.azurerm_resource_group.rg-core-shared.name}"
  tags                    = "${var.tags}"
}