#Backend 1
resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "bmpapp" {
  count                   = var.environment == "production" ? "0" : var.count_value_bmpappvm_module
  
  network_interface_id    = module.bmpapp1vm.nic_id[count.index]
  ip_configuration_name   = module.bmpapp1vm.nic_ip_configuration_name[count.index]
  backend_address_pool_id = azurerm_application_gateway.bmpappgw.backend_address_pool[0].id
}

#Backend 2
resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "bmpkpim" {
  count                   = var.environment == "production" ? "0" : var.count_value_bmpkpimvm_module
  
  network_interface_id    = module.bmpkpim1vm.nic_id[count.index]
  ip_configuration_name   = module.bmpkpim1vm.nic_ip_configuration_name[count.index]
  backend_address_pool_id = azurerm_application_gateway.bmpappgw.backend_address_pool[1].id
}

#Backend 3
resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "bmprest" {
  count                   = var.environment == "production" ? "0" : var.count_value_bmprestvm_module
  
  network_interface_id    = module.bmprest1vm.nic_id[count.index]
  ip_configuration_name   = module.bmprest1vm.nic_ip_configuration_name[count.index]
  backend_address_pool_id = azurerm_application_gateway.bmpappgw.backend_address_pool[2].id
}

#Backend 4
resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "meprest" {
  count                   = var.environment == "production" ? "0" : var.count_value_bmprestvm_module
  
  network_interface_id    = module.bmprest1vm.nic_id[count.index]
  ip_configuration_name   = module.bmprest1vm.nic_ip_configuration_name[count.index]
  backend_address_pool_id = azurerm_application_gateway.bmpappgw.backend_address_pool[3].id
}

#Backend 5
resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "mep" {
  count                   = var.environment == "production" ? "0" : var.count_value_bmpkpimvm_module
  
  network_interface_id    = module.bmpkpim1vm.nic_id[count.index]
  ip_configuration_name   = module.bmpkpim1vm.nic_ip_configuration_name[count.index]
  backend_address_pool_id = azurerm_application_gateway.bmpappgw.backend_address_pool[4].id
}

#Backend 6
resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "das" {
  count                   = var.environment == "production" ? "0" : var.count_value_bmpkpimvm_module
  
  network_interface_id    = module.bmpkpim1vm.nic_id[count.index]
  ip_configuration_name   = module.bmpkpim1vm.nic_ip_configuration_name[count.index]
  backend_address_pool_id = azurerm_application_gateway.bmpappgw.backend_address_pool[5].id
}

#Backend 7
resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "dasrest" {
  count                   = var.environment == "production" ? "0" : "1"
  
  network_interface_id    = module.bmprest1vm.nic_id[var.count_value_bmprestvm_module - 1]
  ip_configuration_name   = module.bmprest1vm.nic_ip_configuration_name[var.count_value_bmprestvm_module - 1]
  backend_address_pool_id = azurerm_application_gateway.bmpappgw.backend_address_pool[6].id
}

#Backend 8
resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "dash" {
  count                   = var.environment == "production" ? "0" : var.count_value_bmpkpimvm_module
  
  network_interface_id    = module.bmpkpim1vm.nic_id[count.index]
  ip_configuration_name   = module.bmpkpim1vm.nic_ip_configuration_name[count.index]
  backend_address_pool_id = azurerm_application_gateway.bmpappgw.backend_address_pool[7].id
}

#Backend 9
resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "act" {
  count                   = var.environment == "production" ? "0" : var.count_value_bmpappvm_module
  
  network_interface_id    = module.bmpapp1vm.nic_id[count.index]
  ip_configuration_name   = module.bmpapp1vm.nic_ip_configuration_name[count.index]
  backend_address_pool_id = azurerm_application_gateway.bmpappgw.backend_address_pool[8].id
}