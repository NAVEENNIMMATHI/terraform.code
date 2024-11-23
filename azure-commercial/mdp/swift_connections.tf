resource "azurerm_app_service_virtual_network_swift_connection" "general_fap" {
  app_service_id = azurerm_function_app.main.id
  subnet_id      = module.mdp_subnet_funapp.subnet_id
}

resource "azurerm_app_service_virtual_network_swift_connection" "avscan_fap" {
  app_service_id = azurerm_function_app.fun_avscan.id
  subnet_id      = module.mdp_clamav_fap_subnet.subnet_id
}

resource "azurerm_app_service_virtual_network_swift_connection" "avscan_wap" {
  app_service_id = azurerm_app_service.app_avscan.id
  subnet_id      = module.mdp_clamav_wap_subnet.subnet_id
}

#Vnet for App integration
resource "azurerm_app_service_virtual_network_swift_connection" "appintg_web" {
  app_service_id = azurerm_app_service.web_appintg.id
  subnet_id      = module.appintgsubnet.subnet_id
}