# Group for container
resource "azuread_group" "jupservergroup" {
  name = "CO-Ignite-${var.engagement_name}${var.separator}SAG-${upper(var.environment)}"
}

resource "azuread_group" "automation_group" {      
      name                    = "co-ignite-${var.engagement_name}${var.separator}automation-${lower(var.environment)}"
      owners                  = []
      prevent_duplicate_names = false
    }

resource "azuread_group" "contributor_group" {
      name                    = "co-ignite-${var.engagement_name}${var.separator}contributors-${lower(var.environment)}"
      owners                  = []
      prevent_duplicate_names = false
    }

resource "azuread_group" "applicationUI_group" {      
      name                    = "CO-${upper(var.engagement_name)}${var.separator}IgniteUI"
      owners                  = []
      prevent_duplicate_names = false
    }


  resource "azuread_group" "aks_cluster_admin_group" {      
      name                    = "aad-ignite-${var.engagement_name}${var.separator}admin-${lower(var.environment)}"
      owners                  = []
      prevent_duplicate_names = false
    }


resource "azuread_group" "data_contributor_group" {      
      name                    = "aad-ignite-${var.engagement_name}${var.separator}data-scientist-${lower(var.environment)}"
      owners                  = []
      prevent_duplicate_names = false
    }

resource "azuread_group" "crisis_planning_user" {      
      name                    = "aad-ignite-${var.engagement_name}${var.separator}user-${lower(var.environment)}"
      owners                  = []
      prevent_duplicate_names = false
    }
