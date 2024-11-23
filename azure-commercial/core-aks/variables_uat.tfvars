# Authentication Varibles

subscription_id = "931d8a2f-96bb-44d3-9b06-6c05c41c4060"
client_id       = "98839278-b29e-4f18-be7c-556056236579"
client_secret   = ""
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

pvt_dns_subscription_id = "4c9dc048-01dc-4854-9063-8a3d4060993a"

# Secrets
sql_administrator_password      = ""
common_virtual_machine_password = ""


# Project Variables

application_acronym    = "core"
environment            = "uat"
environment_acronym    = "uat"
environment_acronym_vm = "ut"
location               = "eastus"
location_paired        = ""
location_acronym       = "use"
location_acronym_paired= ""
location_dr            = "westus"
location_dr_acronym    = "usw"
unique_variable_suffix = ""
legacy_env_acronym     = "uat"
legacy_env_acronym_ns  = "uat"
tags = {
  Environment = "UAT"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core"
}

tags_Artifactory = {
  Environment = "UAT"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - Artifactory"
}

tags_BuildAgent = {
  Environment = "UAT"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - Build Agent"
}

tags_Cloudockit = {
  Environment = "UAT"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - Cloudockit"
}


# Automation Account Variables

automation_account_name = "ama-use-automation-runbook-uat"
automation_account_resource_group_name = "RGP-USE-LOGANALYTICS-UAT"


# Firewall Variables

firewall_environment     = "uat-core"
firewall_pip_environment = "uat"


# Public IP Variables

snowpip_allocation_method = "Dynamic"


# Virtual Networks Variables

hub_vnet_address_space    = ["10.100.0.0/17"]
wu_hub_vnet_address_space = ["10.100.128.0/17"]
hub_vnet_dns_servers      = ["10.30.15.197", "10.30.15.196"]


# Subnet Variables
subnet_address_space_dmappgateway          = ["10.100.8.0/25"]
subnet_address_space_dmase                 = ["10.100.8.128/25"]
subnet_address_space_dmpe                  = ["10.100.9.0/25"]
subnet_address_space_dmdfir                = ["10.100.9.128/25"]

subnet_address_space_bastion1              = ["10.100.0.0/24"]
subnet_address_space_rdgw                  = ["10.100.1.0/26"]
subnet_address_space_rdcbl                 = ["10.100.1.64/26"]
subnet_address_space_infra1                = ["10.100.1.128/25"]
subnet_address_space_hybridworker          = ["10.100.7.240/28"]
subnet_address_space_aad_ds_vm             = ["10.100.2.0/26"]
subnet_address_space_cyberark_pv           = ["10.100.2.64/28"]
subnet_address_space_bastion2              = ["10.100.2.80/28"]
subnet_address_space_cyberark_psm          = ["10.100.2.96/27"]
subnet_address_space_cyberark_cpm          = ["10.100.2.128/27"]
subnet_address_space_cyberark_html_gateway = ["10.100.2.160/27"]
subnet_address_space_web1                  = ["10.100.2.192/26"]
subnet_address_space_app1                  = ["10.100.3.0/24"]
subnet_address_space_db1                   = ["10.100.4.0/24"]
subnet_address_space_sec_mgmt              = ["10.100.5.0/27"]
subnet_address_space_ase1                  = ["10.100.5.64/26"]
subnet_address_space_aad_ds_domain         = ["10.100.5.32/27"]
subnet_address_space_wu_cyberark_core      = ["10.100.128.0/26"]
subnet_address_space_rdssspr_subnet        = ["10.100.5.128/25"]
subnet_address_space_squid                 = ["10.100.6.0/27"]
subnet_address_space_build                 = ["10.100.6.32/27"]
subnet_address_space_packer                = ["10.100.16.0/24"]
subnet_address_space_netapp                = [""]
subnet_address_space_aks                   = ["10.100.12.0/22"]
subnet_address_space_aks_agw               = ["10.100.6.64/26"]
subnet_address_space_aks_paired            = []
subnet_address_space_dmworkers             = ["10.100.6.128/26"]
subnet_address_space_pvtendpnt_core        = ["10.100.11.0/24"]
subnet_address_space_pbi1                  = ["10.100.7.0/27"]
subnet_address_space_build_cicd            = ["10.100.20.0/22"]

# Key Vault Variables

key_vault_ip_list              = ["199.207.253.0/24", "199.206.0.5/32"]
disk_encrypt_app_object_id     = "e7d02040-7211-43c4-96d3-5852d09ae471"
bms_object_id                  = "24f4c0a4-5333-451d-b082-c5b2dc0f4932"
bms_object_wus_id              = "24f4c0a4-5333-451d-b082-c5b2dc0f4932"
wu_disk_encrypt_app_object_id  = "46c70e4d-2526-402e-bde2-05141d6ed675"
vm_password_rotation_object_id = "9dd48cdc-e404-4f68-86d6-28c4c11eca3c"
devops_group_object_id         = "ed4ec0f9-4ca1-4f9b-8e75-1f24c469778b"
diskencryptvault_name          = "kvl-use-ade-931d8a2f"
diskencryptvault_rg_name       = "RGP-USE-COMMON"
core_kvl_name                  = "kvl-use-common-931d8a2f"
core_kvl_rgp                   = "RGP-USE-COMMON"
core_kvl_rgp_paired            = ""


