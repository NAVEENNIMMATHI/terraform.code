# Backend Variables
subscription_id = "96e9a7e6-da33-4993-89ca-b82e0b571aee"
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"
client_id       = "65d6e9b3-65b7-42b9-9f30-89d6a33becf8"
client_secret   = ""

location            = "eastus"
location_acronym    = "use"
application_acronym = "cmbs"
environment         = "qa"
environment_acronym = "qa"
function_env        = "qa"

tags = {
  BusinessOwner    = "Melissa Garfinkel"
  BusinessContact  = "mvangelder@kpmg.com"
  Environment      = "QA"
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

ase_name                     = "ase-use-qaapp-qa"
sharedrg_resource_group_name = "RGP-USE-ASE-QA"


# Application Gateway Variables

cmbs_appgateway_subnet_address_prefix = "" /* This will come from remote state for QA  hence kpet blank here*/
app_gateway_hostname                  = "cmbsqa.kpmgcloudops.com"
agw_cert_name                         = "cmbsqa-kpmgcloudops-com-cer"
agw_cert_pfx                          = "cmbsqa.kpmgcloudops.com.pfx"
app_gateway_certpfx_password          = ""
agw_cert_cer                          = "kpmgcloudops.com.cer"
ase_internal_ip                       = "10.70.0.11"


# SQL Server 

sqlserveradmin_password          = ""
dbedition                        = "Basic"
requested_service_objective_name = "Basic"


# Private Link Variables

shared_vnet_name                           = "vnt-use-ase-np"
shared_resource_group_name                 = "RGP-USE-ASE-NP"
cmbs_privateendpoint_subnet_address_prefix = "" /* This will come from remote state for QA hence kept blank here */


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
shared_state_storage_account_name          = "stousecommon96e9a7e6"
shared_state_storage_account_blob_key_name = "iac-acc-shared-ras.qa.tfstate"
shared_state_storage_account_access_key    = ""


# Storage Account

agent_subnet_id    = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-infra1-qa"
wvd_subnet_id      = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"
core_aks_subnet_id = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-core-aks-qa"

client_keyvault_admin_name = "CO-RAS-KeyVault-Admins-QA"

automation_sp_name = "ama-use-automation-runbook-dv_WygJB+wHaaazaaEs0AAGyQ5t8AveFj3EUyiU+8pwz7o="