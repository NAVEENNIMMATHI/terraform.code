resource "azurerm_web_application_firewall_policy" "impact_agw_policy" {
  name                      = "waf-${var.location}-${var.application_acronym}-impact-agw-${var.environment_acronym}"
  resource_group_name       = module.impact_rg.resource_group_name 
  location                  = module.impact_rg.resource_group_location

  tags = var.tags


  policy_settings {
    enabled                     = true
    mode                        = "Prevention"
    request_body_check          = true
    max_request_body_size_in_kb = 128
  }

  managed_rules {

    managed_rule_set {
      type    = "OWASP"
      version = "3.2"
    }
  }

  lifecycle {
    ignore_changes = [
      policy_settings
    ]
  }

}