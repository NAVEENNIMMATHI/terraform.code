resource "azuread_group" "krtdevgroup" {
  name = "CO-KRTDevelopers${var.uniqueresourcesuffix}"
  description = var.KRTDevelopers_description
}

resource "azuread_group" "AnalysisServicesAdmins" {
  name = "CO-KRTAnalysisServicesAdmins${var.uniqueresourcesuffix}"
  #description = var.AnalysisServicesAdmins_description
  count = var.target_deployment_environment == "prod" ? 1 : 0
}

resource "azuread_group" "BuildVMAdmins" {
  name = "CO-KRTBuildVMAdmins${var.uniqueresourcesuffix}"
  description = var.BuildVMAdmins_description
}

resource "azuread_group" "RDPUsers" {
  name = "CO-KRTRDPUsers${var.uniqueresourcesuffix}"
  description = var.RDPUsers_description
}

resource "azuread_group" "ATOTeam" {
  name = "CO-KRTATOTeam${var.uniqueresourcesuffix}"
  description = var.ATOTeam_description
}

resource "azuread_group" "BusinessUsers" {
  name = "CO-KRTBusinessUsers${var.uniqueresourcesuffix}"
  description = var.BusinessUsers_description
}

resource "azuread_group" "DevopsProjectManagers" {
  name = "CO-KRTDevOpsProjectManagers${var.uniqueresourcesuffix}"
  description = var.DevopsProjectManagers_description
}

resource "azuread_group" "PBICapacityAdmins" {
  name = "CO-KRTPBICapacityAdmins${var.uniqueresourcesuffix}"
  description = var.PBICapacityAdmins_description
}

resource "azuread_group" "PBIWorkspaceMembers" {
  name = "CO-KRTPBIWorkspaceMembers${var.uniqueresourcesuffix}"
  #description = var.PBIWorkspaceMembers_description
  count = var.target_deployment_environment == "prod" ? 1 : 0
}

resource "azuread_group" "PBIWorkspaceAdmins" {
  name = "CO-KRTPBIWorkspaceAdmins${var.uniqueresourcesuffix}"
  #description = var.PBIWorkspaceAdmins_description
  count = var.target_deployment_environment == "prod" ? 1 : 0
}

resource "azuread_group" "ProjectTeam" {
  name = "CO-KRTProjectTeam${var.uniqueresourcesuffix}"
  description = var.ProjectTeam_description
}

resource "azuread_group" "SQLReadOnlyDev" {
  name = "CO-KRTSQLReadOnlyDEV${var.uniqueresourcesuffix}"
  description = var.SQLReadOnlyDev_description
}

resource "azuread_group" "AlteryxUsers" {
  name = "CO-KRTAlteryxUsers${var.uniqueresourcesuffix}"
}

