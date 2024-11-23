subscription_id                         = "9e27f52c-3c97-4fda-9c8f-eadcd0ad195a"
client_id                               = "b2967f11-d801-4812-b532-3f3a676e8b46"
tenant_id                               = "b5031e57-d76f-422e-87c6-02b4cc749974"
client_secret                           = ""

#environment specific variables
target_deployment_environment           = "production"
environment                             = "pd"
environment_dev                         = "dev"
environment_qa                          = "qa"
environment_uat                         = "uat"
application_environment_1               = "PD1"
application_environment_2               = "PD2"
eastus_acronym                          = "eus"
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

#AvailabilitySet
availability_set_name_workstation       = "co-pd-eastus-kipworkstation-as"
availability_set_name_application       = "co-pd-eastus-kipapplication-as"
availability_set_name_powerbigateway    = "co-pd-eastus-kippowerbigateway-as"

#EventHub
event_hub_namespace_name                = "co-pd-eastus-kip1-eventhub"

application_acronym                     = "kip"
backuprecovery_rg_name                  = "co-pd-eastus-kipbackuprecovery-rg"
loganalytics_rg_name                    = "co-pd-eastus-kiploganalytics-rg"
application_rg_name                     = "co-pd-eastus-kip-rg"
loganalytics_rg_location                = "eastus"
backuprecovery_rg_location              = "eastus"
application_rg_location                 = "eastus"

#service principal
encryptapp_service_principal_name       = "DiskEncryptApp"
backupmanagement_service_principal_name = "Backup Management Service"

#route table
spi_route_table_name                    = "co-p-eastus-spitoPaloAlto-udr"
spi_route_table_resource_group_name     = "CO-P-eastus-cospivnet-rg"
ase_routetable_name                     = "co-pd-eastus-kipase-udr"
mi_routetable_name                      = "co-pd-eastus-kipmi-udr"


#virtual network and subnet
virtual_network_name                    = "co-pd-eastus-kip-vnet"
agw1_subnet_name                        = "co-pd-eastus-kipagw1-subnet"
agw1_subnet_adress_space                = "10.22.0.96/27"
app1_subnet_name                        = "co-pd-eastus-kipapp1-subnet"
app1_subnet_adress_space                = "10.22.0.64/27"
wst1_subnet_name                        = "co-pd-eastus-kipwst1-subnet"
wst1_subnet_adress_space                = "10.22.0.192/27"
ase1_subnet_name                        = "co-pd-eastus-kipase1-subnet"
ase1_subnet_adress_space                = "10.22.0.0/26"
pbi1_subnet_name                        = "co-pd-eastus-kippbi1-subnet"
pbi1_subnet_adress_space                = "10.22.0.224/27"
db1_subnet_name                         = "co-pd-eastus-kipdb1-subnet"
db1_subnet_adress_space                 = "10.22.0.128/26"
adx1_subnet_name                        = "co-pd-eastus-kipadx1-subnet"
adx1_subnet_adress_space                = "10.26.4.0/28"
address_space                           = ["10.22.0.0/24","10.26.4.0/22"]
address_space_string_format             = "10.22.0.0/24"
dns_server                              = ["10.30.15.196","10.30.15.197"]
coreinfrasubnetid                       = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/co-p-eastus-infra1-subnet"
core_aks_subnet_id                      = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/sub-use-core-aks-pd"

spidb1subnetid                          = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-spi-vnet/subnets/co-p-eastus-spidb1-subnet"
applicationvnetddosprotectionplan       = "co-pd-eastus-kip-vnet-ddos-protection-plan"


#Network Security Group

nsg_name_agw1                           = "co-pd-eastus-kipagw1-nsg"
nsg_name_app1                           = "co-pd-eastus-kipapp1-nsg"
nsg_name_wst1                           = "co-pd-eastus-kipwst1-nsg"
nsg_name_ase1                           = "co-pd-eastus-kipase1-nsg"
nsg_name_pbi1                           = "co-pd-eastus-kippbi1-nsg"
nsg_name_db1                            = "co-pd-eastus-kipdb1-nsg"
nsg_name_adx1                           = "co-pd-eastus-kipadx1-nsg"


