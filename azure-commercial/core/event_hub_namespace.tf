resource "azurerm_eventhub_namespace" "hub_events_namespace" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-hub1-eventhub" : "ehn-${var.location_acronym}-core1-${var.environment_acronym}"
  location            = azurerm_resource_group.loganalytics.location
  resource_group_name = azurerm_resource_group.loganalytics.name
  sku                 = "Standard"
  capacity            = 1
  #kafka_enabled       = true

  network_rulesets {
    default_action = "Deny"
  }

  tags = var.tags
}

resource "azurerm_eventhub_namespace" "hubla_events_namespace" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-eventhub-loganalytics" : "ehn-${var.location_acronym}-loganalytics-${var.environment_acronym}"
  location            = azurerm_resource_group.loganalytics.location
  resource_group_name = azurerm_resource_group.loganalytics.name
  sku                 = "Basic"
  capacity            = 1

  network_rulesets {
    default_action = "Deny"
  }

  tags = var.tags
}
