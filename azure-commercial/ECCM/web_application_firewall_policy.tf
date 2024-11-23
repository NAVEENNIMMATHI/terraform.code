resource "azurerm_web_application_firewall_policy" "eccm_waf_policy" {
  name                      = "waf-${var.resource_location}-${var.application_acronym}-agw-${var.environment_acronym}"
  resource_group_name       = module.eccm_rg.resource_group_name
  location                  = module.eccm_rg.resource_group_location

  tags = var.tags

  policy_settings {
    enabled                     = true
    mode                        = "Prevention"
    request_body_check          = true
    file_upload_limit_in_mb     = 100
    max_request_body_size_in_kb = 2000
  }

  managed_rules {
    managed_rule_set {
      type    = "OWASP"
      version = "3.2"
    }
  }

}