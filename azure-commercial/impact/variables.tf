
#ResourceGroup

variable "application_acronym" {
  type = string
}
variable "location_acronym" {
  type = string
}
variable "environment_acronym" {
  type = string
}
variable "location" {
  type = string
}

#Backend Variables

variable "tenant_id" {
  type = string
}
variable "subscription_id" {
  type = string
}
variable "client_id" {
  type = string
}
variable "client_secret" {
  type = string
}

variable "tags" {
  type = map(string)
}

#virtual_network

#sub_network
variable "private_endpoint_subnet_address_space" {
  type = string
}
variable "agw1_subnet_adress_space" {
  type = string
}
variable "apim_subnet_address_space" {
  type = string
}
variable "function_subnet_address_space" {
  type = string
}
variable "shared_vnet_name" {
  type = string
}
variable "shared_vnet_rg_name" {
  type = string
}

#storage_account

variable "account_tier" {
  type = string
}
variable "replication_type" {
  type = string
}

### Multi tenant clients variables
variable "impact_multi_tenant" {
  type = map(object({
    clients       = list(string)
    folders       = list(string)
  }))  
}

variable "impact_multi_tenant_clients" {
  type = object({
    clients       = list(string)
  })
}

variable "impact_multi_tenant_folders" {
  type = object({
    folders       = list(string)
  })
}

variable "coreinfrasubnetid" {
  type = string
}
variable "core_aks_subnet_id" {
  type = string
}
#private_endpoint
variable "pvt_dns_subscription_id" {
  type = string
}

variable "pvt_dns_resource_group" {
  type = string
}

#Private DNS
variable "private_dns_zone_name_azurecr" {
  type = string
}

variable "private_dns_zone_subscription" {
  type = string
}

variable "private_dns_zone_resource_group_name" {
  type = string
}
variable "private_dns_zone_name_database" {
  type = string
}
variable "private_dns_zone_name_vaultcore" {
  type    = string
  default = ""
}

variable "pipeline_service_principal_name" {
  type = string
}
variable "private_dns_zone_name_synapse" {
  type    = string
  default = ""
}
variable "private_dns_zone_name_dev_synapse" {
  type    = string
  default = ""
}
variable "private_dns_zone_name_dfs" {
  type    = string
  default = ""
}
variable "private_dns_zone_name_blob" {
  type    = string
  default = ""
}
variable "private_dns_zone_name_azurewebsites" {
  type    = string
  default = ""
}
variable "spoke_law_name" {
  type = string
}
variable "unique_guid" {
  type = string
}

variable "sql_server_admin" {
  type = string
}

variable "sql_server_admin_password" {
  type = string
}

variable "sql_server_name" {
  type = string
}

variable "spoke_law_rg_name" {
  type = string
}

variable "AZFW_PIP" {
  type = list(string)
}

variable "initial_user" {
  type = string
}

variable "appservice_log_retention_days" {
  type = string
}

variable "appservice_log_retention_mb" {
  type = string
}

variable "app_service_plan_tier" {
  type = string
}

variable "app_service_plan_size" {
  type = string
}

variable "app_service_plan_tier_func" {
  type = string
}

variable "app_service_plan_size_func" {
  type = string
}

variable "shared_resource_group_name" {
  type = string
}

variable "ase_name" {
  type = string
}
variable "azfirewall_ip_address" {
  type = string
}

# Application Gateway
variable "application_gateway" {
  type = object({
    environment_acronym = string
    subnet_address      = string
    sku = object({
      name     = string
      tier     = string
      capacity = string
    })
  })
}
variable "webapp_cert_name" {
  type = string
}
variable "api_pfx_cert_name"{
  type = string
}
variable "api_developer_pfx_cert_name" {
  type = string
}
variable "apimsku" {
  type = string
}

variable "publisher_name" {
  type        = string
  description = "The name of publisher/company."
}

variable "publisher_email" {
  type        = string
  description = "The email of publisher/company."
}

variable "apim_subnet_address_prefix" {
   type = string
}
variable "virtual_network_type" {
   type = string
}
variable "dls_replication_type" {
  type = string
}

variable "KPMG_VPN_US" {
  type = list(string)
}

variable "KGS_Bangalore" {
  type = list(string)
}

variable "probe_path" {
   type = string
}

variable "docker_image" {
   type = string
}