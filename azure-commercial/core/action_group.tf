resource "azurerm_monitor_action_group" "Deallocate-VM" {
  name                = "DeallocateVM"
  resource_group_name = var.automation_account_resource_group_name
  short_name          = "DeallocateVM"
  tags = var.tags

  automation_runbook_receiver {
    name                    = "DeallocateVM"
    automation_account_id   = azurerm_automation_account.ama-use-dsc.id
    runbook_name            = "StopVM"
    webhook_resource_id     = azurerm_automation_webhook.Deallocate-VM.id
    is_global_runbook       = false
    service_uri             = azurerm_automation_webhook.Deallocate-VM.uri
    use_common_alert_schema = false
  }
}