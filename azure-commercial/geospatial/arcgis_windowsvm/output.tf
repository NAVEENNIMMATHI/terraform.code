output "nic_id" {
  value = azurerm_network_interface.network_interface_card.*.id
}

output "nic_ip_configuration_name" {
  value = azurerm_network_interface.network_interface_card.*.ip_configuration.0.name
}

output "vm_name" {
  value = azurerm_virtual_machine.virtual_machine.*.name
}

output "vm_id" {
  value = azurerm_virtual_machine.virtual_machine.*.id
}