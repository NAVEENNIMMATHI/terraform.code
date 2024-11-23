#Environment specific variable
variable "environment" {
  type = string
}

variable "application_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "application_acronym" {
  type = string
}

variable "location_acronym" {
  type = string
}

variable "environment_acronym" {
  type = string
}

variable "environment_acronym_aad_url" {
  type = string
}


#VNet, subnet, Routes, NSG

variable "app_subnet_address_prefix" {
  type = string
}

variable "redis_subnet_address_prefix" {
  type = string
}

variable "aci_subnet_address_prefix" {
  type = string
}

variable "ase_subnet_address_prefix" {
  type = string
}

variable "service_endpoints" {
  type = list(string)
}

variable "appsubnet_service_endpoints" {
  type = list(string)
}

variable "route_name" {
  type = string
}

variable "route_address_prefix" {
  type = string
}

variable "route_next_hop_type" {
  type = string
}

variable "route_next_hope_in_ip_address" {
  type = string
}

variable "disable_bgp_route_propagation" {
  type = string
}


#Virtual Machine

variable "vm_count" {
 type = number
}

variable "vm_os_type" {
  type = string
}

variable "vm_workload_desc" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "vm_admin_password" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "custom_emails" {
  type = string
}

variable "domain_user_name" {
  type = string
}

variable "domain_user_password" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "ou_path" {
  type = string
}

variable "encryptappsp_key_password" {
  type = string
}

variable "data_disk_size" {
  type = string
}

variable "keyvault_name" {
  type = string
}

variable "keyvault_resource_group_name" {
  type = string
}

variable "diagnostic_storage_account_name" {
  type = string
}

variable "diagnostic_storage_account_resourcegroup_name" {
  type = string
}

#Backup and Logs
variable "encryptapp_service_principal_name" {
  type = string
}

variable "cicdbuild_subnet" {
  type = string
}

variable "core_aks_subnet_id" {
  type = string
}

#SQl Server and Database
variable "sql_server_version" {
  type = string
}

variable "sql_server_admin_username" {
  type = string
}

variable "sql_server_admin_password" {
  type = string
}

variable "sql_database_edition" {
  type = string
}

variable "sql_database_performance_level" {
  type = string
}

#ASE
variable "ase_name" {
  type = string
}

variable "dns_suffix" {
  type = string
}

#App Service Plan
variable "asp_tier" {
  type = string
}

variable "asp_size" {
  type = string
}


#SQL Elastic Pool
variable "sql_elastic_pool_max_size" {
  type = string
}

variable "sqlelasticpool_sku_name" {
  type = string
}

variable "sqlelasticpool_sku_tier" {
  type = string
}

variable "sqlelasticpool_sku_family" {
  type = string
}

variable "sqlelasticpool_sku_capacity" {
  type = string
}

variable "sqlelasticpool_min_capacity" {
  type = string
}

variable "sqlelasticpool_max_capacity" {
  type = string
}

#Following variable will be used to query shared services 
variable "sharedrg_resource_group_name" {
  type = string
}

variable "sharedvnet_virtual_network_name" {
  type = string
}

variable "log_analytics_workspace_name" {
  type = string
}

variable "ase_subnet_name" {
  type = string
}

variable "appgateway_subnet_name" {
  type = string
}


#Redis_cache
variable "redis_capacity" {
  type = string
}

variable "redis_family" {
  type = string
}

variable "redis_sku_name" {
  type = string
}


#B2C
variable "ad_domain_name" {
  type = string
}

variable "fastpath_clientsecret" {
  type = string
}


#Web App
variable "webapp_name" {
  type = string
  default = ""
}

variable "app_url" {
  type = string
}

variable "api_url" {
  type = string
}

#Api App
variable "apiapp_name" {
  type = string
  default = ""
}

variable "raygunapikey" {
  type = string
}

variable "smtp_server" {
  type = string
}

variable "smtp_port" {
  type = string
}

#Key vault secret
variable "spn_secret_key" {
  type = string
}

variable "consumer_key" {
  type = string
}

variable "consumer_secret" {
  type = string
}

variable "intacctgatewaypwd" {
  type = string
}

#container
variable "container_registry_name" {
  type = string
}

variable "container_image_name" {
  type = string
}

variable "container_cpu" {
  type = string
}

variable "container_memory" {
  type = string
}

variable "container_port" {
  type = string
}

#support site - webapp
variable "support_webapp_name" {
  type = string
  default = ""
}

#support site - apiapp
variable "support_apiapp_name" {
  type = string
  default = ""
}

variable "salt" {
  type = string
}

variable "webhook_addproductmodules" {
  type = string
}

variable "webhook_deleteenvironment" {
  type = string
}

variable "webhook_newenvironment" {
  type = string
}

variable "webhook_newuser" {
  type = string
}

#Automation Account
variable "apiroute" {
  type = string
}

variable "vsopat" {
  type = string
}

variable "vsouri" {
  type = string
}

#App Registration Admin

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "subscription_id" {
  type = string
}