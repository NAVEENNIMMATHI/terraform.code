# VM Admins
resource "azuread_group" "vm_admins" {
  name = "${upper(var.application_acronym)}_VMAdmins${upper(var.environment_acronym)}"
}

