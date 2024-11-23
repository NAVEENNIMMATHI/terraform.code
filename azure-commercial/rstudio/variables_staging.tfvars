# Authentication
client_id       = "b964573c-e75c-4c3c-a59f-5d69a287e284"
client_secret   = ""
subscription_id = "84c5a4ce-8d9d-45f0-b15a-552d0f67db83"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"
key_vault_secret_name = "azuser-svcRSTUAdminST-password"

location                = "eastus"
location_acronym        = "use"
environment             = "staging"
environment_acronym     = "stg"
artifactory_url_acronym = "artifactory-stg"
cloudops_global_prefix  = "co"
application_acronym     = "rstu"
fulcrum_domain_url      = "fulcrumstg.kpmgcloudops.com"

tags = {
  Environment     = "Staging"
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
#rstudio_workstnvm_count          = "1"
rstudio_workstnvm_envmnt_prefix1 = "S1"
rstudio_workstnvm_name_prefix1   = "WKS"
rstudio_workstnvm_size           = "Standard_D2s_v3"

# Server Pro
rstudio_serverprovm_admin_password = ""
rstudio_serverprovm_adminname      = "rStudioLinAdmin"
rstudio_serverprovm_count          = "0"
rstudio_serverprovm_envmnt_prefix1 = "S1"
rstudio_serverprovm_name_prefix1   = "SRVPRO"
rstudio_serverprovm_size           = "Standard_E16s_v3"

# RPM
rstudio_rpmvm_admin_password = ""
rstudio_rpmvm_adminname      = "rStudioLinAdmin"
rstudio_rpmvm_count          = "0"
rstudio_rpmvm_envmnt_prefix1 = "S1"
rstudio_rpmvm_name_prefix1   = "RPM"
rstudio_rpmvm_size           = "Standard_D4s_v3"

# Connect
rstudio_connectvm_admin_password = ""
rstudio_connectvm_adminname      = "rStudioLinAdmin"
rstudio_connectvm_count          = "0"
rstudio_connectvm_envmnt_prefix1 = "S1"
rstudio_connectvm_name_prefix1   = "CON"
rstudio_connectvm_size           = "Standard_E16s_v3"

# Images
target_deployment_environment = "stg"
vm_linux_image_id             = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/CIS-RedHat-Enterprise-Linux-75.vhd-image"
vm_windows_image_id           = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/cis-hardened-win2016-20190111-image"

spi_vnet_name                = "co-stg-eastus-spi-vnet"
spi_vnet_resource_group_name = "co-stg-eastus-cospivnet-rg"

route_table_name             = "rtb-use-spi-azfirewall-stg"
route_table_rg_name          = "RGP-USE-SPI-VNET-STG"

backupmanagementservice_service_principal_name          = "Backup Management Service"
encryptapp_service_principal_name                       = "DiskEncryptApp"
keyvault_service_principal_name                         = "spn-devops-84c5a4ce"
rstudio_address_space                                   = "10.71.6.0/27"
rstudio_postgresql_adminname                            = "kpmgrStudiodaadmin"
rstudio_postgresql_adminpassword                        = ""
rstudio_postgresql_PostGresVersion                      = "10"
rstudio_postgresql_sku_name                             = "GP_Gen5_4"
rstudio_postgresql_storageprofile_backup_retention_days = "7"
rstudio_postgresql_storageprofile_geo_redundant_backup  = "Disabled"
rstudio_postgresql_storageprofile_storage_mb            = "5120"

# Tenant
support_team_group = "CO-Certificate-KeyVault"
tenantfqdn         = "kpmgusadvcloudops.onmicrosoft.com"

# Shared SPI Resources
spoke_da_keyvault_name          = "kvl-use-common-84c5a4ce"
spoke_da_keyvault_resourcegroup = "RGP-USE-COMMON"
spi_resourcegroup               = "RGP-USE-SPI-VNET-STG"
spi_app_vm_name                 = "VMWUSESPIAPDB1STG"
spi_user_vm_name                = "VMWUSESPISTGSQLSTG"

# Core Resources
core_build_subnet_id = "/subscriptions/169d52bf-6f65-47d7-8f3e-e5c67d6ee19e/resourceGroups/RGP-USE-COREVNET-STG/providers/Microsoft.Network/virtualNetworks/vnt-use-core-stg/subnets/sub-use-infra1-stg"
core_aks_subnet_id = "/subscriptions/169d52bf-6f65-47d7-8f3e-e5c67d6ee19e/resourceGroups/RGP-USE-COREVNET-STG/providers/Microsoft.Network/virtualNetworks/vnt-use-core-stg/subnets/sub-use-core-aks-stg"
log_analytics_workspace_id = "" # TODO
log_analytics_workspace_key = "" # TODO
log_analytics_workspace_name = "" # TODO
log_analytics_workspace_resource_group_name = "" # TODO
core_subscription_id = "169d52bf-6f65-47d7-8f3e-e5c67d6ee19e"
core_aks_pip_name = "" # TODO
core_aks_pip_resource_group_name = "" # TODO
artifactory_url = "" # TODO

# Package Name Replacement
qualys_agent = "qualyscloud-agent.x86_64.rpm"
rstudio_pm_package = "rstudio-pm-2022.07.2-11.x86_64.rpm"
rstudio_workbench_rhel_package = "rstudio-workbench-rhel-2022.07.2-576.pro12-x86_64.rpm"
rstudio_connect_package = "rstudio-connect-2022.09.0.el8.x86_64.rpm"
pandoc_package = "pandoc-2.0.6-5.el8.x86_64.rpm"
