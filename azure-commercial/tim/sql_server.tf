module "sqlserver" {
  source                      = "../../modules/sql_server"
  sql_server_name             = "srv-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name         = module.timrg.resource_group_name
  resource_group_location     = module.timrg.resource_group_location
  sql_server_version          = "12.0"
  sql_server_admin_username   = var.sql_server_admin_username
  sql_server_admin_password   = var.sql_server_admin_password
  tags                        = var.tags
  tenant_id                   = var.tenant_id
  sqlserver_adgroup_object_id = azuread_group.adgroup.id
  sqlserver_adgroup_name      = azuread_group.adgroup.name
}