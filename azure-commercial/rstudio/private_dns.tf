resource "azurerm_private_dns_a_record" "gurobi" {
  provider            = azurerm.pvt_dns_subscription
  name                = "gurobi.${var.fulcrum_subdomain}"
  zone_name           = "kpmgcloudops.com"
  resource_group_name = "rgp-use-core-private-dnszone-${var.pvt_dns_environment_acronym}" # DEV/QA share the zone with the -dv suffix, while UAT/PD share the zone with -pd
  ttl                 = 3600
  records             = ["${azurerm_linux_virtual_machine.rstudiogurobivmrminstance.private_ip_address}"]
  depends_on          = [module.gurobi_subnet]
}
