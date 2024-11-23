resource "azurerm_recovery_services_vault" "recovery_services_vault" {
  name                = var.environment == "production" ? "${var.cloudops_global_prefix}-${var.environment_acronym}-${var.application_acronym}-rsv" : "rsv-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = var.environment == "production" ? "co-p-eastus-rstdbackuprecovery-rg" : module.backuprecoveryrg.resource_group_name
  location            = module.backuprecoveryrg.resource_group_location
  sku                 = "standard"
  soft_delete_enabled = true
  tags                = var.tags
}

resource "azurerm_backup_policy_vm" "policy_daily" {
  depends_on          = [azurerm_recovery_services_vault.recovery_services_vault]
  name                = "${var.application_acronym}nvmpolicy"
  resource_group_name = var.environment == "production" ? "co-p-eastus-rstdbackuprecovery-rg" : module.backuprecoveryrg.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.recovery_services_vault.name

  timezone = "UTC"

  backup {
    frequency = "Daily"
    time      = "02:00"
  }

  retention_daily {
    count = 30
  }

  retention_weekly {
    count    = 13
    weekdays = ["Sunday"]
  }

  retention_monthly {
    count    = 12
    weekdays = ["Sunday"]
    weeks    = ["First"]
  }
}