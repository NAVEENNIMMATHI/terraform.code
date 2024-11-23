module "storage_container" {
  source                = "../../modules12/storage_container"
  name                  = "databus"
  storage_account_name  = azurerm_storage_account.ofr.name
  container_access_type = "private"
}