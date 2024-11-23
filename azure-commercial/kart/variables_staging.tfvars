#Authentication
client_id                                           = "b964573c-e75c-4c3c-a59f-5d69a287e284"
client_secret                                       = ""
subscription_id                                     = "84c5a4ce-8d9d-45f0-b15a-552d0f67db83"
tenant_id                                           = "b5031e57-d76f-422e-87c6-02b4cc749974"

#Project Details
application			                                = "kpmg aggregation and reporting tool"
application_acronym                                 = "krt"

#Environment Specific Variables
target_deployment_environment                       = "prod"
environment                                         = "staging"
environment_acronym                                 = "stg"
location                                            = "eastus"
location_acronym                                    = "use"
tags = {
    Platform                                        = "Azure Commercial Cloud"
    Environment                                     = "Staging"
    Node                                            = "Spoke"
    Solution                                        = "KPMG Aggregation And Reporting Tool (KART)"
    TechnicalOwner                                  = "Prajal Doshi"
    TechnicalContact                                = "prajaldoshi@kpmg.com"
    BusinessOwner                                   = "Jeremy Taylor"
    BusinessContact                                 = "jstaylor@kpmg.com"
    LOB                                             = "Deal Advisory & Strategy"
}

#Data Sources
spi_route_table_name                                = "co-p-eastus-spitoPaloAlto-udr"
spi_route_table_resource_group_name                 = "CO-P-eastus-cospivnet-rg"
cospi_log_analytics_workspace_name                  = "CO-P-eastus-cospi1-workspace"
cospi_log_analytics_workspace_resource_group_name   = "co-p-eastus-cospiloganalytics-rg"
encryptapp_service_principal_name                   = "DiskEncryptApp"
backupmanagement_service_principal_name             = "Backup Management Service"
cloudops_keyvault_admin                             = "CO-TerraformStorage-Admin"
client_keyvault_admin                               = "AAD DC Administrators"
keyvaultadminsgroupname                             = "AAD DC Administrators"

#Action Group
action_group_name                                   = "krtactiongroup"
custom_emails                                       = "go-fmmanagedservices@kpmg.com"

#AD Application
krt_app_registration_name                           = "KARTSTGWebApplication"
reply_urls                                          = ["https://kartstg.kpmgcloudops.com/CentralHome","https://kartstg.kpmgcloudops.com/signin-oidc"]

#AD Group
KRTDevelopers_description                           = "This Group will be used for KART Application Developers"
analysisadminsgroupname                             = "CO-KRTAnalysisServicesAdminsSTG"
BuildVMAdmins_description                           = "Admins Group To have admin activity on Build VM"
RDPUsers_description                                = "KART Developer, QA, Business, Project Team RDP Users"
ATOTeam_description                                 = "For ATO User"
BusinessUsers_description                           = "For Business User"
DevopsProjectManagers_description                   = "Required for CI/CD pipeline release"
PBICapacityAdmins_description                       = "CO-KRTPBICapacityAdmins"
PBIWorkspaceMembers_name                            = "CO-KRTPBIWorkspaceMembersSTG"
PBIWorkspaceMembers_description                     = "For KART Power BI Workspace Members Group"
PBIWorkspaceAdmins_name                             = "CO-KRTPBIWorkspaceAdminsSTG"
PBIWorkspaceAdmins_description                      = "For KART PowerBI Workspace Admins Group"
ProjectTeam_description                             = "For KART Application Project Team Members"
SQLReadOnlyDev_description                          = "Would be used by Power BI Developers"
sqlserver_admingroup_name                           = "CO-KRTSQLAdminsSTG"
sqlserver_admingroup_name_description               = "KART SQL Admins"
development_group_name                              = "CO-KRTDevelopers"
development_group_name_description                  = "This Group will be used for KART Application Developers"

#AD User
analysisservice_admin_username                      = "CO-KRTAnalysisServicesAdminsSTG"
analysisservice_admin_user_password                 = ""
tenantfqdn                                          = "kpmgusadvcloudops.onmicrosoft.com"

