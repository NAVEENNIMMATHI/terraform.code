resource "azurerm_data_factory" "kipadf" {
  name                            = "co-${var.environment_acronym}-eastus-kip-adf"
  resource_group_name             = module.applicationrg.resource_group_name
  location                        = module.applicationrg.resource_group_location
  managed_virtual_network_enabled = true

  identity {
    type                        = "SystemAssigned"
  }

  tags                   		    = var.tags
}

resource "azurerm_data_factory" "kipadf_self_hosted" {
  name                          = "dtf-${var.location_acronym}-${var.application_acronym}-selfhosted-${var.environment_acronym}"
  resource_group_name           = module.applicationrg.resource_group_name
  location                      = module.applicationrg.resource_group_location

  managed_virtual_network_enabled = true
  
  identity {
    type                        = "SystemAssigned"
  }

  tags                   		    = var.tags
}

resource "azurerm_data_factory_integration_runtime_self_hosted" "kipadf_ir_self_hosted" {
  name                = "Self-hosted"
  resource_group_name = module.applicationrg.resource_group_name
  data_factory_name   = azurerm_data_factory.kipadf_self_hosted.name
}