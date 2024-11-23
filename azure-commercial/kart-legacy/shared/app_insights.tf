module "appinsights" {
  source              = "../../modules12/application_insights"
  name                = var.app_insights_name
  resource_group_name = data.azurerm_resource_group.sharedrg.name
  location            = data.azurerm_resource_group.sharedrg.location
  sampling_percentage = 0
  tags                = var.tags
}

