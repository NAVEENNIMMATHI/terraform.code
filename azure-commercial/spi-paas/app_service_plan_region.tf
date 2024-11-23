resource "azurerm_app_service_plan" "appserviceplan" {
  for_each = var.appservice_plan
  name                = "asp-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-${var.environment_acronym}"
  location            = module.applicationrg[each.key].resource_group_location
  resource_group_name = module.applicationrg[each.key].resource_group_name
  kind                = "Windows"
  reserved            = false

  sku {
    tier                     = each.value.asp_tier
    size                     = each.value.asp_size
    capacity                 = each.value.asp_capacity
  }

  tags                       = var.tags

}