#Root
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

#Core
variable "corevnetname" {}
variable "corevnetresourcegroup" {}
variable "coresubscriptionid" {}
variable "transitvnetname" {}
variable "transitvnetresourcegroup" {}
variable "transitsubscriptionid" {}

#ResourceGroup
variable "application_acronym" {}
variable "application_name" {}
variable "location_acronym" {}
variable "environment_acronym" {}
variable "environment" {}
variable "location" {}
variable "tags" {
  type = map(string)
}

#Shared State Data Sources
variable "shared_state_storage_account_name" {}
variable "shared_state_storage_account_container_name" {}
variable "shared_state_storage_account_blob_key_name" {}
variable "shared_state_storage_account_access_key" {}

#App Service Environment
variable "app_service_environment_name" {}

#Network and Subnets
variable "dns_servers" {}
variable "address_space" {}
variable "subnet_name_db_address_space" {}
variable "subnet_name_pbi_address_space" {}
variable "subnet_name_mgt_address_space" {}
variable "subnet_name_web_address_space" {}
variable "subnet_name_apgw_address_space" {}

#Private DNS
variable "pvt_dns_subscription_id" {}
variable "pvt_dns_environment_acronym" {}

#Sql Server
variable "sql_server_admin_password" {}
variable "admin_password" {}
variable "sql_edition" {}
variable "sql_size" {}

#ApplicationGateway
variable "app_gateway_environment_acronym" {}
variable "application_gateway_sku_name" {}
variable "application_gateway_sku_tier" {}
variable "application_gateway_sku_capacity" {}
variable "ase_internal_ip" {}
variable "backend_cer_cert_name" {}
variable "frontend_pfx_cert_name" {}
variable "frontend_pfx_cert_password" {}

#AD Groups
variable "encryptapp_sp_name" {}
variable "cloudops_keyvault_admin_group_name" {}
variable "client_keyvault_admin_group_name" {}

#StorageAccount
variable "storage_account_account_replication_type" {}
variable "agent_subnet_id" {}
variable "wvd_subnet_id" {}
variable "core_aks_subnet_id" {}
variable "storage_account_container_name" {}

#Environment Settings
variable "restrict_gateway_endpoint" {}
variable "app_gateway_backend_info" {
  default = null
  type = object(
    {
      port            = string
      request_timeout = string
    }
  )
}

#ADApplication
variable "rriApplicationName" {}
variable "rriRestApplicationName" {}
variable "tenant_fqdn" {}

#Route Table Variables
variable "AzureFirewallIPAddress" {}

#Virtual Machines
variable "vmMgt_Size" {}
variable "vmPbi_Size" {}
