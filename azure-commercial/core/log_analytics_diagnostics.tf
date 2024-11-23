resource "azurerm_log_analytics_workspace" "corelogs" {
  name                = "law-${var.location_acronym}-${var.application_acronym}logs-${var.environment_acronym}"
  location            = azurerm_resource_group.loganalytics.location
  resource_group_name = azurerm_resource_group.loganalytics.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags = var.tags
}

resource "azurerm_log_analytics_solution" "adassessment_corelogs" {
  solution_name         = "ADAssessment"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.corelogs.id
  workspace_name        = azurerm_log_analytics_workspace.corelogs.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ADAssessment"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "agenthealthassessment_corelogs" {
  solution_name         = "AgentHealthAssessment"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.corelogs.id
  workspace_name        = azurerm_log_analytics_workspace.corelogs.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AgentHealthAssessment"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "antimalware_corelogs" {
  solution_name         = "AntiMalware"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.corelogs.id
  workspace_name        = azurerm_log_analytics_workspace.corelogs.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AntiMalware"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "azureactivity_corelogs" {
  solution_name         = "AzureActivity"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.corelogs.id
  workspace_name        = azurerm_log_analytics_workspace.corelogs.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureActivity"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "azureappgatewayanalytics_corelogs" {
  solution_name         = "AzureAppGatewayAnalytics"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.corelogs.id
  workspace_name        = azurerm_log_analytics_workspace.corelogs.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureAppGatewayAnalytics"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "azureautomation_corelogs" {
  solution_name         = "AzureAutomation"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.corelogs.id
  workspace_name        = azurerm_log_analytics_workspace.corelogs.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureAutomation"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "azurensganalytics_corelogs" {
  solution_name         = "AzureNSGAnalytics"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.corelogs.id
  workspace_name        = azurerm_log_analytics_workspace.corelogs.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureNSGAnalytics"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "changetracking_corelogs" {
  solution_name         = "ChangeTracking"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.corelogs.id
  workspace_name        = azurerm_log_analytics_workspace.corelogs.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ChangeTracking"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "keyvaultanalytics_corelogs" {
  solution_name         = "KeyVaultAnalytics"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.corelogs.id
  workspace_name        = azurerm_log_analytics_workspace.corelogs.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/KeyVaultAnalytics"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "networkmonitoring_corelogs" {
  solution_name         = "NetworkMonitoring"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.corelogs.id
  workspace_name        = azurerm_log_analytics_workspace.corelogs.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/NetworkMonitoring"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "security_corelogs" {
  solution_name         = "Security"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.corelogs.id
  workspace_name        = azurerm_log_analytics_workspace.corelogs.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/Security"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "updates_corelogs" {
  solution_name         = "Updates"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.corelogs.id
  workspace_name        = azurerm_log_analytics_workspace.corelogs.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/Updates"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "alertmanagement_corelogs" {
  solution_name         = "AlertManagement"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.corelogs.id
  workspace_name        = azurerm_log_analytics_workspace.corelogs.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AlertManagement"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "servicemap_corelogs" {
  solution_name         = "ServiceMap"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.corelogs.id
  workspace_name        = lower(azurerm_log_analytics_workspace.corelogs.name)

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ServiceMap"
  }

  tags = var.tags
}

#### Below are the solutions for the core1 log analytics workspaces linked to the DSC Automation Accounts ####
resource "azurerm_log_analytics_solution" "adassessment_dsc" {
  solution_name         = "ADAssessment"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].id : azurerm_log_analytics_workspace.hub.id 
  workspace_name        = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].name : azurerm_log_analytics_workspace.hub.name 

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ADAssessment"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "agenthealthassessment_dsc" {
  solution_name         = "AgentHealthAssessment"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].id : azurerm_log_analytics_workspace.hub.id 
  workspace_name        = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].name : azurerm_log_analytics_workspace.hub.name 

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AgentHealthAssessment"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "antimalware_dsc" {
  solution_name         = "AntiMalware"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].id : azurerm_log_analytics_workspace.hub.id 
  workspace_name        = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].name : azurerm_log_analytics_workspace.hub.name 

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AntiMalware"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "azureactivity_dsc" {
  solution_name         = "AzureActivity"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].id : azurerm_log_analytics_workspace.hub.id 
  workspace_name        = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].name : azurerm_log_analytics_workspace.hub.name 

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureActivity"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "azureappgatewayanalytics_dsc" {
  solution_name         = "AzureAppGatewayAnalytics"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].id : azurerm_log_analytics_workspace.hub.id 
  workspace_name        = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].name : azurerm_log_analytics_workspace.hub.name 

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureAppGatewayAnalytics"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "azureautomation_dsc" {
  solution_name         = "AzureAutomation"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].id : azurerm_log_analytics_workspace.hub.id 
  workspace_name        = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].name : azurerm_log_analytics_workspace.hub.name 

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureAutomation"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "azurensganalytics_dsc" {
  solution_name         = "AzureNSGAnalytics"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].id : azurerm_log_analytics_workspace.hub.id 
  workspace_name        = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].name : azurerm_log_analytics_workspace.hub.name 

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureNSGAnalytics"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "changetracking_dsc" {
  solution_name         = "ChangeTracking"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].id : azurerm_log_analytics_workspace.hub.id 
  workspace_name        = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].name : azurerm_log_analytics_workspace.hub.name 
  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ChangeTracking"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "keyvaultanalytics_dsc" {
  solution_name         = "KeyVaultAnalytics"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].id : azurerm_log_analytics_workspace.hub.id 
  workspace_name        = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].name : azurerm_log_analytics_workspace.hub.name 

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/KeyVaultAnalytics"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "networkmonitoring_dsc" {
  solution_name         = "NetworkMonitoring"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].id : azurerm_log_analytics_workspace.hub.id 
  workspace_name        = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].name : azurerm_log_analytics_workspace.hub.name 

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/NetworkMonitoring"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "security_dsc" {
  solution_name         = "Security"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].id : azurerm_log_analytics_workspace.hub.id 
  workspace_name        = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].name : azurerm_log_analytics_workspace.hub.name 

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/Security"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "updates_dsc" {
  solution_name         = "Updates"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].id : azurerm_log_analytics_workspace.hub.id 
  workspace_name        = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].name : azurerm_log_analytics_workspace.hub.name 

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/Updates"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "alertmanagement_dsc" {
  solution_name         = "AlertManagement"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].id : azurerm_log_analytics_workspace.hub.id 
  workspace_name        = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].name : azurerm_log_analytics_workspace.hub.name 

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AlertManagement"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "servicemap_dsc" {
  solution_name         = "ServiceMap"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].id : azurerm_log_analytics_workspace.hub.id 
  workspace_name        = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_log_analytics_workspace.core1[0].name : azurerm_log_analytics_workspace.hub.name 

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ServiceMap"
  }

  tags = var.tags
}