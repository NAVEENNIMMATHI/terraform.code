client_id           					= "9975dc86-7489-483c-b49c-47bdff5e2eb8"
subscription_id     					= "b75fc3c3-04a4-45a6-b126-8279f505e873"
tenant_id           					= "b5031e57-d76f-422e-87c6-02b4cc749974"
client_secret                           = ""

#environment specific variables
location                                = "eastus"
location_acronym						= "use"
environment                             = "uat"
environment_acronym						= "uat"
application								= "kpmg_interview_insights"
application_acronym                     = "kip"
app_url_acronym                         = "u"
tags= {
    Platform                = "Azure Commercial Cloud"
    Environment             = "UAT"
    Node                    = "Spoke"
    Solution                = "KPMG Intelligence Platform (KIP)"
    TechnicalOwner          = "Prajal Doshi"
    TechnicalContact        = "prajaldoshi@kpmg.com"
    BusinessOwner           = "Tom Biagi"
    BusinessContact         = "tbiagi@kpmg.com"
    LOB                     = "Deal Advisory & Strategy"
}

#service principal
encryptapp_service_principal_name       = "DiskEncryptApp"
backupmanagement_service_principal_name = "Backup Management Service"

agw1_subnet_adress_space                    = "10.51.8.0/26"
app1_subnet_adress_space                    = "10.51.8.64/27"
wst1_subnet_adress_space                    = "10.51.8.96/27"
ase1_subnet_adress_space                    = "10.51.8.128/27"
pbi1_subnet_adress_space                    = "10.51.8.160/27"
db1_subnet_adress_space                     = "10.51.8.192/27"
adx1_subnet_adress_space                    = "10.51.8.224/27"
databricks_subnet_private_address_space     = "10.51.9.0/28"
databricks_subnet_public_address_space      = "10.51.9.16/28"
private_endpoint_subnet_address_space       = "10.51.9.32/27"
adf_int_runtime_subnet_address_space        = "10.51.9.64/28"
syn_int_runtime_subnet_address_space        = "10.51.10.192/28"
pvw_int_runtime_subnet_address_space        = "10.51.10.224/28"
kpimcapiq_subnet_address_space              = "10.12.1.224/27"

address_space                               = ["10.51.8.0/21"]
address_space_string_format                 = "10.51.8.0/21"
synapseStartRange                           = "10.51.8.96"
synapseEndRange                             = "10.51.8.127"
dns_server                              = ["10.30.15.196","10.30.15.197"]

coreinfrasubnetid                       = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-infra1-uat"
# spidb1subnetid                          = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/CO-P-eastus-cospivnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-spi-vnet/subnets/co-p-eastus-spidb1-subnet"
###Allow SPI databricks public controlplane subnet in  Prod to access  KIP data lake in UAT
spidatabrickssubnetid                       = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-spi-vnet/subnets/co-p-eastus-spi-databricks-controlplane-subnet"
core_aks_subnet_id                      = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-core-aks-uat"
squid_proxy_vm_subnet_id                = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-squidproxyvm-uat"
rstudio_subnet_id                       = "/subscriptions/b75fc3c3-04a4-45a6-b126-8279f505e873/resourceGroups/RGP-USE-SPI-VNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-spi-uat/subnets/sub-use-spi-rstu-uat"

coresubscriptionid                      = "931d8a2f-96bb-44d3-9b06-6c05c41c4060"
corevnetresourcegroup                   = "RGP-USE-COREVNET-UAT"
corevnetname                            = "vnt-use-core-uat"

#App Service Environment
ase_name                                = "ase-use-kip-uat"
dns_suffix                              = "kpmgcloudops.com"

is_hns_enabled                          = "true"
account_tier                            = "Standard"
account_tier2                           = "Premium"
account_kind                            = "FileStorage"
replication_type2                       = "ZRS"
replication_type                        = "RAGRS"


# Vm count value
count_value_wst1vm                      = "1"
vm_size_wst1vm                          = "Standard_D8s_v3"
data_disk_size_wst1vm                   = "512"

count_value_app1vm                      = "2"
vm_size_app1vm                          = "Standard_D16s_v3"
data_disk_size_app1vm                   = "512"

