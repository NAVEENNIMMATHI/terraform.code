#Authentication
client_id                                           = "76ea9629-a4e1-4a9a-ba2f-39840e53342a"
client_secret                                       = ""
subscription_id                                     = "adf88b05-d3d7-4dee-ba30-ea939f9a1b1c"
tenant_id                                           = "188697ab-840f-44ec-8535-aaaa5680bab0"

#Project Details
application			                                = "kpmg aggregation and reporting tool"
application_acronym                                 = "krt"

#Environment Specific Variables
target_deployment_environment                       = "qa"
fun_environment                                     = "QA"
environment                                         = "qa"
environment_acronym                                 = "qa"
application_url_environment_acronym                                = "qa"
location                                            = "eastus"
location_acronym                                    = "use"
tags = {
    Platform                                        = "Azure Commercial Cloud"
    Environment                                     = "QA"
    Node                                            = "Spoke"
    Solution                                        = "KPMG Aggregation And Reporting Tool (KART)"
    TechnicalOwner                                  = "Prajal Doshi"
    TechnicalContact                                = "prajaldoshi@kpmg.com"
    BusinessOwner                                   = "Jeremy Taylor"
    BusinessContact                                 = "jstaylor@kpmg.com"
    LOB                                             = "Deal Advisory & Strategy"
}
KART_Central_Connection_String = "Data Source=srv-use-krt-qa.database.windows.net,1433;initial catalog=KART_CENTRAL;Encrypt=True;TrustServerCertificate=True "
email_id                                            = "kartsupportqa@kpmg.com"

#Data Sources
spi_route_table_name                                = "rtb-use-spi-PaloAlto-qa"
spi_route_table_resource_group_name                 = "RGP-use-spi-vnet-qa"
cospi_log_analytics_workspace_name                  = "law-use-da-shared-qa"
cospi_log_analytics_workspace_resource_group_name   = "rgp-use-shared-da-qa"
encryptapp_service_principal_name                   = "EncryptApp"
backupmanagement_service_principal_name             = "Backup Management Service"
cloudops_keyvault_admin                             = "CO-Certificate-KeyVault"
client_keyvault_admin                               = "CO-DA-KeyVault-Admins"
keyvaultadminsgroupname                             = "CO-Certificate-KeyVault"

#Action Group
action_group_name                                   = "krtactiongroupqa"
custom_emails                                       = "go-fmmanagedservices@kpmg.com"

#AD Application
krt_app_registration_name                           = "KARTQAWebApplication"
reply_urls                                          = ["https://kartqa.kpmgcloudops.com/CentralHome","https://kartqa.kpmgcloudops.com/signin-oidc"]

#AD Group
KRTDevelopers_description                           = "This Group will be used for KART Application Developers"
analysisadminsgroupname                             = "CO-KRTAnalysisServicesAdminsQA"
BuildVMAdmins_description                           = "Admins Group To have admin activity on Build VM"
RDPUsers_description                                = "KART Developer, QA, Business, Project Team RDP Users"
ATOTeam_description                                 = "For ATO User"
BusinessUsers_description                           = "For Business User"
DevopsProjectManagers_description                   = "Required for CI/CD pipeline release"
PBICapacityAdmins_description                       = "CO-KRTPBICapacityAdmins"
PBIWorkspaceMembers_name                            = "CO-KRTPBIWorkspaceMembersQA"
PBIWorkspaceMembers_description                     = "For KART Power BI Workspace Members Group"
PBIWorkspaceAdmins_name                             = "CO-KRTPBIWorkspaceAdminsQA"
PBIWorkspaceAdmins_description                      = "For KART PowerBI Workspace Admins Group"
ProjectTeam_description                             = "For KART Application Project Team Members"
SQLReadOnlyDev_description                          = "Would be used by Power BI Developers"
sqlserver_admingroup_name                           = "CO-KRTSQLAdminsQA"
sqlserver_admingroup_name_description               = "KART SQL Admins"
development_group_name                              = "CO-KRTDevelopers"
development_group_name_description                  = "This Group will be used for KART Application Developers"

#AD User
analysisservice_admin_username                      = "CO-KRTAnalysisServicesAdminsQA"
analysisservice_admin_user_password                 = ""
tenantfqdn                                          = "kpmgusadvspectrum.onmicrosoft.com"

#Analysis Service
automation_account_app_id                           = "b8447927-1da1-432c-bf8d-34345cb25f6b"
analysis_services_admins_name                       = "CO-KRTAnalysisServicesAdminsMS365QA"
ipv4_firewall_rules         = [
    {
        name       = "kartasemangementIP",
        ip         = "40.87.108.34"
    },
    {
        name       = "AzureFirewallPIP1",
        ip         = "40.76.169.86"
    },
    {
        name       = "AzureFirewallPIP2",
        ip         = "40.76.168.231"
    },
    {
        name       = "AzureFirewallPIP3",
        ip         = "40.76.169.36"
    },
    {
        name       = "AzureFirewallPIP4",
        ip         = "40.76.169.44"
    },
    {
        name       = "AzureFirewallPIP5",
        ip         = "40.76.169.103"
    }
]

