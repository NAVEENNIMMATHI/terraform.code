#Managed Identities for App Services
data "azuread_service_principal" "kip_sp" {
  count        = var.target_deployment_environment == "production" ? 1 : 0

  display_name = var.app_service_name_kip
}

data "azuread_service_principal" "kiprest_sp" {
  count        = var.target_deployment_environment == "production" ? 1 : 0

  display_name = var.app_service_name_kiprest
}

data "azuread_service_principal" "mep-kip_sp" {
  count        = var.target_deployment_environment == "production" ? 1 : 0

  display_name = var.app_service_name_mep-kip
}

data "azuread_service_principal" "meprest-kip_sp" {
  count        = var.target_deployment_environment == "production" ? 1 : 0

  display_name = var.app_service_name_meprest-kip
}

data "azuread_service_principal" "functionapp_prod_sp" {
  count        = var.target_deployment_environment == "production" ? 1 : 0
  
  display_name = var.functionapp_name_prod
}

