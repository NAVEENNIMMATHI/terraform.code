resource "azurerm_app_service" "appservice_web" {
    name                = "${lower(var.application_acronym)}${lower(var.app_gateway_environment_acronym)}"
    location            = module.applicationrg.resource_group_location
    resource_group_name = module.applicationrg.resource_group_name
    app_service_plan_id = module.app_service_plan.app_service_plan_id
    https_only          = "false"
    client_affinity_enabled = "true"
    
    identity {
        type = "SystemAssigned"
    }

    site_config {
        use_32_bit_worker_process = "false"
        php_version               = "5.6"
        dotnet_framework_version  = "v5.0"
        min_tls_version           = "1.2"
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

    tags                = var.tags
}
