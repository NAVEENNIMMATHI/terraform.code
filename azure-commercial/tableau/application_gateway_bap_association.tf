resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "application_gateway_bap_association" {
  network_interface_id    = azurerm_network_interface.tableau_server_nic.id
  ip_configuration_name   = azurerm_network_interface.tableau_server_nic.ip_configuration[0].name
  backend_address_pool_id = azurerm_application_gateway.application_gateway.backend_address_pool[0].id
}