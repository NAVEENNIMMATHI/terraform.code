# Azure Authentication
client_id       = "c79c197f-2835-49dc-846a-06644d7f10c4"
client_secret   = ""
subscription_id = "57fad7dc-7eeb-4a2c-b3b7-405d9f8d3cc8"
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"

application_acronym     = "spokeapp"
environment_acronym = "dv"
location_acronym    = "use"
vm_environment_acronym = "dv"
agw_environment_acronym = "dev"

tags = {
  BusinessContact     = "johnhlee@kpmg.com"
  BusinessOwner       = "Lee, John H"
  Environment         = "Development"
  Instance            = "0001"
  LOB                 = "Risk Advisory Solutions"
  Node                = "Spoke"
  Platform            = "Azure Commercial Cloud"
  Solution            = "Shared RAS"
  TechnicalContact    = "tgunarathne@kpmg.com"
  TechnicalOwner      = "Thilina Gunarathne"
  Version             = "1.0"
}

adminvmtag = {
  BusinessContact  = "johnhlee@kpmg.com"
  BusinessOwner    = "Lee, John H"
  Environment      = "Development"
  Instance         = "0001"
  LOB              = "Risk Advisory Solutions"
  Node             = "Spoke"
  Platform         = "Azure Commercial Cloud"
  Solution         = "Shared RAS"
  TechnicalContact = "tgunarathne@kpmg.com"
  TechnicalOwner   = "Thilina Gunarathne"
  Version          = "1.0"
  VMRole           = "ChangeFrameAdmin"
}

buildvmtag = {
  BusinessContact  = "johnhlee@kpmg.com"
  BusinessOwner    = "Lee, John H"
  Environment      = "Development"
  Instance         = "0001"
  LOB              = "Risk Advisory Solutions"
  Node             = "Spoke"
  Platform         = "Azure Commercial Cloud"
  Solution         = "Shared RAS"
  TechnicalContact = "tgunarathne@kpmg.com"
  TechnicalOwner   = "Thilina Gunarathne"
  Version          = "1.0"
  VMRole           = "ChangeFrameBuild"
}

#ASE
ase_name         = "ase-use-dvapp-dv"
ase_project_name = "app"
dns_suffix       = "kpmgcloudops.com"

#Networking Components
app_subnet_address_prefix            = "10.50.5.0/26"
appgateway_subnet_address_prefix     = "10.50.4.0/28"
appgateway_subnet_address_prefix_cfr = "10.50.4.16/28"
ase_subnet_address_prefix            = "10.50.0.0/22"
build_subnet_address_prefix          = "10.50.5.128/26"
dns_servers                          = ["10.1.11.4", "10.1.11.5"]
mgmt_subnet_address_prefix           = "10.50.5.64/26"
privatelink_subnet_address_prefix    = "10.50.6.0/24"
route_next_hope_in_ip_address        = "10.6.24.4"
vnet_address_space                   = ["10.50.0.0/16"]
powerapps_whitelist_ips                = ["104.41.132.180","13.91.93.63","52.173.245.164","40.71.249.205","40.114.40.132","52.232.188.154","104.209.247.23","52.162.242.161","104.42.122.49","40.112.195.87","13.91.97.196","40.71.193.203","104.210.14.156","13.66.130.243","65.52.197.64","40.113.242.246","40.71.11.80/28","40.71.15.160/27","52.162.107.160/28","52.162.111.192/27","13.89.171.80/28","13.89.178.64/27","40.70.146.208/28","40.70.151.96/27","13.86.223.32/27","40.112.243.160/28"]  
vpn_whitelist_ips                    = ["52.188.159.173/32","103.216.201.101/32","54.173.33.56/32","199.207.253.0/24","199.206.0.5/32","103.58.118.0/24","20.185.110.197/32","20.185.106.126/32"]  
#VNet Peering
core_vnet_name                  = "co-np-eastus-core1-vnet"
coresubscriptionid              = "4cdcf904-fa57-4815-8cb3-e33b9b44f479"
corevnet_resource_group_name    = "co-np-eastus-core1-rg"
transit_vnet_name               = "CO-dv-eastus-hub-vnet"
transitsubscriptionid           = "c72acede-d539-45d9-963d-3464ec4ddae0"
transitvnet_resource_group_name = "CO-dv-eastus-hubvnet-rg"
new_uat_suffix_coretovnet_peering = ""

#Route Table
azfwsubscriptionid       = "c72acede-d539-45d9-963d-3464ec4ddae0"
firewall_network_name    = "firewall-primary-dev-core"
firewall_network_rg_name = "CO-dv-eastus-hubvnet-rg"

#KeyVault
cloudops_keyvault_admin_group_name = "CO-Certificate-KeyVault"
encryptapp_sp_name                 = "spn-devops-57fad7dc"

#Virtual Machine
ad_group_environment_suffix = "-DV"
admin_password              = ""
domain_name                 = "kconp.local"
domain_user_name            = "a-scottmccormick"
domain_user_password        = ""
ou_path                     = "OU=AADDC Computers,DC=kconp,DC=local"
storage_account_kind        = "StorageV2"
subnets_environment_suffix  = "1"
vm_count_admin              = "1"
vm_count_build              = "1"
vm_size_admin               = "Standard_D8s_v3"
vm_size_build               = "Standard_D8s_v3"

#Application Gateway Variables
app_gw_sku_name     = "WAF_Medium"
app_gw_sku_tier     = "WAF"
app_gw_sku_capacity = "2"
ase_internal_ip     = "10.50.0.11"

authentication_certificates = [
  {
    certname       = "fastpathdev_kpmgcloudops_com",
    authcertcer    = "fastpathdev.kpmgcloudops.com.cer"
  }
]

ssl_certificates = [
  {
    certname       = "fastpathdev_kpmgcloudops_com",
    sslcertpfx     = "fastpathdev.kpmgcloudops.com.pfx"
  },
  {
    certname       = "adminfastpathdev_kpmgcloudops_com",
    sslcertpfx     = "adminfastpathdev.kpmgcloudops.com.pfx"
  },
  {
    certname       = "apifastpathdev_kpmgcloudops_com",
    sslcertpfx     = "apifastpathdev.kpmgcloudops.com.pfx"
  },
  {
    certname       = "apiadminfastpathdev_kpmgcloudops_com",
    sslcertpfx     = "apiadminfastpathdev.kpmgcloudops.com.pfx"
  }
]