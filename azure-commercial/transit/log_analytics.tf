
resource "azurerm_log_analytics_workspace" "transit" {
  name                = "CO-${var.environment}-${var.location}-${var.applicationname}1-workspace${var.uniqueresourcesuffix1}"
  location            = "${azurerm_resource_group.transitloganalytics.location}"
  resource_group_name = "${azurerm_resource_group.transitloganalytics.name}"
  sku                 = "Standard"

  tags = "${var.tags}"

}


# resource "azurerm_log_analytics_solution" "ADAssessment" {
#   solution_name         = "ADAssessment"
#   location              = "${azurerm_resource_group.transitloganalytics.location}"
#   resource_group_name   = "${azurerm_resource_group.transitloganalytics.name}"
#   workspace_resource_id = "${azurerm_log_analytics_workspace.transit.id}"
#   workspace_name        = "${azurerm_log_analytics_workspace.transit.name}"

#   plan {
#     publisher = "Microsoft"
#     product   = "OMSGallery/ADAssessment"
#   }
#   tags {
#     Platform = "${var.tag_platform}"
#     Environment  = "${var.tag_environment}"
#     Node = "${var.tag_node}"
#     Solution = "${var.tag_solution}"
#     CostCode = "${var.tag_costcode}"
#     OwnerContact = "${var.tag_ownercontact}"    
#   }
# }  



# resource "azurerm_log_analytics_solution" "AgentHealthAssessment" {
#   solution_name         = "AgentHealthAssessment"
#   location              = "${azurerm_resource_group.transitloganalytics.location}"
#   resource_group_name   = "${azurerm_resource_group.transitloganalytics.name}"
#   workspace_resource_id = "${azurerm_log_analytics_workspace.transit.id}"
#   workspace_name        = "${azurerm_log_analytics_workspace.transit.name}"

#   plan {
#     publisher = "Microsoft"
#     product   = "OMSGallery/AgentHealthAssessment"
#   }
# }


# resource "azurerm_log_analytics_solution" "AntiMalware" {
#   solution_name         = "AntiMalware"
#   location              = "${azurerm_resource_group.transitloganalytics.location}"
#   resource_group_name   = "${azurerm_resource_group.transitloganalytics.name}"
#   workspace_resource_id = "${azurerm_log_analytics_workspace.transit.id}"
#   workspace_name        = "${azurerm_log_analytics_workspace.transit.name}"

#   plan {
#     publisher = "Microsoft"
#     product   = "OMSGallery/AntiMalware"
#   }
# }



# resource "azurerm_log_analytics_solution" "AzureActivity" {
#   solution_name         = "AzureActivity"
#   location              = "${azurerm_resource_group.transitloganalytics.location}"
#   resource_group_name   = "${azurerm_resource_group.transitloganalytics.name}"
#   workspace_resource_id = "${azurerm_log_analytics_workspace.transit.id}"
#   workspace_name        = "${azurerm_log_analytics_workspace.transit.name}"

#   plan {
#     publisher = "Microsoft"
#     product   = "OMSGallery/AzureActivity"
#   }
# }


# resource "azurerm_log_analytics_solution" "AzureAppGatewayAnalytics" {
#   solution_name         = "AzureAppGatewayAnalytics"
#   location              = "${azurerm_resource_group.transitloganalytics.location}"
#   resource_group_name   = "${azurerm_resource_group.transitloganalytics.name}"
#   workspace_resource_id = "${azurerm_log_analytics_workspace.transit.id}"
#   workspace_name        = "${azurerm_log_analytics_workspace.transit.name}"

#   plan {
#     publisher = "Microsoft"
#     product   = "OMSGallery/AzureAppGatewayAnalytics"
#   }
# }



# resource "azurerm_log_analytics_solution" "AzureAutomation" {
#   solution_name         = "AzureAutomation"
#   location              = "${azurerm_resource_group.transitloganalytics.location}"
#   resource_group_name   = "${azurerm_resource_group.transitloganalytics.name}"
#   workspace_resource_id = "${azurerm_log_analytics_workspace.transit.id}"
#   workspace_name        = "${azurerm_log_analytics_workspace.transit.name}"

