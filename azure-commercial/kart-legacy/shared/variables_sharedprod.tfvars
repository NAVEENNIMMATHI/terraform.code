#Authentication
client_id       = "b2967f11-d801-4812-b532-3f3a676e8b46"
client_secret   = "__client_secret__"
subscription_id = "9e27f52c-3c97-4fda-9c8f-eadcd0ad195a"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

#Project Details
key_vault_name_project          = "coprdeuskey01krt"
application_acronym             = "krt"
tenantfqdn                      = "kpmgusadvcloudops.onmicrosoft.com"
uniqueresourcesuffix            = ""

# Shared State Data Sources
shared_resource_group_name          = "co-p-eastus-krt-rg"
backup_shared_resource_group_name   = "co-p-eastus-krtbackuprecovery-rg"
kartsharename                       = "kart-projects-prod"
stage                               = "PRD"
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
}

# SQL Server Resources
sqlserver_admingroup_name               = "CO-KRTSQLAdmins"
sqlserver_admingroup_name_description   = ""
sql_server_name                         = "copeuskrtsqlserver1"
sql_server_admin_username               = "krtsqladmin01"
sqlserveradmin_password                 = ""
sql_elastic_pool_name                   = "copeuskrtelasticpool"
sql_elastic_pool_max_size               = "3072"
sqlelasticpool_sku_name                 = "GP_Gen5"
sqlelasticpool_sku_tier                 = "GeneralPurpose"
sqlelasticpool_sku_family               = "Gen5"
sqlelasticpool_sku_capacity             = "20"
sqlelasticpool_min_capacity             = "0.25"
sqlelasticpool_max_capacity             = "1"

#PaloInboundIPAddress
PaloAltoFirewallPIP1            = "20.185.106.126"
PaloAltoFirewallPIP2            = "20.185.110.197"
kartasemangementIP              = "52.170.100.57"

#App service
app_service_name                = "kart"
app_insights_name               = "co-p-eastus-krt-appinsights"

#Application 
krt_app_registration_name       = "KRTWebApplication"
reply_urls                      = ["https://kart.kpmgcloudops.com/CentralHome","https://kart.kpmgcloudops.com/signin-oidc"]
automation_account_obj_id       = "18a7cc6b-5ed9-4543-80a8-823c7811e425"

# AD Group
keyvaultadminsgroupname             = "AAD DC Administrators"
analysisadminsgroupname             = "CO-KRTAnalysisServicesAdmins"
development_group_name              = "CO-KRTDevelopers"
development_group_name_description  = ""
PBIWorkspaceMembers_description     = ""
PBIWorkspaceAdmins_description      = ""
managed_identity_name               = "azuser-svcKRT"
krtbuildvm_objectid                 = "bc0e53bd-e052-478d-8fd2-046d0b7d45df"

#Virtual Network Name
virtual_network_name            = "co-p-eastus-krt-vnet"
app_subnet_name                 = "co-p-eastus-krtapp1-subnet"
ase_subnet_name                 = "co-p-eastus-krtase1-subnet"
agw_subnet_name                 = "co-p-eastus-krtagw1-subnet"
spiappsubnetid                  = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-spi-vnet/subnets/co-p-eastus-spiapp1-subnet"

#StorageAccount
preprocess_storage_account_name  = "copeuskrtprepro01sa"
postprocess_storage_account_name = "copeuskrtpostpro01sa"
arch_storage_account_name        = "copeuskrtarchive01sa"
account_tier                     = "Standard"
replication_type                 = "RAGRS"
account_type                     = "Storage"
coreinfrasubnetid                = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/co-p-eastus-infra1-subnet"
core_aks_subnet_id               = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/sub-use-core-aks-pd"

# App Service Plan
app_service_plan_name               = "copeastuskrtappsrvpln"
app_service_backup_name             = "kart"
webappbackup_storage_account_name   = "copeuskrtwebappbkp01sa"
webappbackup_storage_container_name = "kartappbackup"
automation_account_name             = "copeuskrtautacc1"

#Analysis Service
analysis_service_name                   = "copeuskrtanasvc1"
analysisservice_admin_username          = "CO-KRTAnalysisServicesAdmins"
analysisservice_admin_user_password     = "__analysisservice_admin_user_password__"

# Address Space Variables
pre_kpmg_nat_ip_list             = []
post_kpmg_nat_ip_list            = []
arch_kpmg_nat_ip_list            = []
target_deployment_environment    = "prod"






