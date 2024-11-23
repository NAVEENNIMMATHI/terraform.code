resource "azurerm_storage_container" "cishardenedimages" {
  name                  = "cis-hardened-images"
  storage_account_name  = module.vmimagesa.storage_account_name
  container_access_type = "private"
}

