# Azure Authentication
client_id       = "2216ff1e-a4a3-4139-95e9-b4b89e001457"
client_secret   = ""
subscription_id = "104a6d25-89e7-4297-9d68-76c0443b2cf6"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

application_acronym     = "sharedras"
environment_acronym = "uat"
location_acronym    = "use"
vm_environment_acronym = "ut"
agw_environment_acronym = "uat"

tags = {
  BusinessContact     = "hmcgarry@kpmg.com"
  BusinessOwner       = "Mick McGarry"
  Environment         = "UAT"
  Instance            = "0001"
  LOB                 = "Risk Advisory Solutions"
  Node                = "Spoke"
  Platform            = "Azure Commercial Cloud"
  Solution            = "Shared RAS"
  TechnicalContact    = "tianhuigu@kpmg.com"
  TechnicalOwner      = "Tianhui Gu"
  Version             = "1.0"
}

adminvmtag = {
  BusinessContact  = "hmcgarry@kpmg.com"
  BusinessOwner    = "Mick McGarry"
  Environment      = "UAT"
  Instance         = "0001"
  LOB              = "Risk Advisory Solutions"
  Node             = "Spoke"
  Platform         = "Azure Commercial Cloud"
  Solution         = "Shared RAS"
  TechnicalContact = "tianhuigu@kpmg.com"
  TechnicalOwner   = "Tianhui Gu"
  Version          = "1.0"
  VMRole           = "ChangeFrameAdmin"
}

buildvmtag = {
  BusinessContact  = "hmcgarry@kpmg.com"
  BusinessOwner    = "Mick McGarry"
  Environment      = "UAT"
  Instance         = "0001"
  LOB              = "Risk Advisory Solutions"
  Node             = "Spoke"
  Platform         = "Azure Commercial Cloud"
  Solution         = "Shared RAS"
  TechnicalContact = "tianhuigu@kpmg.com"
  TechnicalOwner   = "Tianhui Gu"
  Version          = "1.0"
  VMRole           = "ChangeFrameBuild"
}

#ASE
ase_name         = "ase-use-sharedras-uat"
ase_project_name = "app"
dns_suffix       = "kpmgcloudops.com"

#Networking Components
app_subnet_address_prefix            = "10.50.5.0/26"
appgateway_subnet_address_prefix     = "10.50.4.0/28"
appgateway_subnet_address_prefix_cfr = "10.50.4.16/28"
ase_subnet_address_prefix            = "10.50.0.0/22"
build_subnet_address_prefix          = "10.50.5.128/26"
dns_servers                          = ["10.30.15.196", "10.30.15.197"]
mgmt_subnet_address_prefix           = "10.50.5.64/26"
privatelink_subnet_address_prefix    = "10.50.6.0/24"
route_next_hope_in_ip_address        = "10.100.2.196"
vnet_address_space                   = ["10.50.0.0/16"]
powerapps_whitelist_ips                = ["104.41.132.180","13.91.93.63","52.173.245.164","40.71.249.205","40.114.40.132","52.232.188.154","104.209.247.23","52.162.242.161","104.42.122.49","40.112.195.87","13.91.97.196","40.71.193.203","104.210.14.156","13.66.130.243","65.52.197.64","40.113.242.246","40.71.11.80/28","40.71.15.160/27","52.162.107.160/28","52.162.111.192/27","13.89.171.80/28","13.89.178.64/27","40.70.146.208/28","40.70.151.96/27","13.86.223.32/27","40.112.243.160/28"]
vpn_whitelist_ips                    = ["52.188.159.173/32","103.216.201.101/32","54.173.33.56/32","199.207.253.0/24","199.206.0.5/32","103.58.118.0/24","20.185.110.197/32","20.185.106.126/32"]  

#VNet Peering
core_vnet_name                  = "CO-P-eastus-hub-vnet"
coresubscriptionid              = "4c9dc048-01dc-4854-9063-8a3d4060993a"
corevnet_resource_group_name    = "CO-P-eastus-hubvnet-rg"
transit_vnet_name               = "vnt-use-core-uat"
transitsubscriptionid           = "931d8a2f-96bb-44d3-9b06-6c05c41c4060"
transitvnet_resource_group_name = "RGP-USE-COREVNET-UAT"
new_uat_suffix_coretovnet_peering = "sharedras"

#Route Table
azfwsubscriptionid       = "931d8a2f-96bb-44d3-9b06-6c05c41c4060"
firewall_network_name    = "fwl-use-primary-uat-core"
firewall_network_rg_name = "RGP-USE-COREVNET-UAT"

#KeyVault
cloudops_keyvault_admin_group_name = "CO-TerraformStorage-Admin"
encryptapp_sp_name                 = "spn-devops-104a6d25"

#Virtual Machine
ad_group_environment_suffix = ""
admin_password              = ""
domain_name                 = "kco.local"
domain_user_name            = "a-scottmccormick"
domain_user_password        = ""
ou_path                     = "OU=AADDC Computers,DC=kco,DC=local"
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
    certname       = "fastpathuat_kpmgcloudops_com",
    authcertcer    = "fastpathuat.kpmgcloudops.com.cer"
  }
]

ssl_certificates = [
  {
    certname       = "fastpathuat_kpmgcloudops_com",
    sslcertpfx     = "fastpathuat.kpmgcloudops.com.pfx"
  },
  {
    certname       = "adminfastpathuat_kpmgcloudops_com",
    sslcertpfx     = "adminfastpathuat.kpmgcloudops.com.pfx"
  },
  {
    certname       = "apifastpathuat_kpmgcloudops_com",
    sslcertpfx     = "apifastpathuat.kpmgcloudops.com.pfx"
  },
  {
    certname       = "apiadminfastpathuat_kpmgcloudops_com",
    sslcertpfx     = "apiadminfastpathuat.kpmgcloudops.com.pfx"
  }
]