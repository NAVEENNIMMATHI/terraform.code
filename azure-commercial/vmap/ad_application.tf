resource "azuread_application" "ad_app_web" {
  name                       = "${var.application_acronym}${var.application_gateway.environment_acronym}Application"
  homepage                   = "https://homepage"
  reply_urls                 = ["https://${lower(var.application_acronym)}${lower(var.application_gateway.environment_acronym)}.kpmgcloudops.com/signin-oidc", "https://localhost/signin-oidc"]
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
  type                       = "webapp/api"

  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"

    resource_access {
      id   = "7ab1d382-f21e-4acd-a863-ba3e13f7da61"
      type = "Role"
    }
  }

  required_resource_access {
    resource_app_id = "00000002-0000-0000-c000-000000000000"

    resource_access {
      id   = "311a71cc-e848-46a1-bdf8-97ff7156d8e6"
      type = "Scope"
    }
  }

  #Digital Matrix Application Permissions#

  required_resource_access {
    resource_app_id = "ae40ead7-8293-4daf-821e-03a9a15c0603"

    resource_access {
      id   = "0463e54d-f319-489b-8f28-67c213ac2f11"
      type = "Scope"
    }
  }
  required_resource_access {
    resource_app_id = "ef2ff00a-fa12-47c3-a539-8a24a920930d"

    resource_access {
      id   = "1e4b0f2b-3720-464b-8d67-b1e253f741c6"
      type = "Scope"
    }
  }
  required_resource_access {
    resource_app_id = "2dd5965c-602d-44e9-9c47-e8b4b22dae00"

    resource_access {
      id   = "2c2033d9-b36a-4d83-94ae-3d8cc33cc5bb"
      type = "Scope"
    }
  }
  required_resource_access {
    resource_app_id = "d133e792-d7ab-4fca-883e-0e40d45ed28e"

    resource_access {
      id   = "5375ab90-33bc-4497-bd30-7826b8a86454"
      type = "Scope"
    }
  }
  required_resource_access {
    resource_app_id = "1797ea0f-0d0a-48cb-8bc2-72218cb0b45f"

    resource_access {
      id   = "62cd28af-9c17-4e1c-ac7a-98856ff91761"
      type = "Scope"
    }
  }
  required_resource_access {
    resource_app_id = "46351f31-7b32-40a9-ab2f-02a77ba46278"

    resource_access {
      id   = "96736afc-1bcb-4855-b679-6f9857daa123"
      type = "Scope"
    }
  }
  lifecycle {
    ignore_changes = [
      # ignore changes to required_resource_access as these are different in differnt environments.
      required_resource_access
    ]
  }
}

resource "azuread_service_principal" "ad_app_web" {
  application_id               = azuread_application.ad_app_web.application_id
  app_role_assignment_required = false
}

resource "azurerm_role_assignment" "vmapapplication_storage_contributor" {
  scope                = module.storage_account.id
  role_definition_name = "contributor"
  principal_id         = azuread_service_principal.ad_app_web.object_id
  
}