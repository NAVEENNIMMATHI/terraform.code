resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "bap_association" {
  for_each = var.cmp_clients
  network_interface_id    = module.buildvm_cmp_client[each.key].nic_id[0]
  ip_configuration_name   = module.buildvm_cmp_client[each.key].nic_ip_configuration_name[0]
  backend_address_pool_id = "/subscriptions/${var.subscription_id}/resourceGroups/${module.cmp_rg_shared.resource_group_name}/providers/Microsoft.Network/applicationGateways/${azurerm_application_gateway.cmp_agw.name}/backendAddressPools/${each.value.name}-backendpool"
}