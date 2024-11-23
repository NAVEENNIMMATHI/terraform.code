# resource "random_uuid" "app_scope_id" {
# }

locals {

  non_prod_reply_urls                 = ["https://${var.project_name}jup${var.engagement_name}${var.environment}.kpmgcloudops.com/oauth2/callback","https://${var.project_name}jup${var.engagement_name}${var.environment}.kpmgcloudops.com/coupajp/oauth2/callback","https://${var.project_name}jup${var.engagement_name}${var.environment}.kpmgcloudops.com/coupajp/oauth_callback","https://${var.project_name}api${var.engagement_name}${var.environment}.kpmgcloudops.com/oauth2/callback","https://${var.project_name}api${var.engagement_name}${var.environment}.kpmgcloudops.com/api_docs/oauth2-redirect.html","https://${var.project_name}uiapi${var.engagement_name}${var.environment}.kpmgcloudops.com","https://${var.project_name}ui${var.engagement_name}${var.environment}.kpmgcloudops.com","https://${var.project_name}api${var.engagement_name}${var.environment}.kpmgcloudops.com/","https://${var.project_name}jup${var.engagement_name}qa.kpmgcloudops.com/oauth2/callback","https://${var.project_name}jup${var.engagement_name}qa.kpmgcloudops.com/coupajp/oauth2/callback","https://${var.project_name}jup${var.engagement_name}qa.kpmgcloudops.com/coupajp/oauth_callback","https://${var.project_name}api${var.engagement_name}qa.kpmgcloudops.com/oauth2/callback","https://${var.project_name}api${var.engagement_name}qa.kpmgcloudops.com/api_docs/oauth2-redirect.html","https://${var.project_name}uiapi${var.engagement_name}qa.kpmgcloudops.com","https://${var.project_name}ui${var.engagement_name}qa.kpmgcloudops.com","https://${var.project_name}api${var.engagement_name}qa.kpmgcloudops.com/"]
  prod_reply_urls                     = ["https://${var.project_name}jup${var.engagement_name}${var.environment}.kpmgcloudops.com/oauth2/callback","https://${var.project_name}jup${var.engagement_name}${var.environment}.kpmgcloudops.com/coupajp/oauth2/callback","https://${var.project_name}jup${var.engagement_name}${var.environment}.kpmgcloudops.com/coupajp/oauth_callback","https://${var.project_name}api${var.engagement_name}${var.environment}.kpmgcloudops.com/oauth2/callback","https://${var.project_name}api${var.engagement_name}${var.environment}.kpmgcloudops.com/api_docs/oauth2-redirect.html","https://${var.project_name}uiapi${var.engagement_name}ut.kpmgcloudops.com","https://${var.project_name}ui${var.engagement_name}ut.kpmgcloudops.com","https://${var.project_name}api${var.engagement_name}${var.environment}.kpmgcloudops.com/","https://${var.project_name}jup${var.engagement_name}.kpmgcloudops.com/oauth2/callback","https://${var.project_name}jup${var.engagement_name}.kpmgcloudops.com/coupajp/oauth2/callback","https://${var.project_name}jup${var.engagement_name}.kpmgcloudops.com/coupajp/oauth_callback","https://${var.project_name}api${var.engagement_name}.kpmgcloudops.com/oauth2/callback","https://${var.project_name}api${var.engagement_name}.kpmgcloudops.com/api_docs/oauth2-redirect.html","https://${var.project_name}uiapi${var.engagement_name}.kpmgcloudops.com","https://${var.project_name}ui${var.engagement_name}.kpmgcloudops.com","https://${var.project_name}api${var.engagement_name}.kpmgcloudops.com/"]

}


