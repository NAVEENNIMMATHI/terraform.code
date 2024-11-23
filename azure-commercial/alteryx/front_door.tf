# resource "azurerm_frontdoor" "dasgallery" {
#   name                                         = "dasgallery"
#   resource_group_name                          = "${module.applicationrg.resource_group_name}"
#   location                                     = "Global"
#   enforce_backend_pools_certificate_name_check = true
#   friendly_name = "dasgallery"
    
#     frontend_endpoint {
#     #   custom_https_configuration {
#     #       azure_key_vault_certificate_secret_name = "dasgallery-kpmgcloudops-com"
#     #       azure_key_vault_certificate_secret_version = "1418c6b834a645038abc258d9f3f5936"
#     #       azure_key_vault_certificate_vault_id = "${azurerm_key_vault.keyvault.id}"
#     #       certificate_source = "AzureKeyVault"
#     #   }
#       custom_https_provisioning_enabled = false
#       host_name = "dasgallery.azurefd.net"
#       name = "dasgallery-azurefd-net"
#   }
#     frontend_endpoint {
#       custom_https_configuration {
#           azure_key_vault_certificate_secret_name = "dasgallery-kpmgcloudops-com"
#           azure_key_vault_certificate_secret_version = "1418c6b834a645038abc258d9f3f5936"
#           azure_key_vault_certificate_vault_id = "${azurerm_key_vault.keyvault.id}"
#           certificate_source = "AzureKeyVault"
#       }
#       custom_https_provisioning_enabled = true
#       host_name = "dasgallery.kpmgcloudops.com"
#       name = "dasgallery-kpmgcloudops-com"
#   }

#   routing_rule {
#     name               = "UEMCALTERYX1P1"
#     frontend_endpoints = ["dasgallery-kpmgcloudops-com",]
#     redirect_configuration {
#         custom_host = "UEMCALTERYX1P1.KCO.LOCAL"
#         custom_path = "/gallery"
#         redirect_protocol = "MatchRequest"
#         redirect_type = "Found"
#     }
#     accepted_protocols = ["Http", "Https"]
#     patterns_to_match  = ["/*"]
    
#   }

#   backend_pool_load_balancing {
#     name = "loadBalancingSettings-1579903309185"
#   }

#   backend_pool_health_probe {
#     name = "healthProbeSettings-1579903309185"
#     interval_in_seconds = 30
#     protocol = "Https"

#   }

#   backend_pool {
#     name = "${var.UEMCALTERYX1P1_name}"
#     backend {
#       host_header = "UEMCALTERYX1P1.KCO.LOCAL"
#       address     = "UEMCALTERYX1P1.KCO.LOCAL"
#       http_port   = 80
#       https_port  = 443
#     }

#     load_balancing_name = "loadBalancingSettings-1579903309185"
#     health_probe_name   = "healthProbeSettings-1579903309185"
#   }

  
# }