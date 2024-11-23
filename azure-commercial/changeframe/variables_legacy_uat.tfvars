subscription_id = "5d3ae075-2601-49d3-9223-892e3d7f6fb1"
client_id       = "089028a6-c23d-4854-8ecf-2ed345a8b1bf"  
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

#Secrets
admin_password = ""
client_secret   = ""
sql_server_admin_password = ""
shared_state_storage_account_access_key = ""

location            = "eastus"
location_acronym	= "use"
environment         = "uat"
environment_acronym	= "uat"
application			= "change_frame"
application_acronym = "cfr"

tags = {
	Environment =                 "UAT"
	LOB	=                         "Risk Advisory Solutions"
	Node =                        "Spoke"
	Platform =                    "Azure Commercial Cloud"
	Solution =                    "Change Frame"
	BusinessContact =             "jameswilson@kpmg.com"
	BusinessOwner =               "Wilson, James Duffy"
}

ad_group_environment_suffix = ""

#Shared State Configuration
/* this will have data from Shared RAS State File */
shared_state_resource_group_name = "RGP-USE-BASE5D3AE075-PD"
shared_state_storage_account_name = "stousebase5d3ae075"
shared_state_storage_account_container_name = "terraformstatecontainer"
shared_state_storage_account_blob_key_name = "iac-acc-shared-ras.uat.tfstate"

#App service plan
app_service_plan_size = "I1"

#App Service Environment
app_service_environment_name = "webuscrassharedUAT01"
#Network and Subnets - as per new logic vnet_address_space dns_server and agw_subnet_address_space will not be in use
dns_servers = ["10.30.15.196","10.30.15.197"]


#Application Gateway
app_service_name_test = ""
app_service_name_final = "changeframeuat"
application_gateway_sku_name = "WAF_Large"
application_gateway_sku_tier = "WAF"
application_gateway_sku_capacity = "2"
ase_internal_ip = "10.26.16.11" #We have to fill this value after Shared ASE gets create in Prod Subscription for UAT #
backend_cer_cert_name = "kpmgcloudops.com"
frontend_pfx_cert_name = "changeframe.kpmgcloudops.com"
frontend_pfx_cert_password = ""
google_pfx_cert_name = "google.changeframeuat.kpmgcloudops.com"
google_pfx_cert_password = ""
app_service_name_google = "google.changeframeuat"



#AD Groups
encryptapp_sp_name = "spn-devops-5d3ae075"
cloudops_keyvault_admin_group_name = "CO-TerraformStorage-Admin"
client_keyvault_admin_group_name = "CO-RAS-UAT-KeyVault-Admins"


#StorageAccount
#agent_subnet_id = "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet/subnets/co-np-eastus-infra1-subnet"
agent_subnet_id = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/co-p-eastus-infra1-subnet"
wvd_subnet_id = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"
core_aks_subnet_id = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-core-aks-uat"

cfa_appgateway_subnet_address_prefix = "10.26.20.0/27"
service_endpoints = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault"]

shared_resource_group_name = "RGP-USE-ASE-UAT"
suffix=""
restrict_gateway_endpoint = "true"
environment_type_test = ""
environment_type_final = "UAT"
 
###Below Block needs to be commented out while creating the variable file for UAT or Production Environment
#app_gateway_backend_info = {
#	port = 443
#	request_timeout = 30
#}
#Below variables will be blank in UAT and Prod
fun_usc_cfr_dv_slot_qa =""
spn_devops_change_frame_app_service = ""
#shared vnet name
shared_vnet_name = "vnt-use-ase-uat"
