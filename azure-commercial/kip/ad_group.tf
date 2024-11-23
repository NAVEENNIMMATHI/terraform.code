# RDP Users
resource "azuread_group" "RDPUsers" {
  name = var.environment == "production" ? "CO-${upper(var.application_acronym)}RDPUsersProduction" : "CO-${upper(var.application_acronym)}RDPUsers${upper(var.environment_acronym)}"
}

# SQL Admins
resource "azuread_group" "SQLAdmins" {
  name = var.environment == "production" ? "CO-${upper(var.application_acronym)}SQLAdminsProduction" : "CO-${upper(var.application_acronym)}SQLAdmins${upper(var.environment_acronym)}"
}

# MI Admins
resource "azuread_group" "MIAdmins" {
  name = var.environment == "production" ? "CO-${upper(var.application_acronym)}MIAdminsProduction" : "CO-${upper(var.application_acronym)}MIAdmins${upper(var.environment_acronym)}"
}

resource "azuread_group" "KIPADFContributers" {
  name = var.kip_adf_contributers
}

#AD group for contributor access on Storage account for production
resource "azuread_group" "KIPSAAppdataAdmins" {
  name = var.environment == "production" ? "CO-${upper(var.application_acronym)}SAAppdataContributors" : "CO-${upper(var.application_acronym)}SAAppdataContributors${upper(var.environment_acronym)}"
}

# WindowsServicesVM Admins and not required on UAT and PROD
resource "azuread_group" "WindowsServicesVMAdmins" {
  count = var.environment == "development"  ? 1 : 0

  name  = "CO-${upper(var.application_acronym)}WindowsServicesVMAdmins"
}

#We may need below AAD Groups in future
# Devops purposes and not required on UAT and PROD
resource "azuread_group" "DevOpsBuildAdmins" {
  count = var.environment == "development"  ? 1 : 0

  name  = "DA${upper(var.application_acronym)}-DevOpsBuildAdmins"
}

resource "azuread_group" "DevOpsContributors" {
  count = var.environment == "development"  ? 1 : 0

  name  = "DA${upper(var.application_acronym)}-DevOpsContributors"
}

resource "azuread_group" "DevOpsProjectAdmins" {
  count = var.environment == "development"  ? 1 : 0

  name  = "DA${upper(var.application_acronym)}-DevOpsProjectAdmins"
}

resource "azuread_group" "DevOpsReaders" {
  count = var.environment == "development"  ? 1 : 0
  
  name  = "DA${upper(var.application_acronym)}-DevOpsReaders"
}

resource "azuread_group" "PBICapacityAssignmentPermissions" {
  name = var.environment == "production" ?  "CO-${upper(var.application_acronym)}PBICapacityAssignmentPermissionsProduction" : "CO-${upper(var.application_acronym)}PBICapacityAssignmentPermissions${upper(var.environment_acronym)}"
}

resource "azuread_group" "DatabricksContributor" {
  name =  var.environment == "staging" ?  "CO-DA-KIPDatabricks-Contributor-st" : "CO-DA-KIPDatabricks-Contributor-${var.environment_acronym}"
  description = "This group is created for KIP users to be able to access KIP Data lake storage from SPI Databricks"
}

resource "azuread_group" "DatabricksReader" {
  name = var.environment == "staging" ?  "CO-DA-KIPDatabricks-Reader-st" : var.environment == "production" ? "CO-DA-KIPDatabricks-Reader-Pd": "CO-DA-KIPDatabricks-Reader-${var.environment_acronym}"
  description = "This group is created for KIP users to be able to access KIP Data lake storage from SPI Databricks"
}

# Databricks Users
resource "azuread_group" "DatabricksUsers" {
  name = var.environment == "production" ? "CO-${upper(var.application_acronym)}AzDatabricksUsers" : "CO-${upper(var.application_acronym)}AzDatabricksUsers${upper(var.environment_acronym)}"
}

