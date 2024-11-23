# Azure Authentication
client_id       = "089028a6-c23d-4854-8ecf-2ed345a8b1bf"
client_secret   = ""
subscription_id = "5d3ae075-2601-49d3-9223-892e3d7f6fb1"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

application_acronym     = "spokeapp"
environment_acronym = "pd"
location_acronym    = "use"
vm_environment_acronym = "pd"
agw_environment_acronym = ""

tags = {
  BusinessContact     = "hmcgarry@kpmg.com"
  BusinessOwner       = "Mick McGarry"
  Environment         = "Production"
  Instance            = "0001"
  LOB                 = "Consulting"
  Node                = "Spoke"
  Platform            = "Azure Commercial Cloud"
  Solution            = "Shared RAS"
  TechnicalContact    = "tianhuigu@kpmg.com"
  TechnicalOwner      = "Tianhui Gu"
  Version             = "1.0"
  Datadog             = "Monitored"
}

adminvmtag = {
  BusinessContact  = "hmcgarry@kpmg.com"
  BusinessOwner    = "Mick McGarry"
  Environment      = "Production"
  Instance         = "0001"
  LOB              = "Consulting"
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
  Environment      = "Production"
  Instance         = "0001"
  LOB              = "Consulting"
  Node             = "Spoke"
  Platform         = "Azure Commercial Cloud"
  Solution         = "Shared RAS"
  TechnicalContact = "tianhuigu@kpmg.com"
  TechnicalOwner   = "Tianhui Gu"
  Version          = "1.0"
  VMRole           = "ChangeFrameBuild"
}

#ASE
ase_name         = "ase-use-npapp-pd"
ase_project_name = "app"
dns_suffix       = "kpmgcloudops.com"

#Networking Components
app_subnet_address_prefix            = "10.4.20.192/27"
appgateway_subnet_address_prefix     = "10.4.20.0/27"
appgateway_subnet_address_prefix_cfr = "10.4.20.160/27"
ase_subnet_address_prefix            = "10.4.16.0/22"
build_subnet_address_prefix          = "10.4.20.96/27"
dns_servers                          = ["10.30.15.196", "10.30.15.197"]
mgmt_subnet_address_prefix           = "10.4.20.128/27"
privatelink_subnet_address_prefix    = "10.4.22.0/24"
route_next_hope_in_ip_address        = "10.30.16.100"
vnet_address_space                   = ["10.4.16.0/20","10.4.32.0/19","10.4.64.0/18","10.4.128.0/17"]
powerapps_whitelist_ips                = ["104.41.132.180","13.91.93.63","52.173.245.164","40.71.249.205","40.114.40.132","52.232.188.154","104.209.247.23","52.162.242.161","104.42.122.49","40.112.195.87","13.91.97.196","40.71.193.203","104.210.14.156","13.66.130.243","65.52.197.64","40.113.242.246","40.71.11.80/28","40.71.15.160/27","52.162.107.160/28","52.162.111.192/27","13.89.171.80/28","13.89.178.64/27","40.70.146.208/28","40.70.151.96/27","13.86.223.32/27","40.112.243.160/28"]
vpn_whitelist_ips                    = ["52.188.159.173/32","103.216.201.101/32","54.173.33.56/32","199.207.253.0/24","199.206.0.5/32","103.58.118.0/24","20.185.110.197/32","20.185.106.126/32"]  

#VNet Peering
core_vnet_name                  = "CO-P-eastus-hub-vnet"
coresubscriptionid              = "4c9dc048-01dc-4854-9063-8a3d4060993a"
corevnet_resource_group_name    = "CO-P-eastus-hubvnet-rg"
transit_vnet_name               = "CO-P-eastus-transit-vnet"
transitvnet_resource_group_name = "CO-P-eastus-transitvnet-rg"
transitsubscriptionid           = "0d7a7f3c-a15d-4d37-924c-2507147fb74c"
new_uat_suffix_coretovnet_peering = ""

#Route Table

azfwsubscriptionid       = "4c9dc048-01dc-4854-9063-8a3d4060993a"
firewall_network_name    = "firewall-primary-prod-hub"
firewall_network_rg_name = "CO-P-eastus-hubvnet-rg"

#KeyVault
cloudops_keyvault_admin_group_name = "CO-TerraformStorage-Admin"
encryptapp_sp_name                 = "spn-devops-5d3ae075"

#Virtual Machine
ad_group_environment_suffix = "pd"
admin_password              = ""
domain_name                 = "kco.local"
domain_user_name            = "a-scottmccormick"
domain_user_password        = ""
gateway_subnet_info         = ""
ou_path                     = "OU=AADDC Computers,DC=kco,DC=local"
storage_account_kind        = "StorageV2"
subnets_environment_suffix  = "srs"
vm_count_admin              = "1"
vm_count_build              = "1"
vm_size_admin               = "Standard_D8s_v3"
vm_size_build               = "Standard_D8s_v3"

#Application Gateway Variables
app_gw_sku_name     = "WAF_Medium"
app_gw_sku_tier     = "WAF"
app_gw_sku_capacity = "2"
ase_internal_ip     = "10.4.16.11"

authentication_certificates = [
  {
    certname       = "fastpath_kpmgcloudops_com",
    authcertcer    = "fastpath.kpmgcloudops.com.cer"
  }
]

ssl_certificates = [
  {
    certname       = "fastpath_kpmgcloudops_com",
    sslcertpfx     = "fastpath.kpmgcloudops.com.pfx"
  },
  {
    certname       = "adminfastpath_kpmgcloudops_com",
    sslcertpfx     = "adminfastpath.kpmgcloudops.com.pfx"
  },
  {
    certname       = "apifastpath_kpmgcloudops_com",
    sslcertpfx     = "apifastpath.kpmgcloudops.com.pfx"
  },
  {
    certname       = "apiadminfastpath_kpmgcloudops_com",
    sslcertpfx     = "apiadminfastpath.kpmgcloudops.com.pfx"
  }
]