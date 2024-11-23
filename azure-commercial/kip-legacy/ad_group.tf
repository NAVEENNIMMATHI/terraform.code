# RDP Users
resource "azuread_group" "RDPUsers" {
  name = "CO-${upper(var.application_acronym)}RDPUsers${var.uniqueresourcesuffix}"
}

# SQL Admins
resource "azuread_group" "SQLAdmins" {
  name = "CO-${upper(var.application_acronym)}SQLAdmins${var.uniqueresourcesuffix}"
}

# MI Admins
resource "azuread_group" "MIAdmins" {
  name = "CO-${upper(var.application_acronym)}MIAdmins${var.uniqueresourcesuffix}"
}

resource "azuread_group" "KIPADFContributers" {
  name = var.kip_adf_contributers
}


# WindowsServicesVM Admins and not required on UAT and PROD
resource "azuread_group" "WindowsServicesVMAdmins" {
  count = var.target_deployment_environment == "nonprod" ? 1 : 0

  name  = "CO-${upper(var.application_acronym)}WindowsServicesVMAdmins${var.uniqueresourcesuffix}"
}

#We may need below AAD Groups in future
# Devops purposes and not required on UAT and PROD
resource "azuread_group" "DevOpsBuildAdmins" {
  count = var.target_deployment_environment == "nonprod" ? 1 : 0

  name  = "DA${upper(var.application_acronym)}-DevOpsBuildAdmins${var.uniqueresourcesuffix}"
}

resource "azuread_group" "DevOpsContributors" {
  count = var.target_deployment_environment == "nonprod" ? 1 : 0

  name  = "DA${upper(var.application_acronym)}-DevOpsContributors${var.uniqueresourcesuffix}"
}

resource "azuread_group" "DevOpsProjectAdmins" {
  count = var.target_deployment_environment == "nonprod" ? 1 : 0

  name  = "DA${upper(var.application_acronym)}-DevOpsProjectAdmins${var.uniqueresourcesuffix}"
}

resource "azuread_group" "DevOpsReaders" {
  count = var.target_deployment_environment == "nonprod" ? 1 : 0
  
  name  = "DA${upper(var.application_acronym)}-DevOpsReaders${var.uniqueresourcesuffix}"
}

resource "azuread_group" "PBICapacityAssignmentPermissions" {
  name = "CO-${upper(var.application_acronym)}PBICapacityAssignmentPermissions${var.uniqueresourcesuffix}"
}

