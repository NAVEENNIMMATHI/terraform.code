resource "azurerm_data_factory" "spiadf" {
  name                          =var.environment == "production" ? "cospidatafactory" :  "dtf-${var.location_acronym}-df-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name           = azurerm_resource_group.cospidatafactoryrg.name
  location                      = var.location
  identity {
    type                        = "SystemAssigned"
  }

tags = var.environment == "production" ? var.tags_vm : var.tags
 }
