resource "azuread_group" "sql_server_admins" {
  name = "CO-${upper(var.application_acronym)}-SQL-Admins${upper(var.environment_acronym)}"
}

resource "azuread_group" "webapplication_users" {
  name = "CO-${upper(var.application_acronym)}-WebApp-Users${upper(var.environment_acronym)}"
}