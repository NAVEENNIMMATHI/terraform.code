#environment specific variables
variable "target_deployment_environment" { type = string }

variable "environment" { type = string }

variable "environment_dev" { type = string }

variable "environment_qa" { type = string }

variable "environment_uat" { type = string }

variable "application_environment_1" { type = string }

variable "eastus_acronym" { type = string }

variable "tags" {
  type = map(string)
}

variable "krtbuildvm_objectid" { type = string }

variable "application_acronym" { type = string }

#Resource Group
variable "backuprecovery_rg_name" { type = string }

variable "loganalytics_rg_name" { type = string }

variable "application_rg_name" { type = string }

variable "loganalytics_rg_location" { type = string }

variable "backuprecovery_rg_location" { type = string }

variable "application_rg_location" { type = string }

#service principal
variable "encryptapp_service_principal_name" { type = string }

variable "backupmanagement_service_principal_name" { type = string }

#route table
variable "spi_route_table_name" { type = string }

variable "spi_route_table_resource_group_name" { type = string }

#virtual network and subnet
variable "virtual_network_name" { type = string }

variable "krtagw1_subnet_name" { type = string }

variable "krtagw1_subnet_adress_space" { type = string }

variable "krtapp1_subnet_name" { type = string }

variable "krtapp1_subnet_adress_space" { type = string }

variable "krtase1_subnet_name" { type = string }

variable "krtase1_subnet_adress_space" { type = string }

variable "address_space" {
  type = list(string)
}

variable "dns_server" {
  type = list(string)
}

variable "coreinfrasubnetid" { type = string }

variable "coresubscriptionid" { type = string }

variable "transitsubscriptionid" { type = string }

variable "vmimagesubscriptionid" { type = string }

variable "corevnetresourcegroup" { type = string }

variable "transitvnetresourcegroup" { type = string }

variable "corevnetname" { type = string }

variable "transitvnetname" { type = string }

variable "core_aks_subnet_id" { type = string }

#Network Security Groups
variable "nsg_name_agw" { type = string }

variable "nsg_name_app" { type = string }

variable "nsg_name_ase" { type = string }

variable "KPMG_Trusted_NW_address_prefixes" {
  type = list(string)
}

#RecoveryService
variable "recovery_service_name" { type = string }

#App Service Environment
variable "dns_suffix" { type = string }

variable "ase_name" { type = string }

variable "app_service_name" { type = string }

variable "app_service_plan_name" { type = string }

#Application Insights
variable "app_insights_name" { type = string }

#Storage Account

variable "postprocess_storage_account_name" { type = string }

variable "storage_account_name_recovery" { type = string }

variable "storage_account_name_dialog" { type = string }

variable "storage_account_name_vmdialog" { type = string }

variable "storage_account_name_webapp_backup" { type = string }

variable "storage_account_name_app" { type = string }

variable "storage_account_name_app_log" { type = string }

variable "account_type" { type = string }

variable "account_tier" { type = string }

variable "replication_type" { type = string }

variable "kpmg_nat_ip_list" {
  type = list(string)
}

variable "wvd_subnet_id" { type = string }

# Vm count value
variable "count_value_krtapp1vm" { type = string }

variable "count_value_krtwrkstnvm" { type = string }

variable "app1_vm_image_resource_group_name" { type = string }

variable "app1_vm_image_name" { type = string }

variable "vm_size_app" { type = string }

variable "vm_size_wrkstn" { type = string }

# Domain Variables
variable "ou_path" { type = string }

variable "domain_name" { type = string }

variable "domain_user_name" { type = string }

variable "encryptappsp_key_password" { type = string }

variable "admin_password" { type = string }

variable "domain_user_password" { type = string }

# COSPI Log Analytics Details
variable "cospi_log_analytics_workspace_name" { type = string }

variable "cospi_log_analytics_workspace_resource_group_name" { type = string }

variable "custom_emails" { type = string }

variable "action_group_name" { type = string }

#Application Gateway
variable "app_gateway_pip_name" { type = string }

variable "app_gateway_name" { type = string }

variable "application_gw_sku_name" { type = string }

variable "application_gw_sku_tier" { type = string }

variable "application_gw_sku_capacity" { type = string }

variable "krtdevhostname" { type = string }

variable "krtdevcertname" { type = string }

variable "krtdevauthcertcer" { type = string }

variable "krtdevsslcertpfx" { type = string }

variable "krtdevcertpfxpwd" { type = string }

variable "krtqahostname" { type = string }

variable "krtqacertname" { type = string }

