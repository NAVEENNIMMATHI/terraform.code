client_id           					   = "76ea9629-a4e1-4a9a-ba2f-39840e53342a"
subscription_id     					   = "adf88b05-d3d7-4dee-ba30-ea939f9a1b1c"
tenant_id           					   = "188697ab-840f-44ec-8535-aaaa5680bab0"
client_secret                              = ""

#environment specific variables
location                                   = "eastus"
location_acronym						   = "use"
environment                                = "qa"
environment_acronym						   = "qa"
application								   = "kpmg_interview_insights"
application_acronym                        = "kip"
app_url_acronym                            = "q"
tags =  {
    Platform                = "Azure Commercial Cloud"
    Environment             = "QA"
    Node                    = "Spoke"
    Solution                = "KPMG Intelligence Platform (KIP)"
    TechnicalOwner          = "Prajal Doshi"
    TechnicalContact        = "prajaldoshi@kpmg.com"
    BusinessOwner           = "Tom Biagi"
    BusinessContact         = "tbiagi@kpmg.com"
    LOB                     = "Deal Advisory & Strategy"
}

encryptapp_service_principal_name           = "EncryptApp"
backupmanagement_service_principal_name     = "Backup Management Service"

agw1_subnet_adress_space                    = "10.71.8.0/26"
app1_subnet_adress_space                    = "10.71.8.64/27"
wst1_subnet_adress_space                    = "10.71.8.96/27"
ase1_subnet_adress_space                    = "10.71.8.128/27"
pbi1_subnet_adress_space                    = "10.71.8.160/27"
db1_subnet_adress_space                     = "10.71.8.192/27"
adx1_subnet_adress_space                    = "10.71.8.224/27"
databricks_subnet_private_address_space     = "10.71.9.0/26"
databricks_subnet_public_address_space      = "10.71.9.64/26"
private_endpoint_subnet_address_space       = "10.71.9.128/26"
adf_int_runtime_subnet_address_space        = "10.71.9.192/28"
syn_int_runtime_subnet_address_space        = "10.71.10.192/28"
pvw_int_runtime_subnet_address_space        = "10.71.10.224/28"
kpimcapiq_subnet_address_space              = "10.71.9.224/27"

address_space                               = ["10.71.8.0/21"]
address_space_string_format                 = "10.71.8.0/21"
synapseStartRange                           = "10.71.8.96"
synapseEndRange                             = "10.71.8.127"
dns_server                                  = ["10.1.11.4","10.1.11.5"]

coreinfrasubnetid                           = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-infra1-qa"
spidb1subnetid                              = "/subscriptions/adf88b05-d3d7-4dee-ba30-ea939f9a1b1c/resourceGroups/RGP-USE-SPI-VNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-spi-qa/subnets/sub-use-spi-db-qa"
###Allow SPI databricks public controlplane subnet in Non Prod to access  KIP data lake in QA
spidatabrickssubnetid                       = "/subscriptions/0feb4855-aaa2-40f1-bec2-a8db1dfe472e/resourceGroups/CO-NP-eastus-CO-SPIVnet-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-co-spi-vnet/subnets/co-np-databricks-controlplane-sub"
core_aks_subnet_id                          = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-core-aks-qa"
squid_proxy_vm_subnet_id                    = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-squidproxyvm-qa"
rstudio_subnet_id                           = "/subscriptions/adf88b05-d3d7-4dee-ba30-ea939f9a1b1c/resourceGroups/RGP-USE-SPI-VNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-spi-qa/subnets/sub-use-spi-rstu-qa"

#Virtual Network peering
coresubscriptionid                          = "5ce45d57-3192-4bfe-9c2f-cb567b30c586"
corevnetresourcegroup                       = "RGP-USE-COREVNET-QA"
corevnetname                                = "vnt-use-core-qa"
vmimagesubscriptionid                       = "0feb4855-aaa2-40f1-bec2-a8db1dfe472e"

#App Service Environment
ase_name                                    = "ase-eus-kip-qa"
dns_suffix                                  = "kpmgcloudops.com"

is_hns_enabled                              = "true"
account_tier                                = "Standard"
account_tier2                               = "Premium"
account_kind                                = "FileStorage"
replication_type2                           = "ZRS"
replication_type                            = "RAGRS"

# Vm count value
count_value_wst1vm                          = "1"
vm_size_wst1vm                              = "Standard_D8s_v3"
data_disk_size_wst1vm                       = "512"

count_value_app1vm                          = "1"
vm_size_app1vm                              = "Standard_D8s_v3"
managed_disk_type                           = "Premium_LRS"
data_disk_size_app1vm                       = "512"

