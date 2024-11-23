# SPN for Cloudockit
resource "azuread_application" "spn_cloudockit_app" {
  count                      = 1
  name                       = "spn-cloudockit-${var.environment_acronym}"
  homepage                   = "https://spn-cloudockit-${var.environment_acronym}"
  identifier_uris            = ["https://spn-cloudockit-${var.environment_acronym}"]
  reply_urls                 = ["https://spn-cloudockit-${var.environment_acronym}"]
  type                       = "webapp/api"
  group_membership_claims    = "All"
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = false
}

resource "azuread_service_principal" "spn_cloudockit" {
  count                      = 1
  application_id             = azuread_application.spn_cloudockit_app[0].application_id
}