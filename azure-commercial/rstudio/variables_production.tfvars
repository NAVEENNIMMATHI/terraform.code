# Authentication
client_id       = "b2967f11-d801-4812-b532-3f3a676e8b46"
client_secret   = ""
subscription_id = "9e27f52c-3c97-4fda-9c8f-eadcd0ad195a"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"
key_vault_secret_name = "azuser-svcRSTUAdminPD-password"

location                = "eastus"
location_acronym        = "use"
environment             = "production"
environment_acronym     = "p"
artifactory_url_acronym = "artifactory"
cloudops_global_prefix  = "co"
application_acronym     = "rstudio"
fulcrum_subdomain       = "fulcrum"
fulcrum_domain_url      = "fulcrum.kpmgcloudops.com"

tags = {
  Environment     = "Production"
  LOB             = "Deal Advisory & Strategy"
  Node            = "Spoke"
  Platform        = "Azure Commercial Cloud"
  Solution        = "RStudio"
  BusinessContact = "tschenk@kpmg.com"
  BusinessOwner   = "Tom Schenk"
  Datadog         = "Monitored"
}

# Workstation
rstudio_workstnvm_admin_password = ""
rstudio_workstnvm_adminname      = "rStudioLinAdmin"
#rstudio_workstnvm_count          = "1"
rstudio_workstnvm_envmnt_prefix1 = "P1"
rstudio_workstnvm_name_prefix1   = "WKS"
rstudio_workstnvm_size           = "Standard_D2s_v3"

# Server Pro
rstudio_serverprovm_admin_password = ""
rstudio_serverprovm_adminname      = "rStudioLinAdmin"
rstudio_serverprovm_count          = "1"
rstudio_serverprovm_envmnt_prefix1 = "P1"
rstudio_serverprovm_name_prefix1   = "SRVPRO"
rstudio_serverprovm_size           = "Standard_E16s_v3"

# RPM
rstudio_rpmvm_admin_password = ""
rstudio_rpmvm_adminname      = "rStudioLinAdmin"
rstudio_rpmvm_count          = "1"
rstudio_rpmvm_envmnt_prefix1 = "P1"
rstudio_rpmvm_name_prefix1   = "RPM"
rstudio_rpmvm_size           = "Standard_D4s_v3"

# Connect
rstudio_connectvm_admin_password = ""
rstudio_connectvm_adminname      = "rStudioLinAdmin"
rstudio_connectvm_count          = "1"
rstudio_connectvm_envmnt_prefix1 = "P1"
rstudio_connectvm_name_prefix1   = "CON"
rstudio_connectvm_size           = "Standard_E16s_v3"

# Gurobi
rstudio_gurobivm_name_prefix1   = "GRB"
rstudio_gurobirmvm_name_prefix1 = "GRBRM"
rstudio_gurobivm_count          = "0"
rstudio_gurobivm_size           = "Standard_E4s_v3"
rstudio_gurobirmvm_size         = "Standard_E4s_v3"
rstudio_gurobivm_adminname      = "rStudioLinAdmin"
rstudio_gurobivm_admin_password = ""

#Private DNS
pvt_dns_subscription_id     = "4c9dc048-01dc-4854-9063-8a3d4060993a"
pvt_dns_environment_acronym = "pd"

# Images
target_deployment_environment = "prod"
vm_linux_image_id             = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/CIS-RedHat-Enterprise-Linux-75.vhd-image"
vm_windows_image_id           = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/cis-hardened-win2016-20190111-image"

spi_vnet_name                = "CO-P-eastus-spi-vnet"
spi_vnet_resource_group_name = "CO-P-eastus-cospivnet-rg"

route_table_name             = "co-p-eastus-azfirewall-udr"
route_table_rg_name          = "CO-P-eastus-cospivnet-rg"

backupmanagementservice_service_principal_name          = "Backup Management Service"
encryptapp_service_principal_name                       = "DiskEncryptApp"
keyvault_service_principal_name                         = "spn-devops-9e27f52c"
rstudio_address_space                                   = "10.32.6.0/27"
rstudio_postgresql_adminname                            = "kpmgrStudiodaadmin"
rstudio_postgresql_adminpassword                        = ""
rstudio_postgresql_PostGresVersion                      = "10"
rstudio_postgresql_sku_name                             = "GP_Gen5_4"
rstudio_postgresql_storageprofile_backup_retention_days = "7"
rstudio_postgresql_storageprofile_geo_redundant_backup  = "Disabled"
rstudio_postgresql_storageprofile_storage_mb            = "5120"
gurobi_address_space                                    = "10.32.6.48/28"
windows_address_space                                   = "10.32.6.64/28"

# Tenant
support_team_group = "CO-DA-KeyVault-AdminsPD"
tenantfqdn         = "kpmgusadvcloudops.onmicrosoft.com"

# Shared SPI Resources
spoke_da_keyvault_name          = "akvcoeusazcop9e27f52cprd"
spoke_da_keyvault_resourcegroup = "RGP-CO-EUS-AZCOP-9e27f52c-PRD"
spi_resourcegroup               = "CO-P-eastus-cospivnet-rg"
spi_app_vm_name                 = "UEMCSPIAPDB1P1"
spi_user_vm_name                = "UEMCSPIPRODSQL1P1"

# Core Resources
core_build_subnet_id = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/co-p-eastus-infra1-subnet"
core_aks_subnet_id = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/sub-use-core-aks-pd"
log_analytics_workspace_id = "8062b313-c43f-413f-8f8a-ae2d5c3c4251"
log_analytics_workspace_key = "" # Pipeline will fetch this value
log_analytics_workspace_name = "law-use-corelogs-pd"
log_analytics_workspace_resource_group_name = "co-p-eastus-loganalytics-rg"
core_subscription_id = "4c9dc048-01dc-4854-9063-8a3d4060993a"
core_aks_pip_name = "pip-use-core-aks-agw-pd"
core_aks_pip_resource_group_name = "RGP-USE-CORE-AKS-PD"
artifactory_url = "artifactory.kpmgcloudops.com"

# Package Name Replacement
qualys_agent = "qualyscloud-agent.x86_64.rpm"
rstudio_pm_package = "rstudio-pm-2022.07.2-11.x86_64.rpm"
rstudio_workbench_rhel_package = "rstudio-workbench-rhel-2022.07.2-576.pro12-x86_64.rpm"
rstudio_connect_package = "rstudio-connect-2022.09.0.el8.x86_64.rpm"
rstudio_gurobi_package = "gurobi_server9.5.0_linux64.tar.gz"
gurobi_license_file = "gurobi-prod.lic"
pandoc_package = "pandoc-2.0.6-5.el8.x86_64.rpm"

# MongoDB Atlas
mongodb_atlas_cluster_project_id          = ""
mongodb_atlas_cluster_location            = "US_EAST" 
mongodb_atlas_cluster_tier_size           = "M30"
mongodb_atlas_cluster_version             = "4.2"
mongodb_subnet_address_space              = "10.32.6.32/28"
mongodb_user                              = "gurobiuser"
mongodb_user_password                     = ""

# Fulcrum Share
fulcrum_share_account       = "copdeuskiprawcurtd01sa"
fulcrum_share_username      = "copdeuskiprawcurtd01sa"
fulcrum_share_password      = ""

# Code Server
code_server_package = "code-server-4.9.0-amd64.rpm"
