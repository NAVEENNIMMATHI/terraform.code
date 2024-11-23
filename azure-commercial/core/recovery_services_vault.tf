####################################
# East US Recovery Services Vaults #
####################################

resource "azurerm_recovery_services_vault" "hub" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "${var.recovery_services_vault_name}${var.unique_variable_suffix}" : "rsv-${var.location_acronym}-core01-${var.environment_acronym}"
  location            = azurerm_resource_group.backuprecovery.location
  resource_group_name = azurerm_resource_group.backuprecovery.name
  sku                 = "standard"

  tags = var.tags
}

module "recoveryservicevault" {
  source                                   = "../../modules12/recovery_service_vault"
  recovery_services_vault_name             = "rsv-${var.location_acronym}-${lower(var.application_acronym)}-${var.environment_acronym}"
  resource_group_location                  = azurerm_resource_group.backuprecoveryrgp.location
  resource_group_name                      = azurerm_resource_group.backuprecoveryrgp.name
  recovery_services_protection_policy_name = "rsp-${var.location_acronym}-${lower(var.application_acronym)}-${lower(var.environment_acronym)}-vm-backup-policy-daily"
  soft_delete_enabled                      = true
  tags                                     = var.tags
}


####################################
# West US Recovery Services Vaults #
####################################

resource "azurerm_recovery_services_vault" "wuhub" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "${var.wu_recovery_services_vault_name}${var.unique_variable_suffix}" : "rsv-${var.location_dr_acronym}-core01-${var.environment_acronym}"
  location            = azurerm_resource_group.wubackuprecovery.location
  resource_group_name = azurerm_resource_group.wubackuprecovery.name
  sku                 = "standard"

  tags = var.tags
}