count_value_app2vm                          = "1"
vm_size_app2vm                              = "Standard_D8s_v3"
data_disk_size_app2vm                       = "512"

count_value_pbi1vm                          = "2"
vm_size_pbi1vm                              = "Standard_D2s_v3"
data_disk_size_pbi1vm                       = "512"

count_value_adf1vm                          = "1"
vm_size_adf1vm                              = "Standard_D2s_v3"
data_disk_size_adf1vm                       = "512"

count_value_syn1vm                          = "1"
vm_size_syn1vm                              = "Standard_D2s_v3"
data_disk_size_syn1vm                       = "512"

count_value_pvw1vm                          = "1"
vm_size_pvw1vm                              = "Standard_D2s_v3"
data_disk_size_pvw1vm                       = "512"

count_value_kpimcapiqvm                     = "0"
vm_size_kpimcapiqvm                         = "Standard_D2s_v3"
data_disk_size_kpimcapiqvm                  = "512"

count_value_analytics                       = "0"
vm_size_analytics                           = "Standard_DS2_v2"

vm_admin_password                           = ""

application_gw_sku_name                     = "WAF_Large"
application_gw_sku_tier                     = "WAF"
application_gw_sku_capacity                 = "2"

kiphostname                               = "kipq.kpmgcloudops.com"
kipauthcertcer                            = "kipq.kpmgcloudops.com.cer"
kipcertname                               = "kipq_kpmgcloudops_com"
kipsslcertpfx                             = "kipq.kpmgcloudops.com.pfx"

kipresthostname                           = "kiprestq.kpmgcloudops.com"
kiprestauthcertcer                        = "kiprestq.kpmgcloudops.com.cer"
kiprestcertname                           = "kiprestq_kpmgcloudops_com"
kiprestsslcertpfx                         = "kiprestq.kpmgcloudops.com.pfx"

mep-kiphostname                           = "mep-kipq.kpmgcloudops.com"
mep-kipauthcertcer                        = "mepkipq.kpmgcloudops.com.cer"
mep-kipcertname                           = "mep-kipq_kpmgcloudops_com"
mep-kipsslcertpfx                         = "mepkipq.kpmgcloudops.com.pfx"

meprest-kiphostname                       = "meprest-kipq.kpmgcloudops.com"
meprest-kipauthcertcer                    = "meprestkipq.kpmgcloudops.com.cer"
meprest-kipcertname                       = "meprest-kipq_kpmgcloudops_com"
meprest-kipsslcertpfx                     = "meprestkipq.kpmgcloudops.com.pfx"
meprest-kipcertpfxpwd                     = ""

/***Self Signed Certificate*****/
selfsigncertname                            = "star_kpmgcloudops_com"
selfsignauthcertcer                         = "star.kpmgcloudops.com.cer"

# app service plan
asp_tier                                   = "Isolated"
asp_size                                   = "I1"
asp_capacity                               = "1"

kip_sql_dwh_performance_level                = "DW100c"
thirdpartydata_sql_dwh_performance_level     = "DW100c"
kip_synapse_dwh_performance_level            = "DW100c"
thirdpartydata_synapse_dwh_performance_level = "DW100c"
kpmgproprietarydata_synapse_dwh_performance_level = "DW500c"

sqlserveradmin_password                    = ""
PaloInboundIPAddress                       = "10.1.16.100"
azfirewall_ip_address                      = "10.101.2.196"
ase_internal_ip                            = "10.71.8.139"
#Network Security Rule
PaloAlto1                                  = "20.185.109.156/32"
PaloAlto2                                  = "20.185.106.213/32"
KPMG_On-Premise                            = "199.207.253.0/24"
KPMG_VPN                                   = ["199.206.0.5/32"]
KGS_Bangalore                              = ["103.133.112.80/28","103.58.118.80/28"]
KGS_Gurgaon                                = "103.216.201.96/28"
ASE_PIP                                    = ["13.82.1.202/32","52.147.199.75/32"]
AZFW_PIP                                   = ["40.76.169.86","40.76.168.231","40.76.169.36","40.76.169.44","40.76.169.103"]
Shared_DA_ASE_PIP                          = ["13.82.1.202"]
AGW_PIP                                    = ["40.112.52.115/32"]
ADX_Mgmt_IP                                = "52.224.146.56"
adx_healthmonitor_ip                       = ["137.116.81.189","52.249.253.174"]

# Managed Instance
managedInstanceadministratorLogin          = "kipmiadmin"
managedInstanceadministratorLoginPassword  = ""
managedInstanceskuName         			   = "GP_Gen5"
managedInstancevCores         			   = "8"
managedInstancestorageSizeInGB         	   = "8192"
managedInstancelicenseType         		   = "LicenseIncluded"

