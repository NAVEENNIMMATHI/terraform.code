module "appgateway" {
  source                               = "../../modules12/application_gateway"
  locals_prefix                        = var.application_acronym
  host_name                            = var.app_gateway_hostname
  ase_cert_name                        = var.ase_cert_name
  ssl_cert_name                        = var.app_gateway_certname
  tags                                 = var.tags
  location_acronym                     = module.applicationrg.resource_group_location
  application_environment              = upper(var.environment)
  application_acronym                  = var.application_acronym
  application_gateway_name             = var.app_gateway_name
  resource_group_location              = module.applicationrg.resource_group_location
  resource_group_name                  = module.applicationrg.resource_group_name
  application_gateway_sku_name         = "WAF_Medium"
  application_gateway_sku_tier         = "WAF"
  application_gateway_sku_capacity     = "2"
  application_gateway_cert_name        = var.app_gateway_hostname
  application_gateway_certpfx_password = ""
  application_gateway_subnet_id        = module.krtagw1subnet.subnet_id
  ase_internal_ip                      = var.ase_internal_ip
  public_ip_name                       = var.app_gateway_pip_name
  cipher_suites                        = ["TLS_RSA_WITH_AES_128_GCM_SHA256", "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA", "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384", "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA", "TLS_RSA_WITH_AES_256_GCM_SHA384", "TLS_RSA_WITH_AES_256_CBC_SHA256", "TLS_RSA_WITH_AES_256_CBC_SHA"]
  agw_count                            = var.target_deployment_environment == "prod" ? 1 : 0
  app_gateway_probe_request_timeout    = 300
  app_gateway_backend_request_timeout  = 300

  #variable for additional listeners
  host_name_qa                     = ""
  application_gateway_cert_name_qa = ""
  ssl_certqa_name                  = ""
  backend_http_host_name           = "${var.app_service_name}${var.uniqueresourcesuffix}.kpmgcloudops.com"
}

