###############################################################################
#1. EngagementRebuildCubesTemplate.ps1
###############################################################################
data "local_file" "EngagementRebuildCubesTemplate" {
  filename = "../../powershell/kart/EngagementRebuildCubesTemplate.ps1"
}

resource "azurerm_automation_runbook" "EngagementRebuildCubesTemplate" {
  name                    = "EngagementRebuildCubesTemplate"
  resource_group_name     = module.applicationrg.resource_group_name
  location                = module.applicationrg.resource_group_location
  automation_account_name = module.automationaccount.automation_account_name
  log_verbose             = "true"
  log_progress            = "true"
  description             = ""
  runbook_type            = "PowerShell"

  count                   = var.environment == "development" || var.environment == "qa" || var.environment == "uat" ? "1" : "0"

  # must have a content link, but will use custom content from local file
  publish_content_link {
    uri = "https://www.microsoft.com/en-us/"
  }

  content = data.local_file.EngagementRebuildCubesTemplate.content
  tags    = var.tags
}


###############################################################################
#2. KARTManageEngagementRunbooks.ps1
###############################################################################
data "local_file" "KARTManageEngagementRunbooks" {
  filename = "../../powershell/kart/KARTManageEngagementRunbooks.ps1"
}

resource "azurerm_automation_runbook" "KARTManageEngagementRunbooks" {
  name                    = "KARTManageEngagementRunbooks"
  resource_group_name     = module.applicationrg.resource_group_name
  location                = module.applicationrg.resource_group_location
  automation_account_name = module.automationaccount.automation_account_name
  log_verbose             = "true"
  log_progress            = "true"
  description             = ""
  runbook_type            = "PowerShell"

  count                   = var.environment == "development" || var.environment == "qa" || var.environment == "uat" ? "1" : "0"

  # must have a content link, but will use custom content from local file
  publish_content_link {
    uri = "https://www.microsoft.com/en-us/"
  }

  content = data.local_file.KARTManageEngagementRunbooks.content
  tags    = var.tags
}


###############################################################################
#3. KARTArchiveEngagementRunBooks.ps1
###############################################################################
data "local_file" "KARTArchiveEngagementRunBooks" {
  filename = "../../powershell/kart/KARTArchiveEngagementRunBooks.ps1"
}

resource "azurerm_automation_runbook" "KARTArchiveEngagementRunBooks" {
  name                    = "KARTArchiveEngagementRunBooks"
  resource_group_name     = module.applicationrg.resource_group_name
  location                = module.applicationrg.resource_group_location
  automation_account_name = module.automationaccount.automation_account_name
  log_verbose             = "true"
  log_progress            = "true"
  description             = ""
  runbook_type            = "PowerShell"

  count                   = var.environment == "development" || var.environment == "qa" || var.environment == "uat" ? "1" : "0"

  # must have a content link, but will use custom content from local file
  publish_content_link {
    uri = "https://www.microsoft.com/en-us/"
  }

  content = data.local_file.KARTArchiveEngagementRunBooks.content
  tags    = var.tags
}

###############################################################################
#4. KRTSetAzSqlDatabaseBackupShortTermRetentionPolicy.ps1
###############################################################################
data "local_file" "KRTSetAzSqlDatabaseBackupShortTermRetentionPolicy" {
  filename = "../../powershell/kart/KRTSetAzSqlDatabaseBackupShortTermRetentionPolicy.ps1"
}

resource "azurerm_automation_runbook" "KRTSetAzSqlDatabaseBackupShortTermRetentionPolicy" {
  name                    = "KRTSetAzSqlDatabaseBackupShortTermRetentionPolicy"
  resource_group_name     = module.applicationrg.resource_group_name
  location                = module.applicationrg.resource_group_location
  automation_account_name = module.automationaccount.automation_account_name
  log_verbose             = "true"
  log_progress            = "true"
  description             = ""
  runbook_type            = "PowerShell"

  count                   = var.environment == "development" || var.environment == "qa" || var.environment == "uat" ? "1" : "0"

  # must have a content link, but will use custom content from local file
  publish_content_link {
    uri = "https://www.microsoft.com/en-us/"
  }

  content = data.local_file.KRTSetAzSqlDatabaseBackupShortTermRetentionPolicy.content
  tags    = var.tags
}


###############################################################################
#5. KRTSetPolicyForDb.ps1
###############################################################################
data "local_file" "KRTSetPolicyForDb" {
  filename = "../../powershell/kart/KRTSetPolicyForDb.ps1"
}

resource "azurerm_automation_runbook" "KRTSetPolicyForDb" {
  name                    = "KRTSetPolicyForDb"
  resource_group_name     = module.applicationrg.resource_group_name
  location                = module.applicationrg.resource_group_location
  automation_account_name = module.automationaccount.automation_account_name
  log_verbose             = "true"
  log_progress            = "true"
  description             = ""
  runbook_type            = "PowerShell"

  count                   = var.environment == "development" || var.environment == "qa" || var.environment == "uat" ? "1" : "0"

  # must have a content link, but will use custom content from local file
  publish_content_link {
    uri = "https://www.microsoft.com/en-us/"
  }

  content = data.local_file.KRTSetPolicyForDb.content
  tags    = var.tags
}

