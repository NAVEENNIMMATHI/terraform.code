resource "azurerm_private_dns_a_record" "storage_a_record" {
    provider            = azurerm.pvt_dns_subscription
    name                = "stouserri${var.environment_acronym}"
    zone_name           = "privatelink.blob.core.windows.net"
    resource_group_name = "rgp-use-core-private-dnszone-${var.pvt_dns_environment_acronym}" # DEV/QA & UAT/PD share a DNS Zone with each other
    ttl                 = 3600
    records             = ["${azurerm_private_endpoint.storage_endpoint.private_service_connection[0].private_ip_address}"]
}

resource "azurerm_private_dns_a_record" "keyvault_a_record" {
    provider            = azurerm.pvt_dns_subscription
    name                = "kvl-use-rri-${var.environment_acronym}"
    zone_name           = "privatelink.vaultcore.azure.net"
    resource_group_name = "rgp-use-core-private-dnszone-${var.pvt_dns_environment_acronym}" # DEV/QA & UAT/PD share a DNS Zone with each other
    ttl                 = 3600
    records             = ["${azurerm_private_endpoint.kvl_endpoint.private_service_connection[0].private_ip_address}"]
}

resource "azurerm_private_dns_a_record" "sql_a_record" {
    provider            = azurerm.pvt_dns_subscription
    name                = "mssqlsrv-use-rri-${var.environment_acronym}"
    zone_name           = "privatelink.database.windows.net"
    resource_group_name = "rgp-use-core-private-dnszone-${var.pvt_dns_environment_acronym}" # DEV/QA & UAT/PD share a DNS Zone with each other
    ttl                 = 3600
    records             = ["${azurerm_private_endpoint.sql_endpoint.private_service_connection[0].private_ip_address}"]
}

resource "azurerm_private_dns_a_record" "rri_scm" {
  provider            = azurerm.pvt_dns_subscription
  name                = var.environment == "production" ? "rri.scm" : "rri${var.app_gateway_environment_acronym}.scm"
  zone_name           = "kpmgcloudops.com"
  resource_group_name = "rgp-use-core-private-dnszone-${var.pvt_dns_environment_acronym}" # DEV/QA & UAT/PD share a DNS Zone with each other
  ttl                 = 3600
  records             = ["${var.ase_internal_ip}"]
}

resource "azurerm_private_dns_a_record" "rrirest_scm" {
  provider            = azurerm.pvt_dns_subscription
  name                = var.environment == "production" ? "rrirest.scm" : "rrirest${var.app_gateway_environment_acronym}.scm"
  zone_name           = "kpmgcloudops.com"
  resource_group_name = "rgp-use-core-private-dnszone-${var.pvt_dns_environment_acronym}" # DEV/QA & UAT/PD share a DNS Zone with each other
  ttl                 = 3600
  records             = ["${var.ase_internal_ip}"]
}

resource "azurerm_private_dns_a_record" "rri" {
  provider            = azurerm.pvt_dns_subscription
  name                = var.environment == "production" ? "rri" : "rri${var.app_gateway_environment_acronym}"
  zone_name           = "kpmgcloudops.com"
  resource_group_name = "rgp-use-core-private-dnszone-${var.pvt_dns_environment_acronym}" # DEV/QA & UAT/PD share a DNS Zone with each other
  ttl                 = 3600
  records             = ["${var.ase_internal_ip}"]
}

resource "azurerm_private_dns_a_record" "rrirest" {
  provider            = azurerm.pvt_dns_subscription
  name                = var.environment == "production" ? "rrirest" : "rrirest${var.app_gateway_environment_acronym}" 
  zone_name           = "kpmgcloudops.com"
  resource_group_name = "rgp-use-core-private-dnszone-${var.pvt_dns_environment_acronym}" # DEV/QA & UAT/PD share a DNS Zone with each other
  ttl                 = 3600
  records             = ["${module.appgateway_public_ip.public_ip_address}"]
}

resource "azurerm_private_dns_a_record" "storage_a_record_dfs" {
    provider            = azurerm.pvt_dns_subscription
    name                = "stouserri${var.environment_acronym}"
    zone_name           = "privatelink.dfs.core.windows.net"
    resource_group_name = "rgp-use-core-private-dnszone-${var.pvt_dns_environment_acronym}" # DEV/QA & UAT/PD share a DNS Zone with each other
    ttl                 = 3600
    records             = ["${azurerm_private_endpoint.storage_endpoint_dfs.private_service_connection[0].private_ip_address}"]
}