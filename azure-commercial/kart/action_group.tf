resource "azurerm_monitor_action_group" "action_group_alert" {
  
  name                = "krtactiongroup${title(var.application_url_environment_acronym)}"
  resource_group_name = module.applicationrg.resource_group_name
  tags                = var.tags
  short_name          = "notifcation"

  email_receiver {
    name              = "notifyme"
    email_address     = var.custom_emails
  }
}