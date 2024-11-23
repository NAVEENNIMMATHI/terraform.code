client_id           						= "e0628e55-2ee3-4131-8fdd-330265aed576"
subscription_id                             = "3507153c-e6a4-4e2f-ae04-f34c1fd4482f"
tenant_id                                   = "188697ab-840f-44ec-8535-aaaa5680bab0"
client_secret                               = ""

#environment specific variables
location                                    = "eastus"
location_acronym						    = "use"
environment                                 = "development"
environment_acronym						    = "dv"
application								    = "kpmg_interview_insights"
application_acronym                         = "kip"
app_url_acronym                             = "d"
tags =  {
    Platform                = "Azure Commercial Cloud"
    Environment             = "Development"
    Node                    = "Spoke"
    Solution                = "KPMG Intelligence Platform (KIP)"
    TechnicalOwner          = "Prajal Doshi"
    TechnicalContact        = "prajaldoshi@kpmg.com"
    BusinessOwner           = "Tom Biagi"
    BusinessContact         = "tbiagi@kpmg.com"
    LOB                     = "Deal Advisory & Strategy"
}

#service principal
encryptapp_service_principal_name           = "EncryptApp"
backupmanagement_service_principal_name     = "Backup Management Service"

agw1_subnet_adress_space                    = "10.51.8.0/26"
app1_subnet_adress_space                    = "10.51.8.64/27"
wst1_subnet_adress_space                    = "10.51.8.96/27"
ase1_subnet_adress_space                    = "10.51.8.128/27"
pbi1_subnet_adress_space                    = "10.51.8.160/27"
db1_subnet_adress_space                     = "10.51.8.192/27"
adx1_subnet_adress_space                    = "10.51.8.224/27"
databricks_subnet_private_address_space     = "10.51.10.0/26"
databricks_subnet_public_address_space      = "10.51.10.64/26"
private_endpoint_subnet_address_space       = "10.51.10.128/26"
adf_int_runtime_subnet_address_space        = "10.51.10.192/27"
syn_int_runtime_subnet_address_space        = "10.51.9.192/27"
pvw_int_runtime_subnet_address_space        = "10.51.9.224/27"
kpimcapiq_subnet_address_space              = "10.51.10.224/27"

address_space                               = ["10.51.8.0/24","10.51.9.0/24","10.51.10.0/23","10.51.12.0/22"]
address_space_string_format                 = "10.51.8.0/24"
synapseStartRange                           = "10.51.8.96"
synapseEndRange                             = "10.51.8.127"
dns_server                                  = ["10.1.11.4","10.1.11.5"]

coreinfrasubnetid                           = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/co-dv-eastus-infra1-subnet"
spidb1subnetid                              = "/subscriptions/3507153c-e6a4-4e2f-ae04-f34c1fd4482f/resourceGroups/RGP-USE-SPI-VNET-DV/providers/Microsoft.Network/virtualNetworks/vnt-use-spi-dv/subnets/sub-use-spi-db-dv"
###Allow SPI databricks public controlplane subnet in Non Prod to access  KIP data lake in Dev
spidatabrickssubnetid                       = "/subscriptions/0feb4855-aaa2-40f1-bec2-a8db1dfe472e/resourceGroups/CO-NP-eastus-CO-SPIVnet-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-co-spi-vnet/subnets/co-np-databricks-controlplane-sub"
core_aks_subnet_id                          = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/sub-use-core-aks-dv"
squid_proxy_vm_subnet_id                    = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/squid-proxy-vm-subnet"
rstudio_subnet_id                           = "/subscriptions/3507153c-e6a4-4e2f-ae04-f34c1fd4482f/resourceGroups/RGP-USE-SPI-VNET-DV/providers/Microsoft.Network/virtualNetworks/vnt-use-spi-dv/subnets/sub-use-spi-rstu-dv"

#Virtual Network peering
coresubscriptionid                          = "c72acede-d539-45d9-963d-3464ec4ddae0"
corevnetresourcegroup                       = "CO-dv-eastus-hubvnet-rg"
corevnetname                                = "CO-dv-eastus-hub-vnet"

