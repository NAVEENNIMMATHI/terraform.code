module "analysisservice" {
  source                    = "../../modules/analysis_service"
  analysis_service_name     = var.environment == "production" ? "copeuskrtanasvc1" : "ans${var.location_acronym}${var.application_acronym}${var.environment_acronym}"
  analysis_service_location = module.applicationrg.resource_group_location
  resource_group_name       = module.applicationrg.resource_group_name
  admin_users               = ["${var.analysis_services_admins_name}@${var.tenantfqdn}", "app:${azuread_application.KRTWebapplication.application_id}@${data.azurerm_client_config.current.tenant_id}", "app:${var.automation_account_app_id}@${data.azurerm_client_config.current.tenant_id}", "app:${azurerm_user_assigned_identity.identity.client_id}@${data.azurerm_client_config.current.tenant_id}"]
  
  ipv4_firewall_rules  = var.ipv4_firewall_rules
  tags                 = var.tags
}