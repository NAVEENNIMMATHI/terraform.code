resource "azurerm_eventhub" "hub_events" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-hub1-eventhub1" : "ehb-${var.location_acronym}-core1-${var.environment_acronym}"
  namespace_name      = azurerm_eventhub_namespace.hub_events_namespace.name
  resource_group_name = azurerm_resource_group.loganalytics.name
  partition_count     = 2
  message_retention   = 1
}

resource "azurerm_eventhub_namespace_authorization_rule" "hub_events_namespace_auth_rule" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-hub1-eventhub-auth-rule" : "ehr-${var.location_acronym}-core1-${var.environment_acronym}"
  namespace_name      = azurerm_eventhub_namespace.hub_events_namespace.name
  resource_group_name = azurerm_resource_group.loganalytics.name

  listen = true
  send   = true
  manage = true
}