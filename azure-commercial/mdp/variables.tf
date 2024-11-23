variable "subscription_id" {
  type = string
}
variable "client_id" {
  type = string
}
variable "tenant_id" {
  type = string
}
variable "core_spn_id" {
  type = string
}
variable "core_spn_secret" {
  type = string
}
variable "client_secret" {
  type = string
}
variable "vm_admin_password" {
  type = string
}

#ResourceGroup

variable "application_acronym" {
  type = string
}
variable "environment" {
  type = string
}
variable "environment_acronym" {
  type = string
}
variable "location" {
  type = string
}
variable "location_acronym" {
  type = string
}
variable "tags" {
  type = map(string)
}

#Network Components
variable "vnet_address_space" {
  type = list(string)
}
variable "dns_servers" {
  type = list(string)
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
#VNet Peering
variable "hub_subscription_id" {
  type = string
}
variable "hub_vnet_resource_group_name" {
  type = string
}
variable "hub_vnet_name" {
  type = string
}

variable "transit_subscription_id" {
  type = string
}
variable "transit_vnet_name" {
  type = string
}
variable "transit_vnet_resource_group_name" {
  type = string
}

### Databricks Variables
variable "databricks" {
  type = object({
    workspace = object({
      sku = string
    })
    subnets = object({
      public = object({
        address_prefix = string
      })
      private = object({
        address_prefix = string
      })
    })
  })
}

### Data Lake Variables
variable "mdp_adls_main" {
  type = object({
    account_tier     = string
    replication_type = string
    containers       = list(string)
  })
}

variable "account_tier" {
  type = string
}

variable "replication_type" {
  type = string
}
variable "privatelink_subnet_address_prefix" {
  type = string
}

variable "func_subnet_address_prefix" {
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
/*
variable "DV_CSM_eventhub_authorization_rule_id" {
  type = string
}
*/
variable "build_subnet_address_prefix" {
  type = string
}
variable "private_dns_zone_subscription" {
  type    = string
  default = ""
}

# Private DNS Zone
variable "private_dns_zone_resource_group_name" {
  type    = string
  default = ""
}

variable "private_dns_zone_name_blob" {
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
variable "private_dns_zone_name_database" {
  type    = string
  default = ""
}
variable "private_dns_zone_name_databricks" {
  type    = string
  default = "privatelink.azuredatabricks.net"
}
variable "private_dns_zone_name_datafactory" {
  type    = string
  default = ""
}
variable "private_dns_zone_name_automation_agensvc" {
  type    = string
  default = ""
}
variable "private_dns_zone_name_automation" {
  type    = string
  default = ""
}
variable "private_dns_zone_name_vaultcore" {
  type    = string
  default = ""
}
variable "private_dns_zone_name_servicebus" {
  type    = string
  default = ""
}
variable "private_dns_zone_name_synapse" {
  type    = string
  default = ""
}
variable "private_dns_zone_name_dev_synapse" {
  type    = string
  default = ""
}
variable "private_dns_zone_name_azurewebsites" {
  type    = string
  default = ""
}
variable "private_dns_zone_name_azurecr" {
  type    = string
  default = ""
}
variable "private_dns_zone_name_azmk8s" {
  type    = string
  default = ""
}
variable "adf_subnet_address_prefix" {
  type = string
}
variable "spn_name" {}
variable "backend_cer_cert_name" {
  type = string
}
variable "app_intg_cert_name" {
  type = string
}
variable "api_pfx_cert_name" {
  type = string
}
variable "api_developer_pfx_cert_name" {
  type = string
}
variable "aks_cert_name" {
  type = string
}
variable "probe_path" {}

/* remove those
variable "node_size" {}
variable "number_of_nodes" {}
variable "max_parallel_executions_per_node" {}
variable "edition" {}
variable "license_type" {}
*/

variable "mdp_sql_admin_login_password" {}
variable "sypnase_analyticsdev1_performance_level" {}

variable "app_service_plan_size" {}
variable "app_service_plan_tier" {}

# Virtual Machine
variable "encryptapp_sp_name" { type = string }
variable "iics_subnet_address_prefix" { type = string }
variable "avscan_subnet_address_prefix" { type = string }
/*
variable "domain_name" {type = string}
variable "ou_path" {type = string}

variable "domain_user_name" {type = string}
variable "domain_user_password" {type = string}
*/
variable "vm_count_buildvm_iics" {}
variable "vm_count_buildvm_iics_ts" {}
variable "vm_size_build" {}
variable "kpmg_nat_ip_list" { type = list(string) }
variable "kpmg_trusted_address_prefixes" { type = list(string) }
variable "os_disk_size" {}

#APIM Variables
variable "apimsku" {}
variable "publisher_name" {
  type        = string
  description = "The name of publisher/company."
}

variable "publisher_email" {
  type        = string
  description = "The email of publisher/company."
}

variable "apim_subnet_address_prefix" {}
variable "virtual_network_type" {}

variable "spoke_vnet_name" {}
variable "spokevnetrgname" {}

# Subnet Variables
variable "subnet_address_space_aks" {}

# AKS Variables
variable "aks_version" {}

variable "aks_default_node_pool_name" {}
variable "aks_default_node_count" {}
variable "aks_default_node_size" {}
variable "aks_default_auto_scaling" {}
variable "aks_default_pool_type" {}
variable "aks_default_avail_zones" {}

variable "aks_win_node_pool_name" {}
variable "aks_win_node_count" {}
variable "aks_win_node_size" {}
variable "aks_win_auto_scaling" {}
variable "aks_win_avail_zones" {}

variable "aks_pgs_sku" {}
variable "aks_pgs_version" {}
variable "aks_pgs_storage" {}
variable "DNS_VNET" {}

#vnet integration and subnet association variables
variable "clamav_fap_subnet_address_prefix" {}
variable "clamav_wap_subnet_address_prefix" {}
variable "app_intg_subnet_address_prefix" {}

variable "subnet_service_endpoints_clamav_wap" {
  type = list(string)
}
variable "subnet_delegation_clamav_wap" {
  type = list(object({
    delegation_name            = string
    service_delegation_name    = string
    service_delegation_actions = list(string)
  }))
}

variable "subnet_service_endpoints_clamav_fap" {
  type = list(string)
}
variable "subnet_delegation_clamav_fap" {
  type = list(object({
    delegation_name            = string
    service_delegation_name    = string
    service_delegation_actions = list(string)
  }))
}

variable "database_clamav_net_prefixes" {
  type = list(string)
}

#ClamAv Configuration

variable "clamav_eventgrid_function_name" {
  type        = string
  description = "The name of the Function which handles Event Grid messages"

}

variable "clamav_storage_account_function_name" {
  type        = string
  description = "The name of the Function which handles Event Grid messages"
}

variable "fun_main_version" {
type = string
}