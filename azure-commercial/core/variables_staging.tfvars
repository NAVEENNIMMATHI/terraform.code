# Authentication Varibles

subscription_id = "169d52bf-6f65-47d7-8f3e-e5c67d6ee19e"
client_id       = "5ba2d073-7ffe-4aca-a94f-a98bcd4032bb"
client_secret   = ""
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

pvt_dns_subscription_id = "4c9dc048-01dc-4854-9063-8a3d4060993a"

# Secrets
sql_administrator_password      = ""
common_virtual_machine_password = ""


# Project Variables

application_acronym    = "core"
environment            = "staging"
environment_acronym    = "stg"
environment_acronym_vm = "st"
location               = "eastus"
location_acronym       = "use"
location_dr            = "westus"
location_dr_acronym    = "usw"
unique_variable_suffix = ""
legacy_env_acronym     = "stg"
legacy_env_acronym_ns  = "stg"
tags = {
  Environment = "Staging"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core"
}

tags_AADDS = {
  Environment = "Staging"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - AADDS"
}

tags_ADSync = {
  Environment = "Staging"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - AD Sync"
}

tags_Artifactory = {
  Environment = "Staging"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - Artifactory"
}

tags_BuildAgent = {
  Environment = "Staging"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - Build Agent"
}

tags_Cloudockit = {
  Environment = "Staging"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - Cloudockit"
}

tags_DataDog = {
  Environment = "Staging"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - DataDog"
}

tags_NodeMgmt = {
  Environment = "Staging"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - Node Management"
}

tags_Networking = {
  Environment = "Staging"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - Networking"
}

tags_GatewayServices = {
  Environment = "Staging"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - Gateway Services"
}

tags_SNOW = {
  Environment = "Staging"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - SNOW"
}


# Automation Account Variables

automation_account_name = "ama-use-automation-runbook-stg"
automation_account_resource_group_name = "CO-stg-eastus-loganalytics-rg"


# Firewall Variables

firewall_environment     = "stg-core"
firewall_pip_environment = "stg"

# Firewall dr Variables

firewall_environment_dr                = ""
firewall_pip_environment_dr            = ""
firewall_policy_id_dr                  = ""
firewall_policy_dr_name                = ""
firewall_policy_dr_resource_group_name = ""
firewall_policy_dr_location            = ""
ip_confi_dr_name1                      = ""
ip_confi_dr_name2                      = ""
ip_confi_dr_name3                      = ""
dns_servers_dr                         = []


# Public IP Variables

snowpip_allocation_method = "Dynamic"


# Virtual Networks Variables

hub_vnet_address_space    = ["10.101.0.0/17"]
wu_hub_vnet_address_space = ["10.101.128.0/17"]
hub_vnet_dns_servers      = ["10.30.15.197", "10.30.15.196"]


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
subnet_address_space_web1_dr               = [""]
subnet_address_space_app1                  = ["10.101.3.0/24"]
subnet_address_space_db1                   = ["10.101.4.0/24"]
subnet_address_space_sec_mgmt              = ["10.101.5.0/27"]
subnet_address_space_ase1                  = ["10.101.5.64/26"]
subnet_address_space_aad_ds_domain         = ["10.101.5.32/27"]
subnet_address_space_wu_cyberark_core      = ["10.101.128.0/26"]
subnet_address_space_rdssspr_subnet        = ["10.101.5.128/25"]
subnet_address_space_squid                 = ["10.101.6.0/27"]
subnet_address_space_build                 = ["10.101.6.32/27"]
subnet_address_space_netapp                = [""]
subnet_address_space_aks                   = [""]
subnet_address_space_aks_agw               = [""]

# Key Vault Variables

