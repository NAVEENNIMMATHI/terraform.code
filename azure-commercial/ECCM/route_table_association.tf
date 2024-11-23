# resource "azurerm_subnet_route_table_association" "agw_subnet" {
#   subnet_id      = module.eccm_agw_subnet.subnet_id
#   route_table_id = azurerm_route_table.eccm_rtb.id
# }

resource "azurerm_subnet_route_table_association" "aks_subnet" {
  subnet_id      = module.eccm_aks_subnet.subnet_id
  route_table_id = azurerm_route_table.eccm_rtb.id
}

resource "azurerm_subnet_route_table_association" "lap_pvt_subnet" {
  subnet_id      = module.eccm_lap_pvt_subnet.subnet_id
  route_table_id = azurerm_route_table.eccm_rtb.id
}

resource "azurerm_subnet_route_table_association" "lap_pub_subnet" {
  subnet_id      = module.eccm_lap_pub_subnet.subnet_id
  route_table_id = azurerm_route_table.eccm_rtb.id
}

resource "azurerm_subnet_route_table_association" "pep_subnet" {
  subnet_id      = module.eccm_pep_subnet.subnet_id
  route_table_id = azurerm_route_table.eccm_rtb.id
}

resource "azurerm_subnet_route_table_association" "css_subnet" {
  subnet_id      = module.eccm_css_subnet.subnet_id
  route_table_id = azurerm_route_table.eccm_rtb.id
}

resource "azurerm_subnet_route_table_association" "app_subnet" {
  subnet_id      = module.eccm_app_subnet.subnet_id
  route_table_id = azurerm_route_table.eccm_rtb.id
}