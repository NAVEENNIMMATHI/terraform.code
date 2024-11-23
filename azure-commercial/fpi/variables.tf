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


variable "vm_environment" {
  type = string
}


variable "paloalto_hop_address" {
  type = string
}

variable "app_environment_acronym" {
  type = string
}


#Below references should be removed in future
variable "vm_image_id" {
  type = string
}


#Tags Variables
variable "tags" {
  type = map(string)
}


#SQLServer Variables
variable "sqlserver_password" {
  type = string
}

variable "sql_serverPool_count" {
  type = string
}

variable "sql_serverPool2_count" {
  type = string
}

variable "sql_serverPool_expansion_count" {
  type = string
}

variable "ep_max_size_gb" {
  type = string
}

variable "ep_max_size_gb2" {
  type = string
}

variable "ep_sku_name" {
  type = string
}

variable "ep_sku_tier" {
  type = string
}

variable "ep_sku_family" {
  type = string
}

variable "ep_sku_capacity" {
  type = string
}

variable "ep_sku_capacity2" {
  type = string
}

variable "ep_sku_capacity3" {
  type = string
}

variable "ep_per_database_settings_min_capacity" {
  type = string
}

variable "ep_per_database_settings_max_capacity" {
  type = string
}

variable "ep_per_database_settings_max_capacity2" {
  type = string
}

variable "ep_per_database_settings_max_capacity3" {
  type = string
}


#VirtualNetwork Variables
variable "fpivnet_address_space" {
  type = list(string)
}
variable "KIPAGW_PIP" {
 type = list(string)
}
variable "dns_servers" {
  type = list(string)
}

variable "address_prefix_backend" {
  type = string
}

variable "address_prefix_frontend" {
  type = string
}

variable "SVCEP_frontend" {
  type = list(string)
}

variable "SVCEP_backend" {
  type = list(string)
}

variable "vnetpeering1_remote_vnet_name" {
  type = string
}

variable "vnetpeering1_remote_vnet_id" {
  type = string
}

variable "vnetpeering1_remote_vnet_resource_group_name" {
  type = string
}

variable "coresubscriptionid" {
  type = string
}

variable "corevnetresourcegroup" {
  type = string
}

variable "corevnetname" {
  type = string
}


#Public IP Variables
variable "domain_name_label" {
  type = string
}


#ApplicationGateway Variables
variable "host_name" {
  type = string
}
variable "host_name1" {
  type = string
}


variable "backend_address_pool_name" {
  type = string
}

variable "frontend_ip_configuration_name" {
  type = string
}

variable "frontend_port_name" {
  type = string
}

variable "frontend_port2_name" {
  type = string
}

variable "http_listener_ssl_certificate_name" {
  type = string
}

variable "http_listener_rest_ssl_certificate_name" {
  type = string
}
variable "app_listener_host_name" {
  type = string
}
variable "fpirest_listener_host_name" {
  type = string
}
variable "http_listener_ssl_certificate_password" {
  type = string
}

variable "http_listener_ssl_certificate" {
  type = string
}

variable "gateway_ip_configuration_name" {
  type = string
}

variable "listener_name" {
  type = string
}

variable "listener2_name" {
  type = string
}

variable "listener3_name" {
  type = string
}

variable "probe_name" {
  type = string
}

variable "probe_host_name" {
  type = string
}
variable "probe_name1" {
  type = string
}

variable "probe_host_name1" {
  type = string
}

variable "request_routing_rule_name" {
  type = string
}

variable "request_routing_rule2_name" {
  type = string
}
variable "request_routing_rule3_name" {
  type = string
}

variable "backend_http_settings_name1" {
  type = string
}

variable "backend_http_settings_name2" {
  type = string
}
variable "backend_http_settings_name3" {
  type = string
}


#VirtualMachine Variables
variable "vm_count" {
}

variable "vm_size" {
  type = string
}

variable "admin_password" {
  type = string
}

variable "vm_workload_desc" {
  type = string
}


#StorageAccount Variables
variable "account_replication_type" {
  type = string
}

#Firewall Variables
variable "firewall_network_name" {
  type = string
}

variable "firewall_network_rg_name" {
  type = string
}

variable "azure_firewall_subscription_id" {
  type = string
}

#Service Principal
variable "encryptapp_service_principal_name" {
  type = string
}