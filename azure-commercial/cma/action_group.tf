resource "azurerm_monitor_action_group" "action_group_alert" {
  name                = "agp-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.cmarg.resource_group_name
  short_name          = "notifcation"

  email_receiver {
    name          = "notifyme"
    email_address = var.custom_emails
  }
  
  tags       = var.tags
}
