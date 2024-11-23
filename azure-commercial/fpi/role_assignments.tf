resource "azurerm_role_assignment" "web_app_contributor" {
  scope                = module.rgfpi.resource_group_id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.ad_webapp_fpi_spn.object_id
}