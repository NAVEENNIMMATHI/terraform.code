subscription_id                         = "9e27f52c-3c97-4fda-9c8f-eadcd0ad195a"
client_id                               = "b2967f11-d801-4812-b532-3f3a676e8b46"
tenant_id                               = "b5031e57-d76f-422e-87c6-02b4cc749974"
client_secret                           = ""

#environment specific variables
location                                = "eastus"
location_acronym						= "use"
environment                             = "production"
environment_acronym						= "pd"
application								= "kpmg_interview_insights"
application_acronym                     = "kip"
app_url_acronym                         = ""
tags= {
    Platform                = "Azure Commercial Cloud"
    Environment             = "Production"
    Node                    = "Spoke"
    Solution                = "KPMG Intelligence Platform (KIP)"
    TechnicalOwner          = "Prajal Doshi"
    TechnicalContact        = "prajaldoshi@kpmg.com"
    BusinessOwner           = "Tom Biagi"
    BusinessContact         = "tbiagi@kpmg.com"
    LOB                     = "Deal Advisory & Strategy"
    Datadog                 = "Monitored"
}

#service principal
encryptapp_service_principal_name       = "DiskEncryptApp"
backupmanagement_service_principal_name = "Backup Management Service"

#virtual network and subnet
agw1_subnet_adress_space                = "10.22.0.96/27"
app1_subnet_adress_space                = "10.22.0.64/27"
wst1_subnet_adress_space                = "10.22.0.192/27"
ase1_subnet_adress_space                = "10.22.0.0/26"
pbi1_subnet_adress_space                = "10.22.0.224/27"
db1_subnet_adress_space                 = "10.22.0.128/26"
adx1_subnet_adress_space                = "10.26.4.0/28"
databricks_subnet_private_address_space = "10.26.7.0/26"
databricks_subnet_public_address_space  = "10.26.7.64/26"
private_endpoint_subnet_address_space   = "10.26.5.128/26"
adf_int_runtime_subnet_address_space    = "10.26.5.208/28"
syn_int_runtime_subnet_address_space    = "10.26.6.192/28"
pvw_int_runtime_subnet_address_space    = "10.26.6.208/28"
kpimcapiq_subnet_address_space          = "10.26.6.224/27"

address_space                           = ["10.22.0.0/24","10.26.4.0/22"]
address_space_string_format             = "10.22.0.0/24"
synapseStartRange                       = "10.22.0.192"
synapseEndRange                         = "10.22.0.223"

dns_server                              = ["10.30.15.196","10.30.15.197"]
coreinfrasubnetid                       = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/co-p-eastus-infra1-subnet"
spidb1subnetid                          = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-spi-vnet/subnets/co-p-eastus-spidb1-subnet"
###Allow SPI databricks public controlplane subnet in  Prod to access  KIP data lake in Prod
spidatabrickssubnetid                   = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-spi-vnet/subnets/co-p-eastus-spi-databricks-controlplane-subnet"
core_aks_subnet_id                      = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/sub-use-core-aks-pd"
squid_proxy_vm_subnet_id                = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/squid-proxy-vm-subnet"
rstudio_subnet_id                       = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-spi-vnet/subnets/co-p-eastus-spirstudio-subnet"

#Virtual Network peering
coresubscriptionid                      = "4c9dc048-01dc-4854-9063-8a3d4060993a"
corevnetresourcegroup                   = "CO-P-eastus-hubvnet-rg"

corevnetname                            = "CO-P-eastus-hub-vnet"
vmimagesubscriptionid                   = "9e27f52c-3c97-4fda-9c8f-eadcd0ad195a"

#App Service Environment
ase_name                                = "ase-use-kip-pd"
dns_suffix                              = "kpmgcloudops.com"

is_hns_enabled                          = "true"
account_tier                            = "Standard"
account_tier2                           = "Premium"
account_kind                            = "FileStorage"
replication_type2                       = "ZRS"
replication_type                        = "RAGRS"


# Vm count value
count_value_wst1vm                      = "4"
vm_size_wst1vm                          = "Standard_D16s_v3"
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

count_value_kpimcapiqvm                 = "1"
vm_size_kpimcapiqvm                     = "Standard_D4s_v3"
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
asp_size                                = "I2"
asp_capacity                            = "1"

#sql server and elastic pool
kip_sql_dwh_performance_level                = "DW500c"
thirdpartydata_sql_dwh_performance_level     = "DW100c"
kip_synapse_dwh_performance_level            = "DW100c"
thirdpartydata_synapse_dwh_performance_level = "DW500c"
kpmgproprietarydata_synapse_dwh_performance_level = "DW500c"

sqlserveradmin_password                 = ""
PaloInboundIPAddress                    = "10.30.16.100"
azfirewall_ip_address                   = "10.30.3.4"
ase_internal_ip                         = "10.22.0.11"

#Network Security Rule
PaloAlto1                               = "20.185.106.126/32"
PaloAlto2                               = "20.185.110.197/32"
KPMG_On-Premise                         = "199.207.253.0/24"
KPMG_VPN                                = ["199.206.0.5/32"]
KGS_Bangalore                           = ["103.133.112.80/28","103.58.118.80/28"]
KGS_Gurgaon                             = "103.216.201.96/28"
ASE_PIP                                 = ["104.211.19.220/32","52.152.148.131/32"]
AZFW_PIP                                = ["52.224.25.180","52.224.25.158","52.224.25.140","20.42.39.126","52.224.25.167"]
Shared_DA_ASE_PIP                       = ["52.152.148.131"]
AGW_PIP                                 = ["13.82.135.38/32","40.76.47.93/32","52.151.228.112/32"]
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