#App Service Plan
asp_tier                                            = "Isolated"
asp_size                                            = "I1"

#Application Gateway
app_gateway_hostname                                = "kartqa.kpmgcloudops.com"
ase_cert_name                                       = "kpmgcloudops.com.cer"
app_gateway_certname                                = "kartqa.kpmgcloudops.com.pfx"
ase_internal_ip                                     = "10.71.2.11"
# selfsigncertname                                    = "star_kpmgcloudops_com"
# selfsignauthcertcer                                 = "star.kpmgcloudops.com.cer"

#App Service Environment
dns_suffix                                          = "kpmgcloudops.com"

#KeyVault
krtbuildvm_objectid                                 = "573a216b-b6c4-43fd-957d-be55f47bbfcc"

#Network Security Role
KPMG_Trusted_NW_address_prefixes                    = ["20.185.109.156/32","199.207.253.0/24","20.185.106.213/32","103.58.118.0/24","199.206.0.5/32","103.216.201.101/32"]

#Network Security Rule for Azure Firewall
kpmg_trusted_az_fw_nw_address_prefixes              = ["40.76.169.86/32","40.76.168.231/32","40.76.169.36/32","40.76.169.44/32","40.76.169.103/32"]

#Route Table
next_hop_in_ip_address                              = "10.101.2.196"

#Sql Elastic Pool
sql_elastic_pool_max_size                           = "1536"
sqlelasticpool_sku_name                             = "GP_Gen5"
sqlelasticpool_sku_tier                             = "GeneralPurpose"
sqlelasticpool_sku_family                           = "Gen5"
sqlelasticpool_sku_capacity                         = "10"
sqlelasticpool_min_capacity                         = "0"
sqlelasticpool_max_capacity                         = "1"

#Sql Server
sql_server_admin_username                           = "krtqasqladmin1"
sqlserveradmin_password                             = ""
spiappsubnetid                                      = "/subscriptions/adf88b05-d3d7-4dee-ba30-ea939f9a1b1c/resourceGroups/RGP-USE-SPI-VNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-spi-qa/subnets/sub-use-spi-app-qa"

#Storage Account
account_type                                        = "StorageV2"
account_tier                                        = "Standard"
replication_type                                    = "RAGRS"
kpmg_nat_ip_list                                    = ["203.199.72.210"]
pre_kpmg_nat_ip_list                                = ["203.199.72.210"]
post_kpmg_nat_ip_list                               = ["103.216.201.101"]
arch_kpmg_nat_ip_list                               = ["203.199.72.210"]
coreinfrasubnetid                                   = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-infra1-qa"
wvd_subnet_id                                       = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"
kartsharename                                       = "kart-projects-qa"
core_aks_subnet_id                                  = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-core-aks-qa"
squid_proxy_vm_subnet                               = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-squidproxyvm-qa"

#Subnet
krtagw1_subnet_adress_space                         = "10.71.2.96/27"
krtapp1_subnet_adress_space                         = "10.71.2.64/27"
krtase1_subnet_adress_space                         = "10.71.2.0/26"

#Virtual Machinee
count_value_krtapp1vm                               = "1"
count_value_krtwrkstnvm                             = "1"
vm_size_app                                         = "Standard_D8s_v3"
vm_size_wrkstn                                      = "Standard_D8s_v3"
admin_password                                      = ""

#Virtual Network
address_space                                       = ["10.71.2.0/24"]
dns_server                                          = ["10.1.11.4","10.1.11.5"]

#Virtual Network Peering
coresubscriptionid                                  = "4cdcf904-fa57-4815-8cb3-e33b9b44f479"
transitsubscriptionid                               = "25f8d797-bee2-4a88-84cc-de328abd6731"
newcoresubscriptionid                               = "5ce45d57-3192-4bfe-9c2f-cb567b30c586"
corevnetresourcegroup                               = "co-np-eastus-core1-rg"
transitvnetresourcegroup                            = "CO-NP-eastus-CONPTVnet-rg"
newcorevnetresourcegroup                            = "RGP-USE-COREVNET-QA"
corevnetname                                        = "co-np-eastus-core1-vnet"
transitvnetname                                     = "CO-NP-eastus-transit1-Vnet"
newcorevnetname                                     = "vnt-use-core-qa"

#Azure Firewall Private IP
azfirewall_ip_address = "10.101.2.196"