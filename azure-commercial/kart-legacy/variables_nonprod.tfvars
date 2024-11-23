#environment specific variables
target_deployment_environment = "np"
environment                 = "np"
environment_dev             = "dev"
environment_qa              = "qa"
environment_uat             = "uat"
application_environment_1   = "NP1"
eastus_acronym              = "eus"
tags = {
    Platform                = "Azure Commercial Cloud"
    Environment             = "Development"
    Node                    = "Spoke"
    Solution                = "KPMG Aggregation And Reporting Tool (KART)"
    TechnicalOwner          = "Prajal Doshi"
    TechnicalContact        = "prajaldoshi@kpmg.com"
    BusinessOwner           = "Jeremy Taylor"
    BusinessContact         = "jstaylor@kpmg.com"
    LOB                     = "Deal Advisory & Strategy"
}

#AutomationAccount

automation_account_dev_obj_id     = "b8447927-1da1-432c-bf8d-34345cb25f6b"
automation_account_qa_obj_id      = "0c46beca-405f-45fd-9b54-03fccde3b6f1"
automation_account_uat_obj_id     = "3401de7c-7486-4620-9e27-2d71e3bbf3a0"

#AvailabilitySet
availability_set_name_app         = "co-np-eastus-krtapp1-as"
availability_set_name_workstation = "co-np-eastus-krtworkstation-as"

#EventHub
event_hub_namespace_name                = "co-np-eastus-krt1-eventhub"

krtbuildvm_objectid                     = "3d9c3b14-e1a5-4461-964e-9690162719b7"
application_acronym                     = "krt"
backuprecovery_rg_name                  = "co-np-eastus-krtbackuprecovery-rg"
loganalytics_rg_name                    = "co-np-eastus-krtloganalytics-rg"
application_rg_name                     = "co-np-eastus-krt-rg"
loganalytics_rg_location                = "eastus"
backuprecovery_rg_location              = "eastus"
application_rg_location                 = "eastus"

#service principal
encryptapp_service_principal_name       = "EncryptApp"
backupmanagement_service_principal_name = "Backup Management Service"

#route table
spi_route_table_name                    = "co-np-eastus-spitoPaloAlto-udr"
spi_route_table_resource_group_name     = "CO-NP-eastus-CO-SPIVnet-rg"
ase_routetable_name                     = "co-np-eastus-krtase-udr"


#virtual network and subnet
virtual_network_name                    = "co-np-eastus-krt-vnet"
krtagw1_subnet_name                     = "co-np-eastus-krtagw1-subnet"
krtagw1_subnet_adress_space             = "10.8.0.96/27"
krtapp1_subnet_name                     = "co-np-eastus-krtapp1-subnet"
krtapp1_subnet_adress_space             = "10.8.0.64/27"
krtase1_subnet_name                     = "co-np-eastus-krtase1-subnet"
krtase1_subnet_adress_space             = "10.8.0.0/26"
address_space                           = ["10.8.0.0/24"]
dns_server                              = ["10.1.11.4","10.1.11.5"]
coreinfrasubnetid                       = "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet/subnets/co-np-eastus-infra1-subnet"
core_aks_subnet_id                      = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/sub-use-core-aks-dv"

#Network Security Group

nsg_name_agw            = "co-np-eastus-krtagw1-nsg"
nsg_name_app            = "co-np-eastus-krtapp1-nsg"
nsg_name_ase            = "co-np-eastus-krtase1-nsg"

KPMG_Trusted_NW_address_prefixes = ["20.185.109.156/32","54.173.33.56/32","199.207.253.0/24","20.185.106.213/32","103.58.118.0/24","199.206.0.5/32","103.216.201.101/32"]

#Recovery Service
recovery_service_name = "conpeusrecvault01krt"

#Virtual Network peering
coresubscriptionid                      = "4cdcf904-fa57-4815-8cb3-e33b9b44f479"
transitsubscriptionid                   = "25f8d797-bee2-4a88-84cc-de328abd6731"
corevnetresourcegroup                   = "co-np-eastus-core1-rg"
transitvnetresourcegroup                = "CO-NP-eastus-CONPTVnet-rg"
corevnetname                            = "co-np-eastus-core1-vnet"
transitvnetname                         = "CO-NP-eastus-transit1-Vnet"
vmimagesubscriptionid                   = "0feb4855-aaa2-40f1-bec2-a8db1dfe472e"

