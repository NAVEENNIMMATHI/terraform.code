resource "azuread_user" "projectops_d365_service_account" {
  user_principal_name = "${var.d365_service_account_user}@${var.tenant_fqdn}"
  display_name        = var.d365_service_account_user
  password            = var.d365_service_account_password

    lifecycle {
    ignore_changes = [password, force_password_change]
  }
}

resource "azuread_group_member" "projectops_svcaccount_group_member" {
  group_object_id   = data.azuread_group.co_service_accounts_group.id
  member_object_id  = azuread_user.projectops_d365_service_account.id
}
