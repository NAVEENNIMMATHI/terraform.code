resource "azurerm_function_app" "adsyncfap" {
    name						= "fun-${lower(var.location_acronym)}-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
    resource_group_name			= module.adsyncrg.resource_group_name
    location       				= module.adsyncrg.resource_group_location
	storage_account_name		= module.adsyncsa.storage_account_name
	storage_account_access_key	= module.adsyncsa.primary_access_key
    app_service_plan_id			= module.adsyncasp.app_service_plan_id
    version 					= "~3"
	https_only 					= true

	site_config {
		always_on = true
		scm_type  = "VSTSRM"
	}

	auth_settings {
		enabled 			= true
		default_provider	= "AzureActiveDirectory"
		issuer 				= "https://sts.windows.net/${var.tenant_id}/"
		active_directory {
			client_id = var.active_directory_client_id
		}

		runtime_version		= "~1"
		token_store_enabled = true
		token_refresh_extension_hours = 0
		unauthenticated_client_action = "RedirectToLoginPage"
	}

	identity {
		type = "SystemAssigned"
	}

	tags = var.tags
}

resource "azurerm_function_app_slot" "adsyncfapslot" {
	name						= "QA"
    resource_group_name			= module.adsyncrg.resource_group_name
    location       				= module.adsyncrg.resource_group_location
    function_app_name			= "fun-${lower(var.location_acronym)}-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
	storage_account_name		= module.adsyncsa.storage_account_name
	storage_account_access_key	= module.adsyncsa.primary_access_key
    app_service_plan_id			= module.adsyncasp.app_service_plan_id
    version 					= "~3"
	https_only 					= true

	site_config {
		always_on = true
		scm_type  = "VSTSRM"
	}

	auth_settings {
		enabled 			= true
		default_provider	= "AzureActiveDirectory"
		issuer 				= "https://sts.windows.net/${var.tenant_id}/"
		active_directory {
			client_id = var.active_directory_client_id
		}

		runtime_version		= "~1"
		token_store_enabled = true
		token_refresh_extension_hours = 0
		unauthenticated_client_action = "RedirectToLoginPage"
	}

	identity {
		type = "SystemAssigned"
	}

	tags = var.tags

	depends_on = [azurerm_function_app.adsyncfap]

}
