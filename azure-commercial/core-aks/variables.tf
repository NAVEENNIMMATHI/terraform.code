# Authentication Varibles

variable "client_id" {
  type = string
}
variable "client_secret" {
  type = string
}
variable "subscription_id" {
  type = string
}
variable "tenant_id" {
  type = string
}

variable "pvt_dns_subscription_id" {
  type = string
}

# Secrets

variable "common_virtual_machine_password" {
  type = string
}
variable "sql_administrator_password" {
  type = string
}


# Project Variables

variable "application_acronym" {
  type = string
}
variable "environment" {
  type = string
}
variable "environment_acronym" {
  type = string
}
variable "environment_acronym_vm" {
  type = string
}
variable "legacy_env_acronym" {
  type    = string
  default = ""
}
variable "legacy_env_acronym_ns" {
  type    = string
  default = ""
}
variable "location" {
  type = string
}
variable "location_paired" {
  type = string
}
variable "location_acronym" {
  type = string
}
variable "location_acronym_paired" {
  type = string
}
variable "location_dr" {
  type = string
}
variable "location_dr_acronym" {
  type = string
}
variable "unique_variable_suffix" {
  type = string
}
variable "tags" {
  type = map(string)
}

variable "tags_Artifactory" {
  type = map(string)
}

variable "tags_BuildAgent" {
  type = map(string)
}

variable "tags_Cloudockit" {
  type = map(string)
}


# Azure Government Cloud Variables

variable "gov_build_agent_ip" {
  type    = string
  default = ""
}


# Automation Account Variables

variable "automation_account_name" {
  type = string
}

variable "automation_account_resource_group_name" {
  type = string
}

# Firewall Variables

variable "firewall_environment" {
  type = string
}
variable "firewall_pip_environment" {
  type = string
}

variable "azure_firewall_private_ip" {
  type = string
}

# Public IP Variables

variable "snowpip_allocation_method" {
  type = string
}


# Virtual Network Variables

variable "wu_hub_vnet_address_space" {
  type = list(string)
}
variable "hub_vnet_address_space" {
  type = list(string)
}
variable "hub_vnet_dns_servers" {
  type = list(string)
}


# Subnet Variables
variable "subnet_address_space_dmappgateway" {
  type = list(string)
}
variable "subnet_address_space_dmase" {
  type = list(string)
}
variable "subnet_address_space_dmpe" {
  type = list(string)
}
variable "subnet_address_space_dmdfir" {
  type = list(string)
}
variable "subnet_address_space_aad_ds_domain" {
  type = list(string)
}
variable "subnet_address_space_aad_ds_vm" {
  type = list(string)
}
variable "subnet_address_space_app1" {
  type = list(string)
}
variable "subnet_address_space_ase1" {
  type = list(string)
}
variable "subnet_address_space_bastion1" {
  type = list(string)
}
variable "subnet_address_space_bastion2" {
  type = list(string)
}
variable "subnet_address_space_build" {
  type = list(string)
}
variable "subnet_address_space_cyberark_cpm" {
  type = list(string)
}
variable "subnet_address_space_cyberark_html_gateway" {
  type = list(string)
}
variable "subnet_address_space_cyberark_psm" {
  type = list(string)
}
variable "subnet_address_space_cyberark_pv" {
  type = list(string)
}
variable "subnet_address_space_db1" {
  type = list(string)
}
variable "subnet_address_space_infra1" {
  type = list(string)
}
variable "subnet_address_space_hybridworker" {
  type = list(string)
}
variable "subnet_address_space_rdcbl" {
  type = list(string)
}
variable "subnet_address_space_rdgw" {
  type = list(string)
}
variable "subnet_address_space_rdssspr_subnet" {
  type = list(string)
}
variable "subnet_address_space_sec_mgmt" {
  type = list(string)
}
variable "subnet_address_space_squid" {
  type = list(string)
}
variable "subnet_address_space_web1" {
  type = list(string)
}
variable "subnet_address_space_wu_cyberark_core" {
  type = list(string)
}
variable "subnet_address_space_packer" {
  type = list(string)
}
variable "subnet_address_space_netapp" {
  type = list(string)
}
variable "subnet_address_space_aks" {
  type = list(string)
}
variable "subnet_address_space_aks_agw" {
  type = list(string)
}
variable "subnet_address_space_aks_paired" {
  type = list(string)
}
variable "subnet_address_space_dmworkers" {
  type = list(string)
}
variable "subnet_address_space_pvtendpnt_core" {
  type = list(string)
}
variable "subnet_address_space_pbi1" {
  type = list(string)
}

