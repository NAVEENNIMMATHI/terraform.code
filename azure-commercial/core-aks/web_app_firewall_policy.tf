resource "azurerm_web_application_firewall_policy" "core_aks_agw_policy" {
  count                     = 1

  name                      = "waf-${var.location}-${var.application_acronym}-aks-agw-${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.aks[0].name # indexing since resource group is created with count
  location                  = azurerm_resource_group.aks[0].location

  tags = var.tags_Artifactory

  custom_rules {
    name      = "allowfalsepositiveurls"
    priority  = 10
    rule_type = "MatchRule"

    match_conditions {
      match_variables {
        variable_name = "RequestUri"
      }

      operator           = "Regex"
      negation_condition = false
      match_values       =  [
                            "\\/ui.*",
                            "\\/artifactory.*",
                            "\\/CDK.*",
                            "\\/LogIn.*"
                            ]
    }

    action = "Allow"
  }

  policy_settings {
    enabled                     = true
    mode                        = "Detection"
    request_body_check          = true
    file_upload_limit_in_mb     = 750
    max_request_body_size_in_kb = 128
  }

  managed_rules {

    managed_rule_set {
      type    = "OWASP"
      version = "3.1"
      rule_group_override {
        rule_group_name = "General"
        disabled_rules = [
          "200004" # Possible Multipart Unmatched Boundary.  Fixes Artifactory upload 403 error.
        ]
      }
    }
  }

}