# Storage Account Container
webappbackup_container_name                = "webappbackup"

windows_services_vm_name		           = "d4dec99e-8ca5-49ab-9e14-2273cd6b82d9"#"VMUSEKIPAPP1DV"

# Custom RBAC Variables
RBAC_CustomWebsiteContributor_Name		      = "KIP_QA Website Contributor"
RBAC_CustomSQLManagedInstanceContributor_Name = "KIP_QA SQL Managed Instance Contributor"
RBAC_CustomStorageAccountContributor_Name	  = "KIP_QA Storage Account Contributor"
RBAC_CustomKeyVaultRead_Name		          = "KIP_QA Key Vault Read"
RBAC_CustomSQLDBContributor_Name              = "KIP_QA SQL DB Contributor"
RBAC_CustomDataFactoryDeployer_Name           = "KIP_QA DataFactory Deployer"

enforce_private_link_endpoint_network_policies = true

partition_count                             = 1
replica_count                               = 1

adx_min_instance_count                      = 2
adx_max_instance_count                      = 10
adx_database_name                           = "kipadxdatabase"
adx_database_cache_period                   = "P31D"
adx_database_retention_period               = "P1095D"
kip_adf_contributers                        = "KIP_ADF_Contributers_QA"
adx_database_principal_name                 = "kip-adx-database-principal"
ip_rules                                    = "52.190.36.205"
ip_rules_datavault                          = "199.207.253.101"
ip_rules_raw                                = "199.206.0.5"

kme_appsubnet                               = "/subscriptions/adf88b05-d3d7-4dee-ba30-ea939f9a1b1c/resourceGroups/RGP-USE-SHARED-DA-QA/providers/Microsoft.Network/virtualNetworks/vnet-use-shared-daqa/subnets/sub-usc-ase-qa"
kme_mgmtsubnet                              = "/subscriptions/adf88b05-d3d7-4dee-ba30-ea939f9a1b1c/resourceGroups/RGP-USE-SHARED-DA-QA/providers/Microsoft.Network/virtualNetworks/vnet-use-shared-daqa/subnets/sub-usc-mgmt-qa"
spi_appsubnet                               = "/subscriptions/adf88b05-d3d7-4dee-ba30-ea939f9a1b1c/resourceGroups/RGP-USE-SPI-VNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-spi-qa/subnets/sub-use-spi-app-qa"
kme_buildsubnet                             = "/subscriptions/adf88b05-d3d7-4dee-ba30-ea939f9a1b1c/resourceGroups/RGP-USE-SHARED-DA-QA/providers/Microsoft.Network/virtualNetworks/vnet-use-shared-daqa/subnets/sub-usc-build-qa"
wvd_subnet_id                               = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"
#app_gateway_switch = {
#    port = 443
#    request_timeout = 30
#}
private_dns_zone_subscription               = "c72acede-d539-45d9-963d-3464ec4ddae0"
private_dns_zone_blob                       = "privatelink.blob.core.windows.net"
private_dns_zone_resource_group             = "rgp-use-core-private-dnszone-dv"
private_dns_zone_servicebus                 = "privatelink.servicebus.windows.net"
private_dns_zone_queue                      = "privatelink.queue.core.windows.net"
private_dns_zone_purview                    = "privatelink.purview.azure.com"
private_dns_zone_purviewstudio              = "privatelink.purviewstudio.azure.com"

private_link_accesses                     = ["/subscriptions/adf88b05-d3d7-4dee-ba30-ea939f9a1b1c/resourceGroups/RGP-USE-KIP-QA/providers/Microsoft.DataFactory/factories/dtf-use-kip-selfhosted-qa",
                                             "/subscriptions/adf88b05-d3d7-4dee-ba30-ea939f9a1b1c/resourceGroups/RGP-USE-KIP-QA/providers/Microsoft.Synapse/workspaces/sawusekipqav2",
                                             "/subscriptions/adf88b05-d3d7-4dee-ba30-ea939f9a1b1c/resourceGroups/RGP-USE-KIP-QA/providers/Microsoft.Sql/servers/srv-use-kip-qa"]    

#Private DNS
pvt_dns_subscription_id     = "c72acede-d539-45d9-963d-3464ec4ddae0"
pvt_dns_environment_acronym = "dv"

#Arcgis Dev Pep_subent for Datalake Storage
gis_vnet_name    = "vnt-use-arcgis-qa"
gis_vnet_rg_name = "RGP-USE-ARCGIS-QA"
pep_subnet_name  = "sub-use-arcgis-pep-qa"