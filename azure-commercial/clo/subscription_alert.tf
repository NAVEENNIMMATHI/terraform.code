resource "azurerm_monitor_action_group" "monitor_action_group" {
  name                = "notifytooperationsteam"
  resource_group_name = module.loganalyticsrg.resource_group_name
  short_name          = "notifcation"

  email_receiver {
    name              = "notifytooperationsteam"
    email_address     = "go-fmmanagedservices@kpmg.com"
  }

  tags                = var.tags
}

