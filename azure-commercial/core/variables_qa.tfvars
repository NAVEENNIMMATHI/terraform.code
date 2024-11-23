# Authentication Varibles

subscription_id = "5ce45d57-3192-4bfe-9c2f-cb567b30c586"
client_id       = "e85eb674-13e7-418a-ba6f-29daba614eef"
client_secret   = ""
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"

pvt_dns_subscription_id = "c72acede-d539-45d9-963d-3464ec4ddae0"

# Secrets
sql_administrator_password      = ""
common_virtual_machine_password = ""


# Project Variables

application_acronym    = "core"
environment            = "qa"
environment_acronym    = "qa"
environment_acronym_vm = "qa"
location               = "eastus"
location_acronym       = "use"
location_dr            = "westus"
location_dr_acronym    = "usw"
unique_variable_suffix = ""
legacy_env_acronym     = "qa"
legacy_env_acronym_ns  = "qa"
tags = {
  Environment = "QA"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core"
}

tags_AADDS = {
  Environment = "QA"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - AADDS"
}

tags_ADSync = {
  Environment = "QA"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - AD Sync"
}

tags_Artifactory = {
  Environment = "QA"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - Artifactory"
}

tags_BuildAgent = {
  Environment = "QA"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - Build Agent"
}

tags_Cloudockit = {
  Environment = "QA"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - Cloudockit"
}

tags_DataDog = {
  Environment = "QA"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - DataDog"
}

tags_NodeMgmt = {
  Environment = "QA"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - Node Management"
}

tags_Networking = {
  Environment = "QA"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - Networking"
}

tags_GatewayServices = {
  Environment = "QA"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - Gateway Services"
}

tags_SNOW = {
  Environment = "QA"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - SNOW"
}

tags_dr = {
  Environment = "QA-DR"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core"
}

tags_dr_Networking = {
  Environment = "QA-DR"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - Networking"
}


tags_firewall_policy_dr = {
  environment = "QA-DR"
  lob         = "Advisory Other"
  node        = "Hub"
  platform    = "Azure Commercial Cloud"
  solution    = "Core - Networking"
}

# Automation Account Variables

automation_account_name = "ama-use-automation-runbook-qa"
automation_account_resource_group_name = "RGP-USE-LOGANALYTICS-QA"


# Firewall Variables

firewall_environment     = "qa-core"
firewall_pip_environment = "qa"
firewall_policy_id = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/firewallPolicies/fwp-use-core1-qa"
ip_confi_name1                          = "AzureFirewallIpConfiguration0"
ip_confi_name2                          = "firewall-ipconfig-klt-tomagakltp1"     
ip_confi_name3                          = "firewall-ipconfig-klt-tomagakltuatp1"
ip_confi_name4                          = "firewall-ipconfig-KLT_tomagskltp1"
ip_confi_name5                          = "firewall-ipconfig-KLT_tomagskltuatp1"
firewall_avail_zones                    = ["1","3"]

# Firewall dr Variables

firewall_environment_dr                = "qa-core-dr"
firewall_pip_environment_dr            = "qa-dr"
firewall_policy_id_dr                  = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/rgp-usw-hubvnet-qa/providers/Microsoft.Network/firewallPolicies/fwp-use-core1-qa-dr"
firewall_policy_dr_name                = "fwp-use-core1-qa-dr"
firewall_policy_dr_resource_group_name = "rgp-usw-hubvnet-qa"
firewall_policy_dr_location            = "West US"
ip_confi_dr_name1                      = "pip-fwl-usw-primary-qa-core-dr-1"
ip_confi_dr_name2                      = "pip-fwl-usw-primary-qa-core-dr-2"
ip_confi_dr_name3                      = "pip-fwl-usw-primary-qa-core-dr-3"
dns_servers_dr                         = []

# Public IP Variables

snowpip_allocation_method = "Static"


# Virtual Networks Variables

