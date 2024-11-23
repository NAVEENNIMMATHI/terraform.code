resource "azurerm_data_factory" "kipadf" {
  name                          = "co-${var.environment}-eastus-kip-adf"
  resource_group_name           = module.applicationrg.resource_group_name
  location                      = module.applicationrg.resource_group_location
  
  identity {
    type = "SystemAssigned"
  }

  tags                   		    = var.tags
  
}