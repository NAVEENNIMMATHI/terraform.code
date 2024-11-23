variable "subscription_id" { type = string }
variable "client_id" { type = string }
variable "tenant_id" { type = string }
variable "client_secret" { type = string }

variable "wvd_subnet_id" { type = string }
variable "agent_subnet_id" { type = string }
variable "encryptapp_sp_name" { type = string }
variable "spn_name" { type = string }
variable "spoke_vnet_name" { type = string }
variable "spoke_vnet_rgname" { type = string }
variable "spoke_law_name" { type = string }
variable "spoke_law_rg_name" { type = string }
variable "application_name" { type = string }

variable "client_address_prefix" { type = string }

#ResourceGroup
variable "application_acronym" { type = string }
variable "location_acronym" { type = string }
variable "environment_acronym" { type = string }
variable "location" { type = string }
variable "tags" { type = map(string) }
variable "target_deployment_environment" { type = string }
variable "client" { type = string }

# License Manager subnet
variable "license_manager_acronym" { type = string }
variable "address_prefix" { type = string }
variable "enforce_private_link_endpoint_network_policies" { type = bool }
variable "service_endpoints" { type = list(string) }

# Application Gateway subnet
variable "address_prefix_agw" { type = string }
variable "enforce_private_link_endpoint_network_policies_agw" { type = bool }
variable "service_endpoints_agw" { type = list(string) }

# AKS subnet
variable "address_prefix_aks" { type = string }
variable "enforce_private_link_endpoint_network_policies_aks" { type = bool }
variable "service_endpoints_aks" { type = list(string) }
variable "aks_node_subscription" { type = string }

# Private links subnet
variable "address_prefix_pep" { type = string }
variable "enforce_private_link_endpoint_network_policies_pep" { type = bool }
variable "service_endpoints_pep" { type = list(string) }

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


# Private DNS Zone
variable "private_dns_zone_subscription" { type = string }
variable "private_dns_zone_resource_group_name" { type = string }
variable "private_dns_zone_name_file" { type = string }
variable "private_dns_zone_name_automation_agensvc" { type = string }
variable "private_dns_zone_name_automation" { type = string }
variable "private_dns_zone_name_vaultcore" { type = string }
variable "private_dns_zone_name_azurecr" { type = string }
variable "private_dns_zone_name_azmk8s" { type = string }
variable "private_dns_zone_name_postgres" { type = string }

#Route Table
variable "azfwsubscriptionid" { type = string }
variable "firewall_network_name" { type = string }
variable "firewall_network_rg_name" { type = string }

variable "firewall_ip" { type = string }

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
variable "backend_cer_cert_name" { type = string }
variable "frontend_pfx_cert_name" { type = string }
variable "ssl_certificate_secret_id" { type = string }
variable "application_gateway_cert_name" { type = string }
variable "agw_pfx_cert_name" { type = string }

# PostgresSql Database variables
variable "mathworks_postgresql_sku_name" { type = string }
variable "mathworks_postgresql_storageprofile_storage_mb" { type = string }
variable "mathworks_postgresql_storageprofile_backup_retention_days" { type = string }
variable "mathworks_postgresql_storageprofile_geo_redundant_backup" { type = string }
variable "mathworks_postgresql_adminname" { type = string }
variable "mathworks_postgresql_adminpassword" { type = string }
variable "mathworks_postgresql_PostGresVersion" { type = string }
variable "mathworks_connect_postgresql_db_name" { type = string }
variable "mathworks_connect_postgresql_db_api_name" { type = string }
variable "mathworks_connect_postgresql_db_config_name" { type = string }
variable "mathworks_connect_postgresql_db_ui_name" { type = string }
variable "mathworks_connect_postgresql_db_content_name" { type = string }

# License Manager Virtual Machine
variable "vm_count_buildvm_license_manager" { type = string }
variable "vm_size_build" { type = string }
variable "mathworks_vm_admin_password" { type = string }

# Linux VM
variable "mip_linuxvm_admin_password" { type = string }
variable "mip_linuxvm_adminname" { type = string }
variable "mip_linuxvm_count" { type = number }
variable "mip_linuxvm_name_prefix1" { type = string }
variable "mip_linuxvm_size" { type = string }
variable "vm_linux_image_id" { type = string }

# #Recovery Services Vault
# variable "recoveryServicesVaultName" { type = string }
# variable "recoveryServicesVaultResourceGroupName" { type = string }

variable "kpmg_trusted_address_prefixes" {type = list(string)}