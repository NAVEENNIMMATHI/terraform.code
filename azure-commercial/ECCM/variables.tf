variable "tags" {
  type = map(string)
}


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
variable "resource_location" {
  type = string
}
variable "environment" {
  type = string
}
variable "application_name" {
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

##Virtual Network Variables
variable "spoke_vnet_name" { type = string }
variable "spoke_vnet_rg_name" { type = string }

##Subnet Variables
variable "eccm_agw_subnet_address_prefix" { type = string }
variable "eccm_lap_pvt_subnet_address_prefix" { type = string }
variable "eccm_lap_pub_subnet_address_prefix" { type = string }
variable "eccm_aks_subnet_address_prefix" { type = string }
variable "eccm_pep_subnet_address_prefix" { type = string }
variable "eccm_css_subnet_address_prefix" { type = string }
variable "eccm_app_subnet_address_prefix" { type = string }

##Key Vault variables
variable "devopsspn_service_principal_name" { type = string }

##Route Table Variables
variable "AzureFirewallIPAddress" { type = string }

##NSG Variables
variable "kpmg_trusted_ip" { type = list(string) }

##Sql Server
#variable "sql_server_admin_password" { 
#  type = string
#  default = ""
#  }

variable "eccm_sql_server_admin_password" {
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


variable "private_dns_zone_name_logic_app" {
  type    = string
  default = ""
}

variable "private_dns_zone_name_blob" {
  type    = string
  default = ""
}

variable "private_dns_zone_name_table" {
  type    = string
  default = ""
}

variable "private_dns_zone_name_queue" {
  type    = string
  default = ""
}

variable "private_dns_zone_name_logic_app_storage" {
  type    = string
  default = ""
}

variable "private_dns_zone_name_acr" {
  type = string
  default = ""
}

variable "private_dns_zone_name_vaultcore" {
   type = string
   default = ""
}

variable "private_dns_zone_name_sql" {
  type    = string
  default = ""
}

# AKS cluster
variable "aks_version" {}
variable "aks_default_node_pool_name" {}
variable "aks_default_node_count" {}
variable "aks_default_node_size" {}
variable "aks_default_auto_scaling" {}
variable "aks_default_pool_type" {}
variable "aks_default_avail_zones" {}
variable "dns_vnet" {}
variable "aks_lin_node_pool_name" {}
variable "aks_lin_node_count" {}
variable "aks_lin_node_size" {}
variable "aks_lin_auto_scaling" {}
variable "aks_lin_avail_zones" {}
variable "aks_node_subscription" {}



# Application Gateway
variable "application_gateway" {
  type = object({
    sku = object({
      name     = string
      tier     = string
      capacity = string
    })
  })
}

variable "backend_cer_cert_name" {
  type = string
}

variable "frontend_pfx_cert_name" {
  type = string
}

variable "dev_spn" {
  type = string
}