resource "azuread_application" "ad_application_gc_d365" {
  name                       = "GCDynamics365${upper(var.environment_acronym)}"
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

resource "azuread_application" "ad_application_gc" {
  name                       = "spn-app-${var.application_acronym}-${substr(var.subscription_id, 0, 8)}-${var.environment_acronym}"
  available_to_other_tenants = false
  identifier_uris            = []
  oauth2_allow_implicit_flow = false
  public_client              = false
  type                       = "webapp/api"

  reply_urls = []

  required_resource_access {
    resource_app_id = "00000002-0000-0000-c000-000000000000"

    resource_access {
      id   = "c582532d-9d9e-43bd-a97c-2667a28ce295"
      type = "Scope"
    }
    resource_access {
      id   = "78c8a3c8-a07e-4b9e-af1b-b5ccab50a175"
      type = "Role"
    }
    resource_access {
      id   = "824c81eb-e3f8-4ee6-8f6d-de7f50d565b7"
      type = "Role"
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

resource "azuread_service_principal" "spn_dataexport_d365" {
  application_id               = azuread_application.ad_application_gc_d365.application_id
  app_role_assignment_required = false
  
  tags = [
    "WindowsAzureActiveDirectoryIntegratedApp"
  ]
}

resource "azuread_service_principal" "spn_devops_gc_app_service" {
  application_id               = azuread_application.ad_application_gc.application_id
  app_role_assignment_required = false

  tags = [
    "WindowsAzureActiveDirectoryIntegratedApp"
  ]
}