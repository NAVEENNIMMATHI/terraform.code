subscription_id = "3507153c-e6a4-4e2f-ae04-f34c1fd4482f"
client_id       = "e0628e55-2ee3-4131-8fdd-330265aed576"
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"

#Secrets
admin_password                          = ""
client_secret                           = ""
sql_server_admin_password               = ""
shared_state_storage_account_access_key = ""

tags = {
  Environment     = "Development"
  LOB             = "Deal Advisory & Strategy"
  Node            = "Spoke"
  Platform        = "Azure Commercial Cloud"
  Solution        = "Environment & Social Goverance (ESG)"
  BusinessContact = "craigschuh@kpmg.com"
  BusinessOwner   = "Craig Schuh"
}

application_acronym = "esg"
application_name = "blueprint"
location_acronym    = "use"
location            = "eastus"
environment_acronym = "dv"
environment         = "development"

#Shared State Configuration
shared_state_storage_account_name           = "stousecommon3507153c"
shared_state_storage_account_container_name = "terraformstatecontainer"
shared_state_storage_account_blob_key_name  = "iac-acc-shared-das.dv.tfstate"


#App Service Environment
app_service_environment_name = "webuscdasharedDEV01"

#Network and Subnets
dns_servers = ["10.1.11.4", "10.1.11.5"]

#Private DNS
pvt_dns_subscription_id            = "c72acede-d539-45d9-963d-3464ec4ddae0"
pvt_dns_environment_acronym        = "dv"

#Application Gateway
app_gateway_environment_acronym  = "Dev"
application_gateway_sku_name     = "WAF_Medium"
application_gateway_sku_tier     = "WAF"
application_gateway_sku_capacity = "2"
ase_internal_ip                  = "10.51.16.11"
backend_cer_cert_name            = "kpmgcloudops.com"
frontend_pfx_cert_name           = "esgdev.kpmgcloudops.com"
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

#Environment Settings
restrict_gateway_endpoint = "false"
###Below Block needs to be commented out while creating the variable file for UAT or Production Environment
app_gateway_backend_info = {
  port            = 443
  request_timeout = 30
}

#Ad Application
esgApplicationName     = "esgDevApplication"
esgrestApplicationName = "esgrestDevApplication"
tenant_fqdn = "kpmgusadvspectrum.onmicrosoft.com"
# sql_assignment_guid = "712c5a15-36d2-4dc2-9da7-f1ca2be31528" ## no longer required as this is generated by random_guid terraform block