count_value_app2vm                      = "1"
vm_size_app2vm                          = "Standard_D4s_v3"
data_disk_size_app2vm                   = "512"

count_value_pbi1vm                      = "2"
vm_size_pbi1vm                          = "Standard_D8s_v3"
data_disk_size_pbi1vm                   = "512"

count_value_adf1vm                      = "1"
vm_size_adf1vm                          = "Standard_D8s_v3"
data_disk_size_adf1vm                   = "512"

count_value_syn1vm                      = "1"
vm_size_syn1vm                          = "Standard_D2s_v3"
data_disk_size_syn1vm                   = "512"

count_value_pvw1vm                      = "1"
vm_size_pvw1vm                          = "Standard_D2s_v3"
data_disk_size_pvw1vm                   = "512"

count_value_kpimcapiqvm                 = "0"
vm_size_kpimcapiqvm                     = "Standard_D2s_v3"
data_disk_size_kpimcapiqvm              = "512"

count_value_analytics                   = "0"
vm_size_analytics                       = "Standard_DS2_v2"

vm_admin_password                       = ""

application_gw_sku_name                 = "WAF_Large"
application_gw_sku_tier                 = "WAF"
application_gw_sku_capacity             = "2"

/***Self Signed Certificate*****/
selfsigncertname                        = "star_kpmgcloudops_com"
selfsignauthcertcer                     = "kpmgcloudops.com.cer"

# app service plan
asp_tier                                = "Isolated"
asp_size                                = "I1"
asp_capacity                            = "1"

kip_sql_dwh_performance_level                = "DW100c"
thirdpartydata_sql_dwh_performance_level     = "DW100c"
kip_synapse_dwh_performance_level            = "DW100c"
thirdpartydata_synapse_dwh_performance_level = "DW100c"
kpmgproprietarydata_synapse_dwh_performance_level = "DW500c"

sqlserveradmin_password                 = ""

PaloInboundIPAddress                    = "10.30.16.100"
azfirewall_ip_address                   = "10.100.2.196"
ase_internal_ip                         = "10.22.0.11"

#Network Security Rule
PaloAlto1                               = "20.185.106.126/32"
PaloAlto2                               = "20.185.110.197/32"
KPMG_On-Premise                         = "199.207.253.0/24"
KPMG_VPN                                = ["199.206.0.5/32"]
KGS_Bangalore                           = ["103.133.112.80/28","103.58.118.80/28"]
KGS_Gurgaon                             = "103.216.201.96/28"
ASE_PIP                                 = ["104.211.19.220/32","52.152.148.131/32"]
AZFW_PIP                                = ["52.170.175.39","52.170.174.246","52.188.26.32","52.188.27.2","52.188.26.99"]
Shared_DA_ASE_PIP                       = ["13.90.131.217"]
AGW_PIP                                 = ["13.82.135.38/32"]
ADX_Mgmt_IP                             = "52.224.146.56"
adx_healthmonitor_ip                    = ["137.116.81.189","52.249.253.174"]

# Managed Instance
managedInstanceadministratorLogin               = "kipmiadmin"
managedInstanceadministratorLoginPassword       = ""
managedInstanceskuName         			        = "GP_Gen5"
managedInstancevCores         			        = "8"
managedInstancestorageSizeInGB         		    = "8192"
managedInstancelicenseType         		        = "LicenseIncluded"

# Storage Account Container
webappbackup_container_name                     = "webappbackup"

windows_services_vm_name		                = "20dca328-3674-4437-8c48-487b59f34fd4" #Need to correct this value to the UAT APP1 VM

# Custom RBAC Variables
RBAC_CustomWebsiteContributor_Name		        = "KIP_UAT Website Contributor Production"
RBAC_CustomSQLManagedInstanceContributor_Name   = "KIP_UAT SQL Managed Instance Contributor Production"
RBAC_CustomStorageAccountContributor_Name	    = "KIP_UAT Storage Account Contributor Production"
RBAC_CustomKeyVaultRead_Name		            = "KIP_UAT Key Vault Read Production"
RBAC_CustomSQLDBContributor_Name                = "KIP_UAT SQL DB Contributor Production"
RBAC_CustomDataFactoryDeployer_Name             = "KIP_UAT DataFactory Deployer"