resource "azuread_application" "app_ignite" {
  count = var.environment == "dv" || var.environment == "uat" ? 1 : 0
  name                       = "ignite-${var.engagement_name}${var.separator}auth-app"
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
  type                       = "webapp/api"
  #reply_urls                 = ["https://${var.project_name}jup${var.engagement_name}${var.environment}.kpmgcloudops.com/oauth2/callback","https://${var.project_name}jup${var.engagement_name}${var.environment}.kpmgcloudops.com/coupajp/oauth2/callback","https://${var.project_name}jup${var.engagement_name}${var.environment}.kpmgcloudops.com/coupajp/oauth_callback","https://${var.project_name}api${var.engagement_name}${var.environment}.kpmgcloudops.com/oauth2/callback","https://${var.project_name}api${var.engagement_name}${var.environment}.kpmgcloudops.com/api_docs/oauth2-redirect.html","https://${var.project_name}uiapi${var.engagement_name}ut.kpmgcloudops.com","https://${var.project_name}ui${var.engagement_name}ut.kpmgcloudops.com","https://${var.project_name}api${var.engagement_name}${var.environment}.kpmgcloudops.com/","https://${var.project_name}jup${var.engagement_name}.kpmgcloudops.com/oauth2/callback","https://${var.project_name}jup${var.engagement_name}.kpmgcloudops.com/coupajp/oauth2/callback","https://${var.project_name}jup${var.engagement_name}.kpmgcloudops.com/coupajp/oauth_callback","https://${var.project_name}api${var.engagement_name}.kpmgcloudops.com/oauth2/callback","https://${var.project_name}api${var.engagement_name}.kpmgcloudops.com/api_docs/oauth2-redirect.html","https://${var.project_name}uiapi${var.engagement_name}.kpmgcloudops.com","https://${var.project_name}ui${var.engagement_name}.kpmgcloudops.com","https://${var.project_name}api${var.engagement_name}.kpmgcloudops.com/"]
  reply_urls                 = var.environment == "dv" ? local.non_prod_reply_urls : local.prod_reply_urls

  # # oauth2_permission_scope {
  # #     admin_consent_description  = "Allows users to read sign-in files"
  # #     admin_consent_display_name = "Innovation Ignite API"
  # #     enabled                    = true
  # #     id                         = random_uuid.app_scope_id.result
  # #     type                       = "User"
  # #     value                      = "${var.app_api_value}"
  # #   }

  # oauth2_permissions {
  #   admin_consent_description  = "Allows users to read sign-in files"
  #   admin_consent_display_name = "Innovation Ignite API"
  #   is_enabled                 = true
  #   type                       = "User"
  #   value                      = "${var.app_api_value}"
  # }

}

	
resource "azuread_service_principal" "sp_ignite" {
  count = var.environment == "dv" || var.environment == "uat" ? 1 : 0
  application_id               = azuread_application.app_ignite[0].application_id
  app_role_assignment_required = true
  depends_on = [azuread_application.app_ignite]
}


# App registration for DRGS Prod
resource "azuread_application" "app_drgs" {
  count = var.environment == "pd" ? 1 : 0
  name                       = "ignite-drgs${var.separator}auth-app"
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
  type                       = "webapp/api"
}

resource "azuread_service_principal" "sp_drgs" {
  count = var.environment == "pd" ? 1 : 0
  application_id               = azuread_application.app_drgs[0].application_id
  app_role_assignment_required = true
  depends_on = [azuread_application.app_drgs]
}






















/*
resource "azuread_app_role_assignment" "ignite_data_scientist" {
  app_role_id         = azuread_service_principal.sp_ignite.app_role_ids["Application_Owner"]
  principal_object_id = azuread_group.data_contributor_group.object_id
  resource_object_id  = azuread_service_principal.sp_ignite.object_id
}

resource "azuread_app_role_assignment" "ignite_data_user" {
  app_role_id         = azuread_service_principal.sp_ignite.app_role_ids["Application_Owner"]
  principal_object_id = azuread_group.crisis_planning_user.object_id
  resource_object_id  = azuread_service_principal.sp_ignite.object_id
}
*/