#Recovery Service
recovery_service_name                   = "copdeusrecvault01kip"

#Virtual Network peering
coresubscriptionid                      = "4c9dc048-01dc-4854-9063-8a3d4060993a"
transitsubscriptionid                   = "0d7a7f3c-a15d-4d37-924c-2507147fb74c"
corevnetresourcegroup                   = "CO-P-eastus-hubvnet-rg"
transitvnetresourcegroup                = "CO-P-eastus-transitvnet-rg"
corevnetname                            = "CO-P-eastus-hub-vnet"
transitvnetname                         = "CO-P-eastus-transit-vnet"
vmimagesubscriptionid                   = "9e27f52c-3c97-4fda-9c8f-eadcd0ad195a"

#App Service Environment
ase_name                                = "ase-use-kip-pd"
dns_suffix                              = "kpmgcloudops.com"
app_service_plan_name                   = "asp-use-kip-pd"

#Storage Account

storage_account_name_recovery           = "copdeuskiprecover01sa"
storage_account_name_dialog             = "copdeuskipdiaglog01sa"
storage_account_name_vmdialog           = "copdeuskipvmlog01sa"
storage_account_name_webapp_backup      = "copdeuskipwebappbkp01sa"
storage_account_name_app                = "copdeuskipfctapp01sa"
storage_account_name_app_log            = "copdeuskipwebapplog01sa"
account_type                            = "Storage"
account_type_2                          = "StorageV2"
is_hns_enabled                          = "true"
account_tier                            = "Standard"
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
vm_size_pbi1vm                          = "Standard_D4s_v3"
data_disk_size_pbi1vm                   = "512"

vm_admin_password                       = ""

#Application Gateway
app_gateway_pip_name                    = "pip-agw-use-kip-pd"
app_gateway_name                        = "agw-use-kip-pd"
application_gw_sku_name                 = "WAF_Medium"
application_gw_sku_tier                 = "WAF"
application_gw_sku_capacity             = "2"

kipdevhostname                          = "kipdev.kpmgcloudops.com"
kipdevauthcertcer                       = "kipdev.kpmgcloudops.com.cer"
kipdevcertname                          = "kipdev_kpmgcloudops_com"
kipdevsslcertpfx                        = "kipdev.kpmgcloudops.com.pfx"
kipdevcertpfxpwd                        = ""

kiprestdevhostname                      = "kiprestdev.kpmgcloudops.com"
kiprestdevauthcertcer                   = "kiprestdev.kpmgcloudops.com.cer"
kiprestdevcertname                      = "kiprestdev_kpmgcloudops_com"
kiprestdevsslcertpfx                    = "kiprestdev.kpmgcloudops.com.pfx"
kiprestdevcertpfxpwd                    = ""

kipqahostname                           = "kipqa.kpmgcloudops.com"
kipqaauthcertcer                        = "kipqa.kpmgcloudops.com.cer"
kipqacertname                           = "kipqa_kpmgcloudops_com"
kipqasslcertpfx                         = "kipqa.kpmgcloudops.com.pfx"
kipqacertpfxpwd                         = ""

kiprestqahostname                       = "kiprestqa.kpmgcloudops.com"
kiprestqaauthcertcer                    = "kiprestqa.kpmgcloudops.com.cer"
kiprestqacertname                       = "kiprestqa_kpmgcloudops_com"
kiprestqasslcertpfx                     = "kiprestqa.kpmgcloudops.com.pfx"
kiprestqacertpfxpwd                     = ""

mep-kipdevhostname                      = "mep-kipdev.kpmgcloudops.com"
mep-kipdevauthcertcer                   = "mepkipdev.kpmgcloudops.com.cer"
mep-kipdevcertname                      = "mep-kipdev_kpmgcloudops_com"
mep-kipdevsslcertpfx                    = "mepkipdev.kpmgcloudops.com.pfx"
mep-kipdevcertpfxpwd                    = ""

