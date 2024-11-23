resource "azurerm_api_management" "mdp-apim" {
  location                  = module.mdp_rg_main.resource_group_location
  name                      = "apim-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  publisher_name            = var.publisher_name
  publisher_email           = var.publisher_email
  resource_group_name       = module.mdp_rg_main.resource_group_name
  sku_name                  = var.apimsku
  virtual_network_type      = var.virtual_network_type
  notification_sender_email = "apimgmt-noreply@mail.windowsazure.com"
  virtual_network_configuration {
    subnet_id = lower(module.mdp_subnet_apim.subnet_id)
  }

  policy {
      xml_content = <<-EOT
        <policies>
        <inbound>
        <cors allow-credentials="true">
        <allowed-origins>
        <origin>https://mdpapi-dev.kpmgcloudops.com</origin>
        <origin>https://mdpapi-dev-developer.kpmgcloudops.com</origin>
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
    encoded_certificate = filebase64("${var.api_pfx_cert_name}")
    store_name          = "CertificateAuthority"
  }
  certificate {
    encoded_certificate = filebase64("${var.api_developer_pfx_cert_name}")
    store_name          = "CertificateAuthority"
  }

  tags = var.tags
}

module "mdpapimappinsights" {
  source              = "../../modules/application_insights"
  name                = "ais-${var.location_acronym}-${var.application_acronym}-apim-${var.environment_acronym}"
  resource_group_name = module.mdp_rg_main.resource_group_name
  location            = module.mdp_rg_main.resource_group_location

  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "mdp_apim_logging" {
  name                           = "apim-logs"
  target_resource_id             = azurerm_api_management.mdp-apim.id
  log_analytics_workspace_id     = data.azurerm_log_analytics_workspace.spoke_law.id
  log_analytics_destination_type = "AzureDiagnostics"

  log {
    category = "GatewayLogs"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = true
    }
  }

  log {
    category = "WebSocketConnectionLogs"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = true
    }
  }
  metric {
    category = "AllMetrics"
    enabled  = false
    retention_policy {
      days    = 0
      enabled = false
    }
  }
  lifecycle {
    ignore_changes = []
  }
}
