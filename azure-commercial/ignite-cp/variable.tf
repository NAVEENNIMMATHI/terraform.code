#Backend Variables
variable "tenant_id" { type = string }
variable "subscription_id" { type = string }
variable "client_id" { type = string }
variable "client_secret" { type = string }

#Tags
variable "tags" {
  type = map(string)
}

#Environment Variables
variable "rg_location" { type = string }
variable "environment" { type = string }
variable "application_acronym" { type = string }
variable "location" { type = string }
variable "project_acronym" { type = string }
variable "project_name" { type = string }
variable "environment_acronym" { type = string }
variable "engagement_name" { type = string }
variable "separator" { type = string }
variable "isEngagement" {
  type = bool
}
#variable "app_api_value" { type = string }


#Virtual Network Variables
variable "spoke_vnet_name" { type = string }
variable "spoke_vnet_rg_name" { type = string }

#Route Table Variables
variable "AzureFirewallIPAddress" { type = string }

#Subnet Variables
variable "ignite_aks_subnet_address_prefix" { type = string }
variable "ignite_agw_subnet_address_prefix" { type = string }
variable "ignite_ingress_subnet_address_prefix" { type = string }
variable "pep_subnet_name" { type = string }


#AKS Variables
variable "spoke_law_name" { type = string }
variable "spoke_law_rg_name" { type = string }
variable "ignite_aks_cluster_admins_group_name" { type = string }
variable "aks_node_pool_name" { type = string }
variable "aks_node_count" { type = string }
variable "aks_node_size" { type = string }
#variable "aks_api_allow_ip_list" {
#  type = list(string)
 # default = [""]
#}
variable "kubernetes_version" { type = string }
variable "identity_type" { type = string }
variable "enable_auto_scaling" { type = string }
variable "default_node_pool_type" { type = string }
variable "network_profile_outbound_type" { type = string }
variable "acr_allowed_ip_list" {
  type = list(string)
}
variable "availability_zones" { type = list(string) }
variable "min_count" { type = number }
variable "max_count" { type= number }

#Application Gateway Variables
variable "ignite_jup_fqdn" { type = string }
variable "ignite_api_fqdn" { type = string }
variable "ignite_mio_fqdn" { type = string }
variable "ignite_ui_fqdn" { type = string }
variable "ignite_ui_api_fqdn" { type = string }
variable "application_gateway_sku_name" { type = string }
variable "application_gateway_sku_tier" { type = string }
variable "backend_address_pool_ips" {
  type = list(string)
}

variable "jup_pfx_cert_name" { type = string }
variable "api_pfx_cert_name" { type = string }
variable "mio_pfx_cert_name" { type = string }
variable "ui_pfx_cert_name" { type = string }
variable "ui_api_pfx_cert_name" { type = string }

##Key Vault variables
variable "devops_spn_obj_id" { type = string }
variable "devopsspn_service_principal_name" { type = string }

#PostgresSql Database variables
variable "ignite_postgresql_sku_name" { type = string }
variable "ignite_postgresql_storageprofile_storage_mb" { type = string }
variable "ignite_postgresql_storageprofile_backup_retention_days" { type = string }
variable "ignite_postgresql_storageprofile_geo_redundant_backup" { type = string }
variable "ignite_postgresql_adminname" { type = string }
variable "ignite_postgresql_adminpassword" { type = string }
variable "ignite_postgresql_PostGresVersion" { type = string }
variable "ignite_connect_postgresql_db_name" { type = string }
variable "ignite_connect_postgresql_db_api_name" { type = string }
variable "ignite_connect_postgresql_db_config_name" { type = string }
variable "ignite_connect_postgresql_db_ui_name" { type = string }
variable "ignite_connect_postgresql_db_content_name" { type = string }
variable "drgs_connect_postgresql_db_name" {type = string}

variable "agent_subnet_id" {
    type = string
}


### Private DNS variables ###

variable "private_dns_zone_subscription" {
  type    = string
  default = ""
}

variable "private_dns_zone_resource_group_name" {
  type    = string
  default = ""
}

variable "private_dns_zone_name_blob" {
  type    = string
  default = ""
}

variable "private_dns_zone_name_psql" {
  type    = string
  default = ""
}

variable "private_dns_zone_name_cp_acr" {
  type = string
  default = ""
}

variable "private_dns_zone_name_vaultcore" {
   type = string
   default = ""
}

variable "private_dns_zone_name_cognitive" {
   type = string
   default = ""
}

variable "DNS_VNET" {}

variable "vpn_whitelist_ips" { 
  type = list(string) 
  }

  variable "cognitive_sku" {
    type = string
  }