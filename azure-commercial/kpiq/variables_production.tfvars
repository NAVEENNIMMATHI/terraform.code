subscription_id = "9e27f52c-3c97-4fda-9c8f-eadcd0ad195a"
client_id       = "b2967f11-d801-4812-b532-3f3a676e8b46"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

#Secrets
admin_password = ""
client_secret   = ""
sql_server_admin_password = ""
shared_state_storage_account_access_key = ""

tags = {
	Environment =                 "Production"
	LOB	=                         "Deal Advisory & Strategy"
	Node =                        "Spoke"
	Platform =                    "Azure Commercial Cloud"
	Solution =                     "KPMG Project IQ (KPIQ)"
	BusinessContact =             "adamwerner@kpmg.com"
	BusinessOwner =               "Adam S Werner"
	Datadog                 = "Monitored"
}

application_acronym 		= "kpiq"
location_acronym 			= "use"
location 					= "eastus"
environment_acronym 		= "pd"

#Shared State Configuration

shared_state_storage_account_name = "stocoeusazcop9e27f52cprd"
shared_state_storage_account_container_name = "terraformstatecontainer"
shared_state_storage_account_blob_key_name = "iac-acc-shared-das.pd.tfstate"


#App Service Environment

app_service_environment_name = "webuscdasharedPD01"

#Network and Subnets
dns_servers = ["10.30.15.196","10.30.15.197"]

#Application Gateway

app_gateway_environment_acronym = ""
application_gateway_sku_name = "WAF_Medium"
application_gateway_sku_tier = "WAF"
application_gateway_sku_capacity = "2"
ase_internal_ip = "10.33.16.11"
backend_cer_cert_name = "kpmgcloudops.com"
frontend_pfx_cert_name = "kpiq.kpmgcloudops.com"
frontend_pfx_cert_password = ""

#AD Groups
encryptapp_sp_name = "spn-devops-9e27f52c"
cloudops_keyvault_admin_group_name = "CO-TerraformStorage-Admin"
client_keyvault_admin_group_name = "CO-DA-KeyVault-AdminsPD"

#StorageAccount
agent_subnet_id = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/co-p-eastus-infra1-subnet"
wvd_subnet_id = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"
core_aks_subnet_id = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/sub-use-core-aks-pd"

#Environment Settings

restrict_gateway_endpoint = "true"
###Below Block needs to be commented out while creating the variable file for UAT or Production Environment
#app_gateway_backend_info = {
#	port = 443
#	request_timeout = 30
#}

#Ad Application

tenant_fqdn = "kpmgusadvcloudops.onmicrosoft.com"
sql_assignment_guid = "07c8f75f-3761-430e-a757-d37205b5dddd"