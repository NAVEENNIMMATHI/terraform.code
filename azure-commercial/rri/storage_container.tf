resource "azurerm_storage_container" "admin" {
  name                  = var.storage_account_container_name
  storage_account_name  = module.storage_account.storage_account_name
  container_access_type = "private"
}

#data "azurerm_storage_account_sas" "storage_account_sas" {
#  connection_string = module.storage_account.primary_connection_string
#  https_only        = true
#
#  resource_types {
#    service   = true
#    container = false
#    object    = false
#  }
#
#  services {
#    blob  = true
#    queue = false
#    table = false
#    file  = false
#  }
#
#  start  = "2020-01-01"
#  expiry = "2023-12-31"
#
#  permissions {
#    read    = true
#    write   = true
#    delete  = false
#    list    = false
#    add     = true
#    create  = true
#    update  = true
#    process = false
#  }
#}

