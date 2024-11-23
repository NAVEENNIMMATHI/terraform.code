# Authentication
client_id       = "41da8a25-68fc-489c-b051-f97aeca67fd6"
client_secret   = "__client_secret__"
subscription_id = "0feb4855-aaa2-40f1-bec2-a8db1dfe472e"
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"

# Project Details
key_vault_name_project          = "codeveuskey01krt"
application_acronym             = "krt"
tenantfqdn                      = "kpmgusadvspectrum.onmicrosoft.com"
uniqueresourcesuffix            = ""

# Shared State Data Sources
shared_resource_group_name         = "co-np-eastus-krt-rg"
backup_shared_resource_group_name  = "co-np-eastus-krtbackuprecovery-rg"
kartsharename                      = "kart-projects-dev"
stage                              = "Dev"
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

# SQL Server Resources
sqlserver_admingroup_name               = "CO-KRTSQLAdminsDEV"
sqlserver_admingroup_name_description   = "KART SQL Admins"
sql_server_name                         = "codeveuskrtsqlserver1"
sql_server_admin_username               = "krtdevsqladmin1"
sqlserveradmin_password                 = "__sqlserveradmin_password__"
sql_elastic_pool_name                   = "codeveuskrtelasticpool1"
sql_elastic_pool_max_size               = "1536"
sqlelasticpool_sku_name                 = "GP_Gen5"
sqlelasticpool_sku_tier                 = "GeneralPurpose"
sqlelasticpool_sku_family               = "Gen5"
sqlelasticpool_sku_capacity             = "10"
sqlelasticpool_min_capacity             = "0"
sqlelasticpool_max_capacity             = "1"

#PaloInboundIPAddress
PaloAltoFirewallPIP1            = "20.185.109.156"
PaloAltoFirewallPIP2            = "20.185.106.213"
kartasemangementIP              = "52.224.65.67"

#App service
app_service_name                = "kartdev"
app_insights_name               = "co-np-eastus-krtdev-appinsights"

#Application 
krt_app_registration_name       = "KRT DEVWebApplication"
reply_urls                      = ["https://kartdev.kpmgcloudops.com/signin-oidc","http://localhost:52321/signout-oidc","https://kartdev.kpmgcloudops.com/CentralHome","http://localhost:52321/signin-oidc","http://localhost:52321/CentralHome"]
automation_account_name         = "codeveuskrtautacc1"
automation_account_obj_id       = "b8447927-1da1-432c-bf8d-34345cb25f6b"

# AD Group
keyvaultadminsgroupname             = "CO-Certificate-KeyVault"
analysisadminsgroupname             = "CO-KRTAnalysisServicesAdminsDEV"
development_group_name              = "CO-KRTDevelopers"
development_group_name_description  = "This Group will be used for KART Application Developers"
PBIWorkspaceMembers_description     = "For KART Power BI Workspace Members Group"
PBIWorkspaceAdmins_description      = "For KART PowerBI Workspace Admins Group"
managed_identity_name               = "azuser-svcKRTDEV"
krtbuildvm_objectid                 = "3d9c3b14-e1a5-4461-964e-9690162719b7"

#Virtual Network Name
virtual_network_name            = "co-np-eastus-krt-vnet"
app_subnet_name                 = "co-np-eastus-krtapp1-subnet"
ase_subnet_name                 = "co-np-eastus-krtase1-subnet"
agw_subnet_name                 = "co-np-eastus-krtagw1-subnet"
spiappsubnetid                  = "/subscriptions/0feb4855-aaa2-40f1-bec2-a8db1dfe472e/resourceGroups/CO-NP-eastus-CO-SPIVnet-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-co-spi-vnet/subnets/co-np-eastus-spiapp1-subnet"

#StorageAccount
preprocess_storage_account_name  = "codeveuskrtprepro01sa"
postprocess_storage_account_name = "codeveuskrtpostpro01sa"
arch_storage_account_name        = "codeveuskrtarchive01sa"
account_tier                     = "Standard"
replication_type                 = "RAGRS"
account_type                     = "Storage"
coreinfrasubnetid                = "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet/subnets/co-np-eastus-infra1-subnet"
core_aks_subnet_id               = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/sub-use-core-aks-dv"

# App Service Plan
app_service_plan_name               = "conpeastuskrtappsrvpln"
app_service_backup_name             = "kartdev"
webappbackup_storage_account_name   = "conpeuskrtwebappbkp01sa"
webappbackup_storage_container_name = "kartdevappbackup"

#Analysis Service
analysis_service_name               = "codeveuskrtanasvc1"
analysisservice_admin_username      = "CO-KRTAnalysisServicesAdmins"
analysisservice_admin_user_password = "__analysisservice_admin_user_password__"

# Address Space Variables
pre_kpmg_nat_ip_list             = ["203.199.72.210"]
post_kpmg_nat_ip_list            = ["103.216.201.101"]
arch_kpmg_nat_ip_list            = ["203.199.72.210"]
target_deployment_environment    = "dev"






