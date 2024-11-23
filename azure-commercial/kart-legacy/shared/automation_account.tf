module "automationaccount" {
  source                  = "../../modules12/automation_account"
  automation_account_name = var.automation_account_name
  resource_group_name     = data.azurerm_resource_group.sharedrg.name
  resource_group_location = data.azurerm_resource_group.sharedrg.location
  tags                    = var.tags
}

