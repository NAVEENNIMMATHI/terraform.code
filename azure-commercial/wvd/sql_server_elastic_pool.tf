module "ablaelasticpool" {
  source                             = "../../modules/sql_server_elastic_pool"
  name                               = "${var.abla_sql_elastic_pool_name}"
  resource_group_location            = "${module.applicationrg.resource_group_location}"
  resource_group_name                = "${module.applicationrg.resource_group_name}"
  server_name                        = "${var.abla_sql_server_name}"
  max_size_gb                        = 250
  sku_name                           = "GP_Gen5"
  sku_tier                           = "GeneralPurpose"
  sku_family                         = "Gen5"
  sku_capacity                       = 4
  per_database_settings_min_capacity = 0.25
  per_database_settings_max_capacity = 4

}