hub_vnet_address_space    = ["10.101.0.0/17"]
wu_hub_vnet_address_space = ["10.210.0.0/15", "10.212.0.0/14", "10.216.0.0/14"]
hub_vnet_dns_servers      = ["10.1.11.4", "10.1.11.5"]

dr_hubvnet_address_space  = ["10.220.0.0/15"]

# Subnet Variables
subnet_address_space_dmappgateway          = ["10.101.8.0/25"]
subnet_address_space_dmase                 = ["10.101.8.128/25"]
subnet_address_space_dmpe                  = ["10.101.9.0/25"]
subnet_address_space_dmdfir                = ["10.101.9.128/25"]

subnet_address_space_bastion1              = ["10.101.0.0/24"]
subnet_address_space_rdgw                  = ["10.101.1.0/26"]
subnet_address_space_rdcbl                 = ["10.101.1.64/26"]
subnet_address_space_infra1                = ["10.101.1.128/25"]
subnet_address_space_hybridworker          = ["10.101.7.240/28"]
subnet_address_space_aad_ds_vm             = ["10.101.2.0/26"]
subnet_address_space_cyberark_pv           = ["10.101.2.64/28"]
subnet_address_space_bastion2              = ["10.101.2.80/28"]
subnet_address_space_cyberark_psm          = ["10.101.2.96/27"]
subnet_address_space_cyberark_cpm          = ["10.101.2.128/27"]
subnet_address_space_cyberark_html_gateway = ["10.101.2.160/27"]
subnet_address_space_web1                  = ["10.101.2.192/26"]
subnet_address_space_web1_dr               = ["10.220.0.0/26"]
subnet_address_space_app1                  = ["10.101.3.0/24"]
subnet_address_space_db1                   = ["10.101.4.0/24"]
subnet_address_space_sec_mgmt              = ["10.101.5.0/27"]
subnet_address_space_ase1                  = ["10.101.5.64/26"]
subnet_address_space_aad_ds_domain         = ["10.101.5.32/27"]
subnet_address_space_wu_cyberark_core      = ["10.210.150.0/24"]
subnet_address_space_rdssspr_subnet        = ["10.101.5.128/25"]
subnet_address_space_squid                 = ["10.101.6.0/27"]
subnet_address_space_build                 = ["10.101.6.32/27"]
subnet_address_space_packer                = ["10.101.10.0/24"]
subnet_address_space_netapp                = [""]
subnet_address_space_aks                   = ["10.101.12.0/22"]
subnet_address_space_aks_agw               = ["10.101.6.64/26"]
subnet_address_space_dmworkers             = ["10.101.6.128/26"]
subnet_address_space_pvtendpnt_core        = ["10.101.11.0/24"]
subnet_address_space_pbi1                  = ["10.101.7.0/27"]
subnet_address_space_build_cicd            = ["10.101.16.0/22"]
subnet_address_space_wu_aadds              = [" "]
# Key Vault Variables

key_vault_ip_list              = ["199.207.253.0/24", "199.206.0.5/32"]
disk_encrypt_app_object_id     = "e7d02040-7211-43c4-96d3-5852d09ae471"
bms_object_id                  = "24f4c0a4-5333-451d-b082-c5b2dc0f4932"
bms_object_wus_id              = "24f4c0a4-5333-451d-b082-c5b2dc0f4932"
wu_disk_encrypt_app_object_id  = "46c70e4d-2526-402e-bde2-05141d6ed675"
vm_password_rotation_object_id = "f032c2a7-a4f2-4dd4-a173-fbb3af6c1a57"
devops_group_object_id         = "2e016729-80ae-4c88-a89b-e2db47575b62"
diskencryptvault_name          = "kvl-use-ade-5ce45d57"
diskencryptvault_rg_name       = "RGP-USE-COMMON"
core_kvl_name                  = "kvl-use-common-5ce45d57"
core_kvl_rgp                   = "RGP-USE-COMMON"


# Application Gateway Variables

