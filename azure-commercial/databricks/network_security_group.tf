module "databricksnsg" {
  source              = "../../modules/network_security_group"
  name                = var.environment == "p" ? "co-p-eastus-databricks-nsg" : "nsg-${var.location_acronym}-${var.project_acronym}-${var.environment_acronym}"
  location            = module.databricksrg.resource_group_location
  resource_group_name = module.databricksrg.resource_group_name
  tags                = var.tags
}

module "databricksnsgsqlmi" {
  source              = "../../modules/network_security_group"
  name                = var.environment == "p" ? "co-p-eastus-databricks-sql-mi-nsg" : "nsg-${var.location_acronym}-${var.project_acronym}-${var.security_role_sql_managed_instance}-${var.environment_acronym}"
  location            = module.databricksrg.resource_group_location
  resource_group_name = module.databricksrg.resource_group_name
  tags                = var.tags
}