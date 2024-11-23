resource "azurerm_eventhub_namespace" "event_hub_namespace" {
  name                = "ehb-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.datadogrg.name
  location            = azurerm_resource_group.datadogrg.location
  sku                 = "Standard"
  capacity            = 1

  tags = var.tags
}