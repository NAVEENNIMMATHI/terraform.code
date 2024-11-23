resource "azurerm_subnet_route_table_association" "buildvm_route_association" {
  subnet_id      = module.buildsubnet.subnet_id
  route_table_id = azurerm_route_table.vmroutetable.id
  #route_table_id = var.deployment_environment != "DV" ? azurerm_route_table.vmroutetable_palo.id : azurerm_route_table.vmroutetable.id
}
resource "azurerm_subnet_route_table_association" "adminvm_route_association" {
  subnet_id      = module.mgmtsubnet.subnet_id
  route_table_id = azurerm_route_table.vmroutetable.id
  #route_table_id = var.deployment_environment != "DV" ? azurerm_route_table.vmroutetable_palo.id : azurerm_route_table.vmroutetable.id
}
resource "azurerm_subnet_route_table_association" "ase_route_association" {
  subnet_id      = module.asesubnet.subnet_id
  route_table_id = azurerm_route_table.aseroutetable.id
  #route_table_id = var.deployment_environment != "DV" ? azurerm_route_table.aseroutetable_palo.id : azurerm_route_table.aseroutetable.id
}
resource "azurerm_subnet_route_table_association" "pbi_route_association" {
  subnet_id      = module.pbisubnet.subnet_id
  route_table_id = azurerm_route_table.vmroutetable.id  
}
resource "azurerm_subnet_route_table_association" "wst_route_association" {
  subnet_id      = module.wstsubnet.subnet_id
  route_table_id = azurerm_route_table.vmroutetable.id  
}