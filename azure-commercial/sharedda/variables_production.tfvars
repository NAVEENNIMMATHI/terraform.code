subscription_id 								= "9e27f52c-3c97-4fda-9c8f-eadcd0ad195a"
client_id       								= "b2967f11-d801-4812-b532-3f3a676e8b46"
tenant_id       								= "b5031e57-d76f-422e-87c6-02b4cc749974"

tags = {
	Environment 								= "Production"
	LOB											= "Deal Advisory & Strategy"
	Node 										= "Spoke"
	Platform 									= "Azure Commercial Cloud"
	Solution 									= "Shared DAS"
	BusinessContact 							= "adamwerner@kpmg.com"
	BusinessOwner 								= "Adam S Werner"
	Datadog                                     = "Monitored"
}

adminvmtag = {
	VMRole 										= "KMEAdmin"
}

buildvmtag = {
	VMRole 										= "KMEBuild"
}

application_acronym 							= "da"
location		 								= "eastus"
environment_acronym 							= "pd"
location_acronym								= "use"
ad_group_environment_suffix 					= "pd"
vnet_environment_suffix 						= "pd"



vnet_address_space 								= ["10.33.16.0/20"]
ase_subnet_address_space 						= "10.33.16.0/25"
mgmt_subnet_address_space 						= "10.33.16.128/26"
build_subnet_address_space 						= "10.33.16.192/26"
agw_subnet_address_space						= "10.33.17.0/26"
agw_subnet_address_space_kpmgonly				= "10.33.17.64/26"
pbi_subnet_address_space 						= "10.33.18.0/28"
wst_subnet_address_space 						= "10.33.18.16/28"
pe_subnet_address_space 						= "10.33.19.0/26"
rri_pe_subnet_address_space                     = "10.91.67.0/27"
kip_pe_subnet_address_space                     = "10.26.5.128/26"
dns_servers 									= ["10.30.15.196","10.30.15.197"]
ase_outbound_ip_addresses 						= ["52.152.148.131/32","104.211.19.220/32","52.152.148.131/32"]
kip_ase_pip                                     = ["104.211.19.220"]
canada_member_firm_pip                          = ["204.50.172.132","204.50.15.4"]
firewall_ip_addresses                           = ["52.224.25.167","20.42.39.126","52.224.25.140","52.224.25.158","52.224.25.180"]
#VirtualNetwork Peering
coresubscriptionid 								= "4c9dc048-01dc-4854-9063-8a3d4060993a"
corevnet_resource_group_name 					= "CO-P-eastus-hubvnet-rg"
core_vnet_name 									= "CO-P-eastus-hub-vnet"

#Route Table
firewall_network_name 							= "firewall-primary-prod-hub"
firewall_network_rg_name 						= "CO-P-eastus-hubvnet-rg"

#ASEILB
ase_ilb_dns_name 								= "kpmgcloudops.com"

#KeyVault
encryptapp_sp_name 								= "spn-devops-9e27f52c"
cloudops_keyvault_admin_group_name 				= "CO-TerraformStorage-Admin"

#Virtual Machine
vm_count_build 									= "1"
vm_count_buildvm_dotnet4_5						= "0"
vm_count_buildvm_kme                            = "0"
vm_size_build 									= "Standard_D8s_v3"
vm_count_admin 									= "1"
vm_size_admin 									= "Standard_D8s_v3"
vm_count_pbi 									= "2"
vm_size_pbi 									= "Standard_D4s_v3"
vm_count_wst 									= "2"
vm_size_wst 									= "Standard_D16s_v3"
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
agent_subnet_id = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/co-p-eastus-infra1-subnet"
core_aks_subnet_id = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/sub-use-core-aks-pd"

#Secrets
admin_password 									= ""
client_secret   								= ""

# Private DNS Zone
private_dns_zone_subscription              = "4c9dc048-01dc-4854-9063-8a3d4060993a" # pd-core
private_dns_zone_resource_group_name       = "rgp-use-core-private-dnszone-pd"
private_dns_zone_name_file	               = "privatelink.file.core.windows.net"