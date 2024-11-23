resource "azuread_user" "AnalysisServicesAdminUser" {
  user_principal_name = "${var.analysisservice_admin_username}@${var.tenantfqdn}"
  display_name        = var.analysisservice_admin_username
  password            = var.analysisservice_admin_user_password
  #count = "${var.target_deployment_environment == "prod" ? 1 : 0}"
}

