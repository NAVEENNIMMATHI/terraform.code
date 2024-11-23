###########################
# East US Resource Groups #
###########################

resource "azurerm_resource_group" "hubvnet" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-hubvnet-rg" : "RGP-${upper(var.location_acronym)}-COREVNET-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "rds" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-${var.environment == "production" ? "rds" : "rda"}-rg" : "RGP-${upper(var.location_acronym)}-RDA-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "mfa" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-mfa-rg" : "RGP-${upper(var.location_acronym)}-MFA-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "bstnhosts" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-bstnhosts-rg" : "RGP-${upper(var.location_acronym)}-BSTNHOSTS-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

# resource "azurerm_resource_group" "aadds" {
#   name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-aadds-rg" : "RGP-${upper(var.location_acronym)}-AADDS-${upper(var.environment_acronym)}"
#   location = var.location

#   tags = var.tags
# }

resource "azurerm_resource_group" "loganalytics" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-loganalytics-rg" : "RGP-${upper(var.location_acronym)}-LOGANALYTICS-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "backuprecovery" {
  name     =(var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-backuprecovery-rg" : "RGP-${upper(var.location_acronym)}-BACKUPRECOVERY-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "backuprecoveryrgp" {
  name     = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-BACKUPRECOVERY-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "palofwcore" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-palofwcore-rg" : "RGP-${upper(var.location_acronym)}-PALOFWCORE-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "networkwatcher" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "NetworkWatcherRG" : "RGP-${upper(var.location_acronym)}-NETWORKWATCHER-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "opscore" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-opscore-rg" : "RGP-${upper(var.location_acronym)}-OPSCORE-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "smtp" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-smtp-rg" : "RGP-${upper(var.location_acronym)}-SMTP-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "pentest" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-pentest-rg" : "RGP-${upper(var.location_acronym)}-PENTEST-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "co-p-eastus-DSG-PIP-scraper-rg" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-DSG-PIP-scraper-rg" : "RGP-${upper(var.location_acronym)}-DSGPIPSCRAPER-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "AzureBackupRG_eastus_1" {
  name     = "AzureBackupRG_eastus_1"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "cloud-shell-storage-centralindia" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "cloud-shell-storage-centralindia" : "RGP-INC-CLOUDSHELLSTORAGE-${upper(var.environment_acronym)}"
  location = "centralindia"

  tags = var.tags
}

resource "azurerm_resource_group" "cloud-shell-storage-eastus" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "cloud-shell-storage-eastus" : "RGP-USE-CLOUDSHELLSTORAGE-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "CO-P-eastus-artifacts-rg" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-artifacts-rg" : "RGP-${upper(var.location_acronym)}-ARTIFACTS-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "CO-P-eastus-CoreQualys" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-CoreQualys" : "RGP-${upper(var.location_acronym)}-COREQUALYS-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "CO-P-eastus-kdr-rg" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-kdr-rg" : "RGP-${upper(var.location_acronym)}-KDR-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "co-p-eastus-terraformfiles-rg" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-terraformfiles-rg" : "RGP-${upper(var.location_acronym)}-TERRAFORMFILES-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "dashboards" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "dashboards" : "RGP-USE2-DASHBOARDS-${upper(var.environment_acronym)}"
  location = "eastus2"

  tags = var.tags
}

resource "azurerm_resource_group" "jayantabanerjee_rg" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "jayantabanerjee_rg" : "RGP-${upper(var.location_acronym)}-JAYANTABANERJEE-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "VS-co-p-azurecore-Group" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "VS-co-p-azurecore-Group" : "RGP-USC-VSAZURECORE-${upper(var.environment_acronym)}"
  location = "centralus"

  tags = var.tags
}

resource "azurerm_resource_group" "wsus" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-wsus-rg" : "RGP-${upper(var.location_acronym)}-WSUS-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "panorama" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-panorama-rg" : "RGP-${upper(var.location_acronym)}-PANORAMA-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags_Networking
}

resource "azurerm_resource_group" "wvd" {
  count    = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? 1 : 0

  name     = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-WVD-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "netapp" {
  count    = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? 1 : 0

  name     = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-NETAPP-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "packer" {
  name     = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-PACKER-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags_NodeMgmt
}

/*
resource "azurerm_resource_group" "aks" {}
*/
## Moved to Core-AKS folder ##

resource "azurerm_resource_group" "imagegallery" {

  
  name     = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-SIG-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags_NodeMgmt
}

###########################
# West US Resource Groups #
###########################

resource "azurerm_resource_group" "wuhubvnet" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location_dr}-hubvnet-rg" : "RGP-${upper(var.location_dr_acronym)}-COREVNET-${upper(var.environment_acronym)}"
  location = var.location_dr

  tags = var.tags
}

resource "azurerm_resource_group" "vmimage" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-vmimage-rg" : "RGP-${upper(var.location_acronym)}-VMIMAGE-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "wuvmimage" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location_dr}-vmimage-rg" : "RGP-${upper(var.location_dr_acronym)}-VMIMAGE-${upper(var.environment_acronym)}"
  location = var.location_dr

  tags = var.tags
}

resource "azurerm_resource_group" "wuloganalytics" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location_dr}-loganalytics-rg" : "RGP-${upper(var.location_dr_acronym)}-LOGANALYTICS-${upper(var.environment_acronym)}"
  location = var.location_dr

  tags = var.tags
}

resource "azurerm_resource_group" "wubackuprecovery" {
  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location_dr}-backuprecovery-rg" : "RGP-${upper(var.location_dr_acronym)}-BACKUPRECOVERY-${upper(var.environment_acronym)}"
  location = var.location_dr

  tags = var.tags
}

resource "azurerm_resource_group" "drhubvnetrg" {
  name     =  "rgp-${var.location_dr_acronym}-hubvnet-${var.environment_acronym}" 
  location = var.location_dr

  tags = var.tags_dr
}