# Application Gateway Variables

app_cert_pfx_password = ""
app_ssl_cert_pfx      = "rdgwp.kpmgcloudops.com.pfx"
app_auth_cert_cer     = "rdgwp.kpmgcloudops.com.cer"

core_aks_agw_sku_name                = "WAF_V2"
core_aks_agw_sku_tier                = "WAF_V2"
artifactory_fqdn                     = "artifactory-uat.kpmgcloudops.com"
artifactory_cert_name                = "artifactory.kpmgcloudops.com"
artifactory_backend_address_pool_ips = ["10.100.15.200"]
cloudockit_fqdn                      = "cloudockit-uat.kpmgcloudops.com"
cloudockit_cert_name                 = "cloudockit.kpmgcloudops.com"
cloudockit_backend_address_pool_ips  = ["10.100.15.200"]
aks_agw_allow_ip_list                = ["199.207.253.0/24", "199.206.0.5/32", "13.82.22.58/32", "52.170.175.39", "52.170.174.246", "52.188.26.32", "52.188.27.2", "52.188.26.99"]
aks_agw_allow_ip_list_kgs            = ["103.58.118.128/25", "103.58.118.96/27", "103.58.118.80/28"]

# SQL Server Variables

sql_ad_group_name       = "CO-TerraformStorage-Admin"
sql_ad_group_object_id  = "43cd0df9-dfd3-42c3-ae01-df5e2444da5b"


# Route Table Variables

next_hop_in_ip_address_for_routetable_of_palo_alto = "10.30.16.100"
# SMTP
smtp_ip_address             = "199.207.144.0/28"
epe_ip_address              = "20.124.230.36"


# Load Balancer Variables

rds_gateway_load_balancer_2_private_static_ip = "10.100.1.4"


# Network Security Rules Variables (COME BACK TO THIS)

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
count_value_hybrid_worker = "1"

# Bastion1 Instance
bastion1_nic_private_ip_address = "10.100.0.4"
bastion1_admin_username         = "uemcbastion1admin"

# Bastion2 Instance
bastion2_nic_private_ip_address = "10.100.0.5"
bastion2_admin_username         = "uemcbastion2admin"

# Bastion3 Instance
bastion3_nic_private_ip_address = "10.100.0.6"
bastion3_admin_username         = "uemcbastion3admin"

# Bastion 4 Instance
bastion4_nic_private_ip_address = "10.100.0.7"
bastion4_admin_username         = "uemcbastion4admin"

# CICD Windows Instance
cicd_win1_vm_nic_private_ip_address = "10.100.1.135"
cicd_win1_vm_admin_username         = "cicdadmin"
cicd_win1_vm_size                   = "Standard_D8s_v3"

# MFA Instance
mfa1_nic_private_ip_address = "10.100.1.132"
mfa1_admin_username         = "uemcmfa1admin"

## RDSCB1 Instance
rds1_nic_private_ip_address = "10.100.1.68"
rds1_admin_username         = "uemcrdscb1admin"

## RDSCB2 Instance
rds2_nic_private_ip_address = "10.100.1.69"
rds2_admin_username         = "uemcrdscb2admin"

## RDSGW1 Instance
rdgw1_nic_private_ip_address = "10.100.1.6"
rdgw1_admin_username         = "uemcrdsgw1admin"

## RDSGW2 Instance
rdgw2_nic_private_ip_address = "10.100.1.5"
rdgw2_admin_username         = "uemcrdsgw2admin"

## SEP Instance
sep1_nic_private_ip_address = "10.100.1.134"
sep1_admin_username         = "uemcsep1admin"

## UEMCWSUS Instance
wsus_nic_private_ip_address = "10.100.1.138"
wsus_admin_username         = "uemcwsusadmin"
encryptappsp_key_password   = "=h.35k68N=jDy.ND_DagEQEznQxj1JJ0"

## UEMSNOW Instance
uemsnowvm_admin_username = "azuresnowadmin1"

## Panorama Instance
panorama_nic_private_ip_address = "10.100.16.5"

## Firewall Squid Proxy Instance
squid_vm_count = "3"

## Domain Variables
domain_name          = "kco.local"
ou_path              = "OU=AADDC Computers,DC=kco,DC=local"
domain_user_name     = ""
domain_user_password = ""

#pd-spoke-application subscription ID
spokeapp_subscription_id = "104a6d25-89e7-4297-9d68-76c0443b2cf6"

