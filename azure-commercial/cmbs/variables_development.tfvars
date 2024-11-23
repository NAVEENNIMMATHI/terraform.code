# Backend Variables
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"
subscription_id = "57fad7dc-7eeb-4a2c-b3b7-405d9f8d3cc8"
client_id       = "c79c197f-2835-49dc-846a-06644d7f10c4"
client_secret   = ""

location            = "eastus"
location_acronym    = "use"
application_acronym = "cmbs"
environment         = "dev"
environment_acronym = "dev"
function_env        = "dev"

tags = {
  BusinessOwner    = "Melissa Garfinkel"
  BusinessContact  = "mvangelder@kpmg.com"
  Environment      = "Development"
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

ase_name                     = "ase-use-dvapp-dv"
sharedrg_resource_group_name = "RGP-USE-ASE-DV"


# Application Gateway Variables

cmbs_appgateway_subnet_address_prefix = "" /* This will come from remote state for QA  hence kept blank here*/
app_gateway_hostname                  = "cmbsdev.kpmgcloudops.com"
agw_cert_name                         = "cmbsdev-kpmgcloudops-com-cer"
agw_cert_pfx                          = "cmbsdev.kpmgcloudops.com.pfx"
app_gateway_certpfx_password          = ""
agw_cert_cer                          = "kpmgcloudops.com.cer"
ase_internal_ip                       = "10.50.0.11"


# SQL Server 

sqlserveradmin_password          = ""
dbedition                        = "Standard"
requested_service_objective_name = "S0"


# Private Link Variables

shared_vnet_name                           = "vnt-use-ase-dv"
shared_resource_group_name                 = "RGP-USE-ASE-dV"
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
shared_state_storage_account_name          = "stousecommon57fad7dc"
shared_state_storage_account_blob_key_name = "iac-acc-shared-ras.dv.tfstate"
shared_state_storage_account_access_key    = ""


# Storage Account

agent_subnet_id    = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/co-dv-eastus-infra1-subnet"
wvd_subnet_id      = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"
core_aks_subnet_id = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/sub-use-core-aks-dv"

client_keyvault_admin_name = "CO-RAS-KeyVault-Admins-DV"
automation_sp_name = "ama-use-automation-runbook-dv_WygJB+wHaaazaaEs0AAGyQ5t8AveFj3EUyiU+8pwz7o="