###############################################################################
#6. UpdateUsersInEngagementRunbook.ps1
###############################################################################
data "local_file" "UpdateUsersInEngagementRunbook" {
  filename = "../../powershell/kart/UpdateUsersInEngagementRunbook.ps1"
}

resource "azurerm_automation_runbook" "UpdateUsersInEngagementRunbook" {
  name                    = "UpdateUsersInEngagementRunbook"
  resource_group_name     = module.applicationrg.resource_group_name
  location                = module.applicationrg.resource_group_location
  automation_account_name = module.automationaccount.automation_account_name
  log_verbose             = "true"
  log_progress            = "true"
  description             = ""
  runbook_type            = "PowerShell"

  count                   = var.environment == "development" || var.environment == "qa" || var.environment == "uat" ? "1" : "0"

  # must have a content link, but will use custom content from local file
  publish_content_link {
    uri = "https://www.microsoft.com/en-us/"
  }

  content = data.local_file.UpdateUsersInEngagementRunbook.content
  tags    = var.tags
}


###############################################################################
#7. KARTSetFileShareFolderPermissionRunbook.ps1
###############################################################################
data "local_file" "KARTSetFileShareFolderPermissionRunbook" {
  filename = "../../powershell/kart/KARTSetFileShareFolderPermissionRunbook.ps1"
}

resource "azurerm_automation_runbook" "KARTSetFileShareFolderPermissionRunbook" {
  name                    = "KARTSetFileShareFolderPermissionRunbook"
  resource_group_name     = module.applicationrg.resource_group_name
  location                = module.applicationrg.resource_group_location
  automation_account_name = module.automationaccount.automation_account_name
  log_verbose             = "true"
  log_progress            = "true"
  description             = ""
  runbook_type            = "PowerShell"

  count                   = var.environment == "development" || var.environment == "qa" || var.environment == "uat" ? "1" : "0"

  # must have a content link, but will use custom content from local file
  publish_content_link {
    uri = "https://www.microsoft.com/en-us/"
  }

  content = data.local_file.KARTSetFileShareFolderPermissionRunbook.content
  tags    = var.tags
}


###############################################################################
#8. KARTArchiveUnUsedProjects.ps1
###############################################################################
data "local_file" "KARTArchiveUnUsedProjects" {
  filename = "../../powershell/kart/KARTArchiveUnUsedProjects.ps1"
}

resource "azurerm_automation_runbook" "KARTArchiveUnUsedProjects" {
  name                    = "KARTArchiveUnUsedProjects"
  resource_group_name     = module.applicationrg.resource_group_name
  location                = module.applicationrg.resource_group_location
  automation_account_name = module.automationaccount.automation_account_name
  log_verbose             = "true"
  log_progress            = "true"
  description             = ""
  runbook_type            = "PowerShell"

  count                   = var.environment == "development" || var.environment == "qa" ? "1" : "0"

  # must have a content link, but will use custom content from local file
  publish_content_link {
    uri = "https://www.microsoft.com/en-us/"
  }

  content = data.local_file.KARTArchiveUnUsedProjects.content
  tags    = var.tags
}

###############################################################################
#9. KARTDeleteEngagementCubes.ps1
###############################################################################
data "local_file" "KARTDeleteEngagementCubes" {
  filename = "../../powershell/kart/KARTDeleteEngagementCubes.ps1"
}

resource "azurerm_automation_runbook" "KARTDeleteEngagementCubes" {
  name                    = "KARTDeleteEngagementCubes"
  resource_group_name     = module.applicationrg.resource_group_name
  location                = module.applicationrg.resource_group_location
  automation_account_name = module.automationaccount.automation_account_name
  log_verbose             = "true"
  log_progress            = "true"
  description             = ""
  runbook_type            = "PowerShell"

  count                   = var.environment == "development" || var.environment == "qa" ? "1" : "0"

  # must have a content link, but will use custom content from local file
  publish_content_link {
    uri = "https://www.microsoft.com/en-us/"
  }

  content = data.local_file.KARTDeleteEngagementCubes.content
  tags    = var.tags
}

###############################################################################
#10. KARTPeriodicCleanUpDEVandQASQLDatabases.ps1
###############################################################################
data "local_file" "KARTPeriodicCleanUpDEVandQASQLDatabases" {
  filename = "../../powershell/kart/KARTPeriodicCleanUpDEVandQASQLDatabases.ps1"
}

resource "azurerm_automation_runbook" "KARTPeriodicCleanUpDEVandQASQLDatabases" {
  name                    = "KARTPeriodicCleanUpDEVandQASQLDatabases"
  resource_group_name     = module.applicationrg.resource_group_name
  location                = module.applicationrg.resource_group_location
  automation_account_name = module.automationaccount.automation_account_name
  log_verbose             = "true"
  log_progress            = "true"
  description             = "testing purpose"
  runbook_type            = "PowerShell"

  count                   = var.environment == "development" || var.environment == "qa" ? 1 : 0

  # must have a content link, but will use custom content from local file
  publish_content_link {
    uri = "https://www.microsoft.com/en-us/"
  }

  content = data.local_file.KARTPeriodicCleanUpDEVandQASQLDatabases.content
  tags    = var.tags
}
