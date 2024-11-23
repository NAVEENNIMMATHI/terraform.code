# module "recoveryservice" {
#   source                                   = "../../modules/recovery_service_vault"
#   recovery_services_vault_name             = "rsv-usc-${lower(var.application_acronym)}-${lower(var.environment_acronym)}"
#   resource_group_location                  = module.mathworks_rg_shared.resource_group_location
#   resource_group_name                      = module.mathworks_rg_shared.resource_group_name
#   recovery_services_protection_policy_name = "rsp-usc-${lower(var.application_acronym)}-${lower(var.environment_acronym)}backup-policy-daily"
#   soft_delete_enabled                      = true
#   tags                                     = var.tags
# }

module "recoveryservicevault" {
  source                                   = "../../modules/recovery_service_vault"
  recovery_services_vault_name             = "rsv-${var.location_acronym}-${lower(var.application_acronym)}-${var.environment_acronym}"
  resource_group_location                  = module.mathworks_rg_shared.resource_group_location
  resource_group_name                      = module.mathworks_rg_shared.resource_group_name
  recovery_services_protection_policy_name = "rsp-${var.location_acronym}-${lower(var.application_acronym)}-${lower(var.environment_acronym)}-backup-policy-daily"
  soft_delete_enabled                      = true
  tags                                     = var.tags
}