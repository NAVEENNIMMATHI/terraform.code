module "postgresql_database" {
  source                   = "../../modules12/postgresql_database"
  resource_group_name      = module.cmarg.resource_group_name
  name                     = "pgd-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  server_name              = module.postgresql_server.postgresql_server_name
  charset                  = "UTF8"
  collation                = "English_United States.1252"
}