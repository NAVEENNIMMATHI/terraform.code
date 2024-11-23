resource "azurerm_storage_container" "webappbackup" {
  name                  = var.webappbackup_container_name
  storage_account_name  = module.webappbackupsa.storage_account_name
  container_access_type = "private"
}

