module "recoveryservice" {
  source                                   = "../../modules/recovery_service_vault"
  recovery_services_vault_name             = var.environment == "production" ? "copeusrecvault01bmp" : "rsv-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_location                  = module.backuprecoveryrg.resource_group_location
  resource_group_name                      = module.backuprecoveryrg.resource_group_name
  recovery_services_protection_policy_name = var.environment == "production" ? "co-p-bmpbackup-policy-daily" : "rsp-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  soft_delete_enabled                      = true
  tags                                     = var.tags
}

