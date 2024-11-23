subscription_id = "e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2"
client_id       = "2995a923-5fd3-4b7d-8cbe-ef1074ef7921"  
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"

#Secrets
admin_password = ""
client_secret   = ""
sql_server_admin_password = ""
shared_state_storage_account_access_key = ""

location 			= "eastus"
location_acronym 	= "use"
environment 		= "legacy_development"
environment_acronym = "dv"
application 		= "change_frame"
application_acronym = "cfr"

tags = {
	Environment =                 "Development"
	LOB	=                         "Risk Advisory Solutions"
	Node =                        "Spoke"
	Platform =                    "Azure Commercial Cloud"
	Solution =                    "Change Frame"
	BusinessContact =             "jameswilson@kpmg.com"
	BusinessOwner =               "Wilson, James Duffy"
}

ad_group_environment_suffix = ""


#Shared State Configuration
shared_state_resource_group_name = "RGP-USE-BASEE74C5C8B-NP"
shared_state_storage_account_name = "stousebasee74c5c8b"
shared_state_storage_account_container_name = "terraformstatecontainer"
shared_state_storage_account_blob_key_name = "iac-acc-shared-ras.np.tfstate"

#App service plan
app_service_plan_size = "I1"


#App Service Environment
app_service_environment_name = "ase-use-npapp-np"


#Network and Subnets
dns_servers = ["10.1.11.4","10.1.11.5"]


#Application Gateway
app_service_name_test = "changeframedev"
app_service_name_final = "changeframeqa"
application_gateway_sku_name = "WAF_Large"
application_gateway_sku_tier = "WAF"
application_gateway_sku_capacity = "2"
ase_internal_ip = "10.4.16.11"
backend_cer_cert_name = "kpmgcloudops.com"
frontend_pfx_cert_name = "changeframenp.kpmgcloudops.com"
frontend_pfx_cert_password = ""
google_pfx_cert_name = "google.changeframedev.kpmgcloudops.com"
google_pfx_cert_password = ""

#AD Groups
encryptapp_sp_name = "spn-devops-rcdigital"
cloudops_keyvault_admin_group_name = "CO-Certificate-KeyVault"
client_keyvault_admin_group_name = "CO-RAS-KeyVault-Admins"

#StorageAccount
agent_subnet_id = "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet/subnets/co-np-eastus-infra1-subnet"
wvd_subnet_id = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"
core_aks_subnet_id = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/sub-use-core-aks-dv"

cfa_appgateway_subnet_address_prefix = "10.4.22.144/28"
service_endpoints = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault"]
shared_vnet_name = "vnt-use-ase-np"
shared_resource_group_name = "RGP-USE-ASE-NP"
suffix="2"
restrict_gateway_endpoint = "false"
 environment_type_test = ""
 environment_type_final = "DV"

app_gateway_backend_info = {
	port = 443
	request_timeout = 30
}
#Below variables will be blank in UAT and Prod
fun_usc_cfr_dv_slot_qa ="fun-usc-cfr-dv/slots/QA"
spn_devops_change_frame_app_service = "spn-devops-change-frame-app-service"


