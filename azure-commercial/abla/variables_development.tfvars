subscription_id 								= "3507153c-e6a4-4e2f-ae04-f34c1fd4482f"
client_id       								= "e0628e55-2ee3-4131-8fdd-330265aed576"
tenant_id       								= "188697ab-840f-44ec-8535-aaaa5680bab0"

#Secrets
admin_password = ""
client_secret   = ""
sql_server_admin_password = ""
shared_state_storage_account_access_key = ""
uniqueguid = "37c3aefe-b9f9-4a15-a0b8-76b4e26bdd8d"

tags = {
	Environment =                 "Development"
	LOB	=                         "Deal Advisory & Strategy"
	Node =                        "Spoke"
	Platform =                    "Azure Commercial Cloud"
	Solution =                    "Asset Based Lending Automation (ABLA)"
	#BusinessContact =             "adamwerner@kpmg.com"
	#BusinessOwner =               "Adam S Werner"
}

application_acronym 		= "abla"
location_acronym 			= "use"
location 					= "eastus"
environment_acronym 		= "dv"

#Shared State Configuration

shared_state_storage_account_name = "stousecommon3507153c"
shared_state_storage_account_container_name = "terraformstatecontainer"
shared_state_storage_account_blob_key_name = "iac-acc-shared-das.dv.tfstate"


#App Service Environment

app_service_environment_name = "webuscdasharedDEV01"

#Network and Subnets
dns_servers = ["10.1.11.4","10.1.11.5"]

#Application Gateway

app_gateway_environment_acronym = "Dev"
application_gateway_sku_name = "WAF_Medium"
application_gateway_sku_tier = "WAF"
application_gateway_sku_capacity = "2"
ase_internal_ip = "10.51.16.11"
backend_cer_cert_name = "kpmgcloudops.com"
frontend_pfx_cert_name = "abladev.kpmgcloudops.com"
frontend_pfx_cert_password = ""

#AD Groups
encryptapp_sp_name = "EncryptApp"
cloudops_keyvault_admin_group_name = "CO-Certificate-KeyVault"
client_keyvault_admin_group_name = "CO-DA-KeyVault-AdminsDEV"

#StorageAccount
agent_subnet_id = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/co-dv-eastus-infra1-subnet"
wvd_subnet_id = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"

#Environment Settings

restrict_gateway_endpoint = "false"
###Below Block needs to be commented out while creating the variable file for UAT or Production Environment
app_gateway_backend_info = {
	port = 443
	request_timeout = 30
}

#Ad Application

tenant_fqdn = "kpmgusadvspectrum.onmicrosoft.com"