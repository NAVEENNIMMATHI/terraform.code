resource "azurerm_log_analytics_workspace" "hub" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-hub1-workspace${var.unique_variable_suffix}" : "law-${var.location_acronym}-core1-${var.environment_acronym}"
  location            = azurerm_resource_group.loganalytics.location
  resource_group_name = azurerm_resource_group.loganalytics.name
  sku                 = "Standard"
  retention_in_days   = 30

  tags = var.tags
}

# Create the "core1" log analytics workspaces that aren't created for dv and pd in the "hub" resource above for use with new DSC Automation Accounts
# This way all environments will have a "core1" log analytics workspace
resource "azurerm_log_analytics_workspace" "core1" {
  count               = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? 1 : 0
  name                = "law-${var.location_acronym}-core1-${var.environment_acronym}"
  location            = azurerm_resource_group.loganalytics.location
  resource_group_name = azurerm_resource_group.loganalytics.name
  sku                 = "pergb2018"
  retention_in_days   = 30

  tags = var.tags
}

# Enable Update Management solution
resource "azurerm_log_analytics_workspace" "ad_log_analytics_workspace" {
  name                = var.environment == "production" ? "law-use2-aadsigninauditlogs-pd" : "law-${var.location_acronym}-aadsigninauditlogs-${var.environment_acronym}${var.unique_variable_suffix}"
  location            = azurerm_resource_group.loganalytics.location
  resource_group_name = azurerm_resource_group.loganalytics.name
  sku                 = "pergb2018"
  retention_in_days   = 90

  tags = var.tags_AADDS
}

resource "azurerm_log_analytics_solution" "ADAssessment" {
  solution_name         = "ADAssessment"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.hub.id
  workspace_name        = azurerm_log_analytics_workspace.hub.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ADAssessment"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "AgentHealthAssessment" {
  solution_name         = "AgentHealthAssessment"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.hub.id
  workspace_name        = azurerm_log_analytics_workspace.hub.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AgentHealthAssessment"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "AntiMalware" {
  solution_name         = "AntiMalware"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.hub.id
  workspace_name        = azurerm_log_analytics_workspace.hub.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AntiMalware"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "AzureActivity" {
  solution_name         = "AzureActivity"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.hub.id
  workspace_name        = azurerm_log_analytics_workspace.hub.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureActivity"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "AzureAppGatewayAnalytics" {
  solution_name         = "AzureAppGatewayAnalytics"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.hub.id
  workspace_name        = azurerm_log_analytics_workspace.hub.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureAppGatewayAnalytics"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "AzureAutomation" {
  solution_name         = "AzureAutomation"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.hub.id
  workspace_name        = azurerm_log_analytics_workspace.hub.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureAutomation"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "AzureNSGAnalytics" {
  solution_name         = "AzureNSGAnalytics"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.hub.id
  workspace_name        = azurerm_log_analytics_workspace.hub.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureNSGAnalytics"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "ChangeTracking" {
  solution_name         = "ChangeTracking"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.hub.id
  workspace_name        = azurerm_log_analytics_workspace.hub.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ChangeTracking"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "KeyVaultAnalytics" {
  solution_name         = "KeyVaultAnalytics"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.hub.id
  workspace_name        = azurerm_log_analytics_workspace.hub.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/KeyVaultAnalytics"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "NetworkMonitoring" {
  solution_name         = "NetworkMonitoring"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.hub.id
  workspace_name        = azurerm_log_analytics_workspace.hub.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/NetworkMonitoring"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "Security" {
  solution_name         = "Security"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.hub.id
  workspace_name        = azurerm_log_analytics_workspace.hub.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/Security"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "Updates" {
  solution_name         = "Updates"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.hub.id
  workspace_name        = azurerm_log_analytics_workspace.hub.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/Updates"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "AlertManagement" {
  solution_name         = "AlertManagement"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.hub.id
  workspace_name        = azurerm_log_analytics_workspace.hub.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AlertManagement"
  }

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "ServiceMap" {
  solution_name         = "ServiceMap"
  location              = azurerm_resource_group.loganalytics.location
  resource_group_name   = azurerm_resource_group.loganalytics.name
  workspace_resource_id = azurerm_log_analytics_workspace.hub.id
  workspace_name        = lower(azurerm_log_analytics_workspace.hub.name)

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ServiceMap"
  }

  tags = var.tags
}
