#environment specific variables
target_deployment_environment = "prod"
environment                 = "p"
environment_dev             = "dev"
environment_qa              = "qa"
environment_uat             = "uat"
application_environment_1   = "P"
eastus_acronym              = "eus"
tags = {
    Platform                = "Azure Commercial Cloud"
    Environment             = "Production"
    Node                    = "Spoke"
    Solution                = "KPMG Aggregation And Reporting Tool (KART)"
    TechnicalOwner          = "Prajal Doshi"
    TechnicalContact        = "prajaldoshi@kpmg.com"
    BusinessOwner           = "Jeremy Taylor"
    BusinessContact         = "jstaylor@kpmg.com"
    LOB                     = "Deal Advisory & Strategy"
    Datadog                 = "Monitored"
}

#AutomationAccount

automation_account_dev_obj_id     = "b8447927-1da1-432c-bf8d-34345cb25f6b"
automation_account_qa_obj_id      = "0c46beca-405f-45fd-9b54-03fccde3b6f1"
automation_account_uat_obj_id     = "3401de7c-7486-4620-9e27-2d71e3bbf3a0"

#AvailabilitySet
availability_set_name_app         = "co-p-eastus-krtapp1-as"
availability_set_name_workstation = "co-p-eastus-krtworkstation-as"

#EventHub
event_hub_namespace_name                = "co-p-eastus-krt1-eventhub"

krtbuildvm_objectid                     = "bc0e53bd-e052-478d-8fd2-046d0b7d45df"
application_acronym                     = "krt"
backuprecovery_rg_name                  = "co-p-eastus-krtbackuprecovery-rg"
loganalytics_rg_name                    = "co-p-eastus-krtloganalytics-rg"
application_rg_name                     = "co-p-eastus-krt-rg"
loganalytics_rg_location                = "eastus"
backuprecovery_rg_location              = "eastus"
application_rg_location                 = "eastus"

#service principal
encryptapp_service_principal_name       = "DiskEncryptApp"
backupmanagement_service_principal_name = "Backup Management Service"

#route table
spi_route_table_name                    = "co-p-eastus-spitoPaloAlto-udr"
spi_route_table_resource_group_name     = "CO-P-eastus-cospivnet-rg"
ase_routetable_name                     = "co-p-eastus-krtase-udr"


#virtual network and subnet
virtual_network_name                    = "co-p-eastus-krt-vnet"
krtagw1_subnet_name                     = "co-p-eastus-krtagw1-subnet"
krtagw1_subnet_adress_space             = "10.25.0.128/26"
krtapp1_subnet_name                     = "co-p-eastus-krtapp1-subnet"
krtapp1_subnet_adress_space             = "10.25.0.192/27"
krtase1_subnet_name                     = "co-p-eastus-krtase1-subnet"
krtase1_subnet_adress_space             = "10.25.0.0/25"
address_space                           = ["10.25.0.0/24"]
dns_server                              = ["10.30.15.196","10.30.15.197"]
coreinfrasubnetid                       = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/co-p-eastus-infra1-subnet"
core_aks_subnet_id                      = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/sub-use-core-aks-pd"

#Network Security Group

nsg_name_agw                            = "co-p-eastus-krtagw1-nsg"
nsg_name_app                            = "co-p-eastus-krtapp1-nsg"
nsg_name_ase                            = "co-p-eastus-krtase1-nsg"

KPMG_Trusted_NW_address_prefixes        = ["103.216.201.101/32","54.173.33.56/32","199.207.253.0/24","199.206.0.5/32","103.58.118.0/24","20.185.110.197/32","20.185.106.126/32"]

#Recovery Service
recovery_service_name                   = "copeusrecvault01krt"

#Virtual Network peering
coresubscriptionid                      = "4c9dc048-01dc-4854-9063-8a3d4060993a"
transitsubscriptionid                   = "0d7a7f3c-a15d-4d37-924c-2507147fb74c"
corevnetresourcegroup                   = "CO-P-eastus-hubvnet-rg"
transitvnetresourcegroup                = "CO-P-eastus-transitvnet-rg"
corevnetname                            = "CO-P-eastus-hub-vnet"
transitvnetname                         = "CO-P-eastus-transit-vnet"
vmimagesubscriptionid                   = "9e27f52c-3c97-4fda-9c8f-eadcd0ad195a"

#App Service Environment
ase_name                                = "copeastuskrtase01"
dns_suffix                              = "kpmgcloudops.com"
app_service_plan_name                   = "copeastuskrtappsrvpln"

#ApplicationInsights
app_insights_name                       = "co-p-eastus-krt-appinsights"

#Storage Account
postprocess_storage_account_name        = "copeuskrtpostpro01sa"
storage_account_name_recovery           = "copeuskrtrecover01sa"
storage_account_name_dialog             = "copeuskrtdiaglog01sa"
storage_account_name_vmdialog           = "copeuskrtvmlog01sa"
storage_account_name_webapp_backup      = "copeuskrtwebappbkp01sa"
storage_account_name_app                = "copeuskrtfctapp01sa"
storage_account_name_app_log            = "copeuskrtwebapplog01sa"
account_type                            = "Storage"
account_tier                            = "Standard"
replication_type                        = "RAGRS"
kpmg_nat_ip_list                        = []
wvd_subnet_id                           = ""

# Vm count value
count_value_krtapp1vm                   = "1"
count_value_krtwrkstnvm                 = "2"
vm_size_app                             = "Standard_D16s_v3"
vm_size_wrkstn                          = "Standard_D16s_v3"