windows_services_vm_name		                = "20dca328-3674-4437-8c48-487b59f34fd4"

# Custom RBAC Variables
RBAC_CustomWebsiteContributor_Name		        = "Custom Website Contributor Production"
RBAC_CustomSQLManagedInstanceContributor_Name   = "Custom SQL Managed Instance Contributor Production"
RBAC_CustomStorageAccountContributor_Name	    = "Custom Storage Account Contributor Production"
RBAC_CustomKeyVaultRead_Name		            = "Custom Key Vault Read Production"
RBAC_CustomSQLDBContributor_Name                = "Custom SQL DB Contributor Production"
RBAC_CustomDataFactoryDeployer_Name             = "Custom DataFactory Deployer Production"

#Application Gateway
kiphostname                                     = "kip.kpmgcloudops.com"
kipauthcertcer                                  = "kip.kpmgcloudops.com.cer"
kipcertname                                     = "kip_kpmgcloudops_com"
kipsslcertpfx                                   = "kip.kpmgcloudops.com.pfx"
kipresthostname                                 = "kiprest.kpmgcloudops.com"
kiprestauthcertcer                              = "kiprest.kpmgcloudops.com.cer"
kiprestcertname                                 = "kiprest_kpmgcloudops_com"
kiprestsslce                                    = "kiprest.kpmgcloudops.com.pfx"
mep-kiphostname                                 = "mep-kip.kpmgcloudops.com"
mep-kipauthcertcer                              = "mepkip.kpmgcloudops.com.cer"
mep-kipcertname                                 = "mep-kip_kpmgcloudops_com"
mep-kipsslcertpfx                               = "mepkip.kpmgcloudops.com.pfx"
meprest-kiphostname                             = "meprest-kip.kpmgcloudops.com"
meprest-kipauthcertcer                          = "meprestkip.kpmgcloudops.com.cer"
meprest-kipcertname                             = "meprest-kip_kpmgcloudops_com"
meprest-kipsslcertpfx                           = "meprestkip.kpmgcloudops.com.pfx"
kiprestsslcertpfx                               = "kiprest.kpmgcloudops.com.pfx"

#Cognitive Service
partition_count                                 = 2
replica_count                                   = 2

adx_min_instance_count                          = 2
adx_max_instance_count                          = 10
adx_database_name                               = "kipadxdatabase"
adx_database_cache_period                       = "P31D"
adx_database_retention_period                   = "P1095D"
kip_adf_contributers                            = "KIP_ADF_Contributers"
adx_database_principal_name                     = "kip-adx-database-principal"
ip_rules                                        = "199.207.253.101"
ip_rules_datavault                              = "199.207.253.101"
ip_rules_raw                                    = "199.206.0.5"

kme_appsubnet                                   = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/RGP-USE-SHARED-DA-PD/providers/Microsoft.Network/virtualNetworks/vnet-use-shared-dapd/subnets/sub-usc-ase-pd"
kme_mgmtsubnet                                  = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/RGP-USE-SHARED-DA-PD/providers/Microsoft.Network/virtualNetworks/vnet-use-shared-dapd/subnets/sub-usc-mgmt-pd"
spi_appsubnet                                   = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-spi-vnet/subnets/co-p-eastus-spiapp1-subnet"
kme_buildsubnet                                 = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/RGP-USE-SHARED-DA-PD/providers/Microsoft.Network/virtualNetworks/vnet-use-shared-dapd/subnets/sub-usc-build-pd"
wvd_subnet_id                               = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"
app_gateway_switch = {
    port = 443
    request_timeout = 30
}
private_dns_zone_subscription               = "4c9dc048-01dc-4854-9063-8a3d4060993a"
private_dns_zone_blob                       = "privatelink.blob.core.windows.net"
private_dns_zone_resource_group             = "RGP-USE-CORE-PRIVATE-DNSZONE-PD"
private_dns_zone_servicebus                 = "privatelink.servicebus.windows.net"
private_dns_zone_queue                      = "privatelink.queue.core.windows.net"
private_dns_zone_purview                    = "privatelink.purview.azure.com"
private_dns_zone_purviewstudio              = "privatelink.purviewstudio.azure.com"

private_link_accesses                     = ["/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/co-pd-eastus-kip-rg/providers/Microsoft.DataFactory/factories/dtf-use-kip-selfhosted-pd",
                                             "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/co-pd-eastus-kip-rg/providers/Microsoft.Synapse/workspaces/sawusekippd",
                                             "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/co-pd-eastus-kip-rg/providers/Microsoft.Sql/servers/srv-use-kip-pd"]    

#Private DNS
pvt_dns_subscription_id     = "4c9dc048-01dc-4854-9063-8a3d4060993a"
pvt_dns_environment_acronym = "pd"

#Arcgis Dev Pep_subent for Datalake Storage
gis_vnet_name    = "vnt-use-arcgis-pd"
gis_vnet_rg_name = "RGP-USE-ARCGIS-PD"
pep_subnet_name  = "sub-use-arcgis-pep-pd"