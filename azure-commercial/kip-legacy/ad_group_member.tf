# Not required on UAT and PROD
resource "azuread_group_member" "RDPUsers" {
  count            = var.target_deployment_environment == "nonprod" ? 1 : 0

  group_object_id  = data.azuread_group.GlobalRDSGroup.id
  member_object_id = data.azuread_group.RDPUsers.id
}

# Not required on UAT and PROD
resource "azuread_group_member" "WindowsServicesVMAdmins" {
  count            = var.target_deployment_environment == "nonprod" ? 1 : 0
  
  group_object_id  = data.azuread_group.GlobalRDSGroup.id
  member_object_id = azuread_group.WindowsServicesVMAdmins[0].id
}

