module "storage_account" {
  source                            = "../../modules12/storage_account"
  storage_account_name              = "sto${lower(var.location_acronym)}${lower(var.application_acronym)}${lower(var.environment_acronym)}"
  resource_group_name               = module.applicationrg.resource_group_name
  resource_group_location           = module.applicationrg.resource_group_location
  account_replication_type          = "RAGRS"
  network_rule_default_action       = "Allow"
  enable_advanced_threat_protection = "true"

  tags                              = var.tags
}


resource "azurerm_storage_container" "uploadfiles" {
  name                  = "uploadfiles"
  storage_account_name  = module.storage_account.storage_account_name
  container_access_type = "private"
}

resource "azurerm_storage_container" "uploadfilestemplate" {
  name                  = "uploadingfilestemplate"
  storage_account_name  = module.storage_account.storage_account_name
  container_access_type = "private"
}

resource "azurerm_storage_container" "worksheets" {
  name                  = "worksheets"
  storage_account_name  = module.storage_account.storage_account_name
  container_access_type = "private"
}
