# App registration and service principal for MIP
resource "azuread_application" "mip_Application" {
  name                       = "spn-${var.application_acronym}-${var.client}-${var.environment_acronym}"
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

resource "azuread_service_principal" "mip_spn_Application" {
  application_id               = azuread_application.mip_Application.application_id
    tags = [
    "WindowsAzureActiveDirectoryIntegratedApp","WindowsAzureActiveDirectoryCustomSingleSignOnApplication","WindowsAzureActiveDirectoryGalleryApplicationNonPrimaryV1"
  ]
  app_role_assignment_required = false
}


resource "azuread_application" "mip_stifel_Application" {
  name                       = "spn-ent-${var.application_acronym}-${var.client}-${var.environment_acronym}"
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

resource "azuread_service_principal" "mip_stifel_spn_Application" {
  application_id               = azuread_application.mip_stifel_Application.application_id
  tags = [
    "WindowsAzureActiveDirectoryIntegratedApp","WindowsAzureActiveDirectoryCustomSingleSignOnApplication","WindowsAzureActiveDirectoryGalleryApplicationNonPrimaryV1"
  ]
}
