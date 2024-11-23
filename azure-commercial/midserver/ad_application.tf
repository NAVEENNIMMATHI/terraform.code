resource "azuread_application" "snow-spn" {
  name                       = var.snow_spn_name
  reply_urls                 = ["${var.snow_spn_url}"]
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
  type                       = "webapp/api"

  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"

    resource_access {
      id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type = "Scope"
    }
  }
}

resource "azuread_service_principal" "snow-spn" {
  application_id               = azuread_application.snow-spn.application_id
  app_role_assignment_required = false
  tags = ["WindowsAzureActiveDirectoryIntegratedApp"]
}

