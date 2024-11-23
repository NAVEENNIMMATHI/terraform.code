subscription_id 								= "b75fc3c3-04a4-45a6-b126-8279f505e873"
client_id       								= "9975dc86-7489-483c-b49c-47bdff5e2eb8"
tenant_id       								= "b5031e57-d76f-422e-87c6-02b4cc749974"

tags = {
	Environment 								= "UAT"
	LOB											= "Deal Advisory & Strategy"
	Node 										= "Spoke"
	Platform 									= "Azure Commercial Cloud"
	Solution 									= "Shared DAS"
	BusinessContact 							= "adamwerner@kpmg.com"
	BusinessOwner 								= "Adam S Werner"
}

adminvmtag = {
	VMRole 										= "KMEAdmin"
}

buildvmtag = {
	VMRole 										= "KMEBuild"
}

application_acronym 							= "da"
location		 								= "eastus"
environment_acronym 							= "ut"
location_acronym								= "use"
ad_group_environment_suffix 					= "ut"
vnet_environment_suffix 						= "ut"



vnet_address_space 								= ["10.51.16.0/20"]
ase_subnet_address_space 						= "10.51.16.0/24"
mgmt_subnet_address_space 						= "10.51.17.0/26"
build_subnet_address_space 						= "10.51.17.64/26"
agw_subnet_address_space 						= "10.51.17.128/26"
agw_subnet_address_space_kpmgonly				= "10.51.17.192/26"
pbi_subnet_address_space 						= "10.51.18.0/28"
wst_subnet_address_space 						= "10.51.18.16/28"
pe_subnet_address_space 						= "10.51.19.0/26"
rri_pe_subnet_address_space                     = "10.51.67.0/27"
kip_pe_subnet_address_space                     = "10.12.1.0/26"
dns_servers 									= ["10.30.15.196","10.30.15.197"]
ase_outbound_ip_addresses 						= ["52.152.129.10/32","13.68.253.81/32","13.90.131.217/32"]
kip_ase_pip                                     = ["13.68.253.81"]
canada_member_firm_pip                          = ["204.50.172.132","204.50.15.4"]
firewall_ip_addresses                           = ["52.170.175.39","52.170.174.246","52.188.26.32","52.188.27.2","52.188.26.99"]
#VirtualNetwork Peering
coresubscriptionid 								= "931d8a2f-96bb-44d3-9b06-6c05c41c4060"
corevnet_resource_group_name 					= "RGP-USE-COREVNET-UAT"
core_vnet_name 									= "vnt-use-core-uat"

#Route Table
firewall_network_name 							= "fwl-use-primary-uat-core"
firewall_network_rg_name 						= "RGP-USE-COREVNET-UAT"

#ASEILB
ase_ilb_dns_name 								= "kpmgcloudops.com"

#KeyVault
encryptapp_sp_name 								= "spn-devops-931d8a2f"
cloudops_keyvault_admin_group_name 				= "CO-TerraformStorage-Admin"

#Virtual Machine
vm_count_build 									= "0"
vm_count_buildvm_dotnet4_5						= "0"
vm_count_buildvm_kme                            = "1"
vm_size_build 									= "Standard_D4s_v3"
vm_count_admin 									= "1"
vm_size_admin 									= "Standard_D4s_v3"
vm_count_pbi 									= "2"
vm_size_pbi 									= "Standard_D4s_v3"
vm_count_wst 									= "2"
vm_size_wst 									= "Standard_D8s_v3"
domain_name 									= "kco.local"
ou_path 										= "OU=AADDC Computers,DC=kco,DC=local"
domain_user_name 								= "a-rkumarpatel"
domain_user_password 							= ""

#Netapp
netapp_resource_group             				= "RGP-USE-CORE-NETAPP-PD"
netapp_resource_group_location             		= "East US"
netapp_account_name             				= "netapp-use-core-pd"
netapp_pool_name     							= "cp-use-core-pd"
netapp_subnet_id								= "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/sub-use-netapp-pd"
netapp_subscription_id 							= "4c9dc048-01dc-4854-9063-8a3d4060993a"

#StorageAccount
agent_subnet_id = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-infra1-uat"
core_aks_subnet_id = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-core-aks-uat"

#Secrets
admin_password 									= ""
client_secret   								= ""

# Private DNS Zone
private_dns_zone_subscription              = "4c9dc048-01dc-4854-9063-8a3d4060993a" # pd-core
private_dns_zone_resource_group_name       = "rgp-use-core-private-dnszone-pd"
private_dns_zone_name_file	               = "privatelink.file.core.windows.net"