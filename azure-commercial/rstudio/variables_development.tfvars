# Authentication
client_id       = "e0628e55-2ee3-4131-8fdd-330265aed576"
client_secret   = ""
subscription_id = "3507153c-e6a4-4e2f-ae04-f34c1fd4482f"
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"
key_vault_secret_name = "azuser-svcRSTUAdminDV-password"

location                = "eastus"
location_acronym        = "use"
environment             = "development"
environment_acronym     = "dv"
artifactory_url_acronym = "artifactory-dev"
cloudops_global_prefix  = "co"
application_acronym     = "rstu"
fulcrum_subdomain      = "fulcrumdev"
fulcrum_domain_url      = "fulcrumdev.kpmgcloudops.com"

tags = {
  Environment     = "Development"
  LOB             = "Deal Advisory & Strategy"
  Node            = "Spoke"
  Platform        = "Azure Commercial Cloud"
  Solution        = "RStudio"
  BusinessContact = "tschenk@kpmg.com"
  BusinessOwner   = "Tom Schenk"
}

# Workstation
rstudio_workstnvm_admin_password = ""
rstudio_workstnvm_adminname      = "rStudioLinAdmin"
#rstudio_workstnvm_count          = "2"
rstudio_workstnvm_envmnt_prefix1 = "D1"
rstudio_workstnvm_name_prefix1   = "WKS"
rstudio_workstnvm_size           = "Standard_D2s_v3"

# Server Pro
rstudio_serverprovm_admin_password = ""
rstudio_serverprovm_adminname      = "rStudioLinAdmin"
rstudio_serverprovm_count          = "0"
rstudio_serverprovm_envmnt_prefix1 = "D1"
rstudio_serverprovm_name_prefix1   = "SRVPRO"
rstudio_serverprovm_size           = "Standard_E4s_v3"

# RPM
rstudio_rpmvm_admin_password = ""
rstudio_rpmvm_adminname      = "rStudioLinAdmin"
rstudio_rpmvm_count          = "0"
rstudio_rpmvm_envmnt_prefix1 = "D1"
rstudio_rpmvm_name_prefix1   = "RPM"
rstudio_rpmvm_size           = "Standard_D4s_v3"

# Connect
rstudio_connectvm_admin_password = ""
rstudio_connectvm_adminname      = "rStudioLinAdmin"
rstudio_connectvm_count          = "0"
rstudio_connectvm_envmnt_prefix1 = "D1"
rstudio_connectvm_name_prefix1   = "CON"
rstudio_connectvm_size           = "Standard_E4s_v3"

# Gurobi
rstudio_gurobivm_name_prefix1   = "GRB"
rstudio_gurobirmvm_name_prefix1 = "GRBRM"
rstudio_gurobivm_count          = "0"
rstudio_gurobivm_size           = "Standard_E4s_v3"
rstudio_gurobirmvm_size         = "Standard_E4s_v3"
rstudio_gurobivm_adminname      = "rStudioLinAdmin"
rstudio_gurobivm_admin_password = ""

#Private DNS
pvt_dns_subscription_id     = "c72acede-d539-45d9-963d-3464ec4ddae0"
pvt_dns_environment_acronym = "dv"

# Images
target_deployment_environment = "development"
vm_linux_image_id             = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/CIS-RedHat-Enterprise-Linux-75.vhd-image"
vm_windows_image_id           = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/cis-hardened-win2016-20190111-image"

spi_vnet_name                = "vnt-use-spi-dv"
spi_vnet_resource_group_name = "RGP-USE-SPI-VNET-DV"

route_table_name             = "rtb-use-spi-azfirewall-dv"
route_table_rg_name          = "RGP-USE-SPI-VNET-DV"

backupmanagementservice_service_principal_name          = "Backup Management Service"
encryptapp_service_principal_name                       = "EncryptApp"
keyvault_service_principal_name                         = "spn-devops-3507153c"
rstudio_address_space                                   = "10.51.38.0/27"
rstudio_postgresql_adminname                            = "kpmgrStudiodaadmin"
rstudio_postgresql_adminpassword                        = ""
rstudio_postgresql_PostGresVersion                      = "10"
rstudio_postgresql_sku_name                             = "GP_Gen5_4"
rstudio_postgresql_storageprofile_backup_retention_days = "7"
rstudio_postgresql_storageprofile_geo_redundant_backup  = "Disabled"
rstudio_postgresql_storageprofile_storage_mb            = "5120"
gurobi_address_space                                    = "10.51.39.80/28"
windows_address_space                                   = "10.51.39.96/28"

# Tenant
support_team_group = "CO-Certificate-KeyVault"
tenantfqdn         = "kpmgusadvspectrum.onmicrosoft.com"

# Shared SPI Resources
spoke_da_keyvault_name          = "kvl-use-common-3507153c"
spoke_da_keyvault_resourcegroup = "RGP-USE-COMMON"
spi_resourcegroup               = "RGP-USE-SPI-VNET-DV"
spi_app_vm_name                 = "VMWUSESPIAPDB1DV"
spi_user_vm_name                = "VMWUSESPISTGSQLDV"

# Core Resources
core_build_subnet_id = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/co-dv-eastus-infra1-subnet"
core_aks_subnet_id = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/sub-use-core-aks-dv"
log_analytics_workspace_name = "law-use-corelogs-dv"
log_analytics_workspace_resource_group_name = "co-dv-eastus-loganalytics-rg"
log_analytics_workspace_id = "6d29ab96-c578-4486-9591-8093c1863f26"
log_analytics_workspace_key = ""
core_subscription_id = "c72acede-d539-45d9-963d-3464ec4ddae0"
core_aks_pip_name = "pip-use-core-aks-agw-dv"
core_aks_pip_resource_group_name = "RGP-USE-CORE-AKS-DV"
artifactory_url = "artifactory-dev.kpmgcloudops.com"

# Package Name Replacement
qualys_agent = "qualyscloud-agent.x86_64.rpm"
rstudio_pm_package = "rstudio-pm-2022.07.2-11.x86_64.rpm"
rstudio_workbench_rhel_package = "rstudio-workbench-rhel-2022.07.2-576.pro12-x86_64.rpm"
rstudio_connect_package = "rstudio-connect-2022.09.0.el8.x86_64.rpm"
rstudio_gurobi_package = "gurobi_server9.5.0_linux64.tar.gz"
gurobi_license_file = "gurobi-dv.lic"
pandoc_package = "pandoc-2.0.6-5.el8.x86_64.rpm"

# MongoDB Atlas
mongodb_atlas_cluster_location            = "US_EAST" 
mongodb_atlas_cluster_tier_size           = "M10"
mongodb_atlas_cluster_version             = "4.2"
mongodb_subnet_address_space              = "10.51.39.64/28"
mongodb_user                              = "gurobiuser"
mongodb_user_password                     = ""

# Fulcrum Share
fulcrum_share_account       = "dlsusekiprawcurtd01sadv"
fulcrum_share_username      = "dlsusekiprawcurtd01sadv"
fulcrum_share_password      = ""

# Code Server
code_server_package = "code-server-4.9.0-amd64.rpm"
