resource "azuread_user" "d365Servicesaccountname" {
  user_principal_name = "${var.d365ServicesaccountUser}@${var.tenantfqdn}"
  display_name        = var.d365ServicesaccountUser
  password            = var.d365Servicesaccount_password
}

resource "azuread_group_member" "svcaccountgrpadd" {
  group_object_id   = data.azuread_group.ServiceAccounts.id
  member_object_id  = azuread_user.d365Servicesaccountname.id
}

resource "azuread_group_member" "svcaccountgrpaddkpmgllp" {
  count               = var.restrict_gateway_endpoint == "true" ? 1 : 0
  
  group_object_id   = data.azuread_group.ServiceAccountskpmgllp[0].id
  member_object_id  = azuread_user.d365Servicesaccountname.id
}