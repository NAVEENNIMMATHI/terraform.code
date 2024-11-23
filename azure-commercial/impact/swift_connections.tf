
resource "azurerm_app_service_virtual_network_swift_connection" "impact_app_sc" {
  app_service_id = azurerm_app_service.main.id
  subnet_id      = module.impact_function_subnet.subnet_id
}

resource "azurerm_app_service_virtual_network_swift_connection" "impact_func_sc" {
  app_service_id = azurerm_function_app.main.id
  subnet_id      = module.impact_function_subnet.subnet_id
}
