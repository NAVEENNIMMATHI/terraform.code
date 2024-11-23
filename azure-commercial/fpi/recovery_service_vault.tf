# module "recoveryservice" {
#   source                                   = "../../modules12/recovery_service_vault"
#   recovery_services_vault_name             = "co-${var.environment_1}-${var.application_rg_location}-cospibackuprecovery-rg"
#   resource_group_location                  = module.backuprecoveryrg.resource_group_location
#   resource_group_name                      = module.backuprecoveryrg.resource_group_name
#   recovery_services_protection_policy_name = "co-${var.environment_1}-${var.application_acronym}backup-policy-daily"
#   tags                                     = var.tags
# }

