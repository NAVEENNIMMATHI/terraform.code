resource "azuread_application" "KIPDEVApplication" {
  count                        = var.target_deployment_environment == "nonprod" ? 1 : 0

  name                         = "KIP DEVApplication"
  homepage                     = "https://homepage"
  reply_urls                     = ["https://kipdev.kpmgcloudops.com/signin-oidc"]
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = true
  type                         = "webapp/api"
  required_resource_access {
    resource_app_id            = "00000003-0000-0000-c000-000000000000"

    resource_access {
      id                       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type                     = "Scope"
    }
  }
}

resource "azuread_service_principal" "KIPDEVApplication" {
  count                        = var.target_deployment_environment == "nonprod" ? 1 : 0

  application_id               = azuread_application.KIPDEVApplication[0].application_id
  app_role_assignment_required = false
}

resource "azuread_application" "KIPRESTDEVApplication" {
  count                       = var.target_deployment_environment == "nonprod" ? 1 : 0

  name                        = "KIP RESTDEVApplication"
  homepage                    = "https://homepage"
  reply_urls                  = ["https://kiprestdev.kpmgcloudops.com/signin-oidc"]
  available_to_other_tenants  = false
  oauth2_allow_implicit_flow  = true
  type                        = "webapp/api"
}

resource "azuread_service_principal" "KIPRESTDEVApplication" {
  count                       = var.target_deployment_environment == "nonprod" ? 1 : 0

  application_id              = azuread_application.KIPRESTDEVApplication[0].application_id
  app_role_assignment_required = false
}

resource "azuread_application" "KIPQAApplication" {
  count                      = var.target_deployment_environment == "nonprod" ? 1 : 0

  name                       = "KIP QAApplication"
  homepage                   = "https://homepage"
  reply_urls                 = ["https://kipqa.kpmgcloudops.com/signin-oidc"]
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

resource "azuread_service_principal" "KIPQAApplication" {
  count                         = var.target_deployment_environment == "nonprod" ? 1 : 0

  application_id                = azuread_application.KIPQAApplication[0].application_id
  app_role_assignment_required  = false
  
}

resource "azuread_application" "KIPRESTQAApplication" {
  count                         = var.target_deployment_environment == "nonprod" ? 1 : 0

  name                          = "KIP RESTQAApplication"
  homepage                      = "https://homepage"
  reply_urls                    = ["https://kiprestqa.kpmgcloudops.com/signin-oidc"]
  available_to_other_tenants    = false
  oauth2_allow_implicit_flow    = true
  type                          = "webapp/api"
}

resource "azuread_service_principal" "KIPRESTQAApplication" {
  count                         = var.target_deployment_environment == "nonprod" ? 1 : 0

  application_id                = azuread_application.KIPRESTQAApplication[0].application_id
  app_role_assignment_required  = false
  
}

resource "azuread_application" "MEP-KIPDEVApplication" {
  count                         = var.target_deployment_environment == "nonprod" ? 1 : 0

  name                          = "MEP KIPDEVApplication"
  homepage                      = "https://homepage"
  reply_urls                    = ["https://mep-kipdev.kpmgcloudops.com/signin-oidc"]
  available_to_other_tenants    = false
  oauth2_allow_implicit_flow    = true
  type                          = "webapp/api"
  
  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"

    resource_access {
      id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type = "Scope"
    }
  }
}

resource "azuread_service_principal" "MEP-KIPDEVApplication" {
  count                        = var.target_deployment_environment == "nonprod" ? 1 : 0
  
  application_id               = azuread_application.MEP-KIPDEVApplication[0].application_id
  app_role_assignment_required = false 
}

resource "azuread_application" "MEPREST-KIPDEVApplication" {
  count                        = var.target_deployment_environment == "nonprod" ? 1 : 0

  name                         = "MEPREST KIPDEVApplication"
  homepage                     = "https://homepage"
  reply_urls                   = ["https://meprest-kipdev.kpmgcloudops.com/signin-oidc"]
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

resource "azuread_service_principal" "MEPREST-KIPDEVApplication" {
  count                        = var.target_deployment_environment == "nonprod" ? 1 : 0

  application_id               = azuread_application.MEPREST-KIPDEVApplication[0].application_id
  app_role_assignment_required = false
  
}

resource "azuread_application" "MEP-KIPQAApplication" {
  count                        = var.target_deployment_environment == "nonprod" ? 1 : 0

  name                         = "MEP KIPQAApplication"
  homepage                     = "https://homepage"
  reply_urls                   = ["https://mep-kipqa.kpmgcloudops.com/signin-oidc"]
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

resource "azuread_service_principal" "MEP-KIPQAApplication" {
  count                         = var.target_deployment_environment == "nonprod" ? 1 : 0

  application_id                = azuread_application.MEP-KIPQAApplication[0].application_id
  app_role_assignment_required  = false
  
}

resource "azuread_application" "MEPREST-KIPQAApplication" {
  count                         = var.target_deployment_environment == "nonprod" ? 1 : 0

  name                          = "MEPREST KIPQAApplication"
  homepage                      = "https://homepage"
  reply_urls                    = ["https://meprest-kipqa.kpmgcloudops.com/signin-oidc"]
  available_to_other_tenants    = false
  oauth2_allow_implicit_flow    = true
  type                          = "webapp/api"
  
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

resource "azuread_service_principal" "MEPREST-KIPQAApplication" {
  count                          = var.target_deployment_environment == "nonprod" ? 1 : 0

  application_id                 = azuread_application.MEPREST-KIPQAApplication[0].application_id
  app_role_assignment_required   = false
  
}