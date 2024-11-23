variable "shared_resource_group_name" { type = string }

variable "backup_shared_resource_group_name" { type = string }

variable "analysis_service_name" { type = string }

variable "sqlserver_admingroup_name" { type = string }

variable "sqlserver_admingroup_name_description" { type = string }

variable "development_group_name" { type = string }

variable "development_group_name_description" { type = string }

variable "PBIWorkspaceMembers_description" { type = string }

variable "PBIWorkspaceAdmins_description" { type = string }

variable "PaloAltoFirewallPIP1" { type = string }

variable "PaloAltoFirewallPIP2" { type = string }

variable "kartasemangementIP" { type = string }

variable "tags" {
  type = map(string)
}

variable "app_insights_name" { type = string }

variable "application_acronym" { type = string }

variable "webappbackup_storage_account_name" { type = string }

variable "webappbackup_storage_container_name" { type = string }

variable "app_service_name" { type = string }

variable "app_service_plan_name" { type = string }

variable "app_service_backup_name" { type = string }

variable "automation_account_name" { type = string }

variable "keyvaultadminsgroupname" { type = string }

variable "analysisadminsgroupname" { type = string }

variable "uniqueresourcesuffix" { type = string }

variable "managed_identity_name" { type = string }

variable "krtbuildvm_objectid" { type = string }

variable "key_vault_name_project" { type = string }

#SQL Server Resources
variable "sql_server_name" { type = string }

variable "sql_server_admin_username" { type = string }

variable "sqlserveradmin_password" { type = string }

variable "sql_elastic_pool_name" { type = string }

variable "sql_elastic_pool_max_size" { type = string }

variable "sqlelasticpool_sku_name" { type = string }

variable "sqlelasticpool_sku_tier" { type = string }

variable "sqlelasticpool_sku_family" { type = string }

variable "sqlelasticpool_sku_capacity" { type = string }

variable "sqlelasticpool_min_capacity" { type = string }

variable "sqlelasticpool_max_capacity" { type = string }

#Virtual Network Name
variable "virtual_network_name" { type = string }

variable "app_subnet_name" { type = string }

variable "ase_subnet_name" { type = string }

variable "agw_subnet_name" { type = string }

#StorageAccount
variable "preprocess_storage_account_name" { type = string }

variable "postprocess_storage_account_name" { type = string }

variable "arch_storage_account_name" { type = string }

variable "account_tier" { type = string }

variable "replication_type" { type = string }

variable "account_type" { type = string }

variable "coreinfrasubnetid" { type = string }

variable "kartsharename" { type = string }

variable "stage" { type = string }

variable "krt_app_registration_name" { type = string }

variable "reply_urls" {
  type = list(string)
}

variable "core_aks_subnet_id" {
  type = string
}

variable "automation_account_obj_id" { type = string }

variable "pre_kpmg_nat_ip_list" {
  type = list(string)
}

variable "post_kpmg_nat_ip_list" {
  type = list(string)
}

variable "arch_kpmg_nat_ip_list" {
  type = list(string)
}

variable "analysisservice_admin_username" { type = string }

variable "analysisservice_admin_user_password" { type = string }

variable "tenantfqdn" { type = string }

variable "spiappsubnetid" { type = string }

variable "subscription_id" { type = string }

variable "client_id" { type = string }

variable "client_secret" { type = string }

variable "tenant_id" { type = string }

variable "target_deployment_environment" { type = string }