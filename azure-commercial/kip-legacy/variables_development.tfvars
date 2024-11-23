subscription_id                             = "0feb4855-aaa2-40f1-bec2-a8db1dfe472e"
client_id                                   = "41da8a25-68fc-489c-b051-f97aeca67fd6"
tenant_id                                   = "188697ab-840f-44ec-8535-aaaa5680bab0"
client_secret                               = ""

#environment specific variables
target_deployment_environment               = "nonprod"
environment                                 = "np"
environment_dev                             = "dev"
environment_qa                              = "qa"
environment_uat                             = "uat"
application_environment_1                   = "NP1"
application_environment_2                   = "NP2"
eastus_acronym                              = "eus"

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

#AvailabilitySet
availability_set_name_workstation           = "co-np-eastus-kipworkstation-as"
availability_set_name_application           = "co-np-eastus-kipapplication-as"
availability_set_name_powerbigateway        = "co-np-eastus-kippowerbigateway-as"

#EventHub
event_hub_namespace_name                    = "co-np-eastus-kip1-eventhub"
application_acronym                         = "kip"
backuprecovery_rg_name                      = "co-np-eastus-kipbackuprecovery-rg"
loganalytics_rg_name                        = "co-np-eastus-kiploganalytics-rg"
application_rg_name                         = "co-np-eastus-kip-rg"
loganalytics_rg_location                    = "eastus"
backuprecovery_rg_location                  = "eastus"
application_rg_location                     = "eastus"

#service principal
encryptapp_service_principal_name           = "EncryptApp"
backupmanagement_service_principal_name     = "Backup Management Service"

#route table
spi_route_table_name                        = "co-np-eastus-spitoPaloAlto-udr"
spi_route_table_resource_group_name         = "CO-NP-eastus-CO-SPIVnet-rg"
ase_routetable_name                         = "co-np-eastus-kipase-udr"
mi_routetable_name                          = "co-np-eastus-kipmi-udr"

#virtual network and subnet
virtual_network_name                        = "co-np-eastus-kip-vnet"
agw1_subnet_name                            = "co-np-eastus-kipagw1-subnet"
agw1_subnet_adress_space                    = "10.12.0.96/27"
app1_subnet_name                            = "co-np-eastus-kipapp1-subnet"
app1_subnet_adress_space                    = "10.12.0.64/27"
wst1_subnet_name                            = "co-np-eastus-kipwst1-subnet"
wst1_subnet_adress_space                    = "10.12.0.192/27"
ase1_subnet_name                            = "co-np-eastus-kipase1-subnet"
ase1_subnet_adress_space                    = "10.12.0.0/26"
pbi1_subnet_name                            = "co-np-eastus-kippbi1-subnet"
pbi1_subnet_adress_space                    = "10.12.0.224/27"
db1_subnet_name                             = "co-np-eastus-kipdb1-subnet"
db1_subnet_adress_space                     = "10.12.0.128/26"
adx1_subnet_name                            = "co-np-eastus-kipadx1-subnet"
adx1_subnet_adress_space                    = "10.12.1.64/28"
address_space                               = ["10.12.0.0/24","10.12.1.0/24"]
address_space_string_format                 = "10.12.0.0/24"
dns_server                                  = ["10.1.11.4","10.1.11.5"]
coreinfrasubnetid                           = "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet/subnets/co-np-eastus-infra1-subnet"
spidb1subnetid                              = "/subscriptions/0feb4855-aaa2-40f1-bec2-a8db1dfe472e/resourceGroups/CO-NP-eastus-CO-SPIVnet-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-co-spi-vnet/subnets/co-np-eastus-spidb1-subnet"
applicationvnetddosprotectionplan           = "co-np-eastus-kip-vnet-ddos-protection-plan"
core_aks_subnet_id                          = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/sub-use-core-aks-dv"

#Network Security Group
nsg_name_agw1                               = "co-np-eastus-kipagw1-nsg"
nsg_name_app1                               = "co-np-eastus-kipapp1-nsg"
nsg_name_wst1                               = "co-np-eastus-kipwst1-nsg"
nsg_name_ase1                               = "co-np-eastus-kipase1-nsg"
nsg_name_pbi1                               = "co-np-eastus-kippbi1-nsg"
nsg_name_db1                                = "co-np-eastus-kipdb1-nsg"
nsg_name_adx1                               = "co-np-eastus-kipadx1-nsg"

