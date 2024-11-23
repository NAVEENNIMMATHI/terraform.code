subscription_id 								= "adf88b05-d3d7-4dee-ba30-ea939f9a1b1c"
client_id       								= "76ea9629-a4e1-4a9a-ba2f-39840e53342a"
tenant_id       								= "188697ab-840f-44ec-8535-aaaa5680bab0"

tags = {
	Environment 								=  "QA"
	LOB											=  "Deal Advisory & Strategy"
	Node 										=  "Spoke"
	Platform 									=  "Azure Commercial Cloud"
	Solution 									=  "Shared DAS"
	BusinessContact 							=  "adamwerner@kpmg.com"
	BusinessOwner 								=  "Adam S Werner"
}

adminvmtag = {
	VMRole 										= "KMEAdmin"
}

buildvmtag = {
	VMRole 										= "KMEBuild"
}

application_acronym 							= "da"
location		 								= "eastus"
environment_acronym 							= "qa"
location_acronym								= "use"
ad_group_environment_suffix 					= "qa"
vnet_environment_suffix 						= "qa"


#Network and Subnets  #10.1.26.192/26 is spared for other purpose like App-Gateway (if needed)
vnet_address_space 								= ["10.71.16.0/20"]
ase_subnet_address_space 						= "10.71.16.0/24"
mgmt_subnet_address_space 						= "10.71.17.0/26"
build_subnet_address_space 						= "10.71.17.64/26"
agw_subnet_address_space 						= "10.71.17.128/26"
agw_subnet_address_space_kpmgonly				= "10.71.17.192/26"
pbi_subnet_address_space 						= "10.71.18.0/28"
wst_subnet_address_space 						= "10.71.18.16/28"
pe_subnet_address_space 						= "10.71.19.0/26"
rri_pe_subnet_address_space                     = "10.71.67.0/27"
kip_pe_subnet_address_space                     = "10.71.9.128/26"
dns_servers 									= ["10.1.11.4","10.1.11.5"]
ase_outbound_ip_addresses 						= ["13.82.1.202/32","52.147.199.75/32"]
kip_ase_pip                                     = ["52.147.199.75"]
canada_member_firm_pip                          = ["204.50.172.132","204.50.15.4"]
firewall_ip_addresses                           = ["40.76.169.86","40.76.168.231","40.76.169.36","40.76.169.44","40.76.169.103"]
#VirtualNetwork Peering
coresubscriptionid 								= "5ce45d57-3192-4bfe-9c2f-cb567b30c586"
corevnet_resource_group_name 					= "RGP-USE-COREVNET-QA"
core_vnet_name 									= "vnt-use-core-qa"

#Route Table
firewall_network_name 							= "fwl-use-primary-qa-core"
firewall_network_rg_name 						= "RGP-USE-COREVNET-QA"

#ASEILB
ase_ilb_dns_name 								= "kpmgcloudops.com"

#KeyVault
encryptapp_sp_name 								= "spn-devops-adf88b05"
cloudops_keyvault_admin_group_name 				= "CO-Certificate-KeyVault"

#Virtual Machine
vm_count_build 									= "1"
vm_count_buildvm_dotnet4_5						= "0"
vm_count_buildvm_kme                            = "0"
vm_size_build 									= "Standard_D4s_v3"
vm_count_admin 									= "1"
vm_size_admin 									= "Standard_D4s_v3"
vm_count_pbi 									= "2"
vm_size_pbi 									= "Standard_D4s_v3"
vm_count_wst 									= "2"
vm_size_wst 									= "Standard_D8s_v3"
domain_name 									= "kconp.local"
ou_path 										= "OU=AADDC Computers,DC=kconp,DC=local"
domain_user_name 								= "a-roshanpatel"
domain_user_password 							= ""

#Netapp
netapp_resource_group             				= "RGP-USE-CORE-NETAPP-DV"
netapp_resource_group_location             		= "East US"
netapp_account_name             				= "netapp-use-core-dv"
netapp_pool_name     							= "cp-use-core-dv"
netapp_subnet_id								= "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/sub-use-netapp-dv"
netapp_subscription_id 							= "c72acede-d539-45d9-963d-3464ec4ddae0"

#StorageAccount
agent_subnet_id = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-infra1-qa"
core_aks_subnet_id = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-core-aks-qa"

#Secrets
admin_password 									= ""
client_secret   								= ""

# Private DNS Zone
private_dns_zone_subscription              		= "c72acede-d539-45d9-963d-3464ec4ddae0" # dev-core
private_dns_zone_resource_group_name       		= "rgp-use-core-private-dnszone-dv"
private_dns_zone_name_file                		= "privatelink.file.core.windows.net"