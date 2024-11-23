module "recoveryservice"{
    source                                   = "../../modules/recovery_service_vault"
    recovery_services_vault_name             = "${var.recovery_services_vault_name}"
    resource_group_location                  = "${module.backuprecoveryrg.resource_group_location}"
    resource_group_name                      = "${module.backuprecoveryrg.resource_group_name}"
    recovery_services_protection_policy_name = "${var.recovery_services_protection_policy_name}"
    tags                                     = "${var.tags}"
}