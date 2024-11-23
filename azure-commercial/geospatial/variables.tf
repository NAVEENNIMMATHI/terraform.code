
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
variable "environment" {
  type = string
}
variable "separator" {
  type = string
}

#RouteTable
variable "azfwsubscriptionid" {
  type = string
}
variable "firewall_network_name" {
  type = string
}
variable "firewall_network_rg_name" {
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

#Virtual Netwrok Variables
variable "vnet_address_space" {
 type = list(string)
}

variable "geospatial_aks_subnet_address_prefix" {
  type = string
}

variable "geospatial_agw_subnet_address_prefix" {
  type = string
}

variable "geospatial_pep_subnet_address_prefix" {
  type = string
}

variable "geospatial_vm_subnet_address_prefix" {
  type = string
}

variable "geospatial_pstflex_subnet_address_prefix" {
  type = string
}

variable "geospatial_mgmt_subnet_address_prefix" {
  type = string
}


#Vnet Peering Varibales
variable "hub_vnet_resource_group_name" {
  type = string
}

variable "hub_vnet_name" {
  type = string
}

variable "transit_vnet_resource_group_name" {
  type = string
}

variable "transit_vnet_name" {
  type = string
}

variable "transit_subscription_id" {
  type = string
}

variable "hub_subscription_id" {
  type = string
}

variable "agent_subnet_id" {
  type = string
}
variable "wvd_subnet_id" {
  type = string
}
variable "core_aks_subnet_id" {
  type = string
}

# Private DNS Zone
variable "private_dns_zone_subscription" {
  type    = string
  default = ""
}

variable "private_dns_zone_resource_group_name" {
  type    = string
  default = ""
}

variable "private_dns_zone_name_file" {
  type    = string
  default = ""
}
variable "private_dns_zone_name_queue" {
  type    = string
  default = ""
}
variable "private_dns_zone_name_dfs" {
  type    = string
  default = ""
}

variable "private_dns_zone_name_vaultcore" {
  type    = string
  default = ""
}
variable "private_dns_zone_name_acr" {
  type = string
  default = ""
}

variable "private_dns_zone_name_database" {
  type = string
  default = ""
}

variable "private_dns_zone_name_psql" {
  type = string
  default = ""
}

# Application Gateway
variable "application_gateway" {
  type = object({
    environment_acronym = string
    subnet_address      = string
    sku = object({
      name     = string
      tier     = string
    })
  })
}

variable "aks_cert_name" {}
variable "backend_cer_cert_name" {
  type = string
}
variable "backend_address_pool_ips" {
  type = list(string)
}

# AKS Variables
variable "kubernetes_version" {}
variable "aks_node_pool_name" {}
variable "aks_node_count" {}
variable "aks_node_size" {}
variable "enable_auto_scaling" {}
variable "default_node_pool_type" {}
variable "availability_zones" {}
variable "identity_type" {}
variable "network_profile_outbound_type" {}
variable "DNS_VNET" {}
variable "DNS_VNET_CORE" {}
variable "min_count" { type = number }
variable "max_count" { type= number }

#Data Sources
variable "spoke_law_name" { type = string }
variable "spoke_law_rg_name" { type = string }
variable "spoke_vnet_name" { type = string }
variable "spoke_vnet_rg_name" { type = string }
variable "pbi_subnet_name" { type = string }

variable "dns_servers" {
  type = list(string)
}

# Virtual Machine
variable "client_vm_sku" {}
variable "vm_count_buildvm_ts" {}
variable "data_disk_size_arcgis" {}
variable "vm_size_build" {}
variable "managed_disk_type" {}
variable "arcgis_vm_admin_password" { 
  type = string 
  sensitive = true
}

#NSG
variable "kpmg_nat_ip_list" { type = list(string) }
variable "kpmg_trusted_address_prefixes" { type = list(string) }

#PostgresSql Flex variables
variable "gis_postgresql_sku_name" { type = string }
variable "gis_postgresql_storage_mb" { type = string }
variable "gis_postgresql_adminname" { type = string }
variable "gis_postgrefs_adminpassword" { type = string }
variable "gis_postgresql_PostGresVersion" { type = string }