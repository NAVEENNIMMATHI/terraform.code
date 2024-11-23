resource "azurerm_app_service" "appservice_web" {
    name                = "${lower(var.application_acronym)}${lower(var.app_gateway_environment_acronym)}"
    location            = module.applicationrg.resource_group_location
    resource_group_name = module.applicationrg.resource_group_name
    app_service_plan_id = module.app_service_plan.app_service_plan_id
    https_only          = "false"
    tags                = var.tags
    
    
    identity {
        type = "SystemAssigned"
    }

    site_config {
        always_on                 = "true"
        websockets_enabled        = "false"
        http2_enabled             = "true"
        use_32_bit_worker_process = "false"
        php_version               = "5.6"
        scm_type                  = "VSTSRM"
        default_documents         = [
              "Default.htm",
              "Default.html",
              "Default.asp",
              "index.htm",
              "index.html",
              "iisstart.htm",
              "default.aspx",
              "index.php",
              "hostingstart.html",
            ]
    }
    
}


resource "azurerm_app_service" "appservice_rest" {
    name                = "${lower(var.application_acronym)}rest${lower(var.app_gateway_environment_acronym)}"
    location            = module.applicationrg.resource_group_location
    resource_group_name = module.applicationrg.resource_group_name
    app_service_plan_id = module.app_service_plan.app_service_plan_id
    https_only          = "false"
    tags                = var.tags
    
    identity {
        type = "SystemAssigned"
    }

    site_config {
        always_on                 = "false"
        websockets_enabled        = "false"
        http2_enabled             = "true" 
        use_32_bit_worker_process = "false"
        php_version               = "5.6"
        scm_type                  = "VSTSRM"
        default_documents         = [
              "Default.htm",
              "Default.html",
              "Default.asp",
              "index.htm",
              "index.html",
              "iisstart.htm",
              "default.aspx",
              "index.php",
              "hostingstart.html",
            ]
    }
    lifecycle {
    ignore_changes = [
      site_config
    ]
  }
}
