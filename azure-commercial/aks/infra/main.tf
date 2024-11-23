resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "storage_account" {
  source                    = "./modules/storage_account"
  storage_name              = var.storage_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_replication_type  = "LRS"
  container_name            = "container001"
}

module "key_vault" {
  source          = "./modules/key_vault"
  azure_location  = var.location
  key_vault       = var.key_vault_name
  object_id       = var.client_id
  resource_group  = var.resource_group_name
  tags            = var.tags
  tenant_id       = var.tenant_id
}

module "log_analytics" {
  source                    = "./modules/log_analytics"
  log_analytics_workspace   = var.log_analytics_workspace_name
  location                  = var.location
  resource_group            = var.resource_group_name
  storage_name              = var.log_analytics_storage_name
  account_replication_type  = "LRS"
}

module "acr" {
  source = "./modules/container_registry"
  acr_name = var.acr_name
  cluster_location = var.location
  resource_group_name = var.resource_group_name
  tags = var.tags
}

module "postgresql_server" {
  source = "./modules/postgresql_server"
  login = var.postgresql_login
  password = var.postgresql_password
  name = var.postgresql_name
  resource_group_name = var.resource_group_name
  tags = var.tags
}