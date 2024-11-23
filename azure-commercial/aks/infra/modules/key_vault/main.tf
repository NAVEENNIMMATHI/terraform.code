resource "azurerm_key_vault" "keyvault" {
    name                        = var.key_vault
    location                    = var.azure_location
    resource_group_name         = var.resource_group
    enabled_for_disk_encryption = var.enabled_for_disk_encryption
    tenant_id                   = var.tenant_id
    purge_protection_enabled    = var.purge_protection_enabled

    sku_name = var.sku_name

    access_policy {
        tenant_id = var.tenant_id
        object_id = var.object_id

        key_permissions = var.access_policy_key_permissions

        secret_permissions = var.access_policy_secret_permissions

        storage_permissions = var.access_policy_storage_permissions
    }

    tags = var.tags
}