#Application Gateway
kiphostname                                  = "kipu.kpmgcloudops.com"
kipauthcertcer                               = "kipu.kpmgcloudops.com.cer"
kipcertname                                  = "kipu_kpmgcloudops_com"
kipsslcertpfx                                = "kipu.kpmgcloudops.com.pfx"
kipresthostname                              = "kiprestu.kpmgcloudops.com"
kiprestauthcertcer                           = "kiprestu.kpmgcloudops.com.cer"
kiprestcertname                              = "kiprestu_kpmgcloudops_com"
kiprestsslcertpfx                            = "kiprestu.kpmgcloudops.com.pfx"
mep-kiphostname                              = "mep-kipu.kpmgcloudops.com"
mep-kipauthcertcer                           = "mepkipu.kpmgcloudops.com.cer"
mep-kipcertname                              = "mep-kipu_kpmgcloudops_com"
mep-kipsslcertpfx                            = "mepkipu.kpmgcloudops.com.pfx"
meprest-kiphostname                          = "meprest-kipu.kpmgcloudops.com"
meprest-kipauthcertcer                       = "meprestkipu.kpmgcloudops.com.cer"
meprest-kipcertname                          = "meprest-kipu_kpmgcloudops_com"
meprest-kipsslcertpfx                        = "meprestkipu.kpmgcloudops.com.pfx"

partition_count                              = 2
replica_count                                = 2

kme_appsubnet                                = "/subscriptions/b75fc3c3-04a4-45a6-b126-8279f505e873/resourceGroups/RGP-USE-SHARED-DA-UT/providers/Microsoft.Network/virtualNetworks/vnet-use-shared-daut/subnets/sub-usc-ase-ut"
kme_mgmtsubnet                               = "/subscriptions/b75fc3c3-04a4-45a6-b126-8279f505e873/resourceGroups/RGP-USE-SHARED-DA-UT/providers/Microsoft.Network/virtualNetworks/vnet-use-shared-daut/subnets/sub-usc-mgmt-ut"
spi_appsubnet                                = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-spi-vnet/subnets/co-p-eastus-spiapp1-subnet"
kme_buildsubnet                              = "/subscriptions/b75fc3c3-04a4-45a6-b126-8279f505e873/resourceGroups/RGP-USE-SHARED-DA-UT/providers/Microsoft.Network/virtualNetworks/vnet-use-shared-daut/subnets/sub-usc-build-ut"
wvd_subnet_id                                = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"

adx_min_instance_count                       = 2
adx_max_instance_count                       = 10
adx_database_name                            = "kipadxdatabase"
adx_database_cache_period                    = "P31D"
adx_database_retention_period                = "P1095D"
kip_adf_contributers                         = "KIP_ADF_Contributers_UAT"
adx_database_principal_name                  = "kip-adx-database-principal"
ip_rules                                     = "199.207.253.101"


#app_gateway_switch = {
#    port = 443
#    request_timeout = 30
#}
private_dns_zone_subscription               = "4c9dc048-01dc-4854-9063-8a3d4060993a"
private_dns_zone_blob                       = "privatelink.blob.core.windows.net"
private_dns_zone_resource_group             = "RGP-USE-CORE-PRIVATE-DNSZONE-PD"
private_dns_zone_servicebus                 = "privatelink.servicebus.windows.net"
private_dns_zone_queue                      = "privatelink.queue.core.windows.net"
private_dns_zone_purview                    = "privatelink.purview.azure.com"
private_dns_zone_purviewstudio              = "privatelink.purviewstudio.azure.com"

#Private DNS
pvt_dns_subscription_id     = "4c9dc048-01dc-4854-9063-8a3d4060993a"
pvt_dns_environment_acronym = "pd"

#Arcgis Dev Pep_subent for Datalake Storage
gis_vnet_name    = "vnt-use-arcgis-uat"
gis_vnet_rg_name = "RGP-USE-ARCGIS-UAT"
pep_subnet_name  = "sub-use-arcgis-pep-uat"