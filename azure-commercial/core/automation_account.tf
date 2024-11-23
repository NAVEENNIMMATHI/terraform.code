resource "azurerm_automation_account" "co-p-eastus-DSG-PIP-scraper-AA" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-DSG-PIP-scraper-AA${var.unique_variable_suffix}" : "ama-${var.location_acronym}-dsgpipscraper-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.co-p-eastus-DSG-PIP-scraper-rg.name
  location            = azurerm_resource_group.co-p-eastus-DSG-PIP-scraper-rg.location
  sku_name            = "Basic"
  tags                = var.tags
}

resource "azurerm_automation_account" "copeus2CoreAA" {
  count = var.environment_acronym == "qa" ? 0 : 1
  
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co${var.legacy_env_acronym}eus2CoreAA${var.unique_variable_suffix}" : "ama-use2-core-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.loganalytics.name
  location            = "eastus2"
  sku_name            = "Basic"
  tags                = var.tags
}

resource "azurerm_automation_account" "copeuscorekdr01aa" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co${var.legacy_env_acronym}euscorekdr01aa${var.unique_variable_suffix}" : "ama-use2-corekdr01-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.CO-P-eastus-kdr-rg.name
  location            = "eastus2"
  sku_name            = "Basic"
  tags                = var.tags
}

resource "azurerm_automation_account" "copeuscorekvrotation01aa" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co${var.legacy_env_acronym}euscorekvrotation01aa${var.unique_variable_suffix}" : "ama-use2-corekvrotation01-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.backuprecovery.name
  location            = "eastus2"
  sku_name            = "Basic"
  tags                = var.tags
}

resource "azurerm_automation_account" "copeus3CoreAA" {
  count = var.environment_acronym == "qa" ? 0 : 1

  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co${var.legacy_env_acronym}eus3CoreAA${var.unique_variable_suffix}" : "ama-use2-core3-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.loganalytics.name
  location            = "eastus2"
  sku_name            = "Basic"
  tags                = var.tags
}

resource "azurerm_automation_account" "ama-use-dsc" {
  name                = "ama-use-dsc-${var.environment_acronym}"
  resource_group_name = var.automation_account_resource_group_name
  location            = "eastus2"
  sku_name            = "Basic"
  tags                = var.tags_NodeMgmt
}