meprest-kipdevhostname                  = "meprest-kipdev.kpmgcloudops.com"
meprest-kipdevauthcertcer               = "meprestkipdev.kpmgcloudops.com.cer"
meprest-kipdevcertname                  = "meprest-kipdev_kpmgcloudops_com"
meprest-kipdevsslcertpfx                = "meprestkipdev.kpmgcloudops.com.pfx"
meprest-kipdevcertpfxpwd                = ""

mep-kipqahostname                       = "mep-kipqa.kpmgcloudops.com"
mep-kipqaauthcertcer                    = "mepkipqa.kpmgcloudops.com.cer"
mep-kipqacertname                       = "mep-kipqa_kpmgcloudops_com"
mep-kipqasslcertpfx                     = "mepkipqa.kpmgcloudops.com.pfx"
mep-kipqacertpfxpwd                     = ""

meprest-kipqahostname                   = "meprest-kipqa.kpmgcloudops.com"
meprest-kipqaauthcertcer                = "meprestkipqa.kpmgcloudops.com.cer"
meprest-kipqacertname                   = "meprest-kipqa_kpmgcloudops_com"
meprest-kipqasslcertpfx                 = "meprestkipqa.kpmgcloudops.com.pfx"
meprest-kipqacertpfxpwd                 = ""

dasnphostname                           = "dasnp.kpmgcloudops.com"
dasnpauthcertcer                        = "dasnp.kpmgcloudops.com.cer"
dasnpcertname                           = "dasnp_kpmgcloudops_com"
dasnpsslcertpfx                         = "dasnp.kpmgcloudops.com.pfx"
dasnpcertpfxpwd                         = ""

dasrestnphostname                       = "dasrestnp.kpmgcloudops.com"
dasrestnpauthcertcer                    = "dasrestnp.kpmgcloudops.com.cer"
dasrestnpcertname                       = "dasrestnp_kpmgcloudops_com"
dasrestnpsslcertpfx                     = "dasrestnp.kpmgcloudops.com.pfx"
dasrestnpcertpfxpwd                     = ""

/***Self Signed Certificate*****/
selfsigncertname                        = "star_kpmgcloudops_com"
selfsignauthcertcer                     = "kpmgcloudops.com.cer"

# app service plan
app_service_environment_id              = ""
asp_tier                                = "Isolated"
asp_size                                = "I1"
asp_capacity                            = "1"

#sql server and elastic pool
sql_server_name                         = "srv-use-kip-pd"
sypnase_analyticsdev1_name              = "sql-use-kip-pd-synana1"
sypnase_analyticsdev1_performance_level = "DW100c"

sqlserveradmin_password                 = ""
sqladmin_group_name                     = ""

PaloInboundIPAddress                    = "10.30.16.100"
ase_internal_ip                         = "10.22.0.11"
uniqueresourcesuffix                    = "Production"

#KeyVault
key_vault_name                          = "copdeuskey01kip"

#Managed Identity
#managed_identity_name_dev              = ""
#managed_identity_name_qa               = ""
#managed_identity_name_uat              = ""

#Network Security Rule
PaloAlto1                               = "20.185.106.126/32"
PaloAlto2                               = "20.185.110.197/32"
KPMG_On-Premise                         = "199.207.253.0/24"
KPMG_VPN                                = ["199.206.0.5/32", "54.173.33.56/32"]
KGS_Bangalore                           = ["103.133.112.80/28","103.58.118.80/28"]
KGS_Gurgaon                             = "103.216.201.96/28"
ASE_PIP                                 = ["104.211.19.220/32","52.152.148.131/32"]
ADX_Mgmt_IP                             = "52.224.146.56"
ADX_HealthMonitor_IP                    = "137.116.81.189"


#Global RDS Group Name
GlobalRDSGroup_name                     = "CO-KIPRDPUsersStaging"

# Storage Account - Data Lake Storage StorageV2
storage_account_name_data_lake_1                = "copdeuskiprawcurtd01sa"
storage_account_name_data_lake_2                = "copdeuskipdatavult01sa"


