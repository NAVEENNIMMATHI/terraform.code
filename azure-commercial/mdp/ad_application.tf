#resource "azuread_application" "mdp_app_databricks" {
#  name = "spn-${var.application_acronym}-azdatabricks-${var.environment_acronym}"
#}
#
#resource "azuread_service_principal" "mdp_spn_databricks" {
#  application_id = azuread_application.mdp_app_databricks.id
#}
resource "azuread_application" "mdp_app_databricks" {
  name                         = "spn-${var.application_acronym}-azdatabricks-${var.environment_acronym}"
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = true
  type                         = "webapp/api"
  required_resource_access {
    resource_app_id            = "00000003-0000-0000-c000-000000000000"
    resource_access {
      id                       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type                     = "Scope"
    }
  }
}
resource "azuread_service_principal" "mdp_spn_databricks" {
  application_id               = azuread_application.mdp_app_databricks.application_id
  app_role_assignment_required = false
}

resource "azuread_application_password" "mdp_databricks" {
  application_object_id = azuread_application.mdp_app_databricks.object_id
  value = random_password.app_mdp_databricks.result
  end_date_relative = "8760h"
}

resource "random_password" "app_mdp_databricks" {
  length = 16
  special = true
}

#App registration and service principal for APIM

resource "azuread_application" "mdp_app_apim" {
  name                         = "spn-${var.application_acronym}-azapim-${var.environment_acronym}"
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = true
  type                         = "webapp/api"
  required_resource_access {
    resource_app_id            = "00000003-0000-0000-c000-000000000000"
    resource_access {
      id                       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type                     = "Scope"
    }
  }
}
resource "azuread_service_principal" "mdp_spn_APIM" {
  application_id               = azuread_application.mdp_app_apim.application_id
  app_role_assignment_required = false
}

#App registration and service principal for MDPAPP

resource "azuread_application" "mdp_app_application" {
  name                         = "spn-${var.application_acronym}-azapplication-${var.environment_acronym}"
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = true
  type                         = "webapp/api"
  required_resource_access {
    resource_app_id            = "00000003-0000-0000-c000-000000000000"
    resource_access {
      id                       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type                     = "Scope"
    }
  }
}
resource "azuread_service_principal" "mdp_spn_Application" {
  application_id               = azuread_application.mdp_app_application.application_id
  app_role_assignment_required = false
}

#App registration and service principal for IICS (Not required we can remove this)

resource "azuread_application" "iics_mdp_dv" {
  name                         = "spn-${var.application_acronym}-aziics-${var.environment_acronym}"
  available_to_other_tenants   = false
  oauth2_allow_implicit_flow   = true
  type                         = "webapp/api"
  required_resource_access {
    resource_app_id            = "00000003-0000-0000-c000-000000000000"
    resource_access {
      id                       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type                     = "Scope"
    }
  }
}
/*
resource "azuread_service_principal" "mdp_spn_iics" {
  application_id               = azuread_application.iics_mdp_dv.application_id
  app_role_assignment_required = false
}

resource "azuread_application_app_role" "mdp-approle-iics" {
  application_object_id = azuread_application.iics_mdp_dv.id
  allowed_member_types  = ["Both"]
  description           = "can manage roles and perform all task actions"
  display_name          = "Dummyrole"
  is_enabled            = true
  value                 = "Dummyrole"
}
*/
