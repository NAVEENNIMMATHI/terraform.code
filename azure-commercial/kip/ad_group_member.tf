# Not required on UAT and PROD
resource "azuread_group_member" "WindowsServicesVMAdmins" {
  count            = var.environment == "development"  ? 1 : 0
  
  group_object_id  = azuread_group.RDPUsers.id
  member_object_id = azuread_group.WindowsServicesVMAdmins[0].id
}