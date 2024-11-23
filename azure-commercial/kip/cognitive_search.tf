resource "azurerm_search_service" "kipcognitivesearch" {
  name                          = var.environment == "production" ? "co-pd-eastus-kipcognitivesrch" : "azs${var.location_acronym}${var.application_acronym}kip${var.environment_acronym}"
  resource_group_name           = module.applicationrg.resource_group_name
  location                      = module.applicationrg.resource_group_location
  sku                           = "standard"
  partition_count               = var.partition_count
  replica_count                 = var.replica_count
  public_network_access_enabled = false  
  identity {
    type                        = "SystemAssigned"
  }
  tags                          = var.tags
}

#resource "azurerm_role_assignment" "searchtostorage" {
  #scope              = module.rawandcuratedsa.id
  #role_definition_name = "Storage Blob Data Contributor"
  #principal_id       = azurerm_search_service.kipcognitivesearch.identity[0].principal_id
  #depends_on        = [azurerm_search_service.kipcognitivesearch]
#}