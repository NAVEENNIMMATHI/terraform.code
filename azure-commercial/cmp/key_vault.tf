resource "azurerm_key_vault" "cmp_key_vault" {
  name                        = "kvl-${var.location_acronym}-${var.application_acronym}-shared-${var.environment_acronym}"
  location                    = module.cmp_rg_shared.resource_group_location #var.location
  resource_group_name         = module.cmp_rg_shared.resource_group_name #upper("RGP-${var.location_acronym}-${var.application_acronym}-${each.key}-${var.environment_acronym}")
  enabled_for_disk_encryption = true

  sku_name            = "standard"
  soft_delete_enabled = true
  tenant_id           = data.azurerm_client_config.current.tenant_id
  #enabled_for_disk_encryption = true
  enabled_for_template_deployment = true

  tags = var.tags
}


 resource "azurerm_key_vault_access_policy" "vm_access" {
  for_each = var.cmp_clients
  key_vault_id = azurerm_key_vault.cmp_key_vault.id
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = element(module.buildvm_cmp_client[each.key].vm_identity_id,0)
  secret_permissions = ["get", "list"]
}

 resource "azurerm_key_vault_access_policy" "agw_access" {
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = azurerm_user_assigned_identity.cmp_agw_mi.principal_id
  key_vault_id = azurerm_key_vault.cmp_key_vault.id
  certificate_permissions = [
      "Get",
      "List",
      "Import",
    ]
  secret_permissions = [
      "Get",
      "List",
    ]
}

resource "azurerm_key_vault" "cmp_key_vault_tenant" {
  for_each = var.cmp_clients

  name                        = "kvl-${var.location_acronym}-${var.application_acronym}-${each.key}-${var.environment_acronym}"
  location                    = var.location
  resource_group_name         = upper("RGP-${var.location_acronym}-${var.application_acronym}-${each.key}-${var.environment_acronym}")
  enabled_for_disk_encryption = true

  sku_name            = "standard"
  soft_delete_enabled = true
  tenant_id           = data.azurerm_client_config.current.tenant_id
  #enabled_for_disk_encryption = true
  enabled_for_template_deployment = true

  tags = var.tags

  access_policy {
    #AGW
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = azurerm_user_assigned_identity.cmp_agw_mi.principal_id

    certificate_permissions = [
      "Get",
      "List",
      "Import",
    ]
    
    secret_permissions = [
      "Get",
      "List",
    ]
  }

  access_policy {
    #Tenate VMs
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = element(module.buildvm_cmp_client[each.key].vm_identity_id,0)

    secret_permissions = [
      "Get",
      "List",
    ]
  }

}