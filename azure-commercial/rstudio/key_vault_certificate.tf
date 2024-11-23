resource "azurerm_key_vault_certificate" "rstudio_workstnvm_cert" {
    depends_on   = [azurerm_key_vault.rstudio_key_vault_local, azurerm_network_interface.rstudio_workstnvm_nic]
    #name        = "${​element(azurerm_network_interface.rstudio_workstnvm_nic.*.id, count.index)}-winrm-https-cert"
    name         = var.environment == "production" ? "UEMCRSWKSTN1P1-winrm-https-cert" : upper("VMW${var.location_acronym}${var.application_acronym}${var.rstudio_workstnvm_name_prefix1}${var.environment_acronym}-winrm-https-cert")
    #count        = var.rstudio_workstnvm_count
    key_vault_id = azurerm_key_vault.rstudio_key_vault_local.id

    certificate_policy {
        issuer_parameters {
            name = "Self"
        }
        key_properties {
            exportable = true
            key_size   = 2048
            key_type   = "RSA"
            reuse_key  = true
        }
        lifetime_action {
            action {
                action_type = "AutoRenew"
            }
            trigger {
                days_before_expiry = 30
            }
        }
        secret_properties {
            content_type = "application/x-pkcs12"
        }
        x509_certificate_properties {
            key_usage = [
                "cRLSign",
                "dataEncipherment",
                "digitalSignature",
                "keyAgreement",
                "keyCertSign",
                "keyEncipherment",
            ]
            subject            = "CN=${azurerm_network_interface.rstudio_workstnvm_nic.private_ip_address}"
            validity_in_months = 12
        }
    }
}