# Managed Instance
managedInstanceName         			        = "copdeuskipmi"
managedInstanceadministratorLogin               = "kipmiadmin"
managedInstanceadministratorLoginPassword       = ""
managedInstanceskuName         			        = "GP_Gen5"
managedInstancevCores         			        = "8"
managedInstancestorageSizeInGB         		    = "8192"
managedInstancelicenseType         		        = "LicenseIncluded"

# Storage Account Container
webappbackup_container_name                     = "webappbackup"

#App Services
app_service_name_kipuat			                = "kipuat"
app_service_name_kiprestuat		                = "kiprestuat"
app_service_name_mep-kipuat		                = "mep-kipuat"
app_service_name_meprest-kipuat	                = "meprest-kipuat"
functionapp_name_uat			                = "fun-use-kip-uat"

app_service_name_dasnp			                = "dasnp"
app_service_name_dasrestnp		                = "dasrestnp"
functionapp_name_dev			                = "fun-use-kip-dv"
functionapp_name_qa				                = "fun-use-kip-qa"
app_service_name_kipdev			                = "kipdev"
app_service_name_kiprestdev		                = "kiprestdev"
app_service_name_mep-kipdev		                = "mep-kipdev"
app_service_name_meprest-kipdev	                = "meprest-kipdev"
app_service_name_kipqa			                = "kipqa"
app_service_name_kiprestqa		                = "kiprestqa"
app_service_name_mep-kipqa		                = "mep-kipqa"
app_service_name_meprest-kipqa	                = "meprest-kipqa"
windows_services_vm_name		                = "UEMCKIPAPP1PD2"

# Custom RBAC Variables
RBAC_CustomWebsiteContributor_Name		        = "Custom Website Contributor Production"
RBAC_CustomSQLManagedInstanceContributor_Name   = "Custom SQL Managed Instance Contributor Production"
RBAC_CustomStorageAccountContributor_Name	    = "Custom Storage Account Contributor Production"
RBAC_CustomKeyVaultRead_Name		            = "Custom Key Vault Read Production"
RBAC_CustomSQLDBContributor_Name                = "Custom SQL DB Contributor Production"


#####################Staging Variables
#ApplicationInsights
app_insights_name_kipuat                        = "ais-use-kip-kipuat"
app_insights_name_kiprestuat                    = "ais-use-kip-kiprestuat"
app_insights_name_mep-kipuat                    = "ais-use-kip-mep-kipuat"
app_insights_name_meprest-kipuat                = "ais-use-kip-meprest-kipuat"

#Application Gateway
kipuathostname                                  = "kipuat.kpmgcloudops.com"
kipuatauthcertcer                               = "kipuat.kpmgcloudops.com.cer"
kipuatcertname                                  = "kipuat_kpmgcloudops_com"
kipuatsslcertpfx                                = "kipuat.kpmgcloudops.com.pfx"
kipuatcertpfxpwd                                = ""
kiprestuathostname                              = "kiprestuat.kpmgcloudops.com"
kiprestuatauthcertcer                           = "kiprestuat.kpmgcloudops.com.cer"
kiprestuatcertname                              = "kiprestuat_kpmgcloudops_com"
kiprestuatsslcertpfx                            = "kiprestuat.kpmgcloudops.com.pfx"
kiprestuatcertpfxpwd                            = ""
mep-kipuathostname                              = "mep-kipuat.kpmgcloudops.com"
mep-kipuatauthcertcer                           = "mepkipuat.kpmgcloudops.com.cer"
mep-kipuatcertname                              = "mep-kipuat_kpmgcloudops_com"
mep-kipuatsslcertpfx                            = "mepkipuat.kpmgcloudops.com.pfx"
mep-kipuatcertpfxpwd                            = ""
meprest-kipuathostname                          = "meprest-kipuat.kpmgcloudops.com"
meprest-kipuatauthcertcer                       = "meprestkipuat.kpmgcloudops.com.cer"
meprest-kipuatcertname                          = "meprest-kipuat_kpmgcloudops_com"
meprest-kipuatsslcertpfx                        = "meprestkipuat.kpmgcloudops.com.pfx"
meprest-kipuatcertpfxpwd                        = ""



#####################Production Variables

