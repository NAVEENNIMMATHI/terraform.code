#Root
subscription_id = "adf88b05-d3d7-4dee-ba30-ea939f9a1b1c"
client_id       = "76ea9629-a4e1-4a9a-ba2f-39840e53342a"
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"
client_secret   = ""

#Core
coresubscriptionid        =  "5ce45d57-3192-4bfe-9c2f-cb567b30c586"
corevnetresourcegroup     =  "RGP-USE-COREVNET-QA"
corevnetname              =  "vnt-use-core-qa"
transitsubscriptionid     =  "4cdcf904-fa57-4815-8cb3-e33b9b44f479"
transitvnetresourcegroup  =  "co-np-eastus-core1-rg"
transitvnetname           =  "co-np-eastus-core1-vnet"

#ResourceGroup
application_acronym = "rri"
application_name    = "RRI"
location_acronym    = "use"
location            = "eastus"
environment_acronym = "qa"
environment         = "qa"

tags = {
  Environment     = "QA"
  LOB             = "Deal Advisory & Strategy"
  Node            = "Spoke"
  Platform        = "Azure Commercial Cloud"
  Solution        = "Recurring Revenue Insights (RRI)"
  BusinessContact = "craigschuh@kpmg.com"
  BusinessOwner   = "Craig Schuh"
}

#Shared State Configuration
shared_state_storage_account_name           = "stousecommonadf88b05"
shared_state_storage_account_container_name = "terraformstatecontainer"
shared_state_storage_account_blob_key_name  = "iac-acc-shared-das.qa.tfstate"
shared_state_storage_account_access_key     = ""

#App Service Environment
app_service_environment_name = "webuscdasharedQA01"

#Network and Subnets
dns_servers = [
    "10.1.11.4",
    "10.1.11.5"
  ]
address_space                  = ["10.71.67.0/24"]
subnet_name_db_address_space   = ["10.71.67.0/27"]
subnet_name_pbi_address_space  = ["10.71.67.32/27"]
subnet_name_mgt_address_space  = ["10.71.67.64/27"]
subnet_name_web_address_space  = ["10.71.67.96/27"]
subnet_name_apgw_address_space = ["10.71.67.128/27"]

#Private DNS
pvt_dns_subscription_id     = "c72acede-d539-45d9-963d-3464ec4ddae0"
pvt_dns_environment_acronym = "dv"

#Sql Server
sql_server_admin_password = ""
sql_edition               = "Standard"
sql_size                  = "S0"

#Application Gateway
app_gateway_environment_acronym  = "qa"
application_gateway_sku_name     = "WAF_Medium"
application_gateway_sku_tier     = "WAF"
application_gateway_sku_capacity = "2"
ase_internal_ip                  = "10.71.16.11"
backend_cer_cert_name            = "kpmgcloudops.com"
frontend_pfx_cert_name           = "rriqa.kpmgcloudops.com"
frontend_pfx_cert_password       = ""

#AD Groups
encryptapp_sp_name                 = "EncryptApp"
cloudops_keyvault_admin_group_name = "CO-Certificate-KeyVault"
client_keyvault_admin_group_name   = "CO-DA-KeyVault-Admins"

#StorageAccount
storage_account_account_replication_type = "LRS"
agent_subnet_id                          = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-infra1-qa"
wvd_subnet_id                            = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"
core_aks_subnet_id                       = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-core-aks-qa"
storage_account_container_name           = "admin"

#Environment Settings
restrict_gateway_endpoint = "false"
###Below Block needs to be commented out while creating the variable file for UAT or Production Environment
app_gateway_backend_info = {
  port            = 443
  request_timeout = 30
}

#Ad Application
rriApplicationName      = "rriQaApplication"
rriRestApplicationName  = "rriRestQaApplication"
tenant_fqdn             = "kpmgusadvspectrum.onmicrosoft.com"

#Route Table Variables
AzureFirewallIPAddress = "10.101.2.196"

#Virtual Machines
vmPbi_Size      = "Standard_D2s_v3"
vmMgt_Size      = "Standard_D2s_v3"
admin_password  = ""
