resource "azurerm_automation_webhook" "Deallocate-VM" {
  name                    = "DeallocateVM"
  resource_group_name     = var.automation_account_resource_group_name
  automation_account_name = azurerm_automation_account.ama-use-dsc.name
  expiry_time             = "2031-12-31T00:00:00Z"
  enabled                 = true
  runbook_name            = "StopVM"
}