#Recovery Service
recovery_service_name                       = "conpeusrecvault01kip"

#Virtual Network peering
coresubscriptionid                          = "4cdcf904-fa57-4815-8cb3-e33b9b44f479"
transitsubscriptionid                       = "25f8d797-bee2-4a88-84cc-de328abd6731"
corevnetresourcegroup                       = "co-np-eastus-core1-rg"
transitvnetresourcegroup                    = "CO-NP-eastus-CONPTVnet-rg"
corevnetname                                = "co-np-eastus-core1-vnet"
transitvnetname                             = "CO-NP-eastus-transit1-Vnet"
vmimagesubscriptionid                       = "0feb4855-aaa2-40f1-bec2-a8db1dfe472e"

#App Service Environment
ase_name                                    = "ase-eus-kip-np"
dns_suffix                                  = "kpmgcloudops.com"
app_service_plan_name                       = "asp-eus-kip-np"

#ApplicationInsights
app_insights_name_kipdev                    = "ais-use-kip-kipdev"
app_insights_name_kiprestdev                = "ais-use-kip-kiprestdev"
app_insights_name_kipqa                     = "ais-use-kip-kipqa"
app_insights_name_kiprestqa                 = "ais-use-kip-kiprestqa"
app_insights_name_mep-kipdev                = "ais-use-kip-mep-kipdev"
app_insights_name_meprest-kipdev            = "ais-use-kip-meprest-kipdev"
app_insights_name_mep-kipqa                 = "ais-use-kip-mep-kipqa"
app_insights_name_meprest-kipqa             = "ais-use-kip-meprest-kipqa"
app_insights_name_dasnp                     = "ais-use-kip-dasnp"
app_insights_name_dasrestnp                 = "ais-use-kip-dasrestnp"

#Storage Account
storage_account_name_recovery               = "conpeuskiprecover01sa"
storage_account_name_dialog                 = "conpeuskipdiaglog01sa"
storage_account_name_vmdialog               = "conpeuskipvmlog01sa"
storage_account_name_webapp_backup          = "conpeuskipwebappbkp01sa"
storage_account_name_app                    = "conpeuskipfctapp01sa"
storage_account_name_app_log                = "conpeuskipwebapplog01sa"
account_type                                = "Storage"
account_type_2                              = "StorageV2"
is_hns_enabled                              = "true"
account_tier                                = "Standard"
replication_type                            = "RAGRS"

# Vm count value
count_value_wst1vm                          = "1"
vm_size_wst1vm                              = "Standard_D8s_v3"
data_disk_size_wst1vm                       = "512"

count_value_app1vm                          = "2"
vm_size_app1vm                              = "Standard_D16s_v3"
data_disk_size_app1vm                       = "512"

count_value_app2vm                          = "1"
vm_size_app2vm                              = "Standard_D4s_v3"
data_disk_size_app2vm                       = "512"

count_value_pbi1vm                          = "2"
vm_size_pbi1vm                              = "Standard_D4s_v3"
data_disk_size_pbi1vm                       = "512"

vm_admin_password                           = ""

#Application Gateway
app_gateway_pip_name                        = "pip-agw-eus-kip-np"
app_gateway_name                            = "agw-eus-kip-np"
application_gw_sku_name                     = "WAF_Medium"
application_gw_sku_tier                     = "WAF"
application_gw_sku_capacity                 = "2"

kipdevhostname                              = "kipdev.kpmgcloudops.com"
kipdevauthcertcer                           = "kipdev.kpmgcloudops.com.cer"
kipdevcertname                              = "kipdev_kpmgcloudops_com"
kipdevsslcertpfx                            = "kipdev.kpmgcloudops.com.pfx"
kipdevcertpfxpwd                            = ""

kiprestdevhostname                          = "kiprestdev.kpmgcloudops.com"
kiprestdevauthcertcer                       = "kiprestdev.kpmgcloudops.com.cer"
kiprestdevcertname                          = "kiprestdev_kpmgcloudops_com"
kiprestdevsslcertpfx                        = "kiprestdev.kpmgcloudops.com.pfx"
kiprestdevcertpfxpwd                        = ""