vmimagesubscriptionid                       = "0feb4855-aaa2-40f1-bec2-a8db1dfe472e"

#App Service Environment
ase_name                                    = "ase-use-kip-dv"
dns_suffix                                  = "kpmgcloudops.com"

is_hns_enabled                              = "true"
account_tier                                = "Standard"
account_tier2                               = "Premium"
account_kind                                = "FileStorage"
replication_type                            = "RAGRS"
replication_type2                           = "ZRS"

# Vm count value
count_value_wst1vm                          = "7"
vm_size_wst1vm                              = "Standard_D16s_v3"
data_disk_size_wst1vm                       = "512"

count_value_app1vm                          = "2"
vm_size_app1vm                              = "Standard_D8s_v3"
managed_disk_type                           = "Premium_LRS"
data_disk_size_app1vm                       = "512"

count_value_app2vm                          = "1"
vm_size_app2vm                              = "Standard_D2s_v3"
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

count_value_kpimcapiqvm                     = "1"
vm_size_kpimcapiqvm                         = "Standard_D2s_v3"
data_disk_size_kpimcapiqvm                  = "512"

count_value_analytics                       = "1"
vm_size_analytics                           = "Standard_DS2_v2"

vm_admin_password                           = ""

application_gw_sku_name                     = "WAF_Large"
application_gw_sku_tier                     = "WAF"
application_gw_sku_capacity                 = "2"

kiphostname                                 = "kipd.kpmgcloudops.com"
kipauthcertcer                              = "kipd.kpmgcloudops.com.cer"
kipcertname                                 = "kipd_kpmgcloudops_com"
kipsslcertpfx                               = "kipd.kpmgcloudops.com.pfx"
kipresthostname                             = "kiprestd.kpmgcloudops.com"
kiprestauthcertcer                          = "kiprestd.kpmgcloudops.com.cer"
kiprestcertname                             = "kiprestd_kpmgcloudops_com"
kiprestsslcertpfx                           = "kiprestd.kpmgcloudops.com.pfx"
mep-kiphostname                             = "mep-kipd.kpmgcloudops.com"
mep-kipauthcertcer                          = "mepkipd.kpmgcloudops.com.cer"
mep-kipcertname                             = "mep-kipd_kpmgcloudops_com"
mep-kipsslcertpfx                           = "mepkipd.kpmgcloudops.com.pfx"
meprest-kiphostname                         = "meprest-kipd.kpmgcloudops.com"
meprest-kipauthcertcer                      = "meprestkipd.kpmgcloudops.com.cer"
meprest-kipcertname                         = "meprest-kipd_kpmgcloudops_com"
meprest-kipsslcertpfx                       = "meprestkipd.kpmgcloudops.com.pfx"

/***Self Signed Certificate*****/
selfsigncertname                            = "star_kpmgcloudops_com"
selfsignauthcertcer                         = "star.kpmgcloudops.com.cer"

# app service plan
asp_tier                                   = "Isolated"
asp_size                                   = "I1"
asp_capacity                               = "1"

kip_sql_dwh_performance_level                = "DW1000c"
thirdpartydata_sql_dwh_performance_level     = "DW500c"
kip_synapse_dwh_performance_level            = "DW100c"
thirdpartydata_synapse_dwh_performance_level = "DW100c"
kpmgproprietarydata_synapse_dwh_performance_level = "DW500c"

sqlserveradmin_password                    = ""
PaloInboundIPAddress                       = "10.1.16.100"
azfirewall_ip_address                      = "10.6.24.4"
ase_internal_ip                            = "10.51.8.139"

#Network Security Rule
PaloAlto1                                  = "20.185.109.156/32"
PaloAlto2                                  = "20.185.106.213/32"
KPMG_On-Premise                            = "199.207.253.0/24"
KPMG_VPN                                   = ["199.206.0.5/32"]
KGS_Bangalore                              = ["103.133.112.80/28","103.58.118.80/28"]
KGS_Gurgaon                                = "103.216.201.96/28"
ASE_PIP                                    = ["137.116.114.62/32","52.224.104.245/32"]
AZFW_PIP                                   = ["52.190.37.51","52.190.37.75","52.146.53.140","52.146.53.139","52.146.53.16"]
Shared_DA_ASE_PIP                          = ["52.224.104.245"]
AGW_PIP                                    = ["52.186.154.179/32","20.62.220.151/32","23.96.62.160/32"]
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

