#Root
subscription_id = "3507153c-e6a4-4e2f-ae04-f34c1fd4482f"
client_id       = "e0628e55-2ee3-4131-8fdd-330265aed576"
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"
client_secret   = ""

#Core
coresubscriptionid       =  "c72acede-d539-45d9-963d-3464ec4ddae0"
corevnetresourcegroup    =  "CO-dv-eastus-hubvnet-rg"
corevnetname             =  "CO-dv-eastus-hub-vnet"
transitsubscriptionid    =  "4cdcf904-fa57-4815-8cb3-e33b9b44f479"
transitvnetresourcegroup =  "co-np-eastus-core1-rg"
transitvnetname          =  "co-np-eastus-core1-vnet"

#ResourceGroup
application_acronym = "rri"
application_name    = "RRI"
location_acronym    = "use"
location            = "eastus"
environment_acronym = "dv"
environment         = "development"

tags = {
  Environment     = "Development"
  LOB             = "Deal Advisory & Strategy"
  Node            = "Spoke"
  Platform        = "Azure Commercial Cloud"
  Solution        = "Recurring Revenue Insights (RRI)"
  BusinessContact = "craigschuh@kpmg.com"
  BusinessOwner   = "Craig Schuh"
}

#Shared State Data Sources
shared_state_storage_account_name           = "stousecommon3507153c"
shared_state_storage_account_container_name = "terraformstatecontainer"
shared_state_storage_account_blob_key_name  = "iac-acc-shared-das.dv.tfstate"
shared_state_storage_account_access_key     = ""

#App Service Environment
app_service_environment_name = "webuscdasharedDEV01"

#Network and Subnets
dns_servers = [
    "10.1.11.4",
    "10.1.11.5"
  ]
address_space                  = ["10.51.67.0/24"]
subnet_name_db_address_space   = ["10.51.67.0/27"]
subnet_name_pbi_address_space  = ["10.51.67.32/27"]
subnet_name_mgt_address_space  = ["10.51.67.64/27"]
subnet_name_web_address_space  = ["10.51.67.96/27"]
subnet_name_apgw_address_space = ["10.51.67.128/27"]

#Private DNS
pvt_dns_subscription_id     = "c72acede-d539-45d9-963d-3464ec4ddae0"
pvt_dns_environment_acronym = "dv"

#Sql Server
sql_server_admin_password = ""
sql_edition               = "Standard"
sql_size                  = "S0"

#Application Gateway
app_gateway_environment_acronym  = "dev"
application_gateway_sku_name     = "WAF_Medium"
application_gateway_sku_tier     = "WAF"
application_gateway_sku_capacity = "2"
ase_internal_ip                  = "10.51.16.11"
backend_cer_cert_name            = "kpmgcloudops.com"
frontend_pfx_cert_name           = "rridev.kpmgcloudops.com"
frontend_pfx_cert_password       = ""

#AD Groups
encryptapp_sp_name                 = "EncryptApp"
cloudops_keyvault_admin_group_name = "CO-Certificate-KeyVault"
client_keyvault_admin_group_name   = "CO-DA-KeyVault-Admins"

#StorageAccount
storage_account_account_replication_type = "LRS"
agent_subnet_id                          = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/co-dv-eastus-infra1-subnet"
wvd_subnet_id                            = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"
core_aks_subnet_id                       = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/sub-use-core-aks-dv"
storage_account_container_name           = "admin"

#Environment Settings
restrict_gateway_endpoint = "false"
###Below Block needs to be commented out while creating the variable file for UAT or Production Environment
app_gateway_backend_info = {
  port            = 443
  request_timeout = 30
}

#Ad Application
rriApplicationName     = "rriDevApplication"
rriRestApplicationName = "rriRestDevApplication"
tenant_fqdn            = "kpmgusadvspectrum.onmicrosoft.com"

#Route Table Variables
AzureFirewallIPAddress = "10.6.24.4"

#Virtual Machines
admin_password  = ""
vmPbi_Size      = "Standard_D2s_v3"
vmMgt_Size      = "Standard_D2s_v3"
