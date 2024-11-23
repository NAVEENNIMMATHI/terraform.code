# Authentication
variable "client_id" {}
variable "client_secret" {}
variable "subscription_id" {}
variable "tenant_id" {}
variable "key_vault_secret_name" {
    default = ""
}

variable "datadog_api_key" {
    default = ""
    type = string
}
variable "datadog_site" {
    default = "datadoghq.com"
    type = string
}
variable "location" { type = string }
variable "location_acronym" { type = string }
variable "environment" { type = string }
variable "environment_acronym" { type = string }
variable "artifactory_url_acronym" { type = string }
variable "cloudops_global_prefix" { type = string }
variable "application_acronym" { type = string }
variable "fulcrum_subdomain" { type = string }
variable "fulcrum_domain_url" { type = string }
variable "tags" { type = map(string) }
variable "provisioner_log_prefix" { 
    type    = string 
    default = "`date --rfc-3339=seconds` :" 
}
variable "aad_domains" { 
    type = map(string) 
    default = {
        development = "KCONP.LOCAL"
        qa          = "KCONP.LOCAL"
        staging     = "KCO.LOCAL"
        uat         = "KCO.LOCAL"
        production  = "KCO.LOCAL"
    }
}
variable "aad_ou_domain_names" { 
    type = map(string) 
    default = {
        development = "kconp"
        qa          = "kconp"
        staging     = "kco"
        uat         = "kco"
        production  = "kco"
    }
}
variable "aad_domain_join_usernames" { 
    type = map(string) 
    default = {
        development = "A-odmartinez@KCONP.LOCAL"
        qa          = "A-odmartinez@KCONP.LOCAL"
        staging     = "azuser-svc-p-domainjoin@KCO.LOCAL"
        uat         = "azuser-svc-p-domainjoin@KCO.LOCAL"
        production  = "azuser-svc-p-domainjoin@KCO.LOCAL"
    }
}

# Workstation
variable "rstudio_workstnvm_admin_password" { type = string }
variable "rstudio_workstnvm_adminname" { type = string }
#variable "rstudio_workstnvm_count" { type = string }
variable "rstudio_workstnvm_envmnt_prefix1" { type = string }
variable "rstudio_workstnvm_name_prefix1" { type = string }
variable "rstudio_workstnvm_size" { type = string }

# Server Pro
variable "rstudio_serverprovm_admin_password" { type = string }
variable "rstudio_serverprovm_adminname" { type = string }
variable "rstudio_serverprovm_count" { type = number }
variable "rstudio_serverprovm_envmnt_prefix1" { type = string }
variable "rstudio_serverprovm_name_prefix1" { type = string }
variable "rstudio_serverprovm_size" { type = string }

# RPM
variable "rstudio_rpmvm_admin_password" { type = string }
variable "rstudio_rpmvm_adminname" { type = string }
variable "rstudio_rpmvm_count" { type = number }
variable "rstudio_rpmvm_envmnt_prefix1" { type = string }
variable "rstudio_rpmvm_name_prefix1" { type = string }
variable "rstudio_rpmvm_size" { type = string }

# Connect
variable "rstudio_connectvm_admin_password" { type = string }
variable "rstudio_connectvm_adminname" { type = string }
variable "rstudio_connectvm_count" { type = number }
variable "rstudio_connectvm_envmnt_prefix1" { type = string }
variable "rstudio_connectvm_name_prefix1" { type = string }
variable "rstudio_connectvm_size" { type = string }

# Gurobi
variable "rstudio_gurobivm_name_prefix1" { type = string }
variable "rstudio_gurobirmvm_name_prefix1" { type = string }
variable "rstudio_gurobivm_count" { type = string }
variable "rstudio_gurobivm_size" { type = string }
variable "rstudio_gurobirmvm_size" { type = string }
variable "rstudio_gurobivm_adminname" { type = string }
variable "rstudio_gurobivm_admin_password" { type = string }

#Private DNS
variable "pvt_dns_subscription_id" {}
variable "pvt_dns_environment_acronym" {}

# Images
variable "target_deployment_environment" { type = string }
variable "vm_linux_image_id" { type = string }
variable "vm_windows_image_id" { type = string }

variable "spi_vnet_name" { type = string }
variable "spi_vnet_resource_group_name" { type = string }

variable "route_table_name" { type = string }
variable "route_table_rg_name" { type = string }

variable "backupmanagementservice_service_principal_name" { type = string }
variable "encryptapp_service_principal_name" { type = string }
variable "keyvault_service_principal_name" { type = string }
variable "rstudio_address_space" { type = string }
variable "rstudio_postgresql_adminname" { type = string }
variable "rstudio_postgresql_adminpassword" { type = string }
variable "rstudio_postgresql_PostGresVersion" { type = string }
variable "rstudio_postgresql_sku_name" { type = string }
variable "rstudio_postgresql_storageprofile_backup_retention_days" { type = string }
variable "rstudio_postgresql_storageprofile_geo_redundant_backup" { type = string }
variable "rstudio_postgresql_storageprofile_storage_mb" { type = string }
variable "gurobi_address_space" { type = string }
variable "windows_address_space" { type = string }

# Tenant
variable "support_team_group" { type = string}
variable "tenantfqdn" { type = string }

# Shared SPI Resources
variable "spoke_da_keyvault_name" { type = string }
variable "spoke_da_keyvault_resourcegroup" { type = string }
variable "spi_resourcegroup" { type = string }
variable "spi_app_vm_name" { type = string }
variable "spi_user_vm_name" { type = string }

# Core Resources
variable "core_build_subnet_id" { type = string }
variable "core_aks_subnet_id" { type = string }
variable "log_analytics_workspace_name" { type = string }
variable "log_analytics_workspace_resource_group_name" { type = string }
variable "log_analytics_workspace_id" { type = string }
variable "log_analytics_workspace_key" { type = string }
variable "core_subscription_id" { type = string }
variable "core_aks_pip_name" { type = string }
variable "core_aks_pip_resource_group_name" { type = string }
variable "artifactory_url" { type = string }

# File Name Replacement
variable "qualys_agent" { type = string }
variable "rstudio_pm_package" { type = string }
variable "rstudio_workbench_rhel_package" { type = string }
variable "rstudio_connect_package" { type = string }
variable "rstudio_gurobi_package" { type = string }
variable "gurobi_license_file" { type = string }
variable "pandoc_package" { type = string }

#Domain Join
variable "domainjoinpassword" { 
  type    = string
  default = "" 
}

# MongoDB Atlas
variable "mongodb_atlas_cluster_project_id" { type = string }
variable "mongodb_atlas_cluster_location" { type = string }
variable "mongodb_atlas_cluster_version" { type = string }
variable "mongodb_atlas_cluster_tier_size" { type = string }
variable "mongodb_subnet_address_space" { type = string }
variable "mongodb_user" { type = string }
variable "mongodb_user_password" { type = string }

# Fulcrum share
variable "fulcrum_share_account" { type = string }
variable "fulcrum_share_username" { type = string }
variable "fulcrum_share_password" { 
    type = string 
    default = ""
}

# Code Server
variable "code_server_package" { type = string }
