resource "azurerm_monitor_action_group" "action_group_alert" {
  name                = var.action_group_name
  resource_group_name = module.applicationrg.resource_group_name
  tags                = var.tags
  short_name = "notifcation"

  email_receiver {
    name          = "notifyme"
    email_address = var.custom_emails
  }
}

