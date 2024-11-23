#VNet integration
resource "azurerm_app_service_virtual_network_swift_connection" "eccm_lap" {
  app_service_id = azurerm_logic_app_standard.eccm_logic_app.id
  subnet_id      = module.eccm_lap_pub_subnet.subnet_id
}

#VNet integration
resource "azurerm_app_service_virtual_network_swift_connection" "eccm_web_app" {
  app_service_id = azurerm_app_service.eccm_web_app.id
  subnet_id      = module.eccm_app_subnet.subnet_id
}

#VNet integration
resource "azurerm_app_service_virtual_network_swift_connection" "eccm_fun_app" {
  app_service_id = azurerm_function_app.eccm_fun_app.id
  subnet_id      = module.eccm_app_subnet.subnet_id
}


