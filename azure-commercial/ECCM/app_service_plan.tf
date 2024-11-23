resource "azurerm_service_plan" "eccm_app" {
  name                       = "asp-${lower(var.location_acronym)}-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
  resource_group_name        = module.eccm_rg.resource_group_name
  location                   = module.eccm_rg.resource_group_location
  os_type                    = "Windows"
  sku_name = "WS1" 

  tags = var.tags
}

resource "azurerm_service_plan" "eccm_app_web_app" {
  name                       =  "asp-${lower(var.location_acronym)}-${lower(var.application_acronym)}web-${lower(var.environment_acronym)}"
  resource_group_name        = module.eccm_rg.resource_group_name
  location                   = module.eccm_rg.resource_group_location
  os_type                    = "Linux"
  sku_name                   = "P1v2"

  tags = var.tags
}
