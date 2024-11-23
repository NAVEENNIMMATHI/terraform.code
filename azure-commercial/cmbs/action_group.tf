resource "azurerm_monitor_action_group" "action_group_alert" {
  name                = "${var.application_acronym}-actiongroup"
  resource_group_name = module.cmbsrg.resource_group_name
  short_name          = "notifcation"

  email_receiver {
    name          = "notifyme"
    email_address = "go-fmmanagedservices@kpmg.com"
  }

  tags = var.tags
}