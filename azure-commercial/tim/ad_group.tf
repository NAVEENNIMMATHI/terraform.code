resource "azuread_group" "adgroup" {
  name = "CO-TIMSqlAdmins-${upper(var.environment_acronym)}"
}