app_cert_pfx_password = ""
app_ssl_cert_pfx      = "rdgw.passwordreset.kpmgcloudops.com.pfx"
app_auth_cert_cer     = "rdgw.passwordreset.kpmgcloudops.com.cer"

core_aks_agw_sku_name                = "WAF_V2"
core_aks_agw_sku_tier                = "WAF_V2"
artifactory_fqdn                     = "artifactory-qa.kpmgcloudops.com"
artifactory_cert_name                = "artifactory.kpmgcloudops.com"
artifactory_backend_address_pool_ips = ["10.101.15.200"]
cloudockit_fqdn                     = "cloudockit-qa.kpmgcloudops.com"
cloudockit_cert_name                = "cloudockit.kpmgcloudops.com"
cloudockit_backend_address_pool_ips = ["10.101.15.200"]
aks_agw_allow_ip_list               = ["199.207.253.0/24","199.206.0.5/32","40.76.169.86/32","40.76.168.231/32","40.76.169.36/32","40.76.169.44/32","40.76.169.103/32","20.185.109.156/32","20.185.106.213/32","103.216.201.96/28","103.58.118.96/27","1.244.129.34/32","125.20.85.114/32","103.58.118.128/25","103.58.118.80/28","103.133.112.80/28","20.81.66.3/32","168.61.45.140/32"]

# Storage Account Variables

core_binary_storage_account_name = "stousecorebinaryqa"


# SQL Server Variables

sql_ad_group_name      = "Co-Sandbox-CertandSecret"
sql_ad_group_object_id = "0bb34530-d113-4a67-a956-9c8698c4dec6"


# Route Table Variables

next_hop_in_ip_address_for_routetable_of_palo_alto = "10.101.2.196"
# SMTP 
smtp_ip_address             = "199.207.144.0/28"
epe_ip_address              = "20.124.230.36/32"


# Load Balancer Variables

rds_gateway_load_balancer_2_private_static_ip = "10.101.1.4"
squid_proxy_load_balancer_private_static_ip = "10.101.6.4"


# Network Security Rules Variables

