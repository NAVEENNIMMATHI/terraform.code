resource "azuread_group" "sql_server_admins" {
  name = "CO-${upper(var.application_acronym)}-SQLADMINS-${upper(var.environment_acronym)}"
}