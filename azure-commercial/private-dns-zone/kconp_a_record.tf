# resource "azurerm_private_dns_a_record" "dns_server" {
#   name                = "@"
#   zone_name           = module.addns.private_dns_zone_name
#   resource_group_name = module.applicationrg.resource_group_name
#   ttl                 = 3600
#   records             = var.environment_acronym == "dv" ? ["10.1.11.4", "10.1.11.5"] : ["10.30.15.196", "10.30.15.197"]
# }
# resource "azurerm_private_dns_srv_record" "dns_ldap_adforest_finder" {
#   name                = "_ldap._tcp.dc._msdcs"
#   zone_name           = module.addns.private_dns_zone_name
#   resource_group_name = module.applicationrg.resource_group_name
#   ttl                 = 3600

#   record {
#     priority = 0
#     weight   = 100
#     port     = 389
#     target   = var.environment_acronym == "dv" ? "j4q4j68j85vjew6.kconp.local" : "b-kef3bc0ewfu3h.kco.local"
#   }

#   record {
#     priority = 0
#     weight   = 100
#     port     = 389
#     target   = var.environment_acronym == "dv" ? "ttnyrv8mwptw12r.kconp.local" : "l614woabpbsjob9.kco.local"
#   }

#   tags = {
#     Environment = var.environment_acronym == "dv" ? "Development" : "Production"
#   }
# }
# resource "azurerm_private_dns_a_record" "dns_server_alias1" {
#   name                = var.environment_acronym == "dv" ? "ttnyrv8mwptw12r" : "b-kef3bc0ewfu3h"
#   zone_name           = module.addns.private_dns_zone_name
#   resource_group_name = module.applicationrg.resource_group_name
#   ttl                 = 3600
#   records             = var.environment_acronym == "dv" ? ["10.1.11.4"] : ["10.30.15.197"]
# }
# resource "azurerm_private_dns_a_record" "dns_server_alias2" {
#   name                = var.environment_acronym == "dv" ? "j4q4j68j85vjew6" : "l614woabpbsjob9"
#   zone_name           = module.addns.private_dns_zone_name
#   resource_group_name = module.applicationrg.resource_group_name
#   ttl                 = 3600
#   records             = var.environment_acronym == "dv" ? ["10.1.11.5"] : ["10.30.15.196"]
# }
