variable "client_id" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "client_secret" {
  type = string
}


variable "location" {
  type = string
}

variable "location_acronym" {
  type = string
}

variable "environment" {
  type = string
}

variable "environment_acronym" {
  type = string
}

variable "application" {
  type = string
}

variable "application_acronym" {
  type = string
}


#This is used in AAD Application Reply URL formation
variable "environment_acronym2" {
  type = string
}

#Tags Variables
variable "tags" {
  type = map(string)
}


#postgresql server and db
variable "postgresql_server_sku" {
  type = string
}

variable "postgresql_server_admin" {
  type = string
}

variable "postgresql_server_admin_password" {
  type = string
}

variable "storage_mb" {
  type = string
}


#Application Gateway Variables
variable "app_gateway_hostname" {
  type = string
}

variable "agw_cert_name" {
  type = string
}

variable "agw_cert_pfx" {
  type = string
}

variable "app_gateway_certpfx_password" {
  type = string
}

variable "agw_cert_cer" {
  type = string
}

variable "ase_internal_ip" {
  type = string
}


#subnet
variable "cma_appgateway_subnet_address_prefix" {
  type = string
}

variable "cma_pbiwst_subnet_prefix" {
  type = string
}

variable "cma_buildmachine_subnet_prefix" {
  type = string
}

variable "cma_pbigatewaymachine_subnet_prefix" {
  type = string
}

variable "service_endpoints" {
  type = list(string) 
}


#Azure Firewal Route Details
variable "az_firewall_route_name" {
  type = string
}
 
variable "az_firewall_address_prefix" {
  type = string
}
 
variable "az_firewall_next_hop_type" {
  type = string
}


#Azure Firewall Variables
variable "azure_firewall_subscription_id" {
  type = string
}
 
variable "firewall_network_name" {
  type = string
}
 
variable "firewall_network_rg_name" {
  type = string
}


#VirtualMachine Variables
variable "vm_os_type" {
  type = string
}

variable "vm_count" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "data_disk_size" {
  type = string
}

variable "adminusername"  {
  type = string
}

variable "vm_admin_password" {
  type = string
}

variable "custom_emails"  {
  type = string
}


#shared services
variable "shared_resource_group_name" {}

variable "shared_virtual_network_name" {
  type = string
}

variable "ase_subnet_name" {
  type = string
}

variable "ase_name" {
  type = string
}


#App Service Plan
variable "app_service_plan_tier" {
  type = string
}

variable "app_service_plan_size" {
  type = string
}


#App Service
variable "flask_env" {
  type = string
}

variable "appservice_log_retention_days" {
  type = string
}

variable "appservice_log_retention_mb" {
  type = string
}

variable "cma_client_id" {
  type = string
}

variable "cma_client_secret" {
  type = string
}

variable "initial_user" {
  type = string
}


#Storage Account
variable "account_tier" {
  type    = string
  default = ""
}

variable "replication_type" {
  type    = string
  default = ""
}

#Shared State Data Sources
variable "shared_state_resource_group_name" {
  type = string
}

variable "shared_state_storage_account_name" {
  type = string
}

variable "shared_state_storage_account_container_name" {
  type = string
}

variable "shared_state_storage_account_blob_key_name" {
  type = string 
}

variable "shared_state_storage_account_access_key" {
  type = string
}