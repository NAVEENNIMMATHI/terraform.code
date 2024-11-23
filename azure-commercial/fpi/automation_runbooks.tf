###############################################################################
# CreateNewEPCheckDataSpaceAllocated.ps1
###############################################################################
data "local_file" "CreateNewEPCheckDataSpaceAllocated" {
  filename = "../../powershell/fpi/CreateNewEPCheckDataSpaceAllocated.${var.environment}.ps1"
}

resource "azurerm_automation_runbook" "CreateNewEPCheckDataSpaceAllocated" {
  name                    = "CreateNewEPCheckDataSpaceAllocated"
  resource_group_name     = module.rgfpi.resource_group_name
  location                = module.rgfpi.resource_group_location
  automation_account_name = module.fpiaa.automation_account_name
  log_verbose             = "true"
  log_progress            = "true"
  description             = ""
  runbook_type            = "PowerShell"

  # must have a content link, but will use custom content from local file
  publish_content_link {
    uri = "https://www.microsoft.com/en-us/"
  }

  content = data.local_file.CreateNewEPCheckDataSpaceAllocated.content
  tags    = var.tags
}

###############################################################################
# SendEmailNotificationDatabaseMoveFailed.ps1
###############################################################################
data "local_file" "SendEmailNotificationDatabaseMoveFailed" {
  filename = "../../powershell/fpi/SendEmailNotificationDatabaseMoveFailed.${var.environment}.ps1"
}

resource "azurerm_automation_runbook" "SendEmailNotificationDatabaseMoveFailed" {
  name                    = "SendEmailNotificationDatabaseMoveFailed"
  resource_group_name     = module.rgfpi.resource_group_name
  location                = module.rgfpi.resource_group_location
  automation_account_name = module.fpiaa.automation_account_name
  log_verbose             = "true"
  log_progress            = "true"
  description             = ""
  runbook_type            = "PowerShell"

  # must have a content link, but will use custom content from local file
  publish_content_link {
    uri = "https://www.microsoft.com/en-us/"
  }

  content = data.local_file.SendEmailNotificationDatabaseMoveFailed.content
  tags    = var.tags
}

###############################################################################
# SendEmailNotificationDatabaseMoveFailedRED.ps1
###############################################################################
data "local_file" "SendEmailNotificationDatabaseMoveFailedRED" {
  filename = "../../powershell/fpi/SendEmailNotificationDatabaseMoveFailedRED.${var.environment}.ps1"
}

resource "azurerm_automation_runbook" "SendEmailNotificationDatabaseMoveFailedRED" {
  name                    = "SendEmailNotificationDatabaseMoveFailedRED"
  resource_group_name     = module.rgfpi.resource_group_name
  location                = module.rgfpi.resource_group_location
  automation_account_name = module.fpiaa.automation_account_name
  log_verbose             = "true"
  log_progress            = "true"
  description             = ""
  runbook_type            = "PowerShell"

  # must have a content link, but will use custom content from local file
  publish_content_link {
    uri = "https://www.microsoft.com/en-us/"
  }

  content = data.local_file.SendEmailNotificationDatabaseMoveFailedRED.content
  tags    = var.tags
}

###############################################################################
# SendEmailNotificationDatabaseMoveSuccessful.ps1
###############################################################################
data "local_file" "SendEmailNotificationDatabaseMoveSuccessful" {
  filename = "../../powershell/fpi/SendEmailNotificationDatabaseMoveSuccessful.${var.environment}.ps1"
}

resource "azurerm_automation_runbook" "SendEmailNotificationDatabaseMoveSuccessful" {
  name                    = "SendEmailNotificationDatabaseMoveSuccessful"
  resource_group_name     = module.rgfpi.resource_group_name
  location                = module.rgfpi.resource_group_location
  automation_account_name = module.fpiaa.automation_account_name
  log_verbose             = "true"
  log_progress            = "true"
  description             = ""
  runbook_type            = "PowerShell"

  # must have a content link, but will use custom content from local file
  publish_content_link {
    uri = "https://www.microsoft.com/en-us/"
  }

  content = data.local_file.SendEmailNotificationDatabaseMoveSuccessful.content
  tags    = var.tags
}

###############################################################################
# SendEmailNotificationElasticPoolCreationFailed.ps1
###############################################################################
data "local_file" "SendEmailNotificationElasticPoolCreationFailed" {
  filename = "../../powershell/fpi/SendEmailNotificationElasticPoolCreationFailed.${var.environment}.ps1"
}

resource "azurerm_automation_runbook" "SendEmailNotificationElasticPoolCreationFailed" {
  name                    = "SendEmailNotificationElasticPoolCreationFailed"
  resource_group_name     = module.rgfpi.resource_group_name
  location                = module.rgfpi.resource_group_location
  automation_account_name = module.fpiaa.automation_account_name
  log_verbose             = "true"
  log_progress            = "true"
  description             = ""
  runbook_type            = "PowerShell"

  # must have a content link, but will use custom content from local file
  publish_content_link {
    uri = "https://www.microsoft.com/en-us/"
  }

  content = data.local_file.SendEmailNotificationElasticPoolCreationFailed.content
  tags    = var.tags
}

###############################################################################
# SendEmailNotificationElasticPoolCreationFailedRED.ps1
###############################################################################
data "local_file" "SendEmailNotificationElasticPoolCreationFailedRED" {
  filename = "../../powershell/fpi/SendEmailNotificationElasticPoolCreationFailedRED.${var.environment}.ps1"
}

resource "azurerm_automation_runbook" "SendEmailNotificationElasticPoolCreationFailedRED" {
  name                    = "SendEmailNotificationElasticPoolCreationFailedRED"
  resource_group_name     = module.rgfpi.resource_group_name
  location                = module.rgfpi.resource_group_location
  automation_account_name = module.fpiaa.automation_account_name
  log_verbose             = "true"
  log_progress            = "true"
  description             = ""
  runbook_type            = "PowerShell"

  # must have a content link, but will use custom content from local file
  publish_content_link {
    uri = "https://www.microsoft.com/en-us/"
  }

  content = data.local_file.SendEmailNotificationElasticPoolCreationFailedRED.content
  tags    = var.tags
}

###############################################################################
# SendEmailNotificationElasticPoolCreationSuccessful.ps1
###############################################################################
data "local_file" "SendEmailNotificationElasticPoolCreationSuccessful" {
  filename = "../../powershell/fpi/SendEmailNotificationElasticPoolCreationSuccessful.${var.environment}.ps1"
}

resource "azurerm_automation_runbook" "SendEmailNotificationElasticPoolCreationSuccessful" {
  name                    = "SendEmailNotificationElasticPoolCreationSuccessful"
  resource_group_name     = module.rgfpi.resource_group_name
  location                = module.rgfpi.resource_group_location
  automation_account_name = module.fpiaa.automation_account_name
  log_verbose             = "true"
  log_progress            = "true"
  description             = ""
  runbook_type            = "PowerShell"

  # must have a content link, but will use custom content from local file
  publish_content_link {
    uri = "https://www.microsoft.com/en-us/"
  }

  content = data.local_file.SendEmailNotificationElasticPoolCreationSuccessful.content
  tags    = var.tags
}