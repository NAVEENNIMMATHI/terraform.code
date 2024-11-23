variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

variable "application_acronym" {}
variable "environment_acronym" {}
variable "vm_environment_acronym" {}
variable "agw_environment_acronym" {}
variable "location_acronym" {}
variable "dns_suffix" {}
variable "tags" { type = map(string) }
variable "adminvmtag" { type = map(string) }
variable "buildvmtag" { type = map(string) }

#ASE
variable "ase_project_name" {}
variable "ase_name" {}



#Network Components
variable "privatelink_subnet_address_prefix" {}
variable "vnet_address_space" { type = list(string) }
variable "ase_subnet_address_prefix" {}
variable "appgateway_subnet_address_prefix" {}
variable "app_subnet_address_prefix" {}
variable "mgmt_subnet_address_prefix" {}
variable "build_subnet_address_prefix" {}
variable "dns_servers" { type = list(string) }
variable "route_next_hope_in_ip_address" {}
variable "powerapps_whitelist_ips" { type = list(string) }
variable "vpn_whitelist_ips" { type = list(string) }

#Vnet Peering
variable "transit_vnet_name" {}
variable "transitvnet_resource_group_name" {} 
variable "core_vnet_name" {}
variable "corevnet_resource_group_name" {}
variable "transitsubscriptionid" {}
variable "coresubscriptionid"  {}
variable "new_uat_suffix_coretovnet_peering"  {}

#RouteTable
variable "azfwsubscriptionid" {}
variable "firewall_network_name" {}
variable "firewall_network_rg_name" {}

#DataSources
variable "encryptapp_sp_name" {}
variable "cloudops_keyvault_admin_group_name" {}

#Virtual Machine
variable "vm_count_admin" {}
variable "vm_size_admin" {}
variable "vm_count_build" {}
variable "vm_size_build" {}
variable "domain_name" {}
variable "ou_path" {}
variable "domain_user_name" {}
variable "domain_user_password" {}
variable "admin_password" {}
variable "storage_account_kind" {}
variable "subnets_environment_suffix" {}
variable "ad_group_environment_suffix" {}
variable "appgateway_subnet_address_prefix_cfr" {}

#Application Gateway Variables
variable "app_gw_sku_name" { type = string }
variable "app_gw_sku_tier" { type = string }
variable "app_gw_sku_capacity" { type = number }
variable "ase_internal_ip" { type = string }

variable "authentication_certificates" {
  type = list(map(string))
  default = []
}

variable "ssl_certificates" {
  type = list(map(string))
  default = []
}