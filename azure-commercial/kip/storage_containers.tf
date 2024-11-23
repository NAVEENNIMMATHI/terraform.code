resource "azurerm_storage_container" "webappbackup" {
  name                  = var.webappbackup_container_name
  storage_account_name  = module.webappbackupsa.storage_account_name
  container_access_type = "private"
}

data "azurerm_storage_account_sas" "storage_account_sas" {
  connection_string = module.webappbackupsa.primary_connection_string
  https_only        = true

  resource_types {
    service   = true
    container = false
    object    = false
  }

  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }

  start  = "2020-01-01"
  expiry = "2023-12-31"

  permissions {
    read    = true
    write   = true
    delete  = false
    list    = false
    add     = true
    create  = true
    update  = true
    process = false
  }
}

resource "azurerm_storage_container" "synapse" {
  name                  = "synapse"
  storage_account_name  = module.rawandcuratedsa.storage_account_name
  container_access_type = "private"
}