#App Service Environment
ase_name                                = "conpeastuskrtase01"
dns_suffix                              = "kpmgcloudops.com"
app_service_name                        = "kart"
app_service_plan_name                   = "conpeastuskrtappsrvpln"

#ApplicationInsights
app_insights_name                       = "co-np-eastus-krt-appinsights"

#Storage Account
postprocess_storage_account_name        = "conpeuskrtpostpro01sa"
storage_account_name_recovery           = "conpeuskrtrecover01sa"
storage_account_name_dialog             = "conpeuskrtdiaglog01sa"
storage_account_name_vmdialog           = "conpeuskrtvmlog01sa"
storage_account_name_webapp_backup      = "conpeuskrtwebappbkp01sa"
storage_account_name_app                = "conpeuskrtfctapp01sa"
storage_account_name_app_log            = "conpeuskrtwebapplog01sa"
account_type                            = "Storage"
account_tier                            = "Standard"
replication_type                        = "RAGRS"
kpmg_nat_ip_list                        = ["203.199.72.210"]
wvd_subnet_id                           = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"

# Vm count value
count_value_krtapp1vm                   = "1"
count_value_krtwrkstnvm                 = "1"
vm_size_app                             = "1"
vm_size_wrkstn                          = "Standard_D8s_v3"

# Image details
/*
eu-cis-hardened-win2016-20190111-image_name                 = "cis-hardened-win2016-20190111-image"
eu-cis-hardened-win2016-20190111-image_resource_group_name  = "co-np-eastus-cospivmimage-rg"
*/
app1_vm_image_resource_group_name       = "co-np-eastus-copbi-rg"
app1_vm_image_name                      = "cis-hardened-win2016-PowerBI-20190701-image"

# Domain Variables
ou_path                                 = "OU=AADDC Computers,DC=kconp,DC=local"
domain_name                             = "kconp.local"
domain_user_name                        = "A-pdoshi"
encryptappsp_key_password               = "__encryptappsp_key_password__"
admin_password                          = "__admin_password__"
domain_user_password                    = "__domain_user_password__"

# COSPI Log Analytics Details
cospi_log_analytics_workspace_name                  = "co-np-eastus-cospi1-workspace"
cospi_log_analytics_workspace_resource_group_name   = "co-np-eastus-cospiloganalytics-rg"
custom_emails                                       = "go-fmmanagedservices@kpmg.com"
action_group_name                                   = "krtactiongroup"

#Application Gateway
app_gateway_pip_name                    = "co-np-eastus-krtapp1-agw-ip"
app_gateway_name                        = "co-np-eastus-krtapp1-agw"
application_gw_sku_name                 = "WAF_Medium"
application_gw_sku_tier                 = "WAF"
application_gw_sku_capacity             = "2"
krtdevhostname                          = "kartdev.kpmgcloudops.com"
krtdevcertname                          = "kartdev_kpmgcloudops_com"
krtdevauthcertcer                       = "kartdev.kpmgcloudops.com.cer"
krtdevsslcertpfx                        = "kartdev.kpmgcloudops.com.pfx"
krtdevcertpfxpwd                        = "__krtdevcertpfxpwd__"
krtqahostname                           = "kartqa.kpmgcloudops.com"
krtqacertname                           = "kartqa_kpmgcloudops_com"
krtqaauthcertcer                        = "kartqa.kpmgcloudops.com.cer"
krtqasslcertpfx                         = "kartqa.kpmgcloudops.com.pfx"
krtqacertpfxpwd                         = "__krtqacertpfxpwd__"
krtuathostname                          = "kartuat.kpmgcloudops.com"
krtuatcertname                          = "kartuat_kpmgcloudops_com"
krtuatauthcertcer                       = "kartuat.kpmgcloudops.com.cer"
krtuatsslcertpfx                        = "kartuat.kpmgcloudops.com.pfx"
krtuatcertpfxpwd                        = "__krtuatcertpfxpwd__"
dev_backend_ips                         = ["10.8.0.11"]
qa_backend_ips                          = ["10.8.0.11"]
uat_backend_ips                         = ["10.8.0.11"]

/***Self Signed Certificate*****/
selfsigncertname                        = "star_kpmgcloudops_com"
selfsignauthcertcer                     = "star.kpmgcloudops.com.cer"
ase_cert_name                           = "kpmgcloudops.com.cer"
app_gateway_hostname                    = "kart.kpmgcloudops.com"
app_gateway_certname                    = "kart.kpmgcloudops.com.pfx"