kipqahostname                               = "kipqa.kpmgcloudops.com"
kipqaauthcertcer                            = "kipqa.kpmgcloudops.com.cer"
kipqacertname                               = "kipqa_kpmgcloudops_com"
kipqasslcertpfx                             = "kipqa.kpmgcloudops.com.pfx"
kipqacertpfxpwd                             = ""

kiprestqahostname                           = "kiprestqa.kpmgcloudops.com"
kiprestqaauthcertcer                        = "kiprestqa.kpmgcloudops.com.cer"
kiprestqacertname                           = "kiprestqa_kpmgcloudops_com"
kiprestqasslcertpfx                         = "kiprestqa.kpmgcloudops.com.pfx"
kiprestqacertpfxpwd                         = ""

mep-kipdevhostname                          = "mep-kipdev.kpmgcloudops.com"
mep-kipdevauthcertcer                       = "mepkipdev.kpmgcloudops.com.cer"
mep-kipdevcertname                          = "mep-kipdev_kpmgcloudops_com"
mep-kipdevsslcertpfx                        = "mepkipdev.kpmgcloudops.com.pfx"
mep-kipdevcertpfxpwd                        = ""

meprest-kipdevhostname                      = "meprest-kipdev.kpmgcloudops.com"
meprest-kipdevauthcertcer                   = "meprestkipdev.kpmgcloudops.com.cer"
meprest-kipdevcertname                      = "meprest-kipdev_kpmgcloudops_com"
meprest-kipdevsslcertpfx                    = "meprestkipdev.kpmgcloudops.com.pfx"
meprest-kipdevcertpfxpwd                    = ""

mep-kipqahostname                           = "mep-kipqa.kpmgcloudops.com"
mep-kipqaauthcertcer                        = "mepkipqa.kpmgcloudops.com.cer"
mep-kipqacertname                           = "mep-kipqa_kpmgcloudops_com"
mep-kipqasslcertpfx                         = "mepkipqa.kpmgcloudops.com.pfx"
mep-kipqacertpfxpwd                         = ""

meprest-kipqahostname                       = "meprest-kipqa.kpmgcloudops.com"
meprest-kipqaauthcertcer                    = "meprestkipqa.kpmgcloudops.com.cer"
meprest-kipqacertname                       = "meprest-kipqa_kpmgcloudops_com"
meprest-kipqasslcertpfx                     = "meprestkipqa.kpmgcloudops.com.pfx"
meprest-kipqacertpfxpwd                     = ""

dasnphostname                               = "dasnp.kpmgcloudops.com"
dasnpauthcertcer                            = "dasnp.kpmgcloudops.com.cer"
dasnpcertname                               = "dasnp_kpmgcloudops_com"
dasnpsslcertpfx                             = "dasnp.kpmgcloudops.com.pfx"
dasnpcertpfxpwd                             = ""

dasrestnphostname                           = "dasrestnp.kpmgcloudops.com"
dasrestnpauthcertcer                        = "dasrestnp.kpmgcloudops.com.cer"
dasrestnpcertname                           = "dasrestnp_kpmgcloudops_com"
dasrestnpsslcertpfx                         = "dasrestnp.kpmgcloudops.com.pfx"
dasrestnpcertpfxpwd                         = ""

/***Self Signed Certificate*****/
selfsigncertname                            = "star_kpmgcloudops_com"
selfsignauthcertcer                         = "star.kpmgcloudops.com.cer"

# app service plan
app_service_environment_id                 = ""
asp_tier                                   = "Isolated"
asp_size                                   = "I1"
asp_capacity                               = "1"

#sql server and elastic pool
sql_server_name                            = "srv-use-kip-np"
sypnase_analyticsdev1_name                 = "sql-use-kip-dv-synana1"
sypnase_analyticsdev1_performance_level    = "DW100c"

sqlserveradmin_password                    = ""
PaloInboundIPAddress                       = "10.1.16.100"
ase_internal_ip                            = "10.12.0.11"
uniqueresourcesuffix                       = ""

#KeyVault
key_vault_name                             = "conpeuskey01kip"

#Managed Identity
managed_identity_name_dev                  = ""
managed_identity_name_qa                   = ""
managed_identity_name_uat                  = ""

