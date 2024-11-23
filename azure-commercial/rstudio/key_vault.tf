resource "azurerm_key_vault" "rstudio_key_vault" {
    name                = var.environment == "production" ? "${var.cloudops_global_prefix}${var.environment_acronym}${var.application_acronym}keyvault" : "kvl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
    resource_group_name = var.environment == "production" ? "co-p-eastus-rstdbackuprecovery-rg" : module.backuprecoveryrg.resource_group_name
    location            = module.backuprecoveryrg.resource_group_location
    tags                = var.tags
    sku_name            = "standard"

    tenant_id = data.azurerm_client_config.current.tenant_id

    enabled_for_disk_encryption = true

    lifecycle {
        ignore_changes = [
            access_policy,
        ]
    }

    access_policy {
        tenant_id = data.azurerm_client_config.current.tenant_id
        object_id = data.azuread_service_principal.backupmanagementservicesp.id
        key_permissions = [
            "Get",
            "List",
            "Backup",
        ]
        secret_permissions = [
            "Get",
            "List",
            "Backup",
        ]
    }

    access_policy {
        tenant_id = data.azurerm_client_config.current.tenant_id
        object_id = data.azuread_service_principal.encryptappsp.id
        key_permissions = [
            "WrapKey",
        ]
        secret_permissions = [
            "Get",
            "Set",
            "List",
            "Backup",
        ]
    }
}

resource "azurerm_key_vault" "rstudio_key_vault_local" {
    name                        = "kvl-${var.location_acronym}-${var.application_acronym}2-${var.environment_acronym}"
    location                    = module.applicationrg.resource_group_location
    resource_group_name         = module.applicationrg.resource_group_name
    tags                        = var.tags
    sku_name                    = "standard"
    tenant_id                   = data.azurerm_client_config.current.tenant_id
    enabled_for_disk_encryption = true
    enabled_for_deployment      = true

    access_policy {
        tenant_id    = data.azurerm_client_config.current.tenant_id
        object_id    = data.azuread_service_principal.keyvaultsp.id

        key_permissions = [
            "Get",
            "List"
        ]

        secret_permissions = [
            "Get",
            "Set",
            "List"
        ]

        certificate_permissions = [
            "Get",
            "List",
            "Update",
            "Create",
            "Import",
            "Delete",
            "Recover",
            "Backup",
            "Restore",
            "ManageContacts",
            "ManageIssuers",
            "GetIssuers",
            "ListIssuers",
            "SetIssuers",
            "DeleteIssuers",
            "Purge",
        ]
    }

    access_policy {
        tenant_id    = data.azurerm_client_config.current.tenant_id
        object_id    = data.azuread_group.support_team_group.object_id

        key_permissions = [
            "Get",
            "List"
        ]

        secret_permissions = [
            "Get",
            "Set",
            "List"
        ]

        certificate_permissions = [
            "Get",
            "List",
            "Update",
            "Create",
            "Import"
        ]
    }

    access_policy {
        tenant_id    = data.azurerm_client_config.current.tenant_id
        object_id    = azurerm_linux_virtual_machine.rstudiorpm2vminstance.identity[0].principal_id
        
        secret_permissions = [
            "Get",
            "Set",
            "List"
        ]
    }

    access_policy {
        tenant_id    = data.azurerm_client_config.current.tenant_id
        object_id    = azurerm_linux_virtual_machine.rstudioserverpro2vminstance.identity[0].principal_id
        
        secret_permissions = [
            "Get",
            "Set",
            "List"
        ]
    }

    access_policy {
        tenant_id    = data.azurerm_client_config.current.tenant_id
        object_id    = azurerm_linux_virtual_machine.rstudioconnect2vminstance.identity[0].principal_id
        
        secret_permissions = [
            "Get",
            "Set",
            "List"
        ]
    }
}
