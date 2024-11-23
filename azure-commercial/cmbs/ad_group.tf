# SQL Admins
resource "azuread_group" "SQLAdmins" {
  name = "CO-CMBSSQLAdmins${var.environment_acronym}"
}