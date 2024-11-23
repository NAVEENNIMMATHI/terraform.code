subscription_id = "b75fc3c3-04a4-45a6-b126-8279f505e873"
client_id       = "9975dc86-7489-483c-b49c-47bdff5e2eb8"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

#Secrets
admin_password                          = ""
client_secret                           = ""
sql_server_admin_password               = ""
shared_state_storage_account_access_key = ""

tags = {
  Environment     = "UAT"
  LOB             = "Deal Advisory & Strategy"
  Node            = "Spoke"
  Platform        = "Azure Commercial Cloud"
  Solution        = "Environment & Social Goverance (ESG)"
  BusinessContact = "craigschuh@kpmg.com"
  BusinessOwner   = "Craig Schuh"
}

application_acronym = "esg"
application_name    = "blueprint"
location_acronym    = "use"
location            = "eastus"
environment_acronym = "uat"
environment         = "uat"

#Shared State Configuration
shared_state_storage_account_name           = "stousecommonb75fc3c3"
shared_state_storage_account_container_name = "terraformstatecontainer"
shared_state_storage_account_blob_key_name  = "iac-acc-shared-das.uat.tfstate"


#App Service Environment
app_service_environment_name = "webuscdasharedUT01"

#Network and Subnets
dns_servers = ["10.1.11.4", "10.1.11.5"]

#Private DNS
pvt_dns_subscription_id            = "4c9dc048-01dc-4854-9063-8a3d4060993a"
pvt_dns_environment_acronym        = "pd"

#Application Gateway
app_gateway_environment_acronym  = "uat"
application_gateway_sku_name     = "WAF_Medium"
application_gateway_sku_tier     = "WAF"
application_gateway_sku_capacity = "2"
ase_internal_ip                  = "10.51.16.11"
backend_cer_cert_name            = "kpmgcloudops.com"
frontend_pfx_cert_name           = "esguat.kpmgcloudops.com"
frontend_pfx_cert_password       = ""

#AD Groups
encryptapp_sp_name                 = "spn-devops-b75fc3c3"
cloudops_keyvault_admin_group_name = "CO-TerraformStorage-Admin"
client_keyvault_admin_group_name   = "CO-DA-KeyVault-AdminsUAT"

#StorageAccount
storage_account_account_replication_type = "LRS"
agent_subnet_id                          = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-infra1-uat"
wvd_subnet_id                            = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"
core_aks_subnet_id                       = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-core-aks-uat"

#Environment Settings
restrict_gateway_endpoint = "true"
###Below Block needs to be commented out while creating the variable file for UAT or Production Environment
#app_gateway_backend_info = {
#	port = 443
#	request_timeout = 30
#}

#Ad Application
esgApplicationName     = "esgUATApplication"
esgrestApplicationName = "esgrestUATApplication"
tenant_fqdn            = "kpmgusadvcloudops.onmicrosoft.com"
#sql_assignment_guid    = "94638959-428e-4659-a4aa-634733b59bd6" ## no longer required as this is generated by random_guid terraform block