#   plan {
#     publisher = "Microsoft"
#     product   = "OMSGallery/AzureAutomation"
#   }
# }


# resource "azurerm_log_analytics_solution" "AzureNSGAnalytics" {
#   solution_name         = "AzureNSGAnalytics"
#   location              = "${azurerm_resource_group.transitloganalytics.location}"
#   resource_group_name   = "${azurerm_resource_group.transitloganalytics.name}"
#   workspace_resource_id = "${azurerm_log_analytics_workspace.transit.id}"
#   workspace_name        = "${azurerm_log_analytics_workspace.transit.name}"

#   plan {
#     publisher = "Microsoft"
#     product   = "OMSGallery/AzureNSGAnalytics"
#   }
# }



# resource "azurerm_log_analytics_solution" "ChangeTracking" {
#   solution_name         = "ChangeTracking"
#   location              = "${azurerm_resource_group.transitloganalytics.location}"
#   resource_group_name   = "${azurerm_resource_group.transitloganalytics.name}"
#   workspace_resource_id = "${azurerm_log_analytics_workspace.transit.id}"
#   workspace_name        = "${azurerm_log_analytics_workspace.transit.name}"

#   plan {
#     publisher = "Microsoft"
#     product   = "OMSGallery/ChangeTracking"
#   }
# }


# resource "azurerm_log_analytics_solution" "KeyVaultAnalytics" {
#   solution_name         = "KeyVaultAnalytics"
#   location              = "${azurerm_resource_group.transitloganalytics.location}"
#   resource_group_name   = "${azurerm_resource_group.transitloganalytics.name}"
#   workspace_resource_id = "${azurerm_log_analytics_workspace.transit.id}"
#   workspace_name        = "${azurerm_log_analytics_workspace.transit.name}"

#   plan {
#     publisher = "Microsoft"
#     product   = "OMSGallery/KeyVaultAnalytics"
#   }
# }






# resource "azurerm_log_analytics_solution" "NetworkMonitoring" {
#   solution_name         = "NetworkMonitoring"
#   location              = "${azurerm_resource_group.transitloganalytics.location}"
#   resource_group_name   = "${azurerm_resource_group.transitloganalytics.name}"
#   workspace_resource_id = "${azurerm_log_analytics_workspace.transit.id}"
#   workspace_name        = "${azurerm_log_analytics_workspace.transit.name}"

#   plan {
#     publisher = "Microsoft"
#     product   = "OMSGallery/NetworkMonitoring"
#   }
# }


# resource "azurerm_log_analytics_solution" "Security" {
#   solution_name         = "Security"
#   location              = "${azurerm_resource_group.transitloganalytics.location}"
#   resource_group_name   = "${azurerm_resource_group.transitloganalytics.name}"
#   workspace_resource_id = "${azurerm_log_analytics_workspace.transit.id}"
#   workspace_name        = "${azurerm_log_analytics_workspace.transit.name}"

#   plan {
#     publisher = "Microsoft"
#     product   = "OMSGallery/Security"
#   }
# }



# resource "azurerm_log_analytics_solution" "Updates" {
#   solution_name         = "Updates"
#   location              = "${azurerm_resource_group.transitloganalytics.location}"
#   resource_group_name   = "${azurerm_resource_group.transitloganalytics.name}"
#   workspace_resource_id = "${azurerm_log_analytics_workspace.transit.id}"
#   workspace_name        = "${azurerm_log_analytics_workspace.transit.name}"

#   plan {
#     publisher = "Microsoft"
#     product   = "OMSGallery/Updates"
#   }
# }


# resource "azurerm_log_analytics_solution" "AlertManagement" {
#   solution_name         = "AlertManagement"
#   location              = "${azurerm_resource_group.transitloganalytics.location}"
#   resource_group_name   = "${azurerm_resource_group.transitloganalytics.name}"
#   workspace_resource_id = "${azurerm_log_analytics_workspace.transit.id}"
#   workspace_name        = "${azurerm_log_analytics_workspace.transit.name}"

#   plan {
#     publisher = "Microsoft"
#     product   = "OMSGallery/AlertManagement"
#   }
# }

