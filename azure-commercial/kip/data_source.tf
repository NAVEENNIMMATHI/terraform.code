data "azurerm_client_config" "current" {
}

data "azurerm_subscription" "current" {
}

provider "azurerm" {
  alias               = "shared"
  subscription_id     = var.vmimagesubscriptionid
  client_id           = var.client_id
  client_secret       = var.client_secret
  tenant_id           = var.tenant_id
  features {}
}

data "template_file" "ps1" {
  template            = file("win_initialise_data_disk.ps1")
}

data "azuread_service_principal" "encryptappsp" {
  display_name        = var.encryptapp_service_principal_name
}

data "azuread_service_principal" "backupmanagementservicesp" {
  display_name        = "Backup Management Service"
}

# data "azuread_group" "RDPUsers" {
#   name                = azuread_group.RDPUsers.name
# }

data "azurerm_role_definition" "contributor" {
  name                = "Contributor"
}

#Managed Identities for App Services
data "azuread_service_principal" "kip_sp" {
  count        = var.environment == "production" ? 1 : 0

  display_name = "kip"
}

data "azuread_service_principal" "kiprest_sp" {
  count        = var.environment == "production" ? 1 : 0

  display_name = "kiprest"
}

data "azuread_service_principal" "mep-kip_sp" {
  count        = var.environment == "production" ? 1 : 0

  display_name = "mep-kip"
}

data "azuread_service_principal" "meprest-kip_sp" {
  count        = var.environment == "production" ? 1 : 0

  display_name = "meprest-kip"
}

data "azuread_service_principal" "functionapp_prod_sp" {
  count        = var.environment == "production" ? 1 : 0
  
  display_name = "fun-use-kip-pd"
}

#Managed Identity for Windows Services VM
data "azuread_service_principal" "windows_services_vm_sp" {
  #display_name        = var.windows_services_vm_name
  object_id = var.windows_services_vm_name
}

####Private DNS Zone#####
data "azurerm_private_dns_zone" "storage_private_link_file" {
  name                = "privatelink.file.core.windows.net"
  resource_group_name = var.private_dns_zone_resource_group
  provider            = azurerm.dnscore
}

####Private DNS Zone#####
data "azurerm_private_dns_zone" "sql"{
  name = "privatelink.database.windows.net"
  resource_group_name = "rgp-use-core-private-dnszone-${var.pvt_dns_environment_acronym}" # DEV/QA & UAT/PD share a DNS Zone with each other
  provider            = azurerm.pvt_dns_subscription
}

#ArcGIS Private Endpoint Subnet for Datalake Storage
data "azurerm_subnet" "arcgis_pep_subnet" {
  name                 = var.pep_subnet_name
  virtual_network_name = var.gis_vnet_name
  resource_group_name  = var.gis_vnet_rg_name
}