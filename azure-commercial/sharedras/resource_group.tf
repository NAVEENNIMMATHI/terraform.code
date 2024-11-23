module "sharedrg" {
  source                  = "../../modules/resource_group"
  resource_group_name     = "RGP-${upper(var.location_acronym)}-ASE-${upper(var.environment_acronym)}"
  resource_group_location = "eastus"
  tags                    = var.tags
}

module "backuprecoveryrgp" {
  source                  = "../../modules/resource_group"
  resource_group_name     = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-BACKUPRECOVERY-${upper(var.environment_acronym)}"
  resource_group_location = "eastus"

  tags = var.tags
}

resource "azurerm_resource_group" "AzureBackupRG_eastus_1" {
  name     = "AzureBackupRG_eastus_1"
  location = "eastus"

  tags = var.tags
}