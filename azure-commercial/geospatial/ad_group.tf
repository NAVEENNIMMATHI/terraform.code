
#SQL Group
/*
resource "azuread_group" "sql_admins" {
  display_name         = "CO-${upper(var.application_acronym)}-SQLAdmins${upper(var.environment_acronym)}"
  mail_enabled         = false
  security_enabled     = true

  lifecycle {
    ignore_changes = [
      members
    ]
  }
}
resource "azurerm_role_assignment" "sqlTostorage" {
  scope                = data.azurerm_storage_account.sql_policy.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_mssql_server.geospatial_mssql_server.identity[0].principal_id

}
*/

#SAML group (Internal User)
resource "azuread_group" "app_group" {
  display_name         = var.environment_acronym != "dv" ? "CO-${upper(var.application_acronym)}-AppGrp${var.separator}${upper(var.environment_acronym)}" : "CO-ArcgisAppgroup"
  mail_enabled         = false
  security_enabled     = true

  lifecycle {
    ignore_changes = [
      members
    ]
  }
}

#SAML group (External User)
resource "azuread_group" "app_group_external" {
  display_name         = "CO-${upper(var.application_acronym)}-AppGrp-ext${var.separator}${upper(var.environment_acronym)}"
  mail_enabled         = false
  security_enabled     = true

  lifecycle {
    ignore_changes = [
      members
    ]
  }
}

#AKS Group
resource "azuread_group" "aks_cluster_admin_group" {      
      display_name         = "aad-${var.application_acronym}-aks${var.separator}admin-${lower(var.environment_acronym)}"
      mail_enabled         = false
      security_enabled     = true
    }

#SAML Group
resource "azuread_group" "saml_authentication_admin_group" {      
      display_name         = "aad-${var.application_acronym}-saml${var.separator}admin-${lower(var.environment_acronym)}"
      mail_enabled         = false
      security_enabled     = true
    }

#Reader Group for Arcgis RG
resource "azuread_group" "arcgis_rg_readers" {      
      display_name         = "CO-${var.application_acronym}${var.separator}RG-Readers-${lower(var.environment_acronym)}"
      mail_enabled         = false
      security_enabled     = true
    }

resource "azurerm_role_assignment" "arcgis_rg_readers_role" {
  scope                = "${data.azurerm_subscription.current.id}/resourceGroups/${module.geospatial_rg.resource_group_name}"
  role_definition_name = "Reader"
  principal_id         = azuread_group.arcgis_rg_readers.object_id
}

resource "azurerm_role_assignment" "arcgis_storage_contributor_access" {
  scope                = module.vmdiagnosticslogs.id
  role_definition_name = "Storage Account Contributor"
  principal_id         = azuread_group.arcgis_rg_readers.object_id
}
