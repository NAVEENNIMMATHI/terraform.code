subscription_id = "adf88b05-d3d7-4dee-ba30-ea939f9a1b1c"
client_id       = "76ea9629-a4e1-4a9a-ba2f-39840e53342a"
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"

#Secrets
admin_password = ""
client_secret   = ""
sql_server_admin_password = ""
shared_state_storage_account_access_key = ""

tags = {
	Environment =                 "QA"
	LOB	=                         "Deal Advisory & Strategy"
	Node =                        "Spoke"
	Platform =                    "Azure Commercial Cloud"
	Solution =                    "KPMG Aggregation And Reporting Tool (KART)"
	BusinessContact =             "adamwerner@kpmg.com"
	BusinessOwner =               "Adam S Werner"
}

application_acronym 		= "kartng"
location_acronym 			= "use"
location 					= "eastus"
environment_acronym 		= "qa"

#Shared State Configuration

shared_state_storage_account_name = "stousecommonadf88b05"
shared_state_storage_account_container_name = "terraformstatecontainer"
shared_state_storage_account_blob_key_name = "iac-acc-shared-das.qa.tfstate"


#App Service Environment

app_service_environment_name = "webuscdasharedQA01"

#Network and Subnets
dns_servers = ["10.1.11.4","10.1.11.5"]

#Application Gateway

app_gateway_environment_acronym = "qa"
application_gateway_sku_name = "WAF_Medium"
application_gateway_sku_tier = "WAF"
application_gateway_sku_capacity = "2"
ase_internal_ip = "10.71.16.11"
backend_cer_cert_name = "kpmgcloudops.com"
frontend_pfx_cert_name = "kartngqa.kpmgcloudops.com"
frontend_pfx_cert_password = ""
frontend_pfx_cert_rest_name = "kartngrestqa.kpmgcloudops.com"
frontend_pfx_cert_rest_password = ""

#AD Groups
encryptapp_sp_name = "EncryptApp"
cloudops_keyvault_admin_group_name = "CO-Certificate-KeyVault"
client_keyvault_admin_group_name = "CO-DA-KeyVault-Admins"

#StorageAccount
agent_subnet_id = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-infra1-qa"
wvd_subnet_id = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"
core_aks_subnet_id = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-core-aks-qa"

#Environment Settings

restrict_gateway_endpoint = "false"
###Below Block needs to be commented out while creating the variable file for UAT or Production Environment
app_gateway_backend_info = {
	port = 443
	request_timeout = 30
}

#Ad Application

tenant_fqdn = "kpmgusadvspectrum.onmicrosoft.com"