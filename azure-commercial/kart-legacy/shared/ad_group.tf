resource "azuread_group" "sqlserveradgroupdev" {
  name = var.sqlserver_admingroup_name
  description = var.sqlserver_admingroup_name_description
  #count = "${var.target_deployment_environment == "prod" ? 0 : 1}"
  #description = "KART SQL Admins"
}

resource "azuread_group" "adgroup" {
  name = var.development_group_name
  description = var.development_group_name_description
  #count = "${var.target_deployment_environment == "prod" ? 0 : 1}"
  #description = "This Group will be used for KART Application Developers"
}

resource "azuread_group" "AnalysisServicesAdmins" {
  name = var.analysisadminsgroupname
  description = var.analysisadminsgroupname
  count = var.target_deployment_environment == "prod" ? 0 : 1
}

resource "azuread_group" "PBIWorkspaceMembers" {
  name = "CO-KRTPBIWorkspaceMembersDEV${var.uniqueresourcesuffix}"
  description = var.PBIWorkspaceMembers_description
  count = var.target_deployment_environment == "dev" ? 1 : 0
}

resource "azuread_group" "PBIWorkspaceAdmins" {
  name = "CO-KRTPBIWorkspaceAdminsDEV${var.uniqueresourcesuffix}"
  description = var.PBIWorkspaceAdmins_description
  count = var.target_deployment_environment == "dev" ? 1 : 0
}
