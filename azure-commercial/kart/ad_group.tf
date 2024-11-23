resource "azuread_group" "BuildVMAdmins" {
  name = "CO-KRTBuildVMAdmins${title(var.application_url_environment_acronym)}"
  description = var.BuildVMAdmins_description
}

resource "azuread_group" "RDPUsers" {
  name = "CO-KRTRDPUsers${title(var.application_url_environment_acronym)}"
  description = var.RDPUsers_description
}

resource "azuread_group" "ATOTeam" {
  name = "CO-KRTATOTeam${title(var.application_url_environment_acronym)}"
  description = var.ATOTeam_description
}

resource "azuread_group" "BusinessUSers" {
  name = "CO-KRTBusinessUSers${title(var.application_url_environment_acronym)}"
  description = var.BusinessUsers_description
}

resource "azuread_group" "DevopsProjectManagers" {
  name = "CO-KRTDevopsProjectManagers${title(var.application_url_environment_acronym)}"
  description = var.DevopsProjectManagers_description
}

resource "azuread_group" "PBICapacityAdmins" {
  name = "CO-KRTPBICapacityAdmins${title(var.application_url_environment_acronym)}"
  description = var.PBICapacityAdmins_description
}

resource "azuread_group" "PBIWorkspaceMembers" {
  name = "CO-KRTPBIWorkspaceMembers${title(var.application_url_environment_acronym)}"
  description = var.PBIWorkspaceMembers_description
}

resource "azuread_group" "PBIWorkspaceAdmins" {
  name = "CO-KRTPBIWorkspaceAdmins${title(var.application_url_environment_acronym)}"
  description = var.PBIWorkspaceAdmins_description
}

resource "azuread_group" "ProjectTeam" {
  name = "CO-KRTProjectTeam${title(var.application_url_environment_acronym)}"
  description = var.ProjectTeam_description
}

resource "azuread_group" "SQLReadOnlyDev" {
  name = "CO-KRTSQLReadOnlyDev${title(var.application_url_environment_acronym)}"
  description = var.SQLReadOnlyDev_description
}

resource "azuread_group" "AlteryxUsers" {
  name = "CO-KRTAlteryxUsers${title(var.application_url_environment_acronym)}"
  description = "KART Alteryx Users"
  lifecycle {
  ignore_changes = [
    members
  ]
  }
}

resource "azuread_group" "sqlserveradgroupdev" {
  name = "CO-KRTSQLAdmins${title(var.application_url_environment_acronym)}"
  description = var.sqlserver_admingroup_name_description
}

resource "azuread_group" "adgroup" {
  name = "CO-KRTDevelopers${title(var.application_url_environment_acronym)}"
  description = var.development_group_name_description  
}