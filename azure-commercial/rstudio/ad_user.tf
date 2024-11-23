# Generate a new password
resource "random_password" "vm_service_account" {
  length           = 16
  special          = true
  override_special = "_%@"
}

# create service account
resource "azuread_user" "vm_service_account" {
  user_principal_name = "azuser-svc${upper(var.application_acronym)}Admin${upper(var.environment_acronym)}@${var.tenantfqdn}"
  display_name        = "azuser-svc${upper(var.application_acronym)}Admin${upper(var.environment_acronym)}"
  password            = try(data.azurerm_key_vault_secret.key_vault_secret_secretname.value,random_password.vm_service_account.result)

  lifecycle {
    ignore_changes = [
      password
    ]
  }
}

# Put password in keyvault
resource "azurerm_key_vault_secret" "vm_service_account_password" {
  name         = var.key_vault_secret_name
  value        = random_password.vm_service_account.result
  key_vault_id = azurerm_key_vault.rstudio_key_vault_local.id

  lifecycle {
    ignore_changes = [
      value,
      expiration_date,
      not_before_date
    ]
  }
}

# join admin sql group
resource "azuread_group_member" "vm_service_account_sql" {
  group_object_id  = azuread_group.vm_admins.id
  member_object_id = azuread_user.vm_service_account.id
}

# join service account group
resource "azuread_group_member" "vm_service_account_svc" {
  group_object_id  = data.azuread_group.service_account_group.id
  member_object_id = azuread_user.vm_service_account.id
}

# data "azurerm_key_vault_secrets" "key_vault_secrets" {
#   key_vault_id = azurerm_key_vault.rstudio_key_vault_local.id
# }

data "azurerm_key_vault_secret" "key_vault_secret_secretname" {
  depends_on = [
    azurerm_key_vault_secret.vm_service_account_password
  ]

  name         = var.key_vault_secret_name
  key_vault_id = azurerm_key_vault.rstudio_key_vault_local.id
}