ip_list_1                                       = ["52.180.179.108", "52.180.177.87", "13.75.105.168", "52.175.18.134", "52.138.68.41", "52.138.65.157", "104.41.159.212", "104.45.138.161", "52.169.125.119", "52.169.218.0", "52.187.19.1", "52.187.120.237", "13.78.172.246", "52.161.110.169", "52.174.189.149", "40.68.160.142", "40.83.144.56", "13.64.151.161"]
ip_list_2                                       = ["52.180.183.67", "52.180.181.39", "52.175.28.111", "52.175.16.141", "52.138.70.93", "52.138.64.115", "40.80.146.22", "40.121.211.60", "52.138.143.173", "52.169.87.10", "13.76.171.84", "52.187.169.156", "13.78.174.255", "13.78.191.178", "40.68.163.143", "23.100.14.28", "13.64.188.43", "23.99.93.197"]
cyberark_cpm_sec_rule_prefixes                  = ["10.30.2.100", "10.30.2.68", "10.30.2.101", "10.30.2.102", "0.30.2.132"]
allow_123_wu_cyberark_pv_sec_rule_prefixes      = ["0.30.17.100", "10.30.2.100", "10.30.2.68", "10.30.2.101", "10.31.0.4", "10.30.2.102", "0.30.17.102", "10.30.2.132", "10.30.2.133", "0.30.17.101"]
allow_161_cyberark_pv_sec_rule_prefixes         = ["10.30.2.100", "10.30.2.68", "10.30.2.101", "10.31.0.4", "10.30.2.102", "10.30.2.132", "10.30.2.133"]
allow_161_wu_cyberark_pv_sec_rule_prefixes      = ["0.30.17.100", "10.30.2.100", "10.30.2.68", "10.30.2.101", "10.31.0.4", "10.30.2.102", "0.30.17.102", "10.30.2.132", "10.30.2.133", "0.30.17.101"]
allow_162_cyberark_pv_sec_rule_prefixes         = ["10.30.2.100", "10.30.2.68", "10.30.2.101", "10.31.0.4", "10.30.2.102", "10.30.2.132", "10.30.2.133"]
allow_162_wu_cyberark_pv_sec_rule_prefixes      = ["0.30.17.100", "10.30.2.100", "10.30.2.68", "10.30.2.101", "10.31.0.4", "10.30.2.102", "0.30.17.102", "10.30.2.132", "10.30.2.133", "0.30.17.101"]
allow_1858_cyberark_psm_sec_rule_prefixes       = ["10.30.2.100", "10.30.2.101", "10.30.2.102", "10.30.2.132", "10.30.2.133"]
allow_1858_cyberark_pv_sec_rule_prefixes        = ["10.30.2.100", "10.30.2.68", "10.30.2.101", "10.31.0.4", "10.30.2.102", "10.30.2.132", "10.30.2.133"]
allow_1858_wu_cyberark_pv_sec_rule_prefixes     = ["0.30.17.100", "10.30.2.100", "10.30.2.68", "10.30.2.101", "10.31.0.4", "10.30.2.102", "0.30.17.102", "10.30.2.132", "10.30.2.133", "0.30.17.101"]
allow_22_bastion_sec_rule_prefixes              = ["111.125.228.49"]
allow_25_cyberark_pv_sec_rule_prefixes          = ["10.30.2.100", "10.30.2.68", "10.30.2.101", "10.31.0.4", "10.30.2.102", "10.30.2.132", "10.30.2.133"]
allow_443_bastion_sec_rule_prefixes             = ["103.58.118.215", "42.111.8.52", "47.185.149.214", "103.58.118.104", "27.7.91.73", "174.29.14.76", "27.59.41.173", "47.185.174.58"]
allow_443_panorama_dest_port_range              = ["22", "3389", "443"]
allow_443_panorama_sec_rule_prefixes            = ["199.207.253.0/24", "69.250.38.180", "106.51.58.102/32"]
allow_rdp_3389_bastion_sec_rule_prefixes        = ["103.58.118.215", "42.111.8.52", "47.185.149.214", "103.58.118.104", "103.58.118.104", "203.199.72.210", "103.226.237.123", "27.7.91.73", "174.29.14.76", "199.207.253.0/24", "66.25.43.167/32", "111.125.228.49", "49.32.111.112", "27.59.41.173", "47.185.174.58", "111.125.228.102", "103.226.237.116"]
allow_rdp_3389_bastion1_sec_rule_prefixes       = ["199.207.253.96","199.206.0.5"]
allow_rdp_3389_cyberark_psm_sec_rule_prefixes   = ["10.30.2.100", "10.30.2.101", "10.30.2.102", "10.30.2.132", "10.30.2.133"]
allow_rdp_3389_wu_cyberark_pv_sec_rule_prefixes = ["10.30.2.100", "10.30.2.68", "10.30.2.101", "10.30.2.102", "10.30.2.132", "10.31.0.4", "111.125.228.102", "10.30.2.133"]


# Virtual Machine Instance Variables

## AADS Instance
static_ip_uemcaad = []

## Hybrid Worker Instance
custom_emails  = "go-fmmanagedservices@kpmg.com"
count_value_hybrid_worker = "2"
need_zones                = true
count_value_hybrid_worker_ha = "0"
need_zones_ha                = false

# Bastion1 Instance
bastion1_nic_private_ip_address = "10.101.0.4"
bastion1_admin_username         = "uemcbastion1admin"

# Bastion2 Instance
bastion2_nic_private_ip_address = "10.101.0.5"
bastion2_admin_username         = "uemcbastion2admin"

# Bastion3 Instance
bastion3_nic_private_ip_address = "10.101.0.6"
bastion3_admin_username         = "uemcbastion3admin"

# Bastion 4 Instance
bastion4_nic_private_ip_address = "10.101.0.7"
bastion4_admin_username         = "uemcbastion4admin"