#Application Gateway
kiphostname                                     = "kip.kpmgcloudops.com"
kipauthcertcer                                  = "kip.kpmgcloudops.com.cer"
kipcertname                                     = "kip_kpmgcloudops_com"
kipsslcertpfx                                   = "kip.kpmgcloudops.com.pfx"
kipcertpfxpwd                                   = ""
kipresthostname                                 = "kiprest.kpmgcloudops.com"
kiprestauthcertcer                              = "kiprest.kpmgcloudops.com.cer"
kiprestcertname                                 = "kiprest_kpmgcloudops_com"
kiprestsslce                                    = "kiprest.kpmgcloudops.com.pfx"
kiprestcertpfxpwd                               = ""
mep-kiphostname                                 = "mep-kip.kpmgcloudops.com"
mep-kipauthcertcer                              = "mepkip.kpmgcloudops.com.cer"
mep-kipcertname                                 = "mep-kip_kpmgcloudops_com"
mep-kipsslcertpfx                               = "mepkip.kpmgcloudops.com.pfx"
mep-kipcertpfxpwd                               = ""
meprest-kiphostname                             = "meprest-kip.kpmgcloudops.com"
meprest-kipauthcertcer                          = "meprestkip.kpmgcloudops.com.cer"
meprest-kipcertname                             = "meprest-kip_kpmgcloudops_com"
meprest-kipsslcertpfx                           = "meprestkip.kpmgcloudops.com.pfx"
meprest-kipcertpfxpwd                           = ""

kiprestsslcertpfx                               = "kiprest.kpmgcloudops.com.pfx"

#App Services
app_service_name_kip		                    = "kip"
app_service_name_kiprest		                = "kiprest"
app_service_name_mep-kip		                = "mep-kip"
app_service_name_meprest-kip	                = "meprest-kip"
functionapp_name_prod			                = "fun-use-kip-pd"

app_insights_name_kipdev                        = ""
app_insights_name_kiprestdev                    = ""
app_insights_name_kipqa                         = ""
app_insights_name_kiprestqa                     = ""

app_insights_name_mep-kipdev                    = ""
app_insights_name_meprest-kipdev                = ""
app_insights_name_mep-kipqa                     = ""
app_insights_name_meprest-kipqa                 = ""
app_insights_name_dasnp                         = ""
app_insights_name_dasrestnp                     = ""

kme_admin_subnet_id                             = ""
kme_ase_subnet_id                               = ""


#Cognitive Service
cognitive_service                               = "co-pd-eastus-kipcognitivesvc"
cognitive_search                                = "co-pd-eastus-kipcognitivesrch"
partition_count                                 = 2
replica_count                                   = 2
kipprivatedns                                   = "privatelink.search.windows.net"


kme_appsubnet                                   = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/RGP-USE-SHARED-DA-PD/providers/Microsoft.Network/virtualNetworks/vnet-use-shared-dapd/subnets/sub-usc-ase-pd"
kme_mgmtsubnet                                  = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/RGP-USE-SHARED-DA-PD/providers/Microsoft.Network/virtualNetworks/vnet-use-shared-dapd/subnets/sub-usc-mgmt-pd"
spi_appsubnet                                   = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-spi-vnet/subnets/co-p-eastus-spiapp1-subnet"
kme_buildsubnet                                 = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/RGP-USE-SHARED-DA-PD/providers/Microsoft.Network/virtualNetworks/vnet-use-shared-dapd/subnets/sub-usc-build-pd"

#Azure Data Explorer
adx_name                                    = "aecusekippd"
adx_data_mgmt_pip_name                      = "kip-adx-data_mgmt-pip"
adx_engine_pip_name                         = "kip-adx-engine-pip"
adx_min_instance_count                      = 2
adx_max_instance_count                      = 10
adx_database_name                           = "kipadxdatabase"
adx_database_cache_period                   = "P31D"
adx_database_retention_period               = "P1095D"
kip_adf_contributers                        = "KIP_ADF_Contributers"
adx_database_principal_name                 = "kip-adx-database-principal"
ip_rules                                    = "199.207.253.101"