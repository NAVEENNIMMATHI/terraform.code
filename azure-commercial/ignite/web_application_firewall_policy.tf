resource "azurerm_web_application_firewall_policy" "ignite_custom_waf_policy" {
  name                      = "waf-${var.location}-${var.application_acronym}-${var.engagement_name}${var.separator}custom-${var.environment}"
  resource_group_name       = module.ignite_rg.resource_group_name
  location                  = module.ignite_rg.resource_group_location

  tags = var.tags

  custom_rules {
    name      = "allowapicontenttype"
    priority  = 10
    rule_type = "MatchRule"

    match_conditions {
      match_variables {
        variable_name = "RequestHeaders"
      }

      operator           = "Equal"
      negation_condition = false
      match_values       =  [
                            "application/vnd.api+json"
                            ]
    }

    action = "Allow"
  }

  custom_rules {
    name      = "allowsessionidinquery"
    priority  = 20
    rule_type = "MatchRule"

    match_conditions {
      match_variables {
        variable_name = "QueryString"
      }

      operator           = "Contains"
      negation_condition = false
      match_values       =  [
                            "session_id"
                            ]
    }

    action = "Allow"
  }


  custom_rules {
    name      = "allowfalsepositiveurls"
    priority  = 30
    rule_type = "MatchRule"

    match_conditions {
      match_variables {
        variable_name = "RequestUri"
      }

      operator           = "Regex"
      negation_condition = false
      match_values       =  [
                            "^(?i)(\\/hub\\/auth\\/callback)",
                            "^(?i)(\\/auth\\/oauth2\\/callback)",
                            "^(?i)(\\/user\\/.*\\/api\\/contents\\/)",
                            "^(?i)(\\/hub\\/oauth_callback)"
                            ]
    }

    action = "Allow"
  }
  custom_rules {
    name      = "allowrequestcontenttype"
    priority  = 11
    rule_type = "MatchRule"

    match_conditions {
      match_variables {
        variable_name = "RequestHeaders"
        selector      = "Content-Type"
      }

      operator           = "Contains"
      negation_condition = false
      match_values       =  [
                            "application/vnd.api+json"
                            ]
    }

    action = "Allow"
  }

  custom_rules {
    name      = "allowuseragents"
    priority  = 12
    rule_type = "MatchRule"

    match_conditions {
      match_variables {
        variable_name = "RequestHeaders"
        selector      = "User-Agent"
      }

      operator           = "BeginsWith"
      negation_condition = false
      match_values       =  [
                            "python-requests/"
                            ]
      transforms          = ["UrlDecode"]                      
    }

    action = "Allow"
  }

  custom_rules {
    name      = "miniofileupload"
    priority  = 13
    rule_type = "MatchRule"

    match_conditions {
      match_variables {
        variable_name = "RequestUri"
      }
      operator           = "BeginsWith"
      transforms         = ["UrlDecode"]
      negation_condition = false
      match_values       =  [
                            "/igniteui/"
                            ]
    }

    action = "Allow"
  }

  policy_settings {
    enabled                     = true
  #  mode                        = "Detection"
    mode = var.environment == "dv" || var.environment_acronym == "qa" || var.environment == "pd" ? "Prevention" : "Detection"
    request_body_check          = false
#    file_upload_limit_in_mb     = 100
#    max_request_body_size_in_kb = 128
  }

  managed_rules {
    exclusion {
      match_variable          = "RequestCookieNames"
      selector                = "Url"
      selector_match_operator = "Contains"
    }
    exclusion {
      match_variable          = "RequestCookieNames"
      selector                = "session-id"
      selector_match_operator = "Contains"
    }
    exclusion {
      match_variable          = "RequestCookieNames"
      selector                = "jwt"
      selector_match_operator = "Contains"
    }
    exclusion {
      match_variable          = "RequestArgNames"
      selector                = "session_id"
      selector_match_operator = "Contains"
    }
    exclusion {
      match_variable          = "RequestCookieNames"
      selector                = "security_authentication"
      selector_match_operator = "StartsWith"
    }
    exclusion {
      match_variable          = "RequestCookieNames"
      selector                = "XSRF-TOKEN"
      selector_match_operator = "Equals"
    }
    exclusion {
      match_variable          = "RequestCookieNames"
      selector                = "idtoken"
      selector_match_operator = "Contains"
    }
    exclusion {
        match_variable          = "RequestArgNames"
        selector                = "code"
        selector_match_operator = "Equals"
    }
      exclusion {
          match_variable          = "RequestHeaderNames"
          selector                = "Content-Type"
          selector_match_operator = "Contains"
    }
      exclusion {
            match_variable          = "RequestArgNames" 
            selector                = "metadata"
            selector_match_operator = "Contains"
    }
    managed_rule_set {
      type    = "OWASP"
      version = "3.1"
    }
  }

}