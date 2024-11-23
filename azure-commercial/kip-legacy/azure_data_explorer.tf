
resource "azurerm_public_ip" "adxdatamanagementpip" {
  name                  = var.adx_data_mgmt_pip_name
  resource_group_name   = module.applicationrg.resource_group_name
  location              = module.applicationrg.resource_group_location
  allocation_method     = "Static"
  sku                   = "Standard"

  tags                   = var.tags
}

resource "azurerm_public_ip" "adxenginepip" {
  name                  = var.adx_engine_pip_name
  resource_group_name   = module.applicationrg.resource_group_name
  location              = module.applicationrg.resource_group_location
  allocation_method     = "Static"
  sku                   = "Standard"

  tags                   = var.tags
}

resource "azurerm_kusto_cluster" "kipadx" {
  name                = var.adx_name
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  sku {
    name     = "Standard_DS13_v2+1TB_PS"
  }

  optimized_auto_scale{
      minimum_instances =   var.adx_min_instance_count
      maximum_instances =   var.adx_max_instance_count
  }

  virtual_network_configuration{
      subnet_id                    = module.adxsubnet.subnet_id
      engine_public_ip_id          = azurerm_public_ip.adxenginepip.id
      data_management_public_ip_id = azurerm_public_ip.adxdatamanagementpip.id
  }

  identity{
        type = "SystemAssigned"
  }


 tags                = var.tags

}

resource "azurerm_kusto_database" "adx_database" {
  name                = var.adx_database_name
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  cluster_name        = azurerm_kusto_cluster.kipadx.name
  
  soft_delete_period = var.adx_database_retention_period
  hot_cache_period = var.adx_database_cache_period
}