variable "krtqaauthcertcer" { type = string }

variable "krtqasslcertpfx" { type = string }

variable "krtqacertpfxpwd" { type = string }

variable "krtuathostname" { type = string }

variable "krtuatcertname" { type = string }

variable "krtuatauthcertcer" { type = string }

variable "krtuatsslcertpfx" { type = string }

variable "krtuatcertpfxpwd" { type = string }

variable "dev_backend_ips" {
  type = list(string)
}

variable "qa_backend_ips" {
  type = list(string)
}

variable "uat_backend_ips" {
  type = list(string)
}

variable "selfsigncertname" { type = string }

variable "selfsignauthcertcer" { type = string }

variable "ase_cert_name" { type = string }

variable "app_gateway_hostname" { type = string }

variable "app_gateway_certname" { type = string }

#analysis server
variable "analysisservice_name" { type = string }

variable "analysisservice_dev_name" { type = string }

variable "analysisservice_qa_name" { type = string }

variable "analysisservice_uat_name" { type = string }

variable "analysis_server_userid_dev" { type = string }

variable "analysis_server_userid_qa" { type = string }

variable "analysis_server_userid_uat" { type = string }

variable "analysisservice_admin_user_password" { type = string }

# app service plan

variable "asp_tier" { type = string }

variable "asp_size" { type = string }

#sql server and elastic pool
variable "sqladmin_group_name" { type = string }

variable "sql_server_name" { type = string }

variable "sql_server_name_dev" { type = string }

variable "sql_server_name_qa" { type = string }

variable "sql_server_name_uat" { type = string }

variable "sqlserver_admin_dev" { type = string }

variable "sqlserveradmin_password_dev" { type = string }

variable "sqlserver_admin_qa" { type = string }

variable "sqlserveradmin_password_qa" { type = string }

variable "sqlserver_admin_uat" { type = string }

variable "sqlserveradmin_password_uat" { type = string }

variable "sqlserveradmin_password" { type = string }

variable "sqladmindev_group_name" { type = string }

variable "sqladminqa_group_name" { type = string }

variable "sqladminuat_group_name" { type = string }

variable "sql_elastic_pool_name" { type = string }

variable "sqlelasticpool_sku_name" { type = string }

variable "sqlelasticpool_sku_tier" { type = string }

variable "sqlelasticpool_sku_family" { type = string }

variable "sqlelasticpool_sku_capacity" { type = string }

variable "sqlelasticpool_min_capacity" { type = string }

variable "sqlelasticpool_max_capacity" { type = string }

variable "ase_routetable_name" { type = string }

variable "PaloInboundIPAddress" { type = string }

#KeyVault
variable "keyvaultadminsgroupname" { type = string }

variable "key_vault_name_dev" { type = string }

variable "key_vault_name_qa" { type = string }

variable "key_vault_name_uat" { type = string }

variable "key_vault_name_prod" { type = string }

variable "key_vault_name" { type = string }

variable "cloudops_keyvault_admin" { type = string }

variable "client_keyvault_admin" { type = string }


#AutomationAccountChanges

variable "automation_account_dev_obj_id" { type = string }

variable "automation_account_qa_obj_id" { type = string }

variable "automation_account_uat_obj_id" { type = string }


#Availability Set
variable "availability_set_name_app" { type = string }

variable "availability_set_name_workstation" { type = string }

#EventHub
variable "event_hub_namespace_name" { type = string }

variable "PaloAltoFirewallPIP1" { type = string }

variable "PaloAltoFirewallPIP2" { type = string }

variable "kartasemangementIP" { type = string }

variable "ase_internal_ip" { type = string }

variable "uniqueresourcesuffix" { type = string }

#ManagedIdentity
variable "managed_identity_name_dev" { type = string }

variable "managed_identity_name_qa" { type = string }

variable "managed_identity_name_uat" { type = string }

#LogAnalytics Workspace
variable "log_analytics_workspace_name" { type = string }

variable "tenantfqdn" { type = string }

variable "KRTDevelopers_description" { type = string }

variable "BuildVMAdmins_description" { type = string }

variable "RDPUsers_description" { type = string }

variable "ATOTeam_description" { type = string }

variable "BusinessUsers_description" { type = string }

variable "DevopsProjectManagers_description" { type = string }

variable "PBICapacityAdmins_description" { type = string }

variable "ProjectTeam_description" { type = string }

variable "SQLReadOnlyDev_description" { type = string }

variable "subscription_id" { type = string }

variable "client_id" { type = string }

variable "client_secret" { type = string }

variable "tenant_id" { type = string }