#Analysis Service
automation_account_app_id                           = "18a7cc6b-5ed9-4543-80a8-823c7811e425"
PaloAltoFirewallPIP1                                = "20.185.106.126"
PaloAltoFirewallPIP2                                = "20.185.110.197"
kartasemangementIP                                  = "52.170.100.57"

#App Service Plan
asp_tier                                            = "Isolated"
asp_size                                            = "I3"

#Application Gateway
app_gateway_hostname                                = "kartstg.kpmgcloudops.com"
ase_cert_name                                       = "kartstg.kpmgcloudops.com.cer"
app_gateway_certname                                = "kartstg.kpmgcloudops.com.pfx"
ase_internal_ip                                     = "10.25.0.11"
# selfsigncertname                                    = "star_kpmgcloudops_com"
# selfsignauthcertcer                                 = "star.kpmgcloudops.com.cer"

#App Service Environment
dns_suffix                                          = "kpmgcloudops.com"

#KeyVault
krtbuildvm_objectid                                 = "bc0e53bd-e052-478d-8fd2-046d0b7d45df"

#Network Security Rule
KPMG_Trusted_NW_address_prefixes                    = ["103.216.201.101/32","199.207.253.0/24","199.206.0.5/32","103.58.118.0/24","20.185.110.197/32","20.185.106.126/32"]

#Route Table
next_hop_in_ip_address                              = "10.30.16.100"

#Sql Elastic Pool
sql_elastic_pool_max_size                           = "3072"
sqlelasticpool_sku_name                             = "GP_Gen5"
sqlelasticpool_sku_tier                             = "GeneralPurpose"
sqlelasticpool_sku_family                           = "Gen5"
sqlelasticpool_sku_capacity                         = "20"
sqlelasticpool_min_capacity                         = "0.25"
sqlelasticpool_max_capacity                         = "1"

#Sql Server
sql_server_admin_username                           = "krtstgsqladmin1"
sqlserveradmin_password                             = ""
spiappsubnetid                                      = "/subscriptions/84c5a4ce-8d9d-45f0-b15a-552d0f67db83/resourceGroups/RGP-use-spi-vnet-stg/providers/Microsoft.Network/virtualNetworks/vnt-use-spi-stg/subnets/sub-use-app1-subnet-stg"

#Storage Account
account_type                                        = "StorageV2"
account_tier                                        = "Standard"
replication_type                                    = "RAGRS"
kpmg_nat_ip_list                                    = []
pre_kpmg_nat_ip_list                                = []
post_kpmg_nat_ip_list                               = []
arch_kpmg_nat_ip_list                               = []
coreinfrasubnetid                                   = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/co-p-eastus-infra1-subnet"
wvd_subnet_id                                       = ""
kartsharename                                       = "kart-projects-stg"
core_aks_subnet_id                                  = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/sub-use-core-aks-pd"

#Subnet
krtagw1_subnet_adress_space                         = "10.71.2.96/27"
krtapp1_subnet_adress_space                         = "10.71.2.64/27"
krtase1_subnet_adress_space                         = "10.71.2.0/26"

#Virtual Machine
count_value_krtapp1vm                               = "1"
count_value_krtwrkstnvm                             = "2"
vm_size_app                                         = "Standard_D16s_v3"
vm_size_wrkstn                                      = "Standard_D16s_v3"
admin_password                                      = ""

#Virtual Network
address_space                                       = ["10.71.2.0/24"]
dns_server                                          = ["10.30.15.196","10.30.15.197"]

#Virtual Network Peering
coresubscriptionid                                  = "4c9dc048-01dc-4854-9063-8a3d4060993a"
transitsubscriptionid                               = "0d7a7f3c-a15d-4d37-924c-2507147fb74c"
corevnetresourcegroup                               = "CO-P-eastus-hubvnet-rg"
transitvnetresourcegroup                            = "CO-P-eastus-transitvnet-rg"
corevnetname                                        = "CO-P-eastus-hub-vnet"
transitvnetname                                     = "CO-P-eastus-transit-vnet"

#Azure Firewall Private IP
azfirewall_ip_address = "10.100.2.196"