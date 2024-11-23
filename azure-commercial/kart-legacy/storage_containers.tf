resource "azurerm_storage_container" "webappbackupdev" {
  name                  = "kartdevappbackup"
  storage_account_name  = module.webappbackupsa.storage_account_name
  container_access_type = "private"
  count                 = var.target_deployment_environment == "prod" ? 0 : 1
}

resource "azurerm_storage_container" "webappbackupqa" {
  name                  = "kartqaappbackup"
  storage_account_name  = module.webappbackupsa.storage_account_name
  container_access_type = "private"
  count                 = var.target_deployment_environment == "prod" ? 0 : 1
}

resource "azurerm_storage_container" "webappbackupuat" {
  name                  = "kartuatappbackup"
  storage_account_name  = module.webappbackupsa.storage_account_name
  container_access_type = "private"
  count                 = var.target_deployment_environment == "prod" ? 0 : 1
}

##Production Storage Container

resource "azurerm_storage_container" "webappbackup" {
  name                  = "kartappbackup"
  storage_account_name  = module.webappbackupsa.storage_account_name
  container_access_type = "private"
  count                 = var.target_deployment_environment == "prod" ? 1 : 0
}

data "azurerm_storage_account_sas" "webappbackupsas" {
  connection_string = module.webappbackupsa.primary_connection_string
  https_only        = true

  resource_types {
    service   = true
    container = true
    object    = true
  }

  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }

  start  = "2019-03-21"
  expiry = "2021-03-21"

  permissions {
    read    = false
    write   = true
    delete  = false
    list    = false
    add     = false
    create  = false
    update  = false
    process = false
  }
}

