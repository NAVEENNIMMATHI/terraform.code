
data "azuread_client_config" "current" {}

# Create Azure AD group Admin

# AD for Storage
resource "azuread_group" "storage_eccm_con"{
name                    = "${var.application_acronym}-storageadmins-${var.environment_acronym}"
description             = "Admin Access to Storage Account"
prevent_duplicate_names = true
owners                  = []
}

# AD Group for kvl
resource "azuread_group" "kvl_users"{
name                    = "eccm-kvl-users-${var.environment_acronym}"
description             = "Azure AD Group for kvl Users"
prevent_duplicate_names = true
owners                  = []
}

# AD Group for ACR
resource "azuread_group" "acr_users"{
name                    = "eccm-acr-users-${var.environment_acronym}"
description             = "Azure AD Group for ACR Pull"
prevent_duplicate_names = true
owners                  = [data.azuread_client_config.current.object_id]
}

# AD Group for AKS
resource "azuread_group" "aks_admins"{
name                    = "${var.application_acronym}-aksclusteradmins-${var.environment_acronym}"
description             = "Admin Access to AKS Cluster"
prevent_duplicate_names = true
owners                  = []
}

# AD Group for Logic App
resource "azuread_group" "lap_contributors"{
name                    = "${var.application_acronym}-lapadmins-${var.environment_acronym}"
description             = "Admin Access to Logic Apps designer"
prevent_duplicate_names = true
owners                  = []
}

# AD Group for SQL
resource "azuread_group" "sql_contributors"{
name                    = "${var.application_acronym}-sqladmins-${var.environment_acronym}"
description             = "Admin Access to SQL Server"
prevent_duplicate_names = true
owners                  = []
}

# AD Group for Cognitive Services
resource "azuread_group" "css_contributors"{
name                    = "${var.application_acronym}-cognitiveadmins-${var.environment_acronym}"
description             = "Admin Access to Cognitive Services"
prevent_duplicate_names = true
owners                  = []
}