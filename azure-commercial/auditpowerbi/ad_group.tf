resource "azuread_group" "audit_powerbi_vm_wkstn_users" {
  name = "CO-Audit-PowerBI-WKSTN-Users-${upper(var.environment_acronym)}"
}