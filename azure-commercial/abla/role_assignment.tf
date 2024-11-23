 resource "azurerm_role_assignment" "spn_sub_reader" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Reader"
  principal_id         = azuread_service_principal.ad_app_web.object_id
}

resource "azurerm_role_assignment" "spn_website_contributor" {
  scope                = "${data.azurerm_subscription.current.id}/resourceGroups/${module.applicationrg.resource_group_name}"
  role_definition_name = "Website Contributor"
  principal_id         = azuread_service_principal.ad_app_web.object_id
}