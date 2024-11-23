resource "azuread_application" "ad_app_test" {
  name                       = "${var.application_acronym}${var.environment_type_test}Application"
  homepage                   = "https://homepage"
  reply_urls                 = ["http://localhost:54440/","http://localhost:54440/signin-oidc","https://${lower(var.application_acronym)}${lower(var.environment_type_test)}.kpmgcloudops.com/signin-oidc"]
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
  type                       = "webapp/api"
  count                      = var.restrict_gateway_endpoint == "true" ? 0 : 1

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
  required_resource_access {
    resource_app_id = azuread_application.ad_restapp_test[0].application_id

    resource_access {
      id    = tolist(azuread_application.ad_restapp_test[0].oauth2_permissions)[1].id
      type = "Scope"
    }
    resource_access {
      id    = tolist(azuread_application.ad_restapp_test[0].oauth2_permissions)[0].id
      type = "Scope"
    }
  }
  required_resource_access {
    resource_app_id = azuread_application.ad_restumt_test[0].application_id

    resource_access {
      id    = tolist(azuread_application.ad_restumt_test[0].oauth2_permissions)[1].id
      type = "Scope"
    }
    resource_access {
      id    = tolist(azuread_application.ad_restumt_test[0].oauth2_permissions)[0].id
      type = "Scope"
    }
  }
}

resource "azuread_service_principal" "ad_app_test" {
  application_id               = azuread_application.ad_app_test[0].application_id
  app_role_assignment_required = false
  count                        = var.restrict_gateway_endpoint == "true" ? 0 : 1
}

######

resource "azuread_application" "ad_app_final" {
  name                       = "${var.application_acronym}${var.environment_type_final}Application"
  homepage                   = "https://homepage"
  reply_urls                 = ["https://${lower(var.application_acronym)}${lower(var.environment_type_final)}.kpmgcloudops.com/signin-oidc"]
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
  required_resource_access {
    resource_app_id = azuread_application.ad_restapp_final.application_id
    resource_access {
      id    = tolist(azuread_application.ad_restapp_final.oauth2_permissions)[1].id
      type = "Scope"
    }
    resource_access {
      id    = tolist(azuread_application.ad_restapp_final.oauth2_permissions)[0].id
      type = "Scope"
    }
  }
  required_resource_access {
    resource_app_id = azuread_application.ad_restumt_final.application_id
    resource_access {
      id    = tolist(azuread_application.ad_restumt_final.oauth2_permissions)[1].id
      type = "Scope"
    }
    resource_access {
      id    = tolist(azuread_application.ad_restumt_final.oauth2_permissions)[0].id
      type = "Scope"
    }
  }
  
 }


resource "azuread_service_principal" "ad_app_final" {
  application_id               = azuread_application.ad_app_final.application_id
  app_role_assignment_required = false
}

#####

resource "azuread_application" "ad_app_umt_test" {
  name                       = "umt${var.environment_type_test}Application"
  homepage                   = "https://homepage"
  reply_urls                 = ["https://umt${lower(var.environment_type_test)}.kpmgcloudops.com/signin-oidc","https://localhost:44332","https://localhost:44332/signin-oidc"]
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
  type                       = "webapp/api"
  count                      = var.restrict_gateway_endpoint == "true" ? 0 : 1

  required_resource_access {
    resource_app_id = "00000002-0000-0000-c000-000000000000"

    resource_access {
      id   = "311a71cc-e848-46a1-bdf8-97ff7156d8e6"
      type = "Scope"
    }
  }
  required_resource_access {
    resource_app_id = azuread_application.ad_restapp_test[0].application_id

    resource_access {
      id    = tolist(azuread_application.ad_restapp_test[0].oauth2_permissions)[1].id
      type = "Scope"
    }
    resource_access {
      id    = tolist(azuread_application.ad_restapp_test[0].oauth2_permissions)[0].id
      type = "Scope"
    }
  }
  required_resource_access {
    resource_app_id = azuread_application.ad_restumt_test[0].application_id

    resource_access {
      id    = tolist(azuread_application.ad_restumt_test[0].oauth2_permissions)[1].id
      type = "Scope"
    }
    resource_access {
      id    = tolist(azuread_application.ad_restumt_test[0].oauth2_permissions)[0].id
      type = "Scope"
    }
  }
}

resource "azuread_service_principal" "ad_app_umt_test" {
  application_id               = azuread_application.ad_app_umt_test[0].application_id
  app_role_assignment_required = false
  count                        = var.restrict_gateway_endpoint == "true" ? 0 : 1
}

####

resource "azuread_application" "ad_app_umt_final" {
  name                       = "umt${var.environment_type_final}Application"
  homepage                   = "https://homepage"
  reply_urls                 = ["https://umt${lower(var.environment_type_final)}.kpmgcloudops.com/signin-oidc"]
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
  type                       = "webapp/api"

  required_resource_access {
    resource_app_id = "00000002-0000-0000-c000-000000000000"

    resource_access {
      id   = "311a71cc-e848-46a1-bdf8-97ff7156d8e6"
      type = "Scope"
    }
  }
  required_resource_access {
    resource_app_id = azuread_application.ad_restapp_final.application_id

    resource_access {
      id    = tolist(azuread_application.ad_restapp_final.oauth2_permissions)[1].id
      type = "Scope"
    }
    resource_access {
      id    = tolist(azuread_application.ad_restapp_final.oauth2_permissions)[0].id
      type = "Scope"
    }
  }
  required_resource_access {
    resource_app_id = azuread_application.ad_restumt_final.application_id

    resource_access {
      id    = tolist(azuread_application.ad_restumt_final.oauth2_permissions)[1].id
      type = "Scope"
    }
    resource_access {
      id    = tolist(azuread_application.ad_restumt_final.oauth2_permissions)[0].id
      type = "Scope"
    }
  }
}

resource "azuread_service_principal" "ad_app_umt_final" {
  application_id               = azuread_application.ad_app_umt_final.application_id
  app_role_assignment_required = false
}