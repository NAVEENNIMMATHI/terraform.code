output "shared_rg_name" {
  value = module.sharedrg.resource_group_name
}
output "shared_vnet_name" {
  value = module.sharedvnet.virtual_network_name
}
output "ase_subnet_id" {
  value = module.asesubnet.subnet_id
}
output "mgmt_subnet_id" {
  value = module.mgmtsubnet.subnet_id
}
output "build_subnet_id" {
  value = module.buildsubnet.subnet_id
}
output "vm_route_table_id" {
    value = azurerm_route_table.vmroutetable-azfirewall.id
}
output "app_gatewaysubnet_id" {
    value = module.appgatewaysubnet.subnet_id
}

output "app_gatewaysubnet_id_cfr" {
    value = azurerm_subnet.appgatewaysubnet_allow_443_all.id
}
output "privatelink_subnet_id" {
    value = module.privatelinksubnet.subnet_id
}