# AZFW Private IP (to avoid circular dependencies)
azure_firewall_private_ip = "10.100.2.196"

# Core AKS
aks_version                 = "1.24.6"
aks_version_paired          = ""
aks_default_node_pool_name  = "agentpool"
aks_default_node_count      = "5"
aks_default_min_count       = "5" 
aks_default_max_count       = "8"  
aks_default_node_size       = "Standard_D8s_v3"
aks_default_auto_scaling    = "true"
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


# DNS Vnet
dns_vnet = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
dns_vnet_paired = ""

# core subnet IPs for DM
dm_app_gateway_subnet_ip    = "10.100.8.0/25"
core_ase_subnet_ip          = "10.100.8.128/25"

#Network Security Rule
PaloAlto1                                  = "20.185.106.126/32"
PaloAlto2                                  = "20.185.110.197/32"
KPMG_On-Premise                            = "199.207.253.0/24"
KPMG_VPN                                   = ["199.206.0.5/32"]
KGS_Bangalore                              = ["103.133.112.80/28","103.58.118.80/28"]
KGS_Gurgaon                                = "103.216.201.96/28"
ASE_PIP                                    = ["13.82.22.58"]
core_firewall_public_ip                    = ["52.190.37.51","52.190.37.75","52.146.53.140","52.146.53.139","52.146.53.16","40.76.169.86","40.76.168.231","40.76.169.36","40.76.169.44","40.76.169.103","52.224.25.180","52.224.25.158","52.224.25.140","20.42.39.126","52.224.25.167"]
digital_matrix_firewall_public_ip          = ["52.191.93.193","199.247.33.2/32","20.81.66.3/32","52.190.38.166","52.188.179.212"]
core_ase                                   = ["23.96.98.67","168.61.45.140","104.211.37.10"]
idp_ase                                    = ["52.188.160.237"]
light_house                                = ["52.151.208.127","52.151.208.144","52.151.208.152","52.151.208.154","52.151.208.217","52.151.209.28","20.49.104.19","40.117.183.136","13.72.72.241"]
cmbs                                       = ["104.41.132.180","13.91.93.63","52.173.245.164","40.71.249.205","40.114.40.132","52.232.188.154","104.209.247.23","52.162.242.161","104.42.122.49","40.112.195.87","13.91.97.196","40.71.193.203","104.210.14.156","13.66.130.243","65.52.197.64","40.113.242.246","40.71.11.80/28","40.71.15.160/27","52.162.107.160/28","52.162.111.192/27","13.89.171.80/28","13.89.178.64/27","40.70.146.208/28","40.70.151.96/27","13.86.223.32/27","40.112.243.160/28"]
mdp                                        = ["52.149.173.118","52.149.174.241","52.149.175.151","52.149.241.218","40.71.234.234","52.149.243.79","20.49.104.42"]

# AADDS
sub_aaddsdomain_name = "sub-use-aaddsdomain-uat"
sub_aaddsvm_name     = "sub-use-aaddsvm-uat"

sub_aaddsdomain_id   = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-aaddsdomain-uat"
sub_aaddsvm_id       = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-aaddsvm-uat"

# Private DNS Variables
private_dns_zone_vault           = "privatelink.vaultcore.azure.net"
private_dns_zone_automation      = "privatelink.azure-automation.net"
private_dns_zone_resource_group  = "rgp-use-core-private-dnszone-pd" # we only have one dns zone per tenant
hyb_worker_vm_count  = "1"

# PowerBI
vm_size_pbi           = "Standard_D4s_v3"
vm_count_pbi          = "2"
admin_password        = ""

# Core-AKS
hubvnet_resource_group            = "RGP-USE-COREVNET-UAT"
hubvnet_resource_group_paired     = ""
hubvnet_virtual_network           = "vnt-use-core-uat"
hubvnet_virtual_network_paired    = ""
loganalytics_resource_group       = "RGP-USE-LOGANALYTICS-UAT"
log_analytics_workspace_corelogs  = "law-use-corelogs-uat"
log_analytics_workspace_hub       = "law-use-core1-uat"
eventhub_namespace_hub            = "ehn-use-core1-uat"
eventhub_hub_events               = "ehb-use-core1-uat"
hub_events_namespace_auth_rule    = "ehr-use-core1-uat"
firewall_routetable_name          = "rtb-use-azfirewall-uat"
firewall_routetable_name_paired   = ""
firewall_pip1_name                = "pip-fwl-use-primary-uat-core-1"
firewall_pip2_name                = "pip-fwl-use-primary-uat-core-2"
firewall_pip3_name                = "pip-fwl-use-primary-uat-core-3"
firewall_pip4_name                = "pip-fwl-use-primary-uat-core-4"
firewall_pip5_name                = "pip-fwl-use-primary-uat-core-5"