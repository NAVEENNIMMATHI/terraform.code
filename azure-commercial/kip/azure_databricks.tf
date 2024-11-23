resource "azurerm_databricks_workspace" "this" {
  name                = "dbws-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  sku                 = "premium"
  tags                = var.tags
  custom_parameters {
      public_subnet_name  = azurerm_subnet.databricks_public_subnet.name
      public_subnet_network_security_group_association_id = module.databricks_public_subnet_nsg_association.network_security_group_subnet_association_id
      private_subnet_name = azurerm_subnet.databricks_private_subnet.name
      private_subnet_network_security_group_association_id = module.databricks_private_subnet_nsg_association.network_security_group_subnet_association_id
      virtual_network_id  = module.applicationvnet.virtual_network_id      
  }

  lifecycle {
    ignore_changes = [
      public_network_access_enabled
    ]
  }

  depends_on = [module.databricks_private_subnet_nsg_association,module.databricks_public_subnet_nsg_association]  
}