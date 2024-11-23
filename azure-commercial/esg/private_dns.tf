# Tried to put this into code, however, for UAT & PD, the DNS zone is located in AWS Route 53
#
#data "azurerm_private_dns_zone" "kpmgcloudops_com" {
#    name                = "kpmgcloudops.com"
#    resource_group_name = "rgp-use-core-private-dnszone-dv"
#}
#
#data "azurerm_application_gateway" "this" {
#    name                 = "agw-use-appgw-esg-dv"
#    resource_group_name  = "RGP-USE-ESG-DV"
#    public_ip_address_id = ""
#}
#
#resource "azurerm_private_dns_cname_record" "blueprint_cname" {
#    zone_name           = data.azurerm_private_dns_zone.kpmgcloudops_com.name
#    resource_group_name = data.azurerm_private_dns_zone.kpmgcloudops_com.resource_group_name
#    name                = "blueprint${var.dns_env}.kpmgcloudops.com"
#    record              = "5cb87359-5e68-40ad-bdc4-668b1018dffc.cloudapp.net"
#    ttl                 = 3600
#    tags                = var.tags
#}
#
#resource "azurerm_private_dns_cname_record" "blueprintrest_cname" {
#    zone_name           = data.azurerm_private_dns_zone.kpmgcloudops_com.name
#    resource_group_name = data.azurerm_private_dns_zone.kpmgcloudops_com.resource_group_name
#    name                = "blueprintrest${var.dns_env}.kpmgcloudops.com"
#    record              = "5cb87359-5e68-40ad-bdc4-668b1018dffc.cloudapp.net"
#    ttl                 = 3600
#    tags                = var.tags
#}
#
#
#variable "dns_env" {}
#dns_env = "dev"

resource "azurerm_private_dns_a_record" "storage_a_record" {
    provider            = azurerm.pvt_dns_subscription
    name                = "stouseesg${var.environment_acronym}"
    zone_name           = "privatelink.blob.core.windows.net"
    resource_group_name = "rgp-use-core-private-dnszone-${var.pvt_dns_environment_acronym}" # DEV/QA & UAT/PD share a DNS Zone with each other
    ttl                 = 3600
    records             = ["${azurerm_private_endpoint.storage_endpoint.private_service_connection[0].private_ip_address}"]
    #count               = var.environment_acronym == "pd" ? 1 : 0
}

resource "azurerm_private_dns_a_record" "keyvault_a_record" {
    provider            = azurerm.pvt_dns_subscription
    name                = "kvl-use-app-esg-${var.environment_acronym}"
    zone_name           = "privatelink.vaultcore.azure.net"
    resource_group_name = "rgp-use-core-private-dnszone-${var.pvt_dns_environment_acronym}" # DEV/QA & UAT/PD share a DNS Zone with each other
    ttl                 = 3600
    records             = ["${azurerm_private_endpoint.kvl_endpoint.private_service_connection[0].private_ip_address}"]
    #count               = var.environment_acronym == "pd" ? 1 : 0
}

resource "azurerm_private_dns_a_record" "sql_a_record" {
    provider            = azurerm.pvt_dns_subscription
    name                = "mssqlsrv-use-esg-${var.environment_acronym}"
    zone_name           = "privatelink.database.windows.net"
    resource_group_name = "rgp-use-core-private-dnszone-${var.pvt_dns_environment_acronym}" # DEV/QA & UAT/PD share a DNS Zone with each other
    ttl                 = 3600
    records             = ["${azurerm_private_endpoint.sql_endpoint.private_service_connection[0].private_ip_address}"]
    #count               = var.environment_acronym == "pd" ? 1 : 0
}

