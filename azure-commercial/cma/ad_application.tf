resource "azuread_application" "CMAApplication" {
  name                         = "appreg-${var.application_acronym}-${var.environment_acronym}"
  homepage                     = "https://homepage"
  reply_urls                   = ["https://cma${var.environment_acronym2}.kpmgcloudops.com/login/azure/authorized"]
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = false
  type                         = "webapp/api"

  required_resource_access {
    resource_app_id            = "00000002-0000-0000-c000-000000000000"
    resource_access {
      id                       = "311a71cc-e848-46a1-bdf8-97ff7156d8e6"
      type                     = "Scope"
    }
    resource_access {
      id                       = "c582532d-9d9e-43bd-a97c-2667a28ce295"
      type                     = "Scope"
    }
  }

  required_resource_access {
    resource_app_id            = "00000003-0000-0000-c000-000000000000"
    resource_access {
      id                       = "64a6cdd6-aab1-4aaf-94b8-3cc8405e90d0"
      type                     = "Scope"
    }
    resource_access {
      id                       = "37f7f235-527c-4136-accd-4a02d197296e"
      type                     = "Scope"
    }
    resource_access {
      id                       = "14dad69e-099b-42c9-810b-d002981feec1"
      type                     = "Scope"
    }
    resource_access {
      id                       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type                     = "Scope"
    }
  }
}


resource "azuread_service_principal" "CMAApplication" {
  application_id               = azuread_application.CMAApplication.application_id
  app_role_assignment_required = false
}