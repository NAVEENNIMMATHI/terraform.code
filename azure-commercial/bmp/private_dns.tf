resource "azurerm_private_dns_a_record" "keyvault_a_record" {
    provider            = azurerm.pvt_dns_subscription
    name                = "kvl-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}"
    zone_name           = "privatelink.vaultcore.azure.net"
    resource_group_name = var.private_dns_zone_resource_group # DEV/QA & UAT/PD share a DNS Zone with each other
    ttl                 = 3600
    records             = ["${azurerm_private_endpoint.keyvault_appsubnet.private_service_connection[0].private_ip_address}"]
    #count               = var.environment_acronym == "pd" ? 1 : 0
}