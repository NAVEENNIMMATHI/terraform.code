data "azurerm_client_config" "current" {
}

resource "azurerm_key_vault" "key_vault" {
  name                = "kvl-${var.location_acronym}-${var.application_name}-${var.environment_acronym}"
  resource_group_name = module.apprg.resource_group_name
  location            = module.apprg.resource_group_location
  tags                = var.tags
  sku_name            = "standard"
  tenant_id           = data.azurerm_client_config.current.tenant_id

  enabled_for_deployment   = "true"
  purge_protection_enabled = true
  soft_delete_enabled      = true

  network_acls {
    bypass                     = "AzureServices"
    default_action             = "Deny"
    ip_rules                   = ["199.206.0.5/32"]
    virtual_network_subnet_ids = [data.azurerm_subnet.asesubnet.id, var.cicdbuild_subnet, var.core_aks_subnet_id]
  }
}

resource "azurerm_key_vault_access_policy" "spn_access" {
  key_vault_id = azurerm_key_vault.key_vault.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azuread_service_principal.fastpathsp.object_id

  key_permissions = [
          "Get",
          "List",
          "Update",
          "Create",
          "Import",
          "Delete",
          "Recover",
          "Backup",
          "Restore",
      ]

  secret_permissions = [
          "Get",
          "List",
          "Set",
          "Delete",
          "Recover",
          "Backup",
          "Restore",
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
      ]
}

