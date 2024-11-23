resource "azuread_application" "KIPUATApplication" {
  count                       = var.target_deployment_environment == "staging" ? 1 : 0

  name                        = "KIP UATApplication"
  homepage                    = "https://homepage"
  reply_urls                  = ["https://kipuat.kpmgcloudops.com/signin-oidc"]
  available_to_other_tenants  = false
  oauth2_allow_implicit_flow  = true
  type                        = "webapp/api"
  
  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"

    resource_access {
      id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type = "Scope"
    }
  }
}

resource "azuread_service_principal" "KIPUATApplication" {
  count                        = var.target_deployment_environment == "staging" ? 1 : 0

  application_id               = azuread_application.KIPUATApplication[0].application_id
  app_role_assignment_required = false
}

resource "azuread_application" "KIPRESTUATApplication" {
  count                        = var.target_deployment_environment == "staging" ? 1 : 0

  name                         = "KIP RESTUATApplication"
  homepage                     = "https://homepage"
  reply_urls                   = ["https://kiprestuat.kpmgcloudops.com/signin-oidc"]
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = true
  type                         = "webapp/api"
}

resource "azuread_service_principal" "KIPRESTUATApplication" {
  count                        = var.target_deployment_environment == "staging" ? 1 : 0

  application_id               = azuread_application.KIPRESTUATApplication[0].application_id
  app_role_assignment_required = false
}

resource "azuread_application" "MEP-KIPUATApplication" {
  count                        = var.target_deployment_environment == "staging" ? 1 : 0

  name                         = "MEP KIPUATApplication"
  homepage                     = "https://homepage"
  reply_urls                   = ["https://mep-kipuat.kpmgcloudops.com/signin-oidc"]
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = true
  type                         = "webapp/api"

  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"

    resource_access {
      id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type = "Scope"
    }
  }
}

resource "azuread_service_principal" "MEP-KIPUATApplication" {
  count                        = var.target_deployment_environment == "staging" ? 1 : 0

  application_id               = azuread_application.MEP-KIPUATApplication[0].application_id
  app_role_assignment_required = false
}

resource "azuread_application" "MEPREST-KIPUATApplication" {
  count                        = var.target_deployment_environment == "staging" ? 1 : 0

  name                         = "MEPREST KIPUATApplication"
  homepage                     = "https://homepage"
  reply_urls                   = ["https://meprest-kipuat.kpmgcloudops.com/signin-oidc"]
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = true
  type                         = "webapp/api"
  
  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"

    resource_access {
      id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type = "Scope"
    }

    resource_access {
      id   = "bf7b1a76-6e77-406b-b258-bf5c7720e98f"
      type = "Role"
    }

    resource_access {
      id   = "dbaae8cf-10b5-4b86-a4a1-f871c94c6695"
      type = "Role"
    }

    resource_access {
      id   = "5b567255-7703-4780-807c-7be8301ae99b"
      type = "Role"
    }

    resource_access {
      id   = "df021288-bdef-4463-88db-98f22de89214"
      type = "Role"
    }

    resource_access {
      id   = "09850681-111b-4a89-9bed-3f2cae46d706"
      type = "Role"
    }
  }
}

resource "azuread_service_principal" "MEPREST-KIPUATApplication" {
  count                        = var.target_deployment_environment == "staging" ? 1 : 0
  
  application_id               = azuread_application.MEPREST-KIPUATApplication[0].application_id
  app_role_assignment_required = false
}

