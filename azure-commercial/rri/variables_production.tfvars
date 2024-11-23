#Root
subscription_id = "9e27f52c-3c97-4fda-9c8f-eadcd0ad195a"
client_id       = "b2967f11-d801-4812-b532-3f3a676e8b46"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"
client_secret   = ""

#Core
coresubscriptionid       =  "4c9dc048-01dc-4854-9063-8a3d4060993a"
corevnetresourcegroup    =  "CO-P-eastus-hubvnet-rg"
corevnetname             =  "CO-P-eastus-hub-vnet"
transitsubscriptionid    =  "0d7a7f3c-a15d-4d37-924c-2507147fb74c"
transitvnetresourcegroup =  "CO-P-eastus-transitvnet-rg"
transitvnetname          =  "CO-P-eastus-transit-vnet"

#ResourceGroup
application_acronym = "rri"
application_name    = "RRI"
location_acronym    = "use"
location            = "eastus"
environment_acronym = "pd"
environment         = "production"

tags = {
  Environment     = "Production"
  LOB             = "Deal Advisory & Strategy"
  Node            = "Spoke"
  Platform        = "Azure Commercial Cloud"
  Solution        = "Recurring Revenue Insights (RRI)"
  BusinessContact = "craigschuh@kpmg.com"
  BusinessOwner   = "Craig Schuh"
  Datadog         = "Monitored"
}

#Shared State Data Sources
shared_state_storage_account_name           = "stocoeusazcop9e27f52cprd"
shared_state_storage_account_container_name = "terraformstatecontainer"
shared_state_storage_account_blob_key_name  = "iac-acc-shared-das.pd.tfstate"
shared_state_storage_account_access_key     = ""

#App Service Environment
app_service_environment_name = "webuscdasharedPD01"

#Network and Subnets
dns_servers = [
  "10.30.15.196",
  "10.30.15.197"
  ]

address_space                  = ["10.91.67.0/24"]
subnet_name_db_address_space   = ["10.91.67.0/27"]
subnet_name_pbi_address_space  = ["10.91.67.32/27"]
subnet_name_mgt_address_space  = ["10.91.67.64/27"]
subnet_name_web_address_space  = ["10.91.67.96/27"]
subnet_name_apgw_address_space = ["10.91.67.128/27"]

#Private DNS
pvt_dns_subscription_id     = "4c9dc048-01dc-4854-9063-8a3d4060993a"
pvt_dns_environment_acronym = "pd"

#Sql Server
sql_server_admin_password = ""
sql_edition               = "Standard"
sql_size                  = "S0"

#Application Gateway
app_gateway_environment_acronym  = "pd"
application_gateway_sku_name     = "WAF_Medium"
application_gateway_sku_tier     = "WAF"
application_gateway_sku_capacity = "2"
ase_internal_ip                  = "10.33.16.11"
backend_cer_cert_name            = "kpmgcloudops.com"
frontend_pfx_cert_name           = "rri.kpmgcloudops.com"
frontend_pfx_cert_password       = ""

#AD Groups
encryptapp_sp_name                 = "spn-devops-9e27f52c"
cloudops_keyvault_admin_group_name = "CO-TerraformStorage-Admin"
client_keyvault_admin_group_name   = "CO-DA-KeyVault-AdminsPD"

#StorageAccount
storage_account_account_replication_type = "RAGRS"
agent_subnet_id                          = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/co-p-eastus-infra1-subnet"
wvd_subnet_id                            = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"
core_aks_subnet_id                       = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/sub-use-core-aks-pd"
storage_account_container_name           = "admin"

#Environment Settings
restrict_gateway_endpoint = "true"
###Below Block needs to be commented out while creating the variable file for UAT or Production Environment
#app_gateway_backend_info = {
#	port = 443
#	request_timeout = 30
#}

#Ad Application
rriApplicationName     = "rriPdApplication"
rriRestApplicationName = "rriRestPdApplication"
tenant_fqdn            = "kpmgusadvcloudops.onmicrosoft.com"

#Route Table Variables
AzureFirewallIPAddress = "10.30.3.4"

#Virtual Machines
vmPbi_Size      = "Standard_D2s_v3"
vmMgt_Size      = "Standard_D2s_v3"
admin_password  = ""
