resource "azurerm_databricks_workspace" "workspace" {
  name                = var.environment == "p" ? "co-p-databricks-workspace" : "adb-${var.location_acronym}-${var.project_acronym}-${var.environment_acronym}"
  location            = module.databricksrg.resource_group_location
  resource_group_name = module.databricksrg.resource_group_name
  sku                 = "premium"
  tags = var.tags

  custom_parameters {
      public_subnet_name  = azurerm_subnet.controlplane.name
      private_subnet_name = azurerm_subnet.webapp.name
      virtual_network_id  = data.azurerm_virtual_network.spi_vnet.id
  }

  depends_on = [module.controlplane_subnet_nsg_association,module.webapp_subnet_nsg_association]

}