# Image details
/*
eu-cis-hardened-win2016-20190111-image_name                 = "cis-hardened-win2016-20190111-image"
eu-cis-hardened-win2016-20190111-image_resource_group_name  = "co-np-eastus-cospivmimage-rg"
*/
app1_vm_image_resource_group_name       = "CO-P-eastus-cospivmimage-rg"
app1_vm_image_name                      = "cis-hardened-win2016-20190111-image"

# Domain Variables
ou_path                                 = "OU=AADDC Computers,DC=kco,DC=local"
domain_name                             = "kco.local"
domain_user_name                        = "A-rkumarpatel"
encryptappsp_key_password               = "__encryptappsp_key_password__"
admin_password                          = "__admin_password__"
domain_user_password                    = "__domain_user_password__"

# COSPI Log Analytics Details
cospi_log_analytics_workspace_name                  = "CO-P-eastus-cospi1-workspace"
cospi_log_analytics_workspace_resource_group_name   = "co-p-eastus-cospiloganalytics-rg"
custom_emails                                       = "go-fmmanagedservices@kpmg.com"
action_group_name                                   = "krtactiongroup"

#Application Gateway
app_gateway_pip_name                    = "co-p-eastus-krtapp1-agw-ip"
app_gateway_name                        = "co-p-eastus-krtapp1-agw"
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
analysisservice_name                    = "copeuskrtanasvc1"
analysisservice_dev_name                = "codeveuskrtanasvc1"
analysisservice_qa_name                 = "coqaeuskrtanasvc1"
analysisservice_uat_name                = "couateuskrtanasvc1"


analysisservice_admin_user_password     = "__analysisservice_admin_user_password__"

# app service plan

asp_tier                                = "Isolated"
asp_size                                = "I3"
app_service_name                        = "kart"

#sql server and elastic pool
sql_server_name                         = "copeuskrtsqlserver1"
sql_server_name_dev                     = "codeveuskrtsqlserver1"
sql_server_name_qa                      = "coqaeuskrtsqlserver1"
sql_server_name_uat                     = "couateuskrtsqlserver1"
sqlserver_admin_dev                     = "krtdevsqladmin1"
sqlserveradmin_password_dev             = "sqlserveradmin_password_dev__"
sqlserver_admin_qa                      = "krtqasqladmin1"
sqlserveradmin_password_qa              = "__sqlserveradmin_password_qa__"
sqlserver_admin_uat                     = "krtuatsqladmin1"
sqlserveradmin_password_uat             = "__sqlserveradmin_password_uat__"
sqlserveradmin_password                 = "__sqlserveradmin_password__"
sqladmin_group_name                     = "CO-KRTSQLAdmins"
sqladmindev_group_name                  = "CO-KRTSQLAdminsDEV"
sqladminqa_group_name                   = "CO-KRTSQLAdminsQA"
sqladminuat_group_name                  = "CO-KRTSQLAdminsUAT"
sql_elastic_pool_name                   = "copeuskrtelasticpool"
sqlelasticpool_sku_name                 = "GP_Gen5"
sqlelasticpool_sku_tier                 = "GeneralPurpose"
sqlelasticpool_sku_family               = "Gen5"
sqlelasticpool_sku_capacity             = "40"
sqlelasticpool_min_capacity             = "0.25"
sqlelasticpool_max_capacity             = "1"



PaloInboundIPAddress                    = "10.30.16.100"
analysis_server_userid_dev              = "CO-KRTAnalysisServicesAdminsDEV@kpmgusadvspectrum.onmicrosoft.com"
analysis_server_userid_qa               = "CO-KRTAnalysisServicesAdminsQA@kpmgusadvspectrum.onmicrosoft.com"
analysis_server_userid_uat              = "CO-KRTAnalysisServicesAdminsUAT@kpmgusadvspectrum.onmicrosoft.com"
PaloAltoFirewallPIP1                    = "20.185.106.126"
PaloAltoFirewallPIP2                    = "20.185.110.197"
kartasemangementIP                      = "52.170.100.57"
ase_internal_ip                         = "10.25.0.11"
uniqueresourcesuffix                    = ""

#KeyVault
keyvaultadminsgroupname                 = "AAD DC Administrators"
key_vault_name_dev                      = "codeveuskey01krt"
key_vault_name_qa                       = "coqaeuskey01krt"
key_vault_name_uat                      = "couateuskey01krt"
key_vault_name_prod                     = "coprdeuskey01krt"
key_vault_name                          = "copeuskey01krt"
cloudops_keyvault_admin                 = "CO-TerraformStorage-Admin"
client_keyvault_admin                   = "AAD DC Administrators"

#Managed Identity
managed_identity_name_dev               = "azuser-svcKRTDEV"
managed_identity_name_qa                = "azuser-svcKRTQA"
managed_identity_name_uat               = "azuser-svcKRTUAT"

#LogAnalytics Workspace
log_analytics_workspace_name            =   "co-p-eastus-krt-law"
tenantfqdn                              =   "kpmgusadvcloudops.onmicrosoft.comtenantfqdn"

#AD Group
KRTDevelopers_description               = ""
BuildVMAdmins_description               = ""
RDPUsers_description                    = ""
ATOTeam_description                     = ""
BusinessUsers_description               = ""
DevopsProjectManagers_description       = ""
PBICapacityAdmins_description           = ""
ProjectTeam_description                 = ""
SQLReadOnlyDev_description              = ""

subscription_id = "9e27f52c-3c97-4fda-9c8f-eadcd0ad195a"
client_id       = "b2967f11-d801-4812-b532-3f3a676e8b46"
client_secret   = "__client_secret__"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"