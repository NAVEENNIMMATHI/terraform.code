resource "azuread_user" "csp_service_account" {
  user_principal_name = "${var.csp_service_account_user}@${var.tenant_fqdn}"
  display_name        = var.csp_service_account_user
  password            = var.csp_service_account_password

    lifecycle {
    ignore_changes = [password, force_password_change]
  }
}

# Join CO service account group
resource "azuread_group_member" "csp_co_svcaccount_group_member" {
  group_object_id  = data.azuread_group.service_account_group.id
  member_object_id  = azuread_user.csp_service_account.id
}

# Join csp system admin service account group
resource "azuread_group_member" "csp_sysadm_svcaccount_group_member" {
  group_object_id   = azuread_group.csp_sys_admin.id
  member_object_id  = azuread_user.csp_service_account.id
}