# CICD Windows Instance
cicd_win1_vm_nic_private_ip_address = "10.101.1.135"
cicd_win1_vm_admin_username         = "cicdadmin"
cicd_win1_vm_size                   = "Standard_D8s_v3"

# MFA Instance
mfa1_nic_private_ip_address = "10.101.1.132"
mfa1_admin_username         = "uemcmfa1admin"

## RDSCB1 Instance
rds1_nic_private_ip_address = "10.101.1.68"
rds1_admin_username         = "uemcrdscb1admin"
rds1_vm_nic_private_ip_address = "10.101.1.70"


## RDSCB2 Instance
rds2_nic_private_ip_address = "10.101.1.69"
rds2_admin_username         = "uemcrdscb2admin"

## RDSGW1 Instance
rdgw1_nic_private_ip_address = "10.101.1.6"
rdgw1_admin_username         = "uemcrdsgw1admin"

## RDSGW2 Instance
rdgw2_nic_private_ip_address = "10.101.1.5"
rdgw2_admin_username         = "uemcrdsgw2admin"

## SEP Instance
sep1_nic_private_ip_address = "10.101.1.134"
sep1_admin_username         = "uemcsep1admin"

## UEMCWSUS Instance
wsus_nic_private_ip_address = "10.101.1.138"
wsus_admin_username         = "uemcwsusadmin"
encryptappsp_key_password   = "=h.35k68N=jDy.ND_DagEQEznQxj1JJ0"

## UEMSNOW Instance
uemsnowvm_admin_username = "azuresnowadmin1"

## Panorama Instance
panorama_nic_private_ip_address = "10.101.16.5"

## Firewall Squid Proxy Instance
squid_vm_count = "3"
need_zones_squid = true

## Domain Variables
domain_name          = "kconp.local"
ou_path              = "OU=AADDC Computers,DC=kco,DC=local"
domain_user_name     = ""
domain_user_password = ""
netapp_user_name     = ""
netapp_user_password = ""

#np-spoke-application subscription ID
spokeapp_subscription_id = "96e9a7e6-da33-4993-89ca-b82e0b571aee"

# AZFW Private IP (to avoid circular dependencies)
azure_firewall_private_ip = "10.101.2.196"

# Core AKS 
aks_version                 = "1.21.9"
aks_default_node_pool_name  = "agentpool"
aks_default_node_count      = "4"
aks_default_node_size       = "Standard_D8s_v3"
aks_default_auto_scaling    = "false"
aks_default_pool_type       = "VirtualMachineScaleSets"
aks_default_avail_zones     = ["1"]
aks_os_disk_size            = "128"

aks_win_node_pool_name      = "wnpool"
aks_win_node_count          = "4"
aks_win_node_size           = "Standard_DS2_v2"
aks_win_auto_scaling        = "false"
aks_win_avail_zones         = ["1"]

aks_pgs_sku                 = "GP_Gen5_4"
aks_pgs_version             = "11"
aks_pgs_storage             = "640000"

aks_subnet_id               = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-core-aks-qa"
aks_agw_subnet_id           = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-core-aks-agw-qa"


# DNS Vnet
dns_vnet = "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet"

# core subnet IPs for DM
dm_app_gateway_subnet_ip    = "10.101.8.0/25"
core_ase_subnet_ip          = "10.101.8.128/25"

#Network Security Rule
PaloAlto1                                  = "20.185.109.156/32"
PaloAlto2                                  = "20.185.106.213/32"
KPMG_On-Premise                            = "199.207.253.0/24"
KPMG_VPN                                   = ["199.206.0.5/32"]
KGS_Bangalore                              = ["103.133.112.80/28","103.58.118.80/28"]
KGS_Gurgaon                                = "103.216.201.96/28"
ASE_PIP                                    = ["168.61.45.140"]

