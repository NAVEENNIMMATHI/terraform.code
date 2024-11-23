#SPN Details

 subscription_id = "e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2"
  client_id       = "2995a923-5fd3-4b7d-8cbe-ef1074ef7921"
  client_secret   = ""
  tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"

environment_acronym = "np"
application_acronym = "spokeapp"
location_acronym    = "use"
vm_environment_acronym = "np"

tags = {
		BusinessOwner    = "Mick McGarry"
		BusinessContact  = "hmcgarry@kpmg.com"
		Environment      = "Development"
		Instance         = "0001"
		LOB 		     = "Risk Advisory Solutions"
    	Platform         = "Azure Commercial Cloud"
		Solution         = "Shared RAS"
		Node             = "Spoke"
		TechnicalOwner   = "Tianhui Gu"
		TechnicalContact = "tianhuigu@kpmg.com"
		Version          = "1.0"
}

adminvmtag = {
	Environment =                 "Development"
	Instance = 					  "0001"
	LOB	=                         "Risk Advisory Solutions"
	Node =                        "Spoke"
	Platform =                    "Azure Commercial Cloud"
	Solution =                    "Shared RAS"
	BusinessContact =             "hmcgarry@kpmg.com"
	BusinessOwner =               "Mick McGarry"
	VMRole = 					  "ChangeFrameAdmin"
	TechnicalOwner   = "Tianhui Gu"
	TechnicalContact = "tianhuigu@kpmg.com"
	Version          = "1.0"
}

buildvmtag = {
	Environment =                 "Development"
	Instance         = "0001"
	LOB	=                         "Risk Advisory Solutions"
	Node =                        "Spoke"
	Platform =                    "Azure Commercial Cloud"
	Solution =                    "Shared RAS"
	BusinessContact =             "hmcgarry@kpmg.com"
	BusinessOwner =               "Mick McGarry"
	VMRole = 					  "ChangeFrameBuild"
	TechnicalOwner   = "Tianhui Gu"
	TechnicalContact = "tianhuigu@kpmg.com"
	Version          = "1.0"
}

#ASE
ase_project_name = "app"
dns_suffix = "kpmgcloudops.com"
ase_name= "ase-use-npapp-np"

#Networking Components
vnet_address_space = ["10.4.16.0/20"]
appgateway_subnet_address_prefix = "10.4.20.0/27"
ase_subnet_address_prefix = "10.4.16.0/22"
app_subnet_address_prefix = "10.4.20.32/27"
mgmt_subnet_address_prefix = "10.4.21.224/27"
build_subnet_address_prefix = "10.4.21.0/27"
dns_servers = ["10.1.11.4", "10.1.11.5"]
route_next_hope_in_ip_address = "10.1.31.196"
appgateway_subnet_address_prefix_cfr = "10.4.24.80/28" #this is for cfr dummy subnet
powerapps_whitelist_ips                = ["104.41.132.180","13.91.93.63","52.173.245.164","40.71.249.205","40.114.40.132","52.232.188.154","104.209.247.23","52.162.242.161","104.42.122.49","40.112.195.87","13.91.97.196","40.71.193.203","104.210.14.156","13.66.130.243","65.52.197.64","40.113.242.246","40.71.11.80/28","40.71.15.160/27","52.162.107.160/28","52.162.111.192/27","13.89.171.80/28","13.89.178.64/27","40.70.146.208/28","40.70.151.96/27","13.86.223.32/27","40.112.243.160/28"]
vpn_whitelist_ips                    = ["52.188.159.173/32","103.216.201.101/32","54.173.33.56/32","199.207.253.0/24","199.206.0.5/32","103.58.118.0/24","20.185.110.197/32","20.185.106.126/32"]  
#VNet Peering
core_vnet_name = "co-np-eastus-core1-vnet"
coresubscriptionid = "4cdcf904-fa57-4815-8cb3-e33b9b44f479"
corevnet_resource_group_name = "co-np-eastus-core1-rg"
transit_vnet_name = "CO-NP-eastus-transit1-Vnet"
transitvnet_resource_group_name = "CO-NP-eastus-CONPTVnet-rg"
transitsubscriptionid = "25f8d797-bee2-4a88-84cc-de328abd6731"
new_uat_suffix_coretovnet_peering = ""

#Route Table

azfwsubscriptionid = "c72acede-d539-45d9-963d-3464ec4ddae0"
firewall_network_name = "firewall-primary-dev-core"
firewall_network_rg_name = "CO-dv-eastus-hubvnet-rg"

#KeyVault
encryptapp_sp_name = "spn-devops-rcdigital"
cloudops_keyvault_admin_group_name = "CO-Certificate-KeyVault"

#Virtual Machine
vm_count_admin = "1"
vm_size_admin = "Standard_D8s_v3"
vm_count_build = "1"
vm_size_build = "Standard_D8s_v3"
domain_name = "kconp.local"
ou_path = "OU=AADDC Computers,DC=kconp,DC=local"
domain_user_name = "a-scottmccormick"
domain_user_password = ""
admin_password = ""
subnets_environment_suffix=""
ad_group_environment_suffix=""