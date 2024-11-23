locals {

  rg-default-location = "${var.application_rg_location}"

  rg-application-name = "co-${var.environment}-${var.application_rg_location}-${var.application_acronym}-rg"  
  
  rg-backuprecovery-name = "co-${var.environment}-${var.application_rg_location}-${var.application_acronym}-backuprecovery-rg"
  
  rg-log-analytics-name = "co-${var.environment}-${var.application_rg_location}-${var.application_acronym}-loganalytics-rg"

  rg-governance-name = "RGP-USE-AZCOP"

  tag-default = {
    Environment  = "Sandbox"
    Node         = "Spoke"
    Platform     = "Azure Commercial Cloud"
	  Solution = "Cloudneeti POC"
  }

  availability-set-default-name = "co${var.environment}${var.application_rg_location}${var.application_acronym}-as"

  virtual-network-application-name = "co-${var.environment}-${var.application_rg_location}-${var.application_acronym}-vnet"

  storage-account-vm-diagnostics-name = "co${var.environment}${var.resource_location}${var.application_acronym}sad02"

  public-ip-bastion-name = "co${var.environment}${var.application_rg_location}${var.application_acronym}-pip"

  storage-account-terraform-name = "stouseazcop70651883"
}