windows_services_vm_name		           = "b19324ca-a2c2-49ac-91f3-af3956172d29"#"VMUSEKIPAPP1DV"

# Custom RBAC Variables
RBAC_CustomWebsiteContributor_Name		      = "KIP_Dv Website Contributor"
RBAC_CustomSQLManagedInstanceContributor_Name = "KIP_Dv SQL Managed Instance Contributor"
RBAC_CustomStorageAccountContributor_Name	  = "KIP_Dv Storage Account Contributor"
RBAC_CustomKeyVaultRead_Name		          = "KIP_Dv Key Vault Read"
RBAC_CustomSQLDBContributor_Name              = "KIP_Dv SQL DB Contributor"
RBAC_CustomDataFactoryDeployer_Name           = "KIP_Dv DataFactory Deployer"

enforce_private_link_endpoint_network_policies = true

partition_count                             = 1
replica_count                               = 1

adx_min_instance_count                      = 2
adx_max_instance_count                      = 10
adx_database_name                           = "kipadxdatabase"
adx_database_cache_period                   = "P31D"
adx_database_retention_period               = "P1095D"
kip_adf_contributers                        = "KIP_ADF_Contributers_Dev"
adx_database_principal_name                 = "kip-adx-database-principal"
ip_rules                                    = "199.207.253.101"
ip_rules_datavault                          = "199.207.253.101"
ip_rules_raw                                = "199.206.0.5"

kme_appsubnet                               = "/subscriptions/3507153c-e6a4-4e2f-ae04-f34c1fd4482f/resourceGroups/RGP-USE-SHARED-DA-DEV/providers/Microsoft.Network/virtualNetworks/vnet-use-shared-dadev/subnets/sub-usc-ase-dev"
kme_mgmtsubnet                              = "/subscriptions/3507153c-e6a4-4e2f-ae04-f34c1fd4482f/resourceGroups/RGP-USE-SHARED-DA-DEV/providers/Microsoft.Network/virtualNetworks/vnet-use-shared-dadev/subnets/sub-usc-mgmt-dev"
spi_appsubnet                               = "/subscriptions/3507153c-e6a4-4e2f-ae04-f34c1fd4482f/resourceGroups/RGP-USE-SPI-VNET-DV/providers/Microsoft.Network/virtualNetworks/vnt-use-spi-dv/subnets/sub-use-spi-app-dv"
kme_buildsubnet                             = "/subscriptions/3507153c-e6a4-4e2f-ae04-f34c1fd4482f/resourceGroups/RGP-USE-SHARED-DA-DEV/providers/Microsoft.Network/virtualNetworks/vnet-use-shared-dadev/subnets/sub-usc-build-dev"
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

private_link_accesses                     = ["/subscriptions/3507153c-e6a4-4e2f-ae04-f34c1fd4482f/resourcegroups/RGP-USE-KIP-DV/providers/Microsoft.DataFactory/factories/dtf-use-kip-selfhosted-dv",
                                             "/subscriptions/3507153c-e6a4-4e2f-ae04-f34c1fd4482f/resourcegroups/RGP-USE-KIP-DV/providers/Microsoft.Synapse/workspaces/sawusekipdvv2",
                                             "/subscriptions/3507153c-e6a4-4e2f-ae04-f34c1fd4482f/resourcegroups/RGP-USE-KIP-DV/providers/Microsoft.Sql/servers/srv-use-kip-dv"]    

#Private DNS
pvt_dns_subscription_id     = "c72acede-d539-45d9-963d-3464ec4ddae0"
pvt_dns_environment_acronym = "dv"

#Arcgis Dev Pep_subent for Datalake Storage
gis_vnet_name    = "vnt-use-arcgis-dv"
gis_vnet_rg_name = "RGP-USE-ARCGIS-DV"
pep_subnet_name  = "sub-use-arcgis-pep-dv"