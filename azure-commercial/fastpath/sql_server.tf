module "sqlserver" {
  source                      = "../../modules/sql_server"
  sql_server_name             = "srv-${var.location_acronym}-${var.application_name}-${var.environment_acronym}"
  resource_group_name         = module.apprg.resource_group_name
  resource_group_location     = module.apprg.resource_group_location
  sql_server_version          = var.sql_server_version
  sql_server_admin_username   = var.sql_server_admin_username
  sql_server_admin_password   = var.sql_server_admin_password
  tags                        = var.tags
  sqlserver_adgroup_name      = module.sqladmins.ad_group_name
  tenant_id                   = data.azurerm_subscription.current.tenant_id
  sqlserver_adgroup_object_id = module.sqladmins.ad_group_id
}

