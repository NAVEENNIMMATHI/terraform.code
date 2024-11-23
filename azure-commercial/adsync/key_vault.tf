resource "azurerm_key_vault" "adsynckv" {
  name                        = "kvl-${lower(var.location_acronym)}-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
  resource_group_name         = module.adsyncrg.resource_group_name
  location                    = module.adsyncrg.resource_group_location

  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  tags                        = var.tags

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.keyvault_aadsyncspn_obj_id


    key_permissions = [
      "get",
      "list",
      "update",
      "create",
      "import",
      "delete",
      "recover",
      "backup",
      "restore",
    ]

    secret_permissions = [
      "get",
      "list",
      "set",
      "delete",
      "recover",
      "backup",
      "restore",
    ]

    storage_permissions = [
      "get",
    ]

    certificate_permissions = [
	  "backup",
	  "create",
	  "delete",
	  "deleteissuers",
	  "get",
	  "getissuers",
	  "import",
	  "list",
	  "listissuers",
	  "managecontacts",
	  "manageissuers",
	  "purge",
	  "recover",
	  "restore",
	  "setissuers",
	  "update",
	  ]
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id


    key_permissions = [
      "get",
      "list",
      "update",
      "create",
      "import",
      "delete",
      "recover",
      "backup",
      "restore",
    ]

    secret_permissions = [
      "get",
      "list",
      "set",
      "delete",
      "recover",
      "backup",
      "restore",
    ]

    certificate_permissions = [
	  "backup",
	  "create",
	  "delete",
	  "deleteissuers",
	  "get",
	  "getissuers",
	  "import",
	  "list",
	  "listissuers",
	  "managecontacts",
	  "manageissuers",
	  "recover",
	  "restore",
	  "setissuers",
	  "update",
	  ]
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = azurerm_function_app.adsyncfap.identity[0].principal_id


    key_permissions = [
      "get",
      "list",
      "update",
      "create",
      "import",
      "delete",
      "recover",
      "backup",
      "restore",
    ]

    secret_permissions = [
      "get",
      "list",
      "set",
      "delete",
      "recover",
      "backup",
      "restore",
    ]

    certificate_permissions = [
	  "backup",
	  "create",
	  "delete",
	  "deleteissuers",
	  "get",
	  "getissuers",
	  "import",
	  "list",
	  "listissuers",
	  "managecontacts",
	  "manageissuers",
	  "purge",
	  "recover",
	  "restore",
	  "setissuers",
	  "update",
	  ]
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = azurerm_function_app_slot.adsyncfapslot.identity[0].principal_id


    key_permissions = [
      "get",
      "list",
      "update",
      "create",
      "import",
      "delete",
      "recover",
      "backup",
      "restore",
    ]

    secret_permissions = [
      "get",
      "list",
      "set",
      "delete",
      "recover",
      "backup",
      "restore",
    ]

    certificate_permissions = [
	  "backup",
	  "create",
	  "delete",
	  "deleteissuers",
	  "get",
	  "getissuers",
	  "import",
	  "list",
	  "listissuers",
	  "managecontacts",
	  "manageissuers",
	  "purge",
	  "recover",
	  "restore",
	  "setissuers",
	  "update",
	  ]
  }
  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"

    ip_rules       = [    ]
    virtual_network_subnet_ids = []
  }
}