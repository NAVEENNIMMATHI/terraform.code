resource "azurerm_network_ddos_protection_plan" "applicationvnetddosprotectionplan" {
  count               = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? 1 : 0

  name                = "dpp-${var.location_acronym}-${var.application_acronym}-${var.legacy_env_acronym}"
  resource_group_name = azurerm_resource_group.hubvnet.name
  location            = azurerm_resource_group.hubvnet.location

  tags = var.tags
}