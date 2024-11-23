resource "azurerm_app_service" "appservice_test" {
    count               = var.restrict_gateway_endpoint == "true" ? 0 : 1

    name                = var.app_service_name_test
    location            = module.applicationrg.resource_group_location
    resource_group_name = module.applicationrg.resource_group_name
    app_service_plan_id = module.app_service_plan.app_service_plan_id
    https_only          = "false"

    identity {
        type = "SystemAssigned"
    }
    
    site_config {
        #dotnet_framework_version = "v4.0"
        always_on                 = "true"
        websockets_enabled        = "false"
        use_32_bit_worker_process = "true"
        http2_enabled ="true"
        scm_type="VSTSRM"
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

    backup {
        name = "${var.app_service_name_test}-backup"
        enabled = true
        storage_account_url = "${module.storage_account.primary_blob_endpoint}${azurerm_storage_container.webappBackup.name}/${data.azurerm_storage_account_sas.storage_account_sas.sas}"
        schedule {
            frequency_interval = 1
            frequency_unit = "Day"
        }

    }

    tags                = var.tags
}

resource "azurerm_app_service" "appservice_final" {
    name                = lower(var.app_service_name_final)
    location            = module.applicationrg.resource_group_location
    resource_group_name = module.applicationrg.resource_group_name
    app_service_plan_id = module.app_service_plan.app_service_plan_id
    https_only          = "false"
    
    identity {
        type = "SystemAssigned"
    }

    site_config {
        #dotnet_framework_version = "v4.0"
        always_on                 = "true"
        websockets_enabled        = "false"
        use_32_bit_worker_process = "true"
        http2_enabled = "true"
        scm_type = "VSTSRM"
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

    backup {
        name = "${var.app_service_name_final}-backup"
        enabled = true
        storage_account_url = "${module.storage_account.primary_blob_endpoint}${azurerm_storage_container.webappBackup.name}/${data.azurerm_storage_account_sas.storage_account_sas.sas}"
        schedule {
            frequency_interval = 1
            frequency_unit = "Day"
        }

    }

    tags                = var.tags
}