# Key Vault Variables

variable "bms_object_id" {
  type = string
}
variable "bms_object_wus_id" {
  type = string
}
variable "copeusopskeys01hub_key_vault_name" {
  type    = string
  default = ""
}
variable "disk_encrypt_app_object_id" {
  type = string
}
variable "key_vault_name" {
  type    = string
  default = ""
}
variable "key_vault_ip_list" {
  type = list(string)
}
variable "wu_disk_encrypt_app_object_id" {
  type = string
}
variable "wu_key_vault_name" {
  type    = string
  default = ""
}
variable "vm_password_rotation_object_id" {
  type = string
}
variable "devops_group_object_id" {
  type = string
}
variable "diskencryptvault_name" {
  type = string
}
variable "diskencryptvault_rg_name" {
  type = string
}
variable "core_kvl_name" {
  type = string
}
variable "core_kvl_rgp" {
  type = string
}
variable "core_kvl_rgp_paired" {
  type = string
}

# Application Gateway Variavles

variable "app_auth_cert_cer" {
  type = string
}
variable "app_cert_pfx_password" {
  type = string
}
variable "app_ssl_cert_pfx" {
  type = string
}
variable "core_aks_agw_sku_name" {
  type = string
}
variable "core_aks_agw_sku_tier" {
  type = string
}
variable "artifactory_fqdn" {
  type = string
}
variable "artifactory_cert_name" {
  type = string
}
variable "artifactory_backend_address_pool_ips" {
  type = list(string)
}
variable "cloudockit_fqdn" {
  type = string
}
variable "cloudockit_cert_name" {
  type = string
}
variable "cloudockit_backend_address_pool_ips" {
  type = list(string)
}
variable "aks_agw_allow_ip_list" {
  type = list(string)
}
variable "aks_agw_allow_ip_list_kgs" {
  type = list(string)
}

# Recovery Services Vault Variables

variable "recovery_services_vault_name" {
  type    = string
  default = ""
}

variable "wu_recovery_services_vault_name" {
  type    = string
  default = ""
}

# Storage Account Variables

variable "activity_logs_storage_account_name" {
  type    = string
  default = ""
}
variable "diagnostics_logs_eus2_storage_account_name" {
  type    = string
  default = ""
}
variable "diagnostics_logs_storage_account_name" {
  type    = string
  default = ""
}
variable "image_storage_account_name" {
  type    = string
  default = ""
}
variable "recovery_storage_account_name" {
  type    = string
  default = ""
}
variable "sql_audit_logs_storage_account_name" {
  type    = string
  default = ""
}
variable "vm_diagnostics_logs_storage_account_name" {
  type    = string
  default = ""
}
variable "wu_diagnostics_logs_storage_account_name" {
  type    = string
  default = ""
}
variable "wu_image_storage_account_name" {
  type    = string
  default = ""
}
variable "wu_vm_diagnostics_logs_storage_account_name" {
  type    = string
  default = ""
}

variable "prod_storageaccount_firewall_hard_coded_value_GatewaySubnet" {
  type    = string
  default = ""
}

variable "prod_storageaccount_firewall_hard_coded_value_co-p-eastus-web1-subnet" {
  type    = string
  default = ""
}

# Hardened Image Variables

variable "eu_2012_windows_hardened_image" {
  type    = string
  default = ""
}
variable "eu_2016_windows_hardened_image" {
  type    = string
  default = ""
}
variable "eu_centos75_hardened_image" {
  type    = string
  default = ""
}
variable "eu_windows_2012_r2-hardened-image" {
  type    = string
  default = ""
}
variable "eu_windows_2016_hardened_image_v2" {
  type    = string
  default = ""
}


# SQL Server Variables

variable "sql_ad_group_name" {
  type = string
}
variable "sql_ad_group_object_id" {
  type = string
}


# Route Table Variables

variable "next_hop_in_ip_address_for_routetable_of_palo_alto" {
  type = string
}


# Load Balancer Variables

variable "rds_gateway_load_balancer_2_private_static_ip" {
  type = string
}


# Network Security Rules Variables

