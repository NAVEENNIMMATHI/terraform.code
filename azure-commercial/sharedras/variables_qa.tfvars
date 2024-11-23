# Azure Authentication
client_id       = "65d6e9b3-65b7-42b9-9f30-89d6a33becf8"
client_secret   = ""
subscription_id = "96e9a7e6-da33-4993-89ca-b82e0b571aee"
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"

application_acronym     = "spokeapp"
environment_acronym = "qa"
location_acronym    = "use"
vm_environment_acronym = "qa"
agw_environment_acronym = "qa"

tags = {
  BusinessContact     = "johnhlee@kpmg.com"
  BusinessOwner       = "Lee, John H"
  Environment         = "QA"
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
  Environment      = "QA"
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
  Environment      = "QA"
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
ase_name         = "ase-use-qaapp-qa"
ase_project_name = "app"
dns_suffix       = "kpmgcloudops.com"

#Networking Components
privatelink_subnet_address_prefix    = "10.70.6.0/24"
app_subnet_address_prefix            = "10.70.5.0/26"
appgateway_subnet_address_prefix     = "10.70.4.0/28"
appgateway_subnet_address_prefix_cfr = "10.70.4.16/28"
ase_subnet_address_prefix            = "10.70.0.0/22"
build_subnet_address_prefix          = "10.70.5.128/26"
dns_servers                          = ["10.1.11.4", "10.1.11.5"]
mgmt_subnet_address_prefix           = "10.70.5.64/26"
route_next_hope_in_ip_address        = "10.101.2.196"
vnet_address_space                   = ["10.70.0.0/16"]
powerapps_whitelist_ips                = ["104.41.132.180","13.91.93.63","52.173.245.164","40.71.249.205","40.114.40.132","52.232.188.154","104.209.247.23","52.162.242.161","104.42.122.49","40.112.195.87","13.91.97.196","40.71.193.203","104.210.14.156","13.66.130.243","65.52.197.64","40.113.242.246","40.71.11.80/28","40.71.15.160/27","52.162.107.160/28","52.162.111.192/27","13.89.171.80/28","13.89.178.64/27","40.70.146.208/28","40.70.151.96/27","13.86.223.32/27","40.112.243.160/28"]
vpn_whitelist_ips                    = ["52.188.159.173/32","103.216.201.101/32","54.173.33.56/32","199.207.253.0/24","199.206.0.5/32","103.58.118.0/24","20.185.110.197/32","20.185.106.126/32"]  

#VNet Peering
core_vnet_name                  = "co-np-eastus-core1-vnet"
coresubscriptionid              = "4cdcf904-fa57-4815-8cb3-e33b9b44f479"
corevnet_resource_group_name    = "co-np-eastus-core1-rg"
transit_vnet_name               = "vnt-use-core-qa"
transitsubscriptionid           = "5ce45d57-3192-4bfe-9c2f-cb567b30c586"
transitvnet_resource_group_name = "RGP-USE-COREVNET-QA"
new_uat_suffix_coretovnet_peering = ""

#Route Table
azfwsubscriptionid       = "5ce45d57-3192-4bfe-9c2f-cb567b30c586"
firewall_network_name    = "fwl-use-primary-qa-core"
firewall_network_rg_name = "RGP-USE-COREVNET-QA"

#KeyVault
cloudops_keyvault_admin_group_name = "CO-Certificate-KeyVault"
encryptapp_sp_name                 = "spn-devops-96e9a7e6"

#Virtual Machine
ad_group_environment_suffix = "-QA"
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
ase_internal_ip     = "10.70.0.11"

authentication_certificates = [
  {
    certname       = "fastpathqa_kpmgcloudops_com",
    authcertcer    = "fastpathqa.kpmgcloudops.com.cer"
  }
]

ssl_certificates = [
  {
    certname       = "fastpathqa_kpmgcloudops_com",
    sslcertpfx     = "fastpathqa.kpmgcloudops.com.pfx"
  },
  {
    certname       = "adminfastpathqa_kpmgcloudops_com",
    sslcertpfx     = "adminfastpathqa.kpmgcloudops.com.pfx"
  },
  {
    certname       = "apifastpathqa_kpmgcloudops_com",
    sslcertpfx     = "apifastpathqa.kpmgcloudops.com.pfx"
  },
  {
    certname       = "apiadminfastpathqa_kpmgcloudops_com",
    sslcertpfx     = "apiadminfastpathqa.kpmgcloudops.com.pfx"
  }
]