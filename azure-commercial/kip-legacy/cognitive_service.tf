resource "azurerm_cognitive_account" "kipcognitiveservice" {
  name                = var.cognitive_service
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  kind                = "CognitiveServices"
  sku_name            = "S0"
  tags                = var.tags
}