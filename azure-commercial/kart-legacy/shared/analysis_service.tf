module "analysisservice" {
  source                    = "../../modules12/analysis_service"
  analysis_service_name     = var.analysis_service_name
  analysis_service_location = data.azurerm_resource_group.sharedrg.location
  resource_group_name       = data.azurerm_resource_group.sharedrg.name
  admin_users               = ["${data.azuread_group.analysisadmin.name}@${var.tenantfqdn}", "app:${azuread_application.KRTWebapplication.application_id}@${data.azurerm_client_config.current.tenant_id}", "app:${var.automation_account_obj_id}@${data.azurerm_client_config.current.tenant_id}", "app:${azurerm_user_assigned_identity.identity.client_id}@${data.azurerm_client_config.current.tenant_id}"]

  #admin_users                 = []
  PaloAltoFirewallPIP1 = var.PaloAltoFirewallPIP1
  PaloAltoFirewallPIP2 = var.PaloAltoFirewallPIP2
  kartasemangementIP   = var.kartasemangementIP
  tags                 = var.tags
}

# resource "azurerm_analysis_services_server" "analysisservice" {
#   name                    = "${var.analysis_service_name}"
#   location                = "eastus"
#   resource_group_name     = "${data.azurerm_resource_group.sharedrg.name}"
#   sku                     = "S0"
#   admin_users             = ["${var.analysis_server_userid_dev}", "app:${azuread_application.DEVWebapplication.application_id}@${data.azurerm_client_config.current.tenant_id}", "app:${var.automation_account_dev_obj_id}@${data.azurerm_client_config.current.tenant_id}", "app:${azurerm_user_assigned_identity.krtidentitydev.client_id}@${data.azurerm_client_config.current.tenant_id}"]
#   enable_power_bi_service = true
#   #count = "${var.target_deployment_environment == "prod" ? 0 : 1}"
#   ipv4_firewall_rule {
#     name        = "PaloAltoFirewallPIP1"
#     range_start = "${var.PaloAltoFirewallPIP1}"
#     range_end   = "${var.PaloAltoFirewallPIP1}"
#   }
#   ipv4_firewall_rule {
#     name        = "PaloAltoFirewallPIP2"
#     range_start = "${var.PaloAltoFirewallPIP2}"
#     range_end   = "${var.PaloAltoFirewallPIP2}"
#   }
#   ipv4_firewall_rule {
#     name        = "kartasemangementIP"
#     range_start = "${var.kartasemangementIP}"
#     range_end   = "${var.kartasemangementIP}"
#   }
#   tags = "${var.tags}"
# }
