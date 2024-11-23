resource "azuread_application" "KRTWebapplication" {
  name                       = "${var.krt_app_registration_name}${var.uniqueresourcesuffix}"
  reply_urls                 = var.reply_urls
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
  type                       = "webapp/api"

  #count = "${var.target_deployment_environment == "prod" ? 1 : 0}"
  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"

    resource_access {
      id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type = "Scope"
    }
  }
}

