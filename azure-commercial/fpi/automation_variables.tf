resource "azurerm_automation_variable_string" "V_TARGET_SQL_SERVER" {
  name                    = "V_TARGET_SQL_SERVER"
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  value                   = azurerm_sql_server.FPI-SQL.name
}

resource "azurerm_automation_variable_string" "V_TARGET_CURRENT_ELASTIC_POOL" {
  name                    = "V_TARGET_CURRENT_ELASTIC_POOL"
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  value                   = azurerm_mssql_elasticpool.fpi-sql-pool.name
}

resource "azurerm_automation_variable_int" "V_MAX_DATABASE_NUMBER" {
  name                    = "V_MAX_DATABASE_NUMBER"
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  value                   = 400
}

resource "azurerm_automation_variable_string" "V_DATABASE_NAME" {
  name                    = "V_DATABASE_NAME"
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  value                   = "FPI_Project_Master"
}

resource "azurerm_automation_variable_bool" "V_EMAIL_NOT_SENT_YET" {
  name                    = "V_EMAIL_NOT_SENT_YET"
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  value                   = false
}

resource "azurerm_automation_variable_int" "V_VCORE" {
  name                    = "V_VCORE"
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  value                   = 8
}

resource "azurerm_automation_variable_int" "V_STORAGE_MB" {
  name                    = "V_STORAGE_MB"
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  value                   = 1048576
}

resource "azurerm_automation_variable_int" "V_CURRENT_NO_OF_ELASTIC_POOLS" {
  name                    = "V_CURRENT_NO_OF_ELASTIC_POOLS"
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  value                   = 1
}

resource "azurerm_automation_variable_int" "V_CURRENT_TOTAL_OF_ELASTIC_POOLS" {
  name                    = "V_CURRENT_TOTAL_OF_ELASTIC_POOLS"
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  value                   = 1
}

resource "azurerm_automation_variable_int" "V_DB_VCORE" {
  name                    = "V_DB_VCORE"
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  value                   = 2
}

resource "azurerm_automation_variable_int" "V_STORAGE_MAX_LIMIT" {
  name                    = "V_STORAGE_MAX_LIMIT"
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  value                   = 80
}

resource "azurerm_automation_variable_int" "V_RETRIES_DB_CURRENT" {
  name                    = "V_RETRIES_DB_CURRENT"
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  value                   = 1
}

resource "azurerm_automation_variable_int" "V_RETRIES_DB_MAX" {
  name                    = "V_RETRIES_DB_MAX"
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  value                   = 3
}

resource "azurerm_automation_variable_int" "V_RETRIES_POOL_CURRENT" {
  name                    = "V_RETRIES_POOL_CURRENT"
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  value                   = 3
}

resource "azurerm_automation_variable_int" "V_RETRIES_POOL_MAX" {
  name                    = "V_RETRIES_POOL_MAX"
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  value                   = 3
}