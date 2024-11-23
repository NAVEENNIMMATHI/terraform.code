module "storage-binary" {
  source                     = "../../modules/storage_account"
  storage_account_name       = "${var.storage_account_name}"
  resource_group_location    = "${data.azurerm_resource_group.rg-core-shared.location}"
  resource_group_name        = "${data.azurerm_resource_group.rg-core-shared.name}"
  account_replication_type   = "LRS"
  enable_https_traffic_only  = 1
  virtual_network_subnet_ids = "${var.binary-storage-allowed-subnets}"
  tags                       = "${var.tags}"
}