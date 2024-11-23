resource "azuread_group" "sql_server_admins" {
    name        = "CO-${upper(var.application_acronym)}SQLAdmins${title(var.environment_acronym)}"
    members     = [azurerm_app_service.app_service.identity.0.principal_id]
    depends_on  = [azurerm_app_service.app_service]

    lifecycle {
        ignore_changes = [
            members
        ]
    }
}

resource "azuread_group" "workstation_admins" {
    name        = "CO-${upper(var.application_acronym)}WorkstationAdmins${title(var.environment_acronym)}"

    lifecycle {
        ignore_changes = [
            members
        ]
    }
}