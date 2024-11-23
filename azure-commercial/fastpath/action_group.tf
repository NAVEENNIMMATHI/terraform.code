resource "azurerm_monitor_action_group" "action_group_alert" {
  name                = "actiongroup"
  resource_group_name = module.apprg.resource_group_name
  tags                = var.tags
  short_name          = "notifcation"

  email_receiver {
    name              = "notifyme"
    email_address     = var.custom_emails
  }
}

