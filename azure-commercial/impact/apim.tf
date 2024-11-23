/*resource "azurerm_api_management" "impact-apim" {
   location                  = module.impact_rg.resource_group_location
   name                      = "apim-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
   publisher_name            = var.publisher_name
   publisher_email           = var.publisher_email
   resource_group_name       = module.impact_rg.resource_group_name
   sku_name                  = var.apimsku
   virtual_network_type      = var.virtual_network_type
   notification_sender_email = "apimgmt-noreply@mail.windowsazure.com"
   virtual_network_configuration {
     subnet_id = lower(module.impact_apim_subnet.subnet_id)
   }

   policy {
       xml_content = <<-EOT
         <policies>
         <inbound>
         <cors allow-credentials="true">
         <allowed-origins>
         <origin>https://impactapi-dev.kpmgcloudops.com</origin>
         <origin>https://impactapi-dev-developer.kpmgcloudops.com</origin>
         </allowed-origins>
         <allowed-methods preflight-result-max-age="300">
         <method>*</method>
         </allowed-methods>
         <allowed-headers>
         <header>*</header>
         </allowed-headers>
         <expose-headers>
         <header>*</header>
         </expose-headers>
         </cors>
         </inbound>
         <backend />
         <outbound />
         <on-error />
         </policies>
       EOT
     }

   identity {
     type = "SystemAssigned"
   }

   certificate {
     encoded_certificate = filebase64("${var.api_pfx_cert_name}.pfx")
     store_name          = "CertificateAuthority"
   }
   certificate {
     encoded_certificate = filebase64("${var.api_developer_pfx_cert_name}.pfx")
     store_name          = "CertificateAuthority"
   }
   tags = var.tags
 }
*/