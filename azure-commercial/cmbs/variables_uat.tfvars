# Backend Variables
client_id       = "2216ff1e-a4a3-4139-95e9-b4b89e001457"
subscription_id = "104a6d25-89e7-4297-9d68-76c0443b2cf6"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"
client_secret   = ""

location            = "eastus"
location_acronym    = "use"
application_acronym = "cmbs"
environment         = "uat"
environment_acronym = "uat"
function_env        = "uat"

tags = {
  BusinessOwner    = "Melissa Garfinkel"
  BusinessContact  = "mvangelder@kpmg.com"
  Environment      = "UAT"
  Instance         = "0001"
  LOB              = "Risk Advisory Solutions"
  Platform         = "Azure Commercial Cloud"
  Solution         = "Commercial Mortgage Backed Securities (CMBS)"
  Node             = "Spoke"
  TechnicalOwner   = "Sanooj Ramachandran"
  TechnicalContact = "sramachandran@kpmg.com"
  Version          = "1.0"
}


# App Service Plan

app_service_plan_size = "I2"


# App insight

ase_name                     = "ase-use-sharedras-uat"
sharedrg_resource_group_name = "RGP-USE-ASE-UAT"


# Application Gateway Variables

cmbs_appgateway_subnet_address_prefix = "" /* This will come from remote state for QA  hence kept blank here*/
app_gateway_hostname                  = "cmbsuat.kpmgcloudops.com"
agw_cert_name                         = "cmbsuat-kpmgcloudops-com-cer"
agw_cert_pfx                          = "cmbsuat.kpmgcloudops.com.pfx"
app_gateway_certpfx_password          = ""
agw_cert_cer                          = "kpmgcloudops.com.cer"
ase_internal_ip                       = "10.50.0.11"


# SQL Server 

sqlserveradmin_password          = ""
dbedition                        = "Basic"
requested_service_objective_name = "Basic"


# Private Link Variables

shared_vnet_name                           = "vnt-use-ase-uat"
shared_resource_group_name                 = "RGP-USE-ASE-UAT"
cmbs_privateendpoint_subnet_address_prefix = ""


# NSG Variables

source_address_prefixes = [
  "65.55.132.0/24",
  "134.170.26.0/24",
  "65.55.135.0/24",
  "66.119.148.0/24",
  "104.44.113.0/24",
  "104.44.114.0/24",
  "104.44.249.0/25",
  "104.44.249.128/25",
  "13.106.108.0/25",
  "13.106.72.128/25",
  "13.88.20.122",
  "13.92.199.78",
  "13.107.6.169",
  "13.107.9.169"
]

# Shared State Configuration
/* this will have data from Shared RAS State File */
shared_state_resource_group_name           = "RGP-USE-COMMON"
shared_state_storage_account_name          = "stousecommon104a6d25"
shared_state_storage_account_blob_key_name = "iac-acc-shared-ras.uat.tfstate"
shared_state_storage_account_access_key    = ""


# Storage Account

agent_subnet_id    = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-infra1-uat"
wvd_subnet_id      = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"
core_aks_subnet_id = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-core-aks-uat"

client_keyvault_admin_name = "CO-RAS-KeyVault-Admins"

automation_sp_name = "ama-use-automation-runbook-p_dL/gAC1KqE1CZ7cI1qwRyIS55Uy6DfQzylPiC9mfOqE="

