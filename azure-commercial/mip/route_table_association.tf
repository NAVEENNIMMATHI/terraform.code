# AKS
resource "azurerm_subnet_route_table_association" "mdp_aks_route_association" {
  subnet_id      = module.subnet_aks.subnet_id
  route_table_id = azurerm_route_table.vmroutetable-azfirewall2.id
}

# VM
resource "azurerm_subnet_route_table_association" "mdp_vm_route_association" {
  subnet_id      = module.subnet_license_manager.subnet_id
  route_table_id = azurerm_route_table.vmroutetable-azfirewall2.id
}