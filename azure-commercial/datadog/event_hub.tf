resource "azurerm_eventhub" "hub_events" {
  name                = "insights-activity-logs"
  namespace_name      = azurerm_eventhub_namespace.event_hub_namespace.name
  resource_group_name = azurerm_resource_group.datadogrg.name
  partition_count     = 2
  message_retention   = 1
}

resource "null_resource" "exportAuditLog" {
    provisioner "local-exec" {
        command = "../../powershell/datadog/activity_logs_deploy.ps1 -SubscriptionId ${var.subscription_id} -ResourceGroupName ${azurerm_resource_group.datadogrg.name} -ResourceGroupLocation ${azurerm_resource_group.datadogrg.location} -EventhubNamespace ${azurerm_eventhub.hub_events.namespace_name} -EventhubName ${azurerm_eventhub.hub_events.name} -DiagnosticSettingName ${var.act_diagnostic_setting_name}"
        interpreter = ["PowerShell", "-Command"]
    }

  triggers = {
    always_run = "${timestamp()}"
  }
}

// TBD - until a decision is made either to remove this from automation or use a different SP
// The block is commented out as the Service principal used for Release pipeline fails with this error - 
// does not have authorization to perform action 'microsoft.aadiam/diagnosticSettings/write' over 
// scope '/providers/microsoft.aadiam/diagnosticSettings/aad-logs-datadog-diag' or the scope is invalid

/*
resource "null_resource" "setAADSetting" {
    provisioner "local-exec" {
        command = "../../powershell/datadog/Set-AAD-DiagnosticSetting.ps1 -ClientId ${var.client_id} -TenantId ${var.tenant_id} -ClientSecret ${var.client_secret} -SubscriptionId ${var.subscription_id} -ResourceGroupName ${azurerm_resource_group.datadogrg.name} -EventhubNamespace ${azurerm_eventhub.hub_events.namespace_name} -EventhubName ${azurerm_eventhub.hub_events.name} -DiagnosticSettingName ${var.aad_diagnostic_setting_name} -AuthorizationRuleName ${var.authorization_rule_name}"
        interpreter = ["PowerShell", "-Command"]
    }

  triggers = {
    always_run = "${timestamp()}"
  }
}
*/