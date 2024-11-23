resource "azuread_application" "KIPApplication" {
  name                         = var.environment == "production" ? "KIP Application" : "KIP${upper(var.app_url_acronym)}Application"
  homepage                     = "https://homepage"
  reply_urls                   = var.environment == "production" ? ["https://kip.kpmgcloudops.com/signin-oidc"] : ["https://kip${var.app_url_acronym}.kpmgcloudops.com/signin-oidc"]
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

resource "azuread_service_principal" "KIPApplication" {
  application_id               = azuread_application.KIPApplication.application_id
  app_role_assignment_required = false
}

resource "azuread_application" "KIPRESTApplication" {
  #name                         = "KIP RESTApplication"
  name                         = var.environment == "production" ? "KIP RESTApplication" : "KIPREST${upper(var.app_url_acronym)}Application"
  homepage                     = "https://homepage"
  reply_urls                   = var.environment == "production" ? ["https://kiprest.kpmgcloudops.com/signin-oidc"] : ["https://kiprest${var.app_url_acronym}.kpmgcloudops.com/signin-oidc"]
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = true
  type                         = "webapp/api"
   required_resource_access {
    resource_app_id            = "00000003-0000-0000-c000-000000000000"
    resource_access {
      id                       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type                     = "Scope"
    }
    resource_access {
      id                       = "bf7b1a76-6e77-406b-b258-bf5c7720e98f"
      type                     = "Role"
    }
    resource_access {
      id                       = "dbaae8cf-10b5-4b86-a4a1-f871c94c6695"
      type                     = "Role"
    }
    resource_access {
      id                       = "5b567255-7703-4780-807c-7be8301ae99b"
      type                     = "Role"
    }
    resource_access {
      id                       = "df021288-bdef-4463-88db-98f22de89214"
      type                     = "Role"
    }
    resource_access {
      id                       = "09850681-111b-4a89-9bed-3f2cae46d706"
      type                     = "Role"
    }
     resource_access {
      id                       = "62a82d76-70ea-41e2-9197-370581804d09"
      type                     = "Role"
    }
  }
}

resource "azuread_service_principal" "KIPRESTApplication" {
  application_id               = azuread_application.KIPRESTApplication.application_id
  app_role_assignment_required = false
}

resource "azuread_application" "MEP-KIPApplication" {
  #name                         = "MEP KIPApplication"
  name                         = var.environment == "production" ? "MEP KIPApplication" : "MEPKIP${upper(var.app_url_acronym)}Application"
  homepage                     = "https://homepage"
  reply_urls                   = var.environment == "production" ? ["https://mep-kip.kpmgcloudops.com/signin-oidc"] : ["https://mep-kip${var.app_url_acronym}.kpmgcloudops.com/signin-oidc"]
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

resource "azuread_service_principal" "MEP-KIPApplication" {
  application_id               = azuread_application.MEP-KIPApplication.application_id
  app_role_assignment_required = false
}

resource "azuread_application" "MEPREST-KIPApplication" {
  #name                         = "MEPREST KIPApplication"
  name                         = var.environment == "production" ? "MEPREST KIPApplication" : "MEPRESTKIP${upper(var.app_url_acronym)}Application"
  homepage                     = "https://homepage"
  reply_urls                   = var.environment == "production" ? ["https://meprest-kip.kpmgcloudops.com/signin-oidc"] : ["https://meprest-kip${var.app_url_acronym}.kpmgcloudops.com/signin-oidc"]
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = true
  type                         = "webapp/api"
  required_resource_access {
    resource_app_id            = "00000003-0000-0000-c000-000000000000"
    resource_access {
      id                       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type                     = "Scope"
    }
    resource_access {
      id                       = "bf7b1a76-6e77-406b-b258-bf5c7720e98f"
      type                     = "Role"
    }
    resource_access {
      id                       = "dbaae8cf-10b5-4b86-a4a1-f871c94c6695"
      type                     = "Role"
    }
    resource_access {
      id                       = "5b567255-7703-4780-807c-7be8301ae99b"
      type                     = "Role"
    }
    resource_access {
      id                       = "df021288-bdef-4463-88db-98f22de89214"
      type                     = "Role"
    }
    resource_access {
      id                       = "09850681-111b-4a89-9bed-3f2cae46d706"
      type                     = "Role"
    }
  }
}

resource "azuread_service_principal" "MEPREST-KIPApplication" {
  application_id               = azuread_application.MEPREST-KIPApplication.application_id
  app_role_assignment_required = false
}

#App registration and service principal for Databricks

resource "azuread_application" "KIP-Databricks" {
  name                         = "KIP${upper(var.app_url_acronym)}Databricks"
  homepage                     = "https://homepage"
  reply_urls                   = ["https://kip${var.app_url_acronym}databricks.kpmgcloudops.com/signin-oidc",
                                  "https://login.microsoftonline.com/${var.tenant_id}/oauth2/token"
                                ]
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

resource "azuread_service_principal" "KIP-Databricks" {
  application_id               = azuread_application.KIP-Databricks.application_id
  app_role_assignment_required = false
}

#Service principal for Purview
resource "azuread_application" "KIPPurview" {
  name                         = var.environment == "production" ? "KIPPurview" : "KIP${upper(var.environment_acronym)}Purview"
}
resource "azuread_service_principal" "KIP-Purview" {
  application_id               = azuread_application.KIPPurview.application_id
  app_role_assignment_required = false
}


resource "azuread_application" "KIPDataIngressService" {
  name                         ="KIPDIS${upper(var.app_url_acronym)}Application"
  homepage                     = "https://homepage"
  reply_urls                   = ["https://kipdis${var.app_url_acronym}.kpmgcloudops.com/signin-oidc"]
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

resource "azuread_service_principal" "KIPDataIngressService" {
  application_id               = azuread_application.KIPDataIngressService.application_id
  app_role_assignment_required = false
}