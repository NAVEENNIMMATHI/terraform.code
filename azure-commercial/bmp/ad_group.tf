resource "azuread_group" "App_admins" {
  name        = var.environment == "production" ? "CO-BMPAppAdmins" : "CO-BMPAppAdmins${upper(var.environment_acronym)}"
  description = "Members of this group shall manage the administrative activity related to SQL managed instance - BM+"
}

resource "azuread_group" "Informatica_admins" {
  name        = var.environment == "production" ? "CO-BMPInformaticaAdmins" : "CO-BMPInformaticaAdmins${upper(var.environment_acronym)}"
}

resource "azuread_group" "KPIM_admins" {
  name        = var.environment == "production" ? "CO-BMPKPIMAdmins" : "CO-BMPKPIMAdmins${upper(var.environment_acronym)}"
}

resource "azuread_group" "Limestone_TMT" {
  name        = var.environment == "production" ? "CO-BMPLimestoneTMT" : "CO-BMPLimestoneTMT${upper(var.environment_acronym)}"
}

resource "azuread_group" "Rest_admins" {
  name        = var.environment == "production" ? "CO-BMPRestAdmins" : "CO-BMPRestAdmins${upper(var.environment_acronym)}"
}

resource "azuread_group" "RDS_users" {
  name        = var.environment == "production" ? "CO-BMPRDSUsers" : "CO-BMPRDSUsers${upper(var.environment_acronym)}"
}

resource "azuread_group" "Search_admins" {
  name        = var.environment == "production" ? "CO-BMPSearchadmins" : "CO-BMPSearchadmins${upper(var.environment_acronym)}"
}

resource "azuread_group" "Service_accounts" {
  name        = var.environment == "production" ? "CO-BMPServiceAccounts" : "CO-BMPServiceAccounts${upper(var.environment_acronym)}"
}

resource "azuread_group" "Sql_admins" {
  name        = var.environment == "production" ? "CO-BMPSQLAdmins" : "CO-BMPSQLAdmins${upper(var.environment_acronym)}"
  description = "Members of this group shall manage the administrative activity related to SQL managed instance - BM+"
}

