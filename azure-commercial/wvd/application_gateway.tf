locals {
  backend_address_pool_name      = "appGatewayBackendPool-ABLAAPP"
  frontend_port_name             = "appGatewayFrontendPort-ABLA"
  frontend_port2_name            = "ra-httpPort"
  frontend_ip_configuration_name = "appGatewayFrontendIP-ABLA"
  http_setting_name              = "appGatewayBackendHttpsSettings-ABLAAPP"
  listener_name                  = "appGatewayHttpsListener-ABLAAPP-Prod"
  request_routing_rule_name      = "Rule-ABLAAPP-Prod"
  probe_name                     = "appGatewayBackendHttpsSettings-ABLAAPP17badeee-d1b5-4a99-94f4-fb31b868902a"
  probe_name2                    = "appGatewayBackendHttpsSettings-ABLAAPPb74ca557-e06d-4e04-9654-aface3bdb003"
  probe_host_name                = "${var.abla_AppServiceFQDN}"
}

resource "azurerm_application_gateway" "abla_appgw01" {
    name                = "${var.abla_agw_name}"
    resource_group_name = "${module.applicationrg.resource_group_name}"
    location            = "${module.applicationrg.resource_group_location}"
/*    ssl_policy {
        min_protocol_version = "TLSv1_2"
        cipher_suites        = [​
                        "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA",​
                        "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384",​
                        "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384",​
                        "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA",​
                        "TLS_RSA_WITH_AES_256_GCM_SHA384",​
                        "TLS_RSA_WITH_AES_256_CBC_SHA256",​
                        "TLS_RSA_WITH_AES_256_CBC_SHA"​
                        ]​*ZG
      }for v11.14 */
    sku {
    name     = "WAF_Medium"
    tier     = "WAF"
    capacity = 2
  }
   gateway_ip_configuration {
    name      = "app-gateway-ip-configuration"
    subnet_id = "${module.ablaagw1subnet.subnet_id}"
  }
    frontend_port {
    name = "${local.frontend_port_name}"
    port = 443
  }
    frontend_port {
    name = "${local.frontend_port2_name}"
    port = 80
  }
    frontend_ip_configuration {
    name                 = "${local.frontend_ip_configuration_name}"
    public_ip_address_id = "${module.ablaappgwpip.public_ip_id}"
  }

    backend_address_pool {
    name = "${local.backend_address_pool_name}"
  }

  backend_http_settings {
    name                  = "appGatewayBackendHttpsSettings-ABLAAPP"
# v11.14    affinity_cookie_name  = "ApplicationGatewayAffinity"
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 1
    probe_name            = "appGatewayBackendHttpsSettings-ABLAAPP17badeee-d1b5-4a99-94f4-fb31b868902a"
  }

   http_listener {
    name                           = "${local.listener_name}"
    frontend_ip_configuration_name = "${local.frontend_ip_configuration_name}"
    frontend_port_name             = "${local.frontend_port_name}"
    protocol                       = "Https"
    ssl_certificate_name	         = "${var.abla_agw_ase_ssl_cert_name3}"
    host_name                      = "abla.kpmgcloudops.com"
    require_sni                    = "true"
  }

   probe {
    name                       = "${local.probe_name}"
    host                       = "abla.kpmgcloudops.com"
    protocol		               = "Https"
    path                       = "/"
    interval                   = "30"
    timeout                    = "30"
    unhealthy_threshold        = "3"
    pick_host_name_from_backend_http_settings = false
  }

   request_routing_rule {
    name                       = "${local.request_routing_rule_name}"
    rule_type                  = "Basic"
    http_listener_name         = "${local.listener_name}"
    backend_address_pool_name  = "${local.backend_address_pool_name}"
    backend_http_settings_name = "${local.http_setting_name}"
  }
  ssl_certificate {
  name                                  = "${var.abla_agw_ase_ssl_cert_name3}"
  data 		                              = "${base64encode(file("cert_ablanp.pfx"))}"
  password                              = "${var.abla_appcertpfxpwd}"
  }
    waf_configuration {
      enabled                     = "true"
      firewall_mode               = "Detection"
      rule_set_version            = "3.0"
 }

 tags = "${var.tags}"
}