#analysis server
analysisservice_name                    = "conpeuskrtanasvc1"
analysisservice_dev_name                = "codeveuskrtanasvc1"
analysisservice_qa_name                 = "coqaeuskrtanasvc1"
analysisservice_uat_name                = "couateuskrtanasvc1"


analysisservice_admin_user_password     = "__analysisservice_admin_user_password__"

# app service plan

asp_tier                                = "Isolated"
asp_size                                = "I1"

#sql server and elastic pool
sql_server_name                         = "conpeuskrtsqlserver1"
sql_server_name_dev                     = "codeveuskrtsqlserver1"
sql_server_name_qa                      = "coqaeuskrtsqlserver1"
sql_server_name_uat                     = "couateuskrtsqlserver1"
sqlserver_admin_dev                     = "krtdevsqladmin1"
sqlserveradmin_password_dev             = "__sqlserveradmin_password_dev__"
sqlserver_admin_qa                      = "krtqasqladmin1"
sqlserveradmin_password_qa              = "__sqlserveradmin_password_qa__"
sqlserver_admin_uat                     = "krtuatsqladmin1"
sqlserveradmin_password_uat             = "__sqlserveradmin_password_uat__"
sqlserveradmin_password                 = "__sqlserveradmin_password__"
sqladmin_group_name                     = "CO-KRTSQLAdmins"
sqladmindev_group_name                  = "CO-KRTSQLAdminsDEV"
sqladminqa_group_name                   = "CO-KRTSQLAdminsQA"
sqladminuat_group_name                  = "CO-KRTSQLAdminsUAT"
sql_elastic_pool_name                   = "conpeuskrtelasticpool"
sqlelasticpool_sku_name                 = "GP_Gen5"
sqlelasticpool_sku_tier                 = "GeneralPurpose"
sqlelasticpool_sku_family               = "Gen5"
sqlelasticpool_sku_capacity             = "40"
sqlelasticpool_min_capacity             = "0.25"
sqlelasticpool_max_capacity             = "16"



PaloInboundIPAddress                    = "10.1.16.100"
analysis_server_userid_dev              = "CO-KRTAnalysisServicesAdminsDEV@kpmgusadvspectrum.onmicrosoft.com"
analysis_server_userid_qa               = "CO-KRTAnalysisServicesAdminsQA@kpmgusadvspectrum.onmicrosoft.com"
analysis_server_userid_uat              = "CO-KRTAnalysisServicesAdminsUAT@kpmgusadvspectrum.onmicrosoft.com"
PaloAltoFirewallPIP1                    = "20.185.109.156"
PaloAltoFirewallPIP2                    = "20.185.106.213"
kartasemangementIP                      = "52.224.65.67"
ase_internal_ip                         = "10.50.2.11"
uniqueresourcesuffix                    = ""

#KeyVault
keyvaultadminsgroupname                 = "CO-Certificate-KeyVault"
key_vault_name_dev                      = "codeveuskey01krt"
key_vault_name_qa                       = "coqaeuskey01krt"
key_vault_name_uat                      = "couateuskey01krt"
key_vault_name_prod                     = "coprdeuskey01krt"
key_vault_name                          = "conpeuskey01krt"
cloudops_keyvault_admin                 = "CO-Certificate-KeyVault"
client_keyvault_admin                   = "CO-DA-KeyVault-Admins"

#Managed Identity
managed_identity_name_dev               = "azuser-svcKRTDEV"
managed_identity_name_qa                = "azuser-svcKRTQA"
managed_identity_name_uat               = "azuser-svcKRTUAT"

#LogAnalytics Workspace
log_analytics_workspace_name =   "co-np-eastus-krt-law"
tenantfqdn                   =   "kpmgusadvspectrum.onmicrosoft.com"

#AD Group
KRTDevelopers_description           = "This Group will be used for KART Application Developers"
BuildVMAdmins_description           = "Admins Group To have admin activity on Build VM"
RDPUsers_description                = "KART Developer, QA, Business, Project Team RDP Users"
ATOTeam_description                 = "For ATO User"
BusinessUsers_description           = "For Business User"
DevopsProjectManagers_description   = "Required for CI/CD pipeline release"
PBICapacityAdmins_description       = "CO-KRTPBICapacityAdmins"
ProjectTeam_description             = "For KART Application Project Team Members"
SQLReadOnlyDev_description          = "Would be used by Power BI Developers"

subscription_id = "0feb4855-aaa2-40f1-bec2-a8db1dfe472e"
client_id       = "41da8a25-68fc-489c-b051-f97aeca67fd6"
client_secret   = "__client_secret__"
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"