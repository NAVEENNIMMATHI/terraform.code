locals {
  frontend_port_name             = "${lower(var.application_acronym)}frontendport"
  frontend_ip_configuration_name = "${lower(var.application_acronym)}frontendip"
  application_gateway_cert_name  = "${lower(var.application_acronym)}_frontend_digicert_pfx"
  backend_app_gateway_cert_name  = "${lower(var.application_acronym)}_backend_authentication_ase_cer"
  environment_type               = var.application_gateway.environment_acronym
  environment_suffix             = var.application_gateway.environment_acronym == "" ? "" : "-${var.application_gateway.environment_acronym}"
  rest_prefix                    = "${lower(var.application_acronym)}rest${lower(local.environment_type)}"
}

# Public IP
resource "azurerm_public_ip" "appgateway_public_ip" {
  name                = lower("pip-agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  location            = module.mathworks_rg_shared.resource_group_location
  resource_group_name = module.mathworks_rg_shared.resource_group_name
  domain_name_label   = "agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  sku                 = "Standard"
  allocation_method   = "Static"
  tags                = var.tags
}

resource "azurerm_application_gateway" "this" {
  name                = lower("agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  resource_group_name = module.mathworks_rg_shared.resource_group_name
  location            = module.mathworks_rg_shared.resource_group_location
  ssl_policy {
    policy_type          = "Custom"
    min_protocol_version = "TLSv1_2"
    cipher_suites = [
      "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384",
      "TLS_RSA_WITH_AES_256_GCM_SHA384",
      "TLS_RSA_WITH_AES_128_GCM_SHA256",
      "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384",
      "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"]
  }

  # Common Configuration Start
  sku {
    name = var.application_gateway.sku.name
    tier = var.application_gateway.sku.tier
  }

  waf_configuration {
    enabled          = "true"
    firewall_mode    = "Detection"
    rule_set_version = "3.0"
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.agwIdentity.id]
  }

  autoscale_configuration {
    min_capacity = 1
    max_capacity = 2
  }

  backend_address_pool {
    name = "aksbackendpool"
    fqdns = [
      "mip${local.environment_suffix}.kpmgcloudops.com"
    ]
  }
  gateway_ip_configuration {
    name      = "applicationGatewayIpConfig"
    subnet_id = module.subnet_app_gateway.subnet_id
  }
  frontend_port {
    name = local.frontend_port_name
    port = 80
#    port = 443
  }
  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.appgateway_public_ip.id
  }
  # Common Configuration End

  backend_http_settings {
    name                  = "${lower(var.application_acronym)}${lower(local.environment_suffix)}-https-settings"
    cookie_based_affinity = "Enabled"
    affinity_cookie_name  = "ApplicationGatewayAffinity"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 30
    probe_name            = "${lower(var.application_acronym)}${lower(local.environment_suffix)}-probe"
  }

  http_listener {
    name                           = lower("${var.application_acronym}${local.environment_type}-https-listener")
    host_name                      = lower("${var.application_acronym}${local.environment_suffix}.kpmgcloudops.com")
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
 #   protocol                       = "Https"
 #   require_sni                    = "true"
  #  ssl_certificate_name           = local.application_gateway_cert_name
  }

  request_routing_rule {
    name                       = "${lower(var.application_acronym)}${lower(local.environment_type)}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${lower(var.application_acronym)}${lower(local.environment_type)}-https-listener"
    backend_address_pool_name  = "aksbackendpool"
    backend_http_settings_name = "${lower(var.application_acronym)}${lower(local.environment_suffix)}-https-settings"
  }

  probe {
    host                = "${lower(var.application_acronym)}${lower(local.environment_type)}.kpmgcloudops.com"
    name                = "${lower(var.application_acronym)}${lower(local.environment_suffix)}-probe"
    protocol            = "Https"
    path                = "/"
    interval            = "30"
    timeout             = "30"
    unhealthy_threshold = "3"

    match {
      status_code = [
      "200-399"]
    }
  }

    ssl_certificate {
    name     = var.agw_pfx_cert_name
    data     = filebase64("${var.application_gateway_cert_name}.pfx")
    password = ""
    #key_vault_secret_id = data.azurerm_key_vault_secret.ssl_certificate.id
    #key_vault_secret_id = var.ssl_certificate_secret_id
  }

#### AGW is managed by AKS ingress controller
  lifecycle {
    ignore_changes = [
      probe,
      request_routing_rule,
      http_listener,
      backend_http_settings,
      frontend_ip_configuration,
      frontend_port,
      backend_address_pool,
      identity,
      url_path_map,
      ssl_certificate,
      redirect_configuration,
      tags
    ]
  }

  tags = var.tags
}
