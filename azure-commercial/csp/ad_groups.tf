resource "azuread_group" "csp_sys_admin" {
  display_name = "aad-success-system-admin-${var.environment_acronym}"
  security_enabled = true
}

resource "azuread_group" "csp_leadership" {
  display_name = "aad-success-leader-${var.environment_acronym}"
  security_enabled = true
}

resource "azuread_group" "csp_partner" {
  display_name = "aad-success-partner-${var.environment_acronym}"
  security_enabled = true
}

resource "azuread_group" "csp_manager" {
  display_name = "aad-success-manager-${var.environment_acronym}"
  security_enabled = true
}

resource "azuread_group" "csp_engineer" {
  display_name = "aad-success-engineer-${var.environment_acronym}"
  security_enabled = true
}

resource "azuread_group" "csp_security" {
  display_name = "aad-success-security-group-${var.environment_acronym}"
  security_enabled = true
  members = [
    azuread_group.csp_sys_admin.object_id,
    azuread_group.csp_leadership.object_id,
    azuread_group.csp_manager.object_id,
    azuread_group.csp_engineer.object_id,
    azuread_group.csp_partner.object_id
  ]  
}