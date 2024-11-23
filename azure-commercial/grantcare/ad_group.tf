resource "azuread_group" "GCAdmins" {
  name = "CO-GCd365Admins${var.environment_acronym}"
 # description = var.GCDevelopers_description
}

resource "azuread_group" "PBIReportconsumer" {
  name = "CO-GC-PBI-Report-consumer${var.environment_acronym}"

}

resource "azuread_group" "PBIReportGenerator" {
  name = "CO-GC-PBI-Report-generator${var.environment_acronym}"

}

/*

data "azuread_user" "mboucherak" {
  
count = var.restrict_gateway_endpoint == "true" ? 0 : 1
  
  user_principal_name = "mboucherak@kpmgusadvspectrum.onmicrosoft.com"
}
data "azuread_user" "cvantiem" {
  count = var.restrict_gateway_endpoint == "true" ? 0 : 1
  user_principal_name = "cvantiem@kpmgusadvspectrum.onmicrosoft.com"
}
data "azuread_user" "srummo" {
  count = var.restrict_gateway_endpoint == "true" ? 0 : 1
  user_principal_name = "srummo@kpmgusadvspectrum.onmicrosoft.com"
}
data "azuread_user" "wskaar" {
  count = var.restrict_gateway_endpoint == "true" ? 0 : 1
  user_principal_name = "wskaar@kpmgusadvspectrum.onmicrosoft.com"
}
data "azuread_user" "afirmano" {
  count = var.restrict_gateway_endpoint == "true" ? 0 : 1
  user_principal_name = "afirmano@kpmgusadvspectrum.onmicrosoft.com"
}
data "azuread_user" "kirstenmckenna" {
  count = var.restrict_gateway_endpoint == "true" ? 0 : 1
  user_principal_name = "kirstenmckenna@kpmgusadvspectrum.onmicrosoft.com"
}
data "azuread_user" "sramachandran" {
  count = var.restrict_gateway_endpoint == "true" ? 0 : 1
  user_principal_name = "sramachandran@kpmgusadvspectrum.onmicrosoft.com "
}
resource "azuread_group_member" "GCAdmins-mboucherak" {
  
  group_object_id   = azuread_group.GCAdmins.id
  member_object_id  = data.azuread_user.mboucherak[0].id
}
resource "azuread_group_member" "GCAdmins-cvantiem" {
  group_object_id   = azuread_group.GCAdmins.id
  member_object_id  = data.azuread_user.cvantiem[0].id
}

resource "azuread_group_member" "GCAdmins-srummo" {
  group_object_id   = azuread_group.GCAdmins.id
  member_object_id  = data.azuread_user.srummo[0].id
}

resource "azuread_group_member" "GCAdmins-wskaar" {
  group_object_id   = azuread_group.GCAdmins.id
  member_object_id  = data.azuread_user.wskaar[0].id
}


resource "azuread_group_member" "GCAdmins-afirmano" {
  group_object_id   = azuread_group.GCAdmins.id
  member_object_id  = data.azuread_user.afirmano[0].id
}

resource "azuread_group_member" "GCAdmins-kirstenmckenna" {
  group_object_id   = azuread_group.GCAdmins.id
  member_object_id  = data.azuread_user.kirstenmckenna[0].id
}

resource "azuread_group_member" "GCAdmins-sramachandran" {
  group_object_id   = azuread_group.GCAdmins.id
  member_object_id  = data.azuread_user.sramachandran[0].id
}
*/