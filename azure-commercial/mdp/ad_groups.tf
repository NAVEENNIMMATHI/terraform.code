resource "azuread_group" "mdp_rg_readers" {
  name = "CO-${upper(var.application_acronym)}-RG-Readers-${upper(var.environment_acronym)}"
}


/* mdp-synapse-admins */

resource "azuread_group" "mdp_synapse_admins" {
  name  = "CO-${upper(var.application_acronym)}-synapse-admins-${upper(var.environment_acronym)}"
}

resource "azuread_group" "mdp_sql_admins" {
  name  = "CO-${upper(var.application_acronym)}-sql-admins-${upper(var.environment_acronym)}"
}

resource "azurerm_role_assignment" "mdp_rg_readers_role" {
  scope                = "${data.azurerm_subscription.current.id}/resourceGroups/${module.mdp_rg_main.resource_group_name}"
  role_definition_name = "Reader"
  principal_id         = azuread_group.mdp_rg_readers.object_id
}

resource "azuread_group" "mdp_rg_contributors" {
  name = "CO-${upper(var.application_acronym)}-RG-Contributors-${upper(var.environment_acronym)}"
}

resource "azurerm_role_assignment" "mdp_rg_contributors_role" {
  scope                = "${data.azurerm_subscription.current.id}/resourceGroups/${module.mdp_rg_main.resource_group_name}"
  role_definition_name = "Contributor"
  principal_id         = azuread_group.mdp_rg_contributors.object_id
}

#Group for IICS Dev

resource "azuread_group" "mdp_iics_admins" {
  name  = "CO-${upper(var.application_acronym)}-iics-admins-${upper(var.environment_acronym)}"
}

resource "azuread_group" "mdp_iics_developer" {
  name  = "CO-${upper(var.application_acronym)}-iics-developers-${upper(var.environment_acronym)}"
}

resource "azuread_group" "mdp_iics_tester" {
  name  = "CO-${upper(var.application_acronym)}-iics-tester-${upper(var.environment_acronym)}"
}

resource "azuread_group" "mdp_data_access_contributor" {
    name  = "CO-${upper(var.application_acronym)}-Data-Access-Contributors-${upper(var.environment_acronym)}"
}

resource "azurerm_role_assignment" "mdp_data_access_contributors_role" {
  scope                = "${data.azurerm_subscription.current.id}/resourceGroups/${module.mdp_rg_main.resource_group_name}"
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azuread_group.mdp_rg_contributors.object_id
}

resource "azuread_group" "mdp_synapse_contributor" {
    name  = "CO-${upper(var.application_acronym)}-Data-Access-Contributors-${upper(var.environment_acronym)}"
}

resource "azurerm_role_assignment" "mdp_synapse_contributor_role" {
  scope                = "${data.azurerm_subscription.current.id}/resourceGroups/${module.mdp_rg_main.resource_group_name}/providers/Microsoft.Synapse/workspaces/${azurerm_synapse_workspace.mdpsynapse.name}"
  role_definition_name = "Contributor"
  principal_id         = azuread_group.mdp_rg_contributors.object_id
}

resource "azuread_group" "mdp_aks_cluster_admins" {
  name = "CO-${upper(var.application_acronym)}-AKS-Cluster-Admins-${upper(var.environment_acronym)}"
}

#Ad group for SQL server
resource "azuread_group" "mdp_sql_appintg_admins" {
  name  = "${lower(var.application_acronym)}-sql-admins-${lower(var.environment_acronym)}"
}

#resource "azurerm_role_assignment" "mdp_aks_cluster_admins_role" {
#  scope                = azurerm_kubernetes_cluster.aks_mdp.id
#  role_definition_name = "Azure Kubernetes Service Cluster Admin Role"
#  principal_id         = azuread_group.mdp_aks_cluster_admins.object_id
#}
#resource "azurerm_role_assignment" "mdp_aks_cluster_admins_cluster_role" {
#  scope                = "${data.azurerm_subscription.current.id}/resourceGroups/RGP-USE-AKS-NODE-DV"
#  role_definition_name = "Azure Kubernetes Service Cluster Admin Role"
#  principal_id         = azuread_group.mdp_aks_cluster_admins.object_id
#}
