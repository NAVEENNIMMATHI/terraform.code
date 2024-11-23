module "ablasqlserver02" {
  source                    = "../../modules/sql_server"
  sql_server_name           = "${var.abla_sql_server_name}"
  resource_group_location   = "${module.applicationrg.resource_group_location}"
  resource_group_name       = "${module.applicationrg.resource_group_name}"
  sql_server_version        = "${var.sql_server_version}"
  sql_server_admin_username = "${var.abla_sqlserver_admin}"
  sql_server_admin_password = "${var.abla_sqlserver_adminpassword}"
  tags = "${var.tags}"
}

module "ablasqlserver02activedirectory" {
  source                       = "../../modules/sql_active_directory_administrator"
  sql_server_name              = "${var.abla_sql_server_name}"
  resource_group_name          = "${module.applicationrg.resource_group_name}"
  sqlserver_adgroup_group_name = "${var.sqlserver_adgroup_group_name}"
  sqlserver_adgroup_objectid   = "${var.sqlserver_adgroup_objectid}"
  tenant_id                    = "${data.azurerm_client_config.current.tenant_id}"
}



#resource "azurerm_sql_active_directory_administrator" "ablasqlserver02activedirectory" {
#  server_name         = "${var.abla_sql_server_name}"
#  resource_group_name = "${module.applicationrg.resource_group_name}"
#  login               = "ABLA DB Admin"
#  tenant_id           = "${data.azurerm_client_config.current.tenant_id}"
#  object_id           = "dd9da94a-4c57-43c9-933a-f21f2a2c5a70"
#}