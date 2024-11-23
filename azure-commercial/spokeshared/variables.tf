#Environment specific variable
variable "environment" {
  type = string
}

variable "application_name" {
  type = string
}

variable "shared_rg_location" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "application_acronym" {
  type = string
}

#Virtual Network and subnet
variable "vnet_name" {
  type = string
}

variable "ase_subnet_name" {
  type = string
}

variable "appgateway_subnet_name" {
  type = string
}

variable "core_vnetpeering_name" {
  type = string
}

variable "transit_vnetpeering_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "ase_subnet_address_prefix" {
  type = string
}

variable "appgateway_subnet_address_prefix" {
  type = string
}

variable "dns_servers" {
  type = list(string)
}

variable "service_endpoints" {
  type = list(string)
}

variable "ase_routetable_name" {
  type = string
}

variable "route_next_hope_in_ip_address" {
  type = string
}

variable "ase_network_security_group_name" {
  type = string
}

variable "appgateway_network_security_group_name" {
  type = string
}

variable "transit_vnet_name" {
  type = string
}

variable "transitvnet_resource_group_name" {
  type = string
}

variable "transittoappvnet_vnetpeering_name" {
  type = string
}

variable "core_vnet_name" {
  type = string
}

variable "corevnet_resource_group_name" {
  type = string
}

variable "coretoappvnet_vnetpeering_name" {
  type = string
}

variable "transitsubscriptionid" {
  type = string
}

variable "coresubscriptionid" {
  type = string
}

#LAW
variable "log_analytics_workspace_name" {
  type = string
}

#Resource Group
variable "shared_resource_group_name" {
  type = string
}

#ASE
variable "ase_name" {
  type = string
}

variable "dns_suffix" {
  type = string
}

#App Gateway
variable "app_gateway_hostname" {
  type = string
}

variable "supportapp_gateway_hostname" {
  type = string
}

variable "functionapp_gateway_hostname" {
  type = string
}

variable "apiapp_gateway_hostname" {
  type = string
}

variable "apisupportapp_gateway_hostname" {
  type = string
}

variable "app_gateway_name" {
  type = string
}

variable "agw_cert_name" {
  type = string
}

variable "supportapp_agw_cert_name" {
  type = string
}

variable "functionapp_agw_cert_name" {
  type = string
}

variable "apiapp_agw_cert_name" {
  type = string
}

variable "apisupportapp_agw_cert_name" {
  type = string
}

variable "agw_cert_pfx" {
  type = string
}

variable "supportapp_agw_cert_pfx" {
  type = string
}

variable "functionapp_agw_cert_pfx" {
  type = string
}

variable "apiapp_agw_cert_pfx" {
  type = string
}

variable "apisupportapp_agw_cert_pfx" {
  type = string
}

variable "agw_cert_cer" {
  type = string
}

variable "ase_internal_ip" {
  type = string
}

variable "app_gateway_certpfx_password" {
  type = string
}

variable "supportapp_url" {
  type = string
}

variable "app_url" {
  type = string
}

variable "functionapp_url" {
  type = string
}

variable "gateway_whitelist_ips" {
  type = list(string)
}

#Datasource
variable "webapp_name" {
  type = string
}

variable "webapp_resource_group_name" {
  type = string
}

#Container Registry
variable "container_registry_name" {
  type = string
}
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

variable "target_deployment_environment" {
  type = string
}