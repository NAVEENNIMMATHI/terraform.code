module "recoveryservice" {
  source                                   = "../../modules12/recovery_service_vault"
  recovery_services_vault_name             = var.environment == "production" ? "copeusrecvault01clo" : "rsv-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_location                  = module.backuprecoveryrg.resource_group_location
  resource_group_name                      = module.backuprecoveryrg.resource_group_name
  recovery_services_protection_policy_name = "co-${var.environment_acronym}-${var.application_acronym}backup-policy-daily"
  soft_delete_enabled                      = true
  
  tags                                     = var.tags
}

