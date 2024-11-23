module "analysisservice" {
  for_each = var.analysisservice
  source                    = "../../modules/analysis_service"
  analysis_service_name     = "ans${each.value.location_acronym}${var.application_acronym}${each.value.region}${var.environment_acronym}"
  analysis_service_location = module.applicationrg[each.key].resource_group_location
  resource_group_name       = module.applicationrg[each.key].resource_group_name
  admin_users               = ["${var.analysis_services_admins_groupname}@${var.tenantfqdn}","app:${azuread_application.spipaas_dtf.application_id}@${data.azurerm_client_config.current.tenant_id}"]
  analysis_service_sku      = each.value.sku
  ipv4_firewall_rules  = each.value.ipv4_firewall_rules
  tags                 = var.tags
}