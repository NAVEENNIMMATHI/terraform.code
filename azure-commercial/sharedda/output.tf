output "shared_rg_name" {
  value = module.applicationrg.resource_group_name
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
output "agw_subnet_id" {
  value = module.agwsubnet.subnet_id
}
output "agw_kpmgonly_subnet_id" {
  value = module.agwsubnet_kpmgonly.subnet_id
}
output "pe_kpmgonly_subnet_id" {
  value = module.private_endpoint.subnet_id
}
output "ase_route_table_id" {
    value = azurerm_route_table.aseroutetable.id
}
output "vm_route_table_id" {
    value = azurerm_route_table.vmroutetable.id
}
output "wkstn_subnet_id" {
  value = module.wstsubnet.subnet_id
}