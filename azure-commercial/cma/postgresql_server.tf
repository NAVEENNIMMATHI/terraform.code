module "postgresql_server" {
  source                           = "../../modules12/postgresql_server"
  resource_group_name              = module.cmarg.resource_group_name
  location                         = module.cmarg.resource_group_location
  name                             = var.environment=="development" ? "pgs-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}1" : "pgs-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  sku_name                         = var.postgresql_server_sku
  postgresql_server_version        = "11"
  administrator_login              = var.postgresql_server_admin
  administrator_login_password     = var.postgresql_server_admin_password
  auto_grow_enabled                = false
  storage_mb                       = var.storage_mb
  backup_retention_days            = "7"
  geo_redundant_backup_enabled     = true
  ssl_enforcement_enabled          = true 
  tags                             = var.tags
}

module "postgresql_server_network_rules1" {
  source                    = "../../modules12/postgresql_virtual_network_rule"
  name                      = "AllowTrafficFromASESubnet"
  resource_group_name       = module.cmarg.resource_group_name
  server_name               = module.postgresql_server.postgresql_server_name
  subnet_id                 = data.terraform_remote_state.shared.outputs.ase_subnet_id
}

module "postgresql_server_network_rules2" {
  source                    = "../../modules12/postgresql_virtual_network_rule"
  name                      = "AllowTrafficFromPowerBIWorkstation"
  resource_group_name       = module.cmarg.resource_group_name
  server_name               = module.postgresql_server.postgresql_server_name
  subnet_id                 = data.terraform_remote_state.shared.outputs.mgmt_subnet_id
}