core_firewall_public_ip                    = ["52.190.37.51","52.190.37.75","52.146.53.140","52.146.53.139","52.146.53.16","52.170.175.39","52.170.174.246","52.188.26.32","52.188.27.2","52.188.26.99","52.224.25.180","52.224.25.158","52.224.25.140","20.42.39.126","52.224.25.167"]
digital_matrix_firewall_public_ip          = ["52.191.93.193","199.247.33.2/32","52.188.179.212","52.190.38.166","20.81.66.3","52.224.76.4"]
core_ase                                   = ["23.96.98.67","13.82.22.58","104.211.37.10"]
idp_ase                                    = ["52.188.160.237","52.255.180.120"]
light_house                                = ["52.151.208.127","52.151.208.144","52.151.208.152","52.151.208.154","52.151.208.217","52.151.209.28","20.49.104.19","40.117.183.136","13.72.72.241"]
cmbs                                       = ["104.41.132.180","13.91.93.63","52.173.245.164","40.71.249.205","40.114.40.132","52.232.188.154","104.209.247.23","52.162.242.161","104.42.122.49","40.112.195.87","13.91.97.196","40.71.193.203","104.210.14.156","13.66.130.243","65.52.197.64","40.113.242.246","40.71.11.80/28","40.71.15.160/27","52.162.107.160/28","52.162.111.192/27","13.89.171.80/28","13.89.178.64/27","40.70.146.208/28","40.70.151.96/27","13.86.223.32/27","40.112.243.160/28"]
mdp                                        = ["52.149.173.118","52.149.174.241","52.149.175.151","52.149.241.218","40.71.234.234","52.149.243.79","20.49.104.42"]
malta                                      = ["158.180.192.32/27","158.180.192.64/26","158.180.192.10/32","158.180.192.14/32","158.179.64.12/32","158.179.64.13/32","158.179.64.41/32","158.179.64.42/32","158.179.64.43/32","158.179.64.44/32","158.179.64.45/32","158.179.64.46/32","158.179.64.83/32","158.179.64.84/32","20.49.227.56/32"]
vmap_ase                                   = ["52.188.160.237","40.87.59.241","52.188.159.173"]
ms_odp                                     = ["52.152.200.89","52.149.189.39","52.186.36.97","52.188.180.20","52.188.91.218","52.188.91.246","52.188.92.114","52.188.92.122","52.188.92.141","52.152.201.79","52.188.92.250","52.188.93.14","52.188.93.126","52.188.93.147","52.186.38.103","52.186.38.19","40.88.18.164","52.152.202.231","52.188.93.170","52.188.93.205","52.188.93.214","52.188.93.219","52.188.93.235","52.188.176.242","52.188.93.239","52.188.93.245","52.188.94.57","52.188.94.132","52.188.94.145","52.186.36.229","20.49.104.32","52.151.235.131","52.151.239.192","40.71.239.210","52.149.170.190","52.149.171.237","40.71.237.163","52.149.173.118","52.149.174.241","52.149.175.151","52.149.241.218","40.71.234.234","52.149.243.79","52.149.245.5","52.149.246.162","52.149.247.225","52.188.143.13","52.152.192.21","52.152.192.42","52.152.192.71","52.151.236.145","40.71.239.250","52.152.192.224","52.152.193.149","52.152.194.54","52.152.195.126","40.71.235.219","52.152.196.125","52.152.198.47","52.152.199.12","52.152.199.116","20.49.104.42"]

# AADDS
sub_aaddsdomain_name = "sub-use-aaddsdomain-qa"
sub_aaddsvm_name     = "sub-use-aaddsvm-qa"
sub_aaddsdomain_id   = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-aaddsdomain-qa"
sub_aaddsvm_id       = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-aaddsvm-qa"

# Private DNS Variables
private_dns_zone_vault           = "privatelink.vaultcore.azure.net"
private_dns_zone_automation      = "privatelink.azure-automation.net"
private_dns_zone_resource_group  = "rgp-use-core-private-dnszone-dv" # we only have one dnz zone per tenant
hyb_worker_vm_count  = "1"

# PowerBI
vm_size_pbi           = "Standard_D4s_v3"
vm_count_pbi          = "3"
admin_password        = ""