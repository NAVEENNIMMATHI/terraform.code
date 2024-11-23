resource "azurerm_storage_account" "storage" {
    name = var.storage_name
    resource_group_name = var.resource_group_name
    location = var.location
    account_kind = var.account_kind
    account_tier = var.account_tier
    account_replication_type = var.account_replication_type
}

resource "azurerm_storage_container" "container" {
    name = var.container_name
    storage_account_name =  var.storage_name

    depends_on = [
      azurerm_storage_account.storage
    ]
}