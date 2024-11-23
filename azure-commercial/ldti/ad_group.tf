resource "azuread_group" "ldtidevelopers" {
  name = "CO-${upper(var.application_acronym)}-Developers${upper(var.environment_acronym)}"
}