#Network Security Rule
PaloAlto1                                  = "20.185.109.156/32"
PaloAlto2                                  = "20.185.106.213/32"
KPMG_On-Premise                            = "199.207.253.0/24"
KPMG_VPN                                   = ["199.206.0.5/32", "54.173.33.56/32"]
KGS_Bangalore                              = ["103.133.112.80/28","103.58.118.80/28"]
KGS_Gurgaon                                = "103.216.201.96/28"
ASE_PIP                                    = ["40.121.216.33/32","13.68.223.82/32"]
ADX_Mgmt_IP                                = "52.224.146.56"
ADX_HealthMonitor_IP                       = "137.116.81.189"

#Global RDS Group Name
GlobalRDSGroup_name                        = "Global RDS users Group"

# Storage Account - Data Lake Storage StorageV2
storage_account_name_data_lake_1           = "conpeuskiprawcurtd01sa"
storage_account_name_data_lake_2           = "conpeuskipdatavult01sa"

# Managed Instance
managedInstanceName         			   = "conpeuskipmi"
managedInstanceadministratorLogin          = "kipmiadmin"
managedInstanceadministratorLoginPassword  = ""
managedInstanceskuName         			   = "GP_Gen5"
managedInstancevCores         			   = "8"
managedInstancestorageSizeInGB         	   = "8192"
managedInstancelicenseType         		   = "LicenseIncluded"

# Storage Account Container
webappbackup_container_name                = "webappbackup"

#App Services
app_service_name_kipdev			           = "kipdev"
app_service_name_kiprestdev		           = "kiprestdev"
app_service_name_mep-kipdev		           = "mep-kipdev"
app_service_name_meprest-kipdev	           = "meprest-kipdev"
app_service_name_kipqa			           = "kipqa"
app_service_name_kiprestqa	               = "kiprestqa"
app_service_name_mep-kipqa		           = "mep-kipqa"
app_service_name_meprest-kipqa	           = "meprest-kipqa"
app_service_name_dasnp			           = "dasnp"
app_service_name_dasrestnp		           = "dasrestnp"
functionapp_name_dev			           = "fun-use-kip-dv"
functionapp_name_qa				           = "fun-use-kip-qa"
windows_services_vm_name		           = "UEMCKIPAPP1NP2"

# Custom RBAC Variables
RBAC_CustomWebsiteContributor_Name		   = "Custom Website Contributor"
RBAC_CustomSQLManagedInstanceContributor_Name   = "Custom SQL Managed Instance Contributor"
RBAC_CustomStorageAccountContributor_Name	= "Custom Storage Account Contributor"
RBAC_CustomKeyVaultRead_Name		        = "Custom Key Vault Read"
RBAC_CustomSQLDBContributor_Name            = "Custom SQL DB Contributor"


#####################Staging Variables
#ApplicationInsights
app_insights_name_kipuat                    = "ais-use-kip-kipuat"
app_insights_name_kiprestuat                = "ais-use-kip-kiprestuat"
app_insights_name_mep-kipuat                = "ais-use-kip-mep-kipuat"
app_insights_name_meprest-kipuat            = "ais-use-kip-meprest-kipuat"

#Application Gateway
kipuathostname                              = "kipuat.kpmgcloudops.com"
kipuatauthcertcer                           = "kipuat.kpmgcloudops.com.cer"
kipuatcertname                              = "kipuat_kpmgcloudops_com"
kipuatsslcertpfx                            = "kipuat.kpmgcloudops.com.pfx"
kipuatcertpfxpwd                            = ""
kiprestuathostname                          = "kiprestuat.kpmgcloudops.com"
kiprestuatauthcertcer                       = "kiprestuat.kpmgcloudops.com.cer"
kiprestuatcertname                          = "kiprestuat_kpmgcloudops_com"
kiprestuatsslcertpfx                        = "kiprestuat.kpmgcloudops.com.pfx"
kiprestuatcertpfxpwd                        = ""
mep-kipuathostname                          = "mep-kipuat.kpmgcloudops.com"
mep-kipuatauthcertcer                       = "mepkipuat.kpmgcloudops.com.cer"
mep-kipuatcertname                          = "mep-kipuat_kpmgcloudops_com"
mep-kipuatsslcertpfx                        = "mepkipuat.kpmgcloudops.com.pfx"
mep-kipuatcertpfxpwd                        = ""
meprest-kipuathostname                      = "meprest-kipuat.kpmgcloudops.com"
meprest-kipuatauthcertcer                   = "meprestkipuat.kpmgcloudops.com.cer"
meprest-kipuatcertname                      = "meprest-kipuat_kpmgcloudops_com"
meprest-kipuatsslcertpfx                    = "meprestkipuat.kpmgcloudops.com.pfx"
meprest-kipuatcertpfxpwd                    = ""

