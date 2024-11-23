resource "azurerm_automation_credential" "FPISqlCredential" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "FPISqlCredential"
  username                = "FPISqlCredential"
  password                = var.sqlserver_password
}