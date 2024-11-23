### Route Table Associations

resource "azurerm_subnet_route_table_association" "kipwst1_subnet" {
  subnet_id      = module.wst1subnet.subnet_id
  route_table_id = azurerm_route_table.kiptoAzureFirewall.id
}

resource "azurerm_subnet_route_table_association" "kipapp1_subnet" {
  subnet_id      = module.app1subnet.subnet_id
  route_table_id = azurerm_route_table.kiptoAzureFirewall.id
}

resource "azurerm_subnet_route_table_association" "kippbi1_subnet" {
  subnet_id      = module.pbi1subnet.subnet_id
  route_table_id = azurerm_route_table.kiptoAzureFirewall.id
}

resource "azurerm_subnet_route_table_association" "kipdb1_subnet" {
  subnet_id      = azurerm_subnet.db1subnet.id
  route_table_id = azurerm_route_table.miroutetable.id
}

resource "azurerm_subnet_route_table_association" "kipase1_subnet" {
    subnet_id      = module.ase1subnet.subnet_id
  route_table_id =  azurerm_route_table.aseroutetable.id
}

resource "azurerm_subnet_route_table_association" "dbws_public_subnet" {
  subnet_id      = azurerm_subnet.databricks_public_subnet.id
  route_table_id = azurerm_route_table.dbws_route_table.id
  depends_on = [azurerm_databricks_workspace.this]
}
resource "azurerm_subnet_route_table_association" "dbws_private_subnet" {
  subnet_id      = azurerm_subnet.databricks_private_subnet.id
  route_table_id = azurerm_route_table.dbws_route_table.id
  depends_on = [azurerm_databricks_workspace.this]
}
resource "azurerm_subnet_route_table_association" "adf1subnet_subnet" {
  subnet_id      = module.adf1subnet.subnet_id
  route_table_id = azurerm_route_table.kiptoAzureFirewall.id
}
resource "azurerm_subnet_route_table_association" "syn1subnet_subnet" {
  subnet_id      = module.syn1subnet.subnet_id
  route_table_id = azurerm_route_table.kiptoAzureFirewall.id
}
resource "azurerm_subnet_route_table_association" "pvw1subnet_subnet" {
  subnet_id      = module.pvw1subnet.subnet_id
  route_table_id = azurerm_route_table.kiptoAzureFirewall.id
}
resource "azurerm_subnet_route_table_association" "kpimcapiqsubnet_subnet" {
  subnet_id      = module.kpimcapiqsubnet.subnet_id
  route_table_id = azurerm_route_table.kiptoAzureFirewall.id
}
resource "azurerm_subnet_route_table_association" "privatelinksubnet_subnet" {
  subnet_id      = module.privatelinksubnet.subnet_id
  route_table_id = azurerm_route_table.kiptoAzureFirewall.id
}