#App Services
app_service_name_kipuat			            = "kipuat"
app_service_name_kiprestuat		            = "kiprestuat"
app_service_name_mep-kipuat		            = "mep-kipuat"
app_service_name_meprest-kipuat	            = "meprest-kipuat"
functionapp_name_uat			            = "fun-use-kip-uat"

#####################Production Variables

#Application Gateway
kiphostname                                 = ""
kipauthcertcer                              = ""
kipcertname                                 = ""
kipsslcertpfx                               = ""
kipcertpfxpwd                               = ""
kipresthostname                             = ""
kiprestauthcertcer                          = ""
kiprestcertname                             = ""
kiprestsslcertpfx                           = ""
kiprestcertpfxpwd                           = ""
mep-kiphostname                             = ""
mep-kipauthcertcer                          = ""
mep-kipcertname                             = ""
mep-kipsslcertpfx                           = ""
mep-kipcertpfxpwd                           = ""
meprest-kiphostname                         = ""
meprest-kipauthcertcer                      = ""
meprest-kipcertname                         = ""
meprest-kipsslcertpfx                       = ""
meprest-kipcertpfxpwd                       = ""

#App Services
app_service_name_kip			            = ""
app_service_name_kiprest		            = ""
app_service_name_mep-kip		            = ""
app_service_name_meprest-kip	            = ""
functionapp_name_prod			            = ""

#KME Subnet Access for DataLake

kme_ase_subnet_id                           = ""
kme_admin_subnet_id                         = ""
sqladmin_group_name                         = ""
enforce_private_link_endpoint_network_policies = true

#Cognitive Service
# cognitive_service                           = "co-np-eastus-kipcognitivesvc"
# cognitive_search                            = "co-np-eastus-kipcognitivesrch"

cognitive_service                           = "co-np-eus-kip-cognitivesvc"
cognitive_search                            = "co-np-eus-kip-acs"
partition_count                             = 1
replica_count                               = 1
kipprivatedns                               = "privatelink.search.windows.net"

kme_appsubnet                               = "/subscriptions/0feb4855-aaa2-40f1-bec2-a8db1dfe472e/resourceGroups/RGP-USE-SHARED-DA-DV/providers/Microsoft.Network/virtualNetworks/vnet-use-shared-da/subnets/sub-usc-ase-dv"
kme_mgmtsubnet                              = "/subscriptions/0feb4855-aaa2-40f1-bec2-a8db1dfe472e/resourceGroups/RGP-USE-SHARED-DA-DV/providers/Microsoft.Network/virtualNetworks/vnet-use-shared-da/subnets/sub-usc-mgmt-dv"
spi_appsubnet                               = "/subscriptions/0feb4855-aaa2-40f1-bec2-a8db1dfe472e/resourceGroups/CO-NP-eastus-CO-SPIVnet-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-co-spi-vnet/subnets/co-np-eastus-spiapp1-subnet"
kme_buildsubnet                             = "/subscriptions/0feb4855-aaa2-40f1-bec2-a8db1dfe472e/resourceGroups/RGP-USE-SHARED-DA-DV/providers/Microsoft.Network/virtualNetworks/vnet-use-shared-da/subnets/sub-usc-build-dv"

#Azure Data Explorer
adx_name                                    = "kipadx"
adx_data_mgmt_pip_name                      = "kip-adx-data_mgmt-pip"
adx_engine_pip_name                         = "kip-adx-engine-pip"
adx_min_instance_count                      = 2
adx_max_instance_count                      = 10
adx_database_name                           = "kipadxdatabase"
adx_database_cache_period                   = "P31D"
adx_database_retention_period               = "P1095D"
kip_adf_contributers                        = "KIP_ADF_Contributers"
adx_database_principal_name                 = "kip-adx-database-principal"
ip_rules                                    = "52.190.36.205"