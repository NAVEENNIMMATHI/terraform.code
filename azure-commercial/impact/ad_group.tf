
resource "azuread_group" "sql_admins" {
  name = "CO-${upper(var.application_acronym)}-SQLAdmins${upper(var.environment_acronym)}"
  lifecycle {
    ignore_changes = [
      members
    ]
  }
}

# Synapse Users
resource "azuread_group" "SynapseCredentialUsers" {
  name = "CO-${upper(var.application_acronym)}SynapseCredentialUsers${upper(var.environment_acronym)}"
  lifecycle {
    ignore_changes = [
      members
    ]
  }
}


resource "azuread_group" "SynapseAdministrators" {
  name = "CO-${upper(var.application_acronym)}SynapseAdministrators${upper(var.environment_acronym)}"
  lifecycle {
    ignore_changes = [
      members
    ]
  }
}


resource "azuread_group" "SynapseContributors" {
  name = "CO-${upper(var.application_acronym)}SynapseContributors${upper(var.environment_acronym)}"
  lifecycle {
    ignore_changes = [
      members
    ]
  }
}


resource "azuread_group" "SynapseSQLAdministrator" {
  name = "CO-${upper(var.application_acronym)}SynapseSQLAdministrator${upper(var.environment_acronym)}"
  lifecycle {
    ignore_changes = [
      members
    ]
  }
}

resource "azuread_group" "SynapseComputeOperators" {
  name = "CO-${upper(var.application_acronym)}SynapseComputeOperators${upper(var.environment_acronym)}"
  lifecycle {
    ignore_changes = [
      members
    ]
  }
}


resource "azuread_group" "SynapseDatabaseAdministrators" {
  name = "CO-${upper(var.application_acronym)}SynapseDatabaseAdministrators${upper(var.environment_acronym)}"
  lifecycle {
    ignore_changes = [
      members
    ]
  }
}

#### RBAC

resource "azuread_group" "ImpactExcternalClientUsers" {
  name = "CO-${upper(var.application_acronym)}-App-Client-Users-${upper(var.environment_acronym)}"
  lifecycle {
    ignore_changes = [
      members
    ]
  }
}

resource "azuread_group" "ImpactDataLakeStorageAdmin" {
  name = "CO-${upper(var.application_acronym)}-ADLS-Admins-${upper(var.environment_acronym)}"
  lifecycle {
    ignore_changes = [
      members
    ]
  }
}

resource "azuread_group" "ImpactSynapseAdmins" {
  name = "CO-${upper(var.application_acronym)}-Synapse-Admins-${upper(var.environment_acronym)}"
  lifecycle {
    ignore_changes = [
      members
    ]
  }
}

resource "azuread_group" "ImpactSQlAdmins" {
  name = "CO-${upper(var.application_acronym)}-SQL-Admins-${upper(var.environment_acronym)}"
  lifecycle {
    ignore_changes = [
      members
    ]
  }
}

resource "azuread_group" "ImpactAPIMAdmins" {
  name = "CO-${upper(var.application_acronym)}-APIM-Admins-${upper(var.environment_acronym)}"
  lifecycle {
    ignore_changes = [
      members
    ]
  }
}

resource "azuread_group" "ImpactSubscriptionReaders" {
  name = "CO-${upper(var.application_acronym)}-RG-Readers-${upper(var.environment_acronym)}"
  lifecycle {
    ignore_changes = [
      members
    ]
  }
}

resource "azuread_group" "ImpactResourceGroupContributors" {
  name = "CO-${upper(var.application_acronym)}-RG-Contributors-${upper(var.environment_acronym)}"
  lifecycle {
    ignore_changes = [
      members
    ]
  }
}

resource "azuread_group" "ImpactResourceGroupOwners" {
  name = "CO-${upper(var.application_acronym)}-RG-Owners-${upper(var.environment_acronym)}"
  lifecycle {
    ignore_changes = [
      members
    ]
  }
}

## AAD groups for Multi Tenant

resource "azuread_group" "ImpactContainerGroupContributors" {
  for_each  = toset(var.impact_multi_tenant_clients.clients)
  name      = "CO-${upper(var.application_acronym)}-${each.key}-DLS-Contributors-${upper(var.environment_acronym)}"
  lifecycle {
    ignore_changes = [
      members
    ]
  }
}

resource "azuread_group" "ImpactSQLDBGroupContributors" {
  for_each  = toset(var.impact_multi_tenant_clients.clients)
  name = "CO-${upper(var.application_acronym)}-${each.key}-DB-Contributors-${upper(var.environment_acronym)}"
  lifecycle {
    ignore_changes = [
      members
    ]
  }
}
