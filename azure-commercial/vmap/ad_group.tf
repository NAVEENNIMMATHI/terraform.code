resource "azuread_group" "sql_admins" {
  name = "CO-${upper(var.application_acronym)}-SQLAdmins${upper(var.environment_acronym)}"
}
resource "azuread_group" "vmap_users" {
  name = "CO-${upper(var.application_acronym)}-Users-${upper(var.environment_acronym)}"
}