variable "ip_list_1" {
  type = list(string)
}
variable "ip_list_2" {
  type = list(string)
}
variable "cyberark_cpm_sec_rule_prefixes" {
  type = list(string)
}
variable "allow_123_wu_cyberark_pv_sec_rule_prefixes" {
  type = list(string)
}
variable "allow_161_cyberark_pv_sec_rule_prefixes" {
  type = list(string)
}
variable "allow_161_wu_cyberark_pv_sec_rule_prefixes" {
  type = list(string)
}
variable "allow_162_cyberark_pv_sec_rule_prefixes" {
  type = list(string)
}
variable "allow_162_wu_cyberark_pv_sec_rule_prefixes" {
  type = list(string)
}
variable "allow_1858_cyberark_psm_sec_rule_prefixes" {
  type = list(string)
}
variable "allow_1858_cyberark_pv_sec_rule_prefixes" {
  type = list(string)
}
variable "allow_1858_wu_cyberark_pv_sec_rule_prefixes" {
  type = list(string)
}
variable "allow_22_bastion_sec_rule_prefixes" {
  type = list(string)
}
variable "allow_25_cyberark_pv_sec_rule_prefixes" {
  type = list(string)
}
variable "allow_443_bastion_sec_rule_prefixes" {
  type = list(string)
}
variable "allow_443_panorama_dest_port_range" {
  type = list(string)
}
variable "allow_443_panorama_sec_rule_prefixes" {
  type = list(string)
}
variable "allow_rdp_3389_bastion_sec_rule_prefixes" {
  type = list(string)
}
variable "allow_rdp_3389_bastion1_sec_rule_prefixes" {
  type = list(string)
}
variable "allow_rdp_3389_cyberark_psm_sec_rule_prefixes" {
  type = list(string)
}
variable "allow_rdp_3389_wu_cyberark_pv_sec_rule_prefixes" {
  type = list(string)
}


# Virtual Machine Instance Variables

## Hybrid Worker Shared Instance
variable "count_value_hybrid_worker" {
  type = string
}

## Hybrid Worker Instance

variable "custom_emails" {
  type = string
}

## AADS Instance

variable "static_ip_uemcaad" {
  type = list(string)
}

## Bastion1 Instance

variable "bastion1_nic_private_ip_address" {
  type = string
}
variable "bastion1_admin_username" {
  type = string
}
## Bastion2 Instance

variable "bastion2_nic_private_ip_address" {
  type = string
}
variable "bastion2_admin_username" {
  type = string
}

## Bastion3 Instance

variable "bastion3_nic_private_ip_address" {
  type = string
}
variable "bastion3_admin_username" {
  type = string
}

## Bastion 4 Instance

variable "bastion4_nic_private_ip_address" {
  type = string
}
variable "bastion4_admin_username" {
  type = string
}

## CICDwin1 Instance

variable "cicd_win1_vm_nic_private_ip_address" {
  type = string
}
variable "cicd_win1_vm_admin_username" {
  type = string
}
variable "cicd_win1_vm_size" {
  type = string
}

## Domain Instance

variable "domain_name" {
  type = string
}
variable "ou_path" {
  type = string
}
variable "domain_user_name" {
  type = string
}
variable "domain_user_password" {
  type = string
}


## MFA1 Instance

variable "mfa1_nic_private_ip_address" {
  type = string
}
variable "mfa1_admin_username" {
  type = string
}

## RDSCB1 Instance

variable "rds1_nic_private_ip_address" {
  type = string
}
variable "rds1_admin_username" {
  type = string
}

## RDSCB2 Instance

variable "rds2_nic_private_ip_address" {
  type = string
}
variable "rds2_admin_username" {
  type = string
}

## RDSGW1 Instance

variable "rdgw1_nic_private_ip_address" {
  type = string
}
variable "rdgw1_admin_username" {
  type = string
}

## RDSGW2 Instance

variable "rdgw2_nic_private_ip_address" {
  type = string
}
variable "rdgw2_admin_username" {
  type = string
}

## SEP1 Instance

variable "sep1_nic_private_ip_address" {
  type = string
}
variable "sep1_admin_username" {
  type = string
}

## UEMCWSUS Instance

variable "wsus_nic_private_ip_address" {
  type = string
}
variable "wsus_admin_username" {
  type = string
}
variable "encryptappsp_key_password" {
  type = string
}

## UEMSNOW Instance

variable "uemsnowvm_admin_username" {
  type = string
}

## PA Instance

variable "panorama_nic_private_ip_address" {
  type = string
}

## Squid Proxy Instance

