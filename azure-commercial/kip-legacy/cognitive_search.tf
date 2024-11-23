resource "azurerm_search_service" "kipcognitivesearch" {
  name                          = var.cognitive_search
  resource_group_name           = module.applicationrg.resource_group_name
  location                      = module.applicationrg.resource_group_location
  sku                           = "standard"
  partition_count               = var.partition_count
  replica_count                 = var.replica_count
  public_network_access_enabled = false
  tags                          = var.tags
}