resource "azurerm_cognitive_account" "kipcognitiveservice" {
  name                = var.environment == "production" ? "co-pd-eastus-kipcognitivesvc" : "css-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  kind                = "CognitiveServices"
  sku_name            = "S0"
  local_auth_enabled  = true
  outbound_network_access_restrited = false

  tags                = var.tags
  
}