variable "squid_vm_count" {
  type = string
}

## PBI GW Instance

variable "vm_size_pbi" {
  type = string
}

variable "vm_count_pbi" {
  type = string
}

variable "admin_password" {
  type = string
}


#spoke app subscription
variable "spokeapp_subscription_id" {
  type = string
}

# Core AKS
variable "aks_version" {
  type = string
}

variable "aks_version_paired" {
  type = string
}

variable "aks_os_disk_size" {
  type = string
}

variable "aks_default_node_pool_name" {
  type = string
}

variable "aks_default_node_count" {
  type = string
}

variable "aks_default_min_count" {
  type = string
}

variable "aks_default_max_count" {
  type = string
}

variable "aks_default_node_size" {
  type = string
}

variable "aks_default_auto_scaling" {
  type = string
}

variable "aks_default_pool_type" {
  type = string
}

variable "aks_default_avail_zones" {
  type = list(string)
}

variable "dns_vnet" {
  type = string
}

variable "dns_vnet_paired" {
  type = string
}

variable "aks_win_node_pool_name" {
  type = string
}

variable "aks_win_node_count" {
  type = string
}

variable "aks_win_node_size" {
  type = string
}

variable "aks_win_auto_scaling" {
  type = string
}

variable "aks_win_avail_zones" {
  type = list(string)
}

variable "aks_pgs_sku" {
  type = string
}

variable "aks_pgs_version" {
  type = string
}

variable "aks_pgs_storage" {
  type = string
}

variable "smtp_ip_address" {
  type    = string
  default = "0.0.0.0"
}


# core subnet IPs for DM

variable "dm_app_gateway_subnet_ip" {
  type    = string
  default = "0.0.0.0"
}
variable "core_ase_subnet_ip" {
  type    = string
  default = "0.0.0.0"
}

#Network Security Rule

variable "PaloAlto1" {
  type    = string
  default = ""
}

variable "PaloAlto2" {
  type    = string
  default = ""
}

variable "KPMG_On-Premise" {
  type    = string
  default = ""
}

variable "KPMG_VPN" {
  type = list(string)
}

variable "KGS_Bangalore" {
  type = list(string)
}

variable "KGS_Gurgaon" {
  type    = string
  default = ""
}

variable "ASE_PIP" {
 type = list(string)
}

variable "core_firewall_public_ip" {
  type = list(string)
}

variable "digital_matrix_firewall_public_ip" {
 type = list(string)
}

variable "core_ase" {
 type = list(string)
}

variable "idp_ase" {
 type = list(string)
}

variable "light_house" {
 type = list(string)
}

variable "cmbs" {
 type = list(string)
}

variable "mdp" {
 type = list(string)
}

# AADDS

variable "sub_aaddsdomain_name" {
  type    = string
}

variable "sub_aaddsvm_name" {
  type    = string
}

variable "sub_aaddsdomain_id" {
  type    = string
}

variable "sub_aaddsvm_id" {
  type    = string
}

# Private DNS Variables

variable "private_dns_zone_vault" {
  type = string
}

variable "private_dns_zone_automation" {
  type = string
}

variable "private_dns_zone_resource_group" {
  type = string
}
variable "hyb_worker_vm_count" {
  type = string
}

# IDP - EPE

variable "epe_ip_address" {
  type    = string
  default = ""
}
variable "subnet_address_space_build_cicd" {
  type = list(string)
}

# Core-AKS
variable "hubvnet_resource_group" {
  type = string
}

variable "hubvnet_resource_group_paired" {
  type = string
}

variable "hubvnet_virtual_network" {
  type = string
}

variable "hubvnet_virtual_network_paired" {
  type = string
}

variable "loganalytics_resource_group" {
  type = string
}

variable "log_analytics_workspace_corelogs" {
  type = string
}

variable "log_analytics_workspace_hub" {
  type = string
}

variable "eventhub_namespace_hub" {
  type = string
}

variable "eventhub_hub_events" {
  type = string
}

variable "hub_events_namespace_auth_rule" {
  type = string
}

variable "firewall_routetable_name" {
  type = string
}

variable "firewall_routetable_name_paired" {
  type = string
}

variable "firewall_pip1_name" {
  type = string
}

variable "firewall_pip2_name" {
  type = string
}

variable "firewall_pip3_name" {
  type = string
}

variable "firewall_pip4_name" {
  type = string
}

variable "firewall_pip5_name" {
  type = string
}