resource "azuread_application" "projectops_ad_application_d365" {
  name                       = "spn-${var.application_acronym}-1-${var.environment_acronym}"
  available_to_other_tenants = false
  identifier_uris            = []
  oauth2_allow_implicit_flow = true
  public_client              = false
  type                       = "webapp/api"

  reply_urls = [
    "https://localhost"
  ]

  required_resource_access {
    resource_app_id = "00000007-0000-0000-c000-000000000000"

    resource_access {
      id   = "78ce3f0f-a1ce-49c2-8cde-64b5c0896db4"
      type = "Scope"
    }
  }

  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"

    resource_access {
      id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type = "Scope"
    }
  }
}

resource "azuread_service_principal" "projectops_dataexport_d365" {
  application_id               = azuread_application.projectops_ad_application_d365.application_id
  app_role_assignment_required = false
  
  tags = [
    "WindowsAzureActiveDirectoryIntegratedApp"
  ]
}
