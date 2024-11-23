module "recoveryservice" {
  source                                   = "../../modules/recovery_service_vault"
  recovery_services_vault_name             = "rsv-${var.location_acronym}-vmandsql-${var.environment_acronym}"
  resource_group_location                  = module.backuprecoveryrg.resource_group_location
  resource_group_name                      = module.backuprecoveryrg.resource_group_name
  recovery_services_protection_policy_name = "rsp-${var.location_acronym}-vmandsql-${var.environment_acronym}"
  tags                                     = var.tags
  soft_delete_enabled                      = true
}

