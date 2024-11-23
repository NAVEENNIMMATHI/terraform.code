resource "azuread_application" "KIPApplication" {
  count                        = var.target_deployment_environment == "production" ? 1 : 0

  name                         = "KIP Application"
  homepage                     = "https://homepage"
  reply_urls                   = ["https://kip.kpmgcloudops.com/signin-oidc"]
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

resource "azuread_service_principal" "KIPApplication" {
  count                        = var.target_deployment_environment == "production" ? 1 : 0

  application_id               = azuread_application.KIPApplication[0].application_id
  app_role_assignment_required = false
}

resource "azuread_application" "KIPRESTApplication" {
  count                        = var.target_deployment_environment == "production" ? 1 : 0

  name                         = "KIP RESTApplication"
  homepage                     = "https://homepage"
  reply_urls                   = ["https://kiprest.kpmgcloudops.com/signin-oidc"]
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = true
  type                         = "webapp/api"
}

resource "azuread_service_principal" "KIPRESTApplication" {
  count                        = var.target_deployment_environment == "production" ? 1 : 0

  application_id               = azuread_application.KIPRESTApplication[0].application_id
  app_role_assignment_required = false
}

resource "azuread_application" "MEP-KIPApplication" {
  count                        = var.target_deployment_environment == "production" ? 1 : 0

  name                         = "MEP KIPApplication"
  homepage                     = "https://homepage"
  reply_urls                   = ["https://mep-kip.kpmgcloudops.com/signin-oidc"]
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

resource "azuread_service_principal" "MEP-KIPApplication" {
  count                        = var.target_deployment_environment == "production" ? 1 : 0

  application_id               = azuread_application.MEP-KIPApplication[0].application_id
  app_role_assignment_required = false
}

resource "azuread_application" "MEPREST-KIPApplication" {
  count                        = var.target_deployment_environment == "production" ? 1 : 0

  name                         = "MEPREST KIPApplication"
  homepage                     = "https://homepage"
  reply_urls                   = ["https://meprest-kip.kpmgcloudops.com/signin-oidc"]
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

resource "azuread_service_principal" "MEPREST-KIPApplication" {
  count                        = var.target_deployment_environment == "production" ? 1 : 0

  application_id               = azuread_application.MEPREST-KIPApplication[0].application_id
  app_role_assignment_required = false
}

