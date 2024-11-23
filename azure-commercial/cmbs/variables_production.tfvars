# Backend Variables
subscription_id = "5d3ae075-2601-49d3-9223-892e3d7f6fb1"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"
client_id       = "089028a6-c23d-4854-8ecf-2ed345a8b1bf"
client_secret   = ""

location_acronym    = "use"
application_acronym = "cmbs"
environment_acronym = "pd"
location            = "eastus"
environment         = "production"
function_env        = ""

tags = {
  BusinessOwner    = "Melissa Garfinkel"
  BusinessContact  = "mvangelder@kpmg.com"
  Environment      = "Production"
  Instance         = "0001"
  LOB              = "Risk Advisory Solutions"
  Platform         = "Azure Commercial Cloud"
  Solution         = "Commercial Mortgage Backed Securities (CMBS)"
  Node             = "Spoke"
  TechnicalOwner   = "Sanooj Ramachandran"
  TechnicalContact = "sramachandran@kpmg.com"
  Version          = "1.0"
  Datadog          = "Monitored"
}


# App Service Plan

app_service_plan_size = "I3"


# App insight

ase_name                     = "ase-use-npapp-pd"
sharedrg_resource_group_name = "RGP-USE-ASE-PD"


# Application Gateway Variables

cmbs_appgateway_subnet_address_prefix = "" /* This will come from remote state for QA  hence kept blank here*/
app_gateway_hostname                  = "cmbs.kpmgcloudops.com"
agw_cert_name                         = "cmbs-kpmgcloudops-com-cer"
agw_cert_pfx                          = "cmbs.kpmgcloudops.com.pfx"
app_gateway_certpfx_password          = ""
agw_cert_cer                          = "kpmgcloudops.com.cer"
ase_internal_ip                       = "10.4.16.11"


# SQL Server 

sqlserveradmin_password          = ""
dbedition                        = "Basic"
requested_service_objective_name = "Basic"


# Private Link Variables

shared_vnet_name                           = "vnt-use-ase-pd"
shared_resource_group_name                 = "RGP-USE-ASE-PD"
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
shared_state_resource_group_name           = "RGP-USE-BASE5D3AE075-PD"
shared_state_storage_account_name          = "stousebase5d3ae075"
shared_state_storage_account_blob_key_name = "iac-acc-shared-ras.pd.tfstate"
shared_state_storage_account_access_key    = ""


# Storage Account

agent_subnet_id    = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/co-p-eastus-infra1-subnet"
wvd_subnet_id      = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"
core_aks_subnet_id = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/sub-use-core-aks-pd"

client_keyvault_admin_name = "CO-RAS-KeyVault-AdminsPD"
automation_sp_name = "ama-use-automation-runbook-p_dL/gAC1KqE1CZ7cI1qwRyIS55Uy6DfQzylPiC9mfOqE="