resource "azurerm_key_vault" "mipkv" {
  name                        = var.environment_acronym == "uat" ? "kvl-${var.location_acronym}-${var.application_acronym}-${var.client}-v-${lower(var.environment_acronym)}" : "kvl-${var.location_acronym}-${var.application_acronym}-${var.client}-${lower(var.environment_acronym)}"
  resource_group_name         = module.mathworks_rg_client.resource_group_name
  location                    = module.mathworks_rg_client.resource_group_location
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  enabled_for_disk_encryption = true
  purge_protection_enabled    = true
  soft_delete_retention_days  = 90

  tags = var.tags

  network_acls {
    default_action = "Allow"
    bypass         = "AzureServices"
    ip_rules = [
      "199.207.253.101/32",
      "199.207.253.96/32",
      "103.58.118.81/32"
    ]
    virtual_network_subnet_ids = [module.subnet_private_link.subnet_id] 

  }
  # lifecycle {
  #   ignore_changes = [
  #     network_acls
  #   ]
  # }
}

resource "azurerm_key_vault_access_policy" "appgateway" {
  key_vault_id = azurerm_key_vault.mipkv.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = azurerm_user_assigned_identity.agwIdentity.principal_id

  key_permissions = []

  secret_permissions = [
    "Get",
    "List",
  ]
}

# resource "azurerm_key_vault_access_policy" "appgateway_adm" {
#   key_vault_id = azurerm_key_vault.mipkv.id

#   tenant_id = data.azurerm_client_config.current.tenant_id
#   object_id = "05e8b33e-c840-4435-a327-04dceb3bdaa5"

#   key_permissions = []

#   secret_permissions = [
#     "Get",
#     "List",
#   ]
#   certificate_permissions = [
#     "Get",
#     "List",
#   ]
# }