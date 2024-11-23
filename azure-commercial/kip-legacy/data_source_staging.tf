#Managed Identities for App Services
data "azuread_service_principal" "kipuat_sp" {
  count        = var.target_deployment_environment == "nonprod" ? 0 : 1

  display_name = var.app_service_name_kipuat
}

data "azuread_service_principal" "kiprestuat_sp" {
  count        = var.target_deployment_environment == "nonprod" ? 0 : 1

  display_name = var.app_service_name_kiprestuat
}

data "azuread_service_principal" "mep-kipuat_sp" {
  count        = var.target_deployment_environment == "nonprod" ? 0 : 1

  display_name = var.app_service_name_mep-kipuat
}

data "azuread_service_principal" "meprest-kipuat_sp" {
  count        = var.target_deployment_environment == "nonprod" ? 0 : 1

  display_name = var.app_service_name_meprest-kipuat
}

data "azuread_service_principal" "functionapp_uat_sp" {
  count        = var.target_deployment_environment == "nonprod" ? 0 : 1
  
  display_name = var.functionapp_name_uat
}

