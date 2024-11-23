resource "azurerm_storage_container" "webappbackup_container" {
  name                  = var.webappbackup_container_name
  for_each = var.storage_account_logs
  storage_account_name  = module.spipaaswebappbackup01sa[each.key].storage_account_name
  container_access_type = "private"
}

data "azurerm_storage_account_sas" "storage_account_sas" {
  connection_string = module.spipaaswebappbackup01sa[each.key].primary_connection_string
  for_each = var.storage_account_logs
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
