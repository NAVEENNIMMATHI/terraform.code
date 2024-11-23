
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

variable "backend_cer_cert_name" {
  type = string
}

variable "frontend_pfx_cert_name" {
  type = string
}

#Virtual Network Variables

variable "spoke_vnet_name" {
  type = string
}
variable "spoke_vnet_rg_name" {
  type = string
}
variable "source_address_prefix" {
  type = string
}
/*variable "cmp_key_vault" {
  type = string
}*/

#Network Components

variable "cmp_agw_subnet_address_prefix" {
  type = string
}

variable "kpmg_trusted_address_prefixes" {
  type = list(string)
}

variable "vnet_address_space" {
  type = list(string)
}

variable "cmp_shared_pep_subnet_address_prefix" {
  type = string
}

# variable "dns_servers" {
#   type = list(string) 
#}

#RouteTable
#variable "azfwsubscriptionid" {
#  type = string
#}
#variable "firewall_network_name" {
#  type = string
#}
#variable "firewall_network_rg_name" {
#  type = string
#}

#VNet Peering
#variable "devcoresubscriptionid" {
#  type = string
#}
#variable "devcore_vnet_name" {
#  type= string
#}
#variable "devcorevnet_resource_group_name" {
#  type = string
#}

#variable "npcoresubscriptionid" {
#  type= string
#}
#variable "npcorevnetresourcegroup" {
#  type = string
#}

#Vnet shared service

#variable "sharedrg_resource_group_name" {
#  type    = string
#}
#variable "sharedvnet_virtual_network_name" {
#  type    = string  
#}
#variable "client_vm_subnet_address_prefix" {
#  type    = list(string)
#}


#Subnets

variable "application_gateway_subnet_address" {
  type = string
}

variable "cmp_clients" {
  type = map(object({
    name            = string
    subnet_cidr     = string
    pep_subnet_cidr = string
    vm_acronym      = string
  }))
}

#Client Virtual Machine
variable "vm_count_cmp_client" {
  type = string
}
variable "vm_size_build" {
  type = string
}
variable "vm_admin_password" {
  type = string
}

variable "clientvm_sku" {
  type = string
}

#Private DNS Zone

variable "private_dns_zone_subscription" {
  type = string
}

variable "private_dns_zone_resource_group_name" {
  type = string
}

variable "private_dns_zone_name_azurecr" {
  type = string
}

variable "private_dns_zone_name_vaultcore" {
  type = string
}

# PostgreSql
variable "sql_admin_password" {
  type = string
}

variable "cmp_aps_sku" {
  type = string
}

variable "cmp_aps_version" {
  type = string
}

variable "cmp_aps_storage" {
  type = string
}

variable "private_dns_zone_name_postgres" {
  type = string
}

#Spoke Variables

variable "spoke_law_name" {
  type = string
}

variable "spoke_law_rg_name" {
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

# RouteTable

variable "firewall_primary_core" {
  type = string
}

variable "azfwsubscriptionid" {
  type = string
}

variable "firewall_network_name" {
  type = string
}

variable "firewall_network_rg_name" {
  type = string
}

#App Registrations
variable "spa_redirect_url" {
  type = string
}
variable "tenant_fqdn" {
  type = string

}