key_vault_ip_list              = ["199.207.253.0/24", "199.206.0.5/32"]
disk_encrypt_app_object_id     = "e7d02040-7211-43c4-96d3-5852d09ae471"
bms_object_id                  = "24f4c0a4-5333-451d-b082-c5b2dc0f4932"
bms_object_wus_id              = "24f4c0a4-5333-451d-b082-c5b2dc0f4932"
wu_disk_encrypt_app_object_id  = "46c70e4d-2526-402e-bde2-05141d6ed675"
vm_password_rotation_object_id = "9dd48cdc-e404-4f68-86d6-28c4c11eca3c"
devops_group_object_id         = "ed4ec0f9-4ca1-4f9b-8e75-1f24c469778b"
diskencryptvault_name          = "kvl-use-ade-169d52bf"
diskencryptvault_rg_name       = "RGP-USE-COMMON"
core_kvl_name                  = "kvl-use-common-169d52bf"
core_kvl_rgp                   = "RGP-USE-COMMON"


# Application Gateway Variables

app_cert_pfx_password = ""
app_ssl_cert_pfx      = "rdgwp.kpmgcloudops.com.pfx"
app_auth_cert_cer     = "rdgwp.kpmgcloudops.com.cer"

core_aks_agw_sku_name                = "WAF_V2"
core_aks_agw_sku_tier                = "WAF_V2"
artifactory_fqdn                     = "artifactory-stg.kpmgcloudops.com"
artifactory_cert_name                = "artifactory.kpmgcloudops.com"
artifactory_backend_address_pool_ips = [""]
cloudockit_fqdn                     = "cloudockit-stg.kpmgcloudops.com"
cloudockit_cert_name                = "cloudockit.kpmgcloudops.com"
cloudockit_backend_address_pool_ips = [""]
aks_agw_allow_ip_list                = ["199.207.253.0/24","199.206.0.5/32"]


# SQL Server Variables

sql_ad_group_name      = "CO-TerraformStorage-Admin"
sql_ad_group_object_id = "43cd0df9-dfd3-42c3-ae01-df5e2444da5b"


# Route Table Variables

next_hop_in_ip_address_for_routetable_of_palo_alto = "10.30.16.100"
# SMTP 
smtp_ip_address             = "199.207.144.0/28"
epe_ip_address              = "20.36.246.63/32"


# Load Balancer Variables

rds_gateway_load_balancer_2_private_static_ip = "10.101.1.7"


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
allow_rdp_3389_bastion1_sec_rule_prefixes       = ["199.207.253.96", "199.206.0.5"]
allow_rdp_3389_cyberark_psm_sec_rule_prefixes   = ["10.30.2.100", "10.30.2.101", "10.30.2.102", "10.30.2.132", "10.30.2.133"]
allow_rdp_3389_wu_cyberark_pv_sec_rule_prefixes = ["10.30.2.100", "10.30.2.68", "10.30.2.101", "10.30.2.102", "10.30.2.132", "10.31.0.4", "111.125.228.102", "10.30.2.133"]


# Virtual Machine Instance Variables

## AADS Instance
static_ip_uemcaad = ["10.101.2.4"]

## Hybrid Worker Instance
custom_emails  = "go-fmmanagedservices@kpmg.com"
count_value_hybrid_worker    = "1"
need_zones                   = false
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

# MFA Instance
mfa1_nic_private_ip_address = "10.101.1.132"
mfa1_admin_username         = "uemcmfa1admin"

## RDSCB1 Instance
rds1_nic_private_ip_address = "10.101.1.68"
rds1_admin_username         = "uemcrdscb1admin"

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
squid_vm_count = "1"

## Domain Variables
domain_name          = "kco.local"
ou_path              = "OU=AADDC Computers,DC=kco,DC=local"
domain_user_name     = ""
domain_user_password = ""

#np-spoke-application subscription ID
spokeapp_subscription_id = "e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2"

# AZFW Private IP (to avoid circular dependencies)
azure_firewall_private_ip = ""

# Core AKS 
aks_version                 = "1.20.5"
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


# DNS Vnet
dns_vnet = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"

# AADDS
sub_aaddsdomain_name = "sub-use-aaddsdomain-stg"
sub_aaddsvm_name     = "sub-use-aaddsvm-stg"

sub_aaddsdomain_id   = ""
sub_aaddsvm_id       = ""