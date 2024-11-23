subscription_id = "96e9a7e6-da33-4993-89ca-b82e0b571aee"
client_id       = "65d6e9b3-65b7-42b9-9f30-89d6a33becf8"  
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"

#Secrets
admin_password = ""
client_secret   = ""
sql_server_admin_password = ""
shared_state_storage_account_access_key = ""

location            = "eastus"
location_acronym	= "use"
environment         = "qa"
environment_acronym	= "qa"
application			= "change_frame"
application_acronym = "cfr"

tags = {
	Environment =                 "QA"
	LOB	=                         "Risk Advisory Solutions"
	Node =                        "Spoke"
	Platform =                    "Azure Commercial Cloud"
	Solution =                    "Change Frame"
	BusinessContact =             "jameswilson@kpmg.com"
	BusinessOwner =               "Wilson, James Duffy"
}

ad_group_environment_suffix = "qa"


#Shared State Configuration
shared_state_resource_group_name = "RGP-USE-COMMON"
shared_state_storage_account_name = "stousecommon96e9a7e6"
shared_state_storage_account_container_name = "terraformstatecontainer"
shared_state_storage_account_blob_key_name = "iac-acc-shared-ras.qa.tfstate"

#App service plan
app_service_plan_size = "I1"

#App Service Environment
app_service_environment_name = "ase-use-qaapp-qa"


#Network and Subnets
dns_servers = ["10.1.11.4","10.1.11.5"]


#Application Gateway
app_service_name_test = ""
app_service_name_final = "changeframeqa"
app_service_name_google = "google.changeframeqa"
application_gateway_sku_name = "WAF_Large"
application_gateway_sku_tier = "WAF"
application_gateway_sku_capacity = "2"
ase_internal_ip = "10.70.0.11"
backend_cer_cert_name = "kpmgcloudops.com"
frontend_pfx_cert_name = "changeframenp.kpmgcloudops.com"
frontend_pfx_cert_password = ""
google_pfx_cert_name = "google.changeframeqa.kpmgcloudops.com"
google_pfx_cert_password = ""

#AD Groups
encryptapp_sp_name = "spn-devops-96e9a7e6"
cloudops_keyvault_admin_group_name = "CO-Certificate-KeyVault"
client_keyvault_admin_group_name = "CO-RAS-KeyVault-Admins-QA"

#StorageAccount
agent_subnet_id = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-infra1-qa"
wvd_subnet_id = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"
core_aks_subnet_id = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-core-aks-qa"

service_endpoints = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault"]
shared_vnet_name = "vnt-use-ase-qa"
shared_resource_group_name = "RGP-USE-ASE-QA"
suffix=""
restrict_gateway_endpoint = "true"
 environment_type_test = ""
 environment_type_final = "QA"

#app_gateway_backend_info = {
#	port = 443
#	request_timeout = 30
#}
#Below variables will be blank in UAT and Prod
fun_usc_cfr_dv_slot_qa ="fun-usc-cfr-dv/slots/QA"
spn_devops_change_frame_app_service = "spn-devops-change-frame-app-service"