# Synapse Users
resource "azuread_group" "SynapseCredentialUsers" {
  name = var.environment == "production" ? "CO-${upper(var.application_acronym)}SynapseCredentialUsers" : "CO-${upper(var.application_acronym)}SynapseCredentialUsers${upper(var.environment_acronym)}"
  lifecycle {
        ignore_changes = [
            members
        ]
    }
}


resource "azuread_group" "SynapseAdministrators" {
  name = var.environment == "production" ? "CO-${upper(var.application_acronym)}SynapseAdministrators" : "CO-${upper(var.application_acronym)}SynapseAdministrators${upper(var.environment_acronym)}"
  lifecycle {
        ignore_changes = [
            members
        ]
    }
}


resource "azuread_group" "SynapseContributors" {
  name = var.environment == "production" ? "CO-${upper(var.application_acronym)}SynapseContributors" : "CO-${upper(var.application_acronym)}SynapseContributors${upper(var.environment_acronym)}"
  lifecycle {
        ignore_changes = [
            members
        ]
    }
}


resource "azuread_group" "SynapseSQLAdministrator" {
  name = var.environment == "production" ? "CO-${upper(var.application_acronym)}SynapseSQLAdministrator" : "CO-${upper(var.application_acronym)}SynapseSQLAdministrator${upper(var.environment_acronym)}"
  lifecycle {
        ignore_changes = [
            members
        ]
    }
}

resource "azuread_group" "SynapseComputeOperators" {
  name = var.environment == "production" ? "CO-${upper(var.application_acronym)}SynapseComputeOperators" : "CO-${upper(var.application_acronym)}SynapseComputeOperators${upper(var.environment_acronym)}"
  lifecycle {
        ignore_changes = [
            members
        ]
    }
}


resource "azuread_group" "SynapseDatabaseAdministrators" {
  name = var.environment == "production" ? "CO-${upper(var.application_acronym)}SynapseDatabaseAdministrators" : "CO-${upper(var.application_acronym)}SynapseDatabaseAdministrators${upper(var.environment_acronym)}"
  lifecycle {
        ignore_changes = [
            members
        ]
    }
}

# PURVIEW ADMIN
resource "azuread_group" "KipPurviewCollectionAdmin" {
  name = var.environment == "production" ? "CO-${upper(var.application_acronym)}-Purview-CollectionAdmin" : "CO-${upper(var.application_acronym)}-Purview-CollectionAdmin-${upper(var.environment_acronym)}"
}

# PURVIEW Data Source
resource "azuread_group" "KipPurviewDataSourceAdmin" {
  name = var.environment == "production" ? "CO-${upper(var.application_acronym)}-Purview-DataSourceAdmin" : "CO-${upper(var.application_acronym)}-Purview-DataSourceAdmin-${upper(var.environment_acronym)}"
}

# PURVIEW Curators
resource "azuread_group" "KipPurviewCuratorTechnical" {
  name = var.environment == "production" ? "CO-${upper(var.application_acronym)}-Purview-Curator-Technical" : "CO-${upper(var.application_acronym)}-Purview-Curator-Technical-${upper(var.environment_acronym)}"
}
resource "azuread_group" "KipPurviewCuratorEndUser" {
  name = var.environment == "production" ? "CO-${upper(var.application_acronym)}-Purview-Curator-EndUser" : "CO-${upper(var.application_acronym)}-Purview-Curator-EndUser-${upper(var.environment_acronym)}"
}

# PURVIEW Readers
resource "azuread_group" "KipPurviewReaderTechnical" {
  name = var.environment == "production" ? "CO-${upper(var.application_acronym)}-Purview-Reader-Technical" : "CO-${upper(var.application_acronym)}-Purview-Reader-Technical-${upper(var.environment_acronym)}"
}
resource "azuread_group" "KipPurviewReaderEndUser" {
  name = var.environment == "production" ? "CO-${upper(var.application_acronym)}-Purview-Reader-EndUser" : "CO-${upper(var.application_acronym)}-Purview-Reader-EndUser-${upper(var.environment_acronym)}"
}