resource "azurerm_app_service" "appservice_test" {
    name                = "${lower(var.application_acronym)}${lower(var.environment_type_test)}"
    location            = module.applicationrg.resource_group_location
    resource_group_name = module.applicationrg.resource_group_name
    app_service_plan_id = module.app_service_plan.app_service_plan_id
    https_only          = "false"
    tags                = var.tags
    count               = var.restrict_gateway_endpoint == "true" ? 0 : 1
    
    identity {
        type = "SystemAssigned"
    }

    site_config {
        always_on                 = "true"
        websockets_enabled        = "false"
        use_32_bit_worker_process = "false"
        php_version               = "5.6"
        dotnet_framework_version  = "v5.0"
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

resource "azurerm_app_service" "appservice_final" {
    name                = "${lower(var.application_acronym)}${lower(var.environment_type_final)}"
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
        use_32_bit_worker_process = "false"
        php_version               = "5.6"
        dotnet_framework_version  = "v5.0"
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

resource "azurerm_app_service" "appservice_umt_test" {
    name                = "umt${lower(var.environment_type_test)}"
    location            = module.applicationrg.resource_group_location
    resource_group_name = module.applicationrg.resource_group_name
    app_service_plan_id = module.app_service_plan.app_service_plan_id
    https_only          = "false"
    tags                = var.tags
    count               = var.restrict_gateway_endpoint == "true" ? 0 : 1
    
    identity {
        type = "SystemAssigned"
    }

    site_config {
        always_on                 = "false"
        websockets_enabled        = "false"
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

resource "azurerm_app_service" "appservice_umt_final" {
    name                = "umt${lower(var.environment_type_final)}"
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
        http2_enabled             = "true"
        websockets_enabled        = "false"
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

resource "azurerm_app_service" "appservice_rest_test" {
    name                = "${lower(var.application_acronym)}rest${lower(var.environment_type_test)}"
    location            = module.applicationrg.resource_group_location
    resource_group_name = module.applicationrg.resource_group_name
    app_service_plan_id = module.app_service_plan.app_service_plan_id
    https_only          = "false"
    tags                = var.tags
    count               = var.restrict_gateway_endpoint == "true" ? 0 : 1
    
    identity {
        type = "SystemAssigned"
    }

    site_config {
        always_on                 = "false"
        websockets_enabled        = "false"
        use_32_bit_worker_process = "false"
        php_version               = "5.6"
        dotnet_framework_version  = "v5.0"
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

resource "azurerm_app_service" "appservice_rest_final" {
    name                = "${lower(var.application_acronym)}rest${lower(var.environment_type_final)}"
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
        use_32_bit_worker_process = "false"
        php_version               = "5.6"
        dotnet_framework_version  = "v5.0"
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

resource "azurerm_app_service" "appservice_umt_rest_test" {
    name                = "umtrest${lower(var.environment_type_test)}"
    location            = module.applicationrg.resource_group_location
    resource_group_name = module.applicationrg.resource_group_name
    app_service_plan_id = module.app_service_plan.app_service_plan_id
    https_only          = "false"
    tags                = var.tags
    count               = var.restrict_gateway_endpoint == "true" ? 0 : 1
    
    identity {
        type = "SystemAssigned"
    }

    site_config {
        always_on                 = "false"
        websockets_enabled        = "false"
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

resource "azurerm_app_service" "appservice_umt_rest_final" {
    name                = "umtrest${lower(var.environment_type_final)}"
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
        http2_enabled             = "true" 
        websockets_enabled        = "false"
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
