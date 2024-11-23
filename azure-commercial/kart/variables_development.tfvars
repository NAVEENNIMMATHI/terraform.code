#Authentication
client_id                                           = "e0628e55-2ee3-4131-8fdd-330265aed576"
client_secret                                       = ""
subscription_id                                     = "3507153c-e6a4-4e2f-ae04-f34c1fd4482f"
tenant_id                                           = "188697ab-840f-44ec-8535-aaaa5680bab0"

#Project Details
application			                                = "kpmg aggregation and reporting tool"
application_acronym                                 = "krt"

#Environment Specific Variables
target_deployment_environment                       = "dev"
fun_environment                                     = "Dev"
environment                                         = "development"
environment_acronym                                 = "dv"
application_url_environment_acronym                                = "dev"
location                                            = "eastus"
location_acronym                                    = "use"
tags = {
    Platform                                        = "Azure Commercial Cloud"
    Environment                                     = "Development"
    Node                                            = "Spoke"
    Solution                                        = "KPMG Aggregation And Reporting Tool (KART)"
    TechnicalOwner                                  = "Prajal Doshi"
    TechnicalContact                                = "prajaldoshi@kpmg.com"
    BusinessOwner                                   = "Jeremy Taylor"
    BusinessContact                                 = "jstaylor@kpmg.com"
    LOB                                             = "Deal Advisory & Strategy"
}
KART_Central_Connection_String                      = "Data Source=srv-use-krt-dv.database.windows.net,1433;initial catalog=KART_CENTRAL;Encrypt=True;TrustServerCertificate=True"
email_id                                            = "kartsupportdev@kpmg.com"

#Data Sources
spi_route_table_name                                = "rtb-use-spi-PaloAlto-dv"
spi_route_table_resource_group_name                 = "RGP-use-spi-vnet-dv"
cospi_log_analytics_workspace_name                  = "law-use-da-shared-dev"
cospi_log_analytics_workspace_resource_group_name   = "rgp-use-shared-da-dev"
encryptapp_service_principal_name                   = "EncryptApp"
backupmanagement_service_principal_name             = "Backup Management Service"
cloudops_keyvault_admin                             = "CO-Certificate-KeyVault"
client_keyvault_admin                               = "CO-DA-KeyVault-Admins"
keyvaultadminsgroupname                             = "CO-Certificate-KeyVault"

#Action Group
action_group_name                                   = "krtactiongroupdev"
custom_emails                                       = "go-fmmanagedservices@kpmg.com"

#AD Application
krt_app_registration_name                           = "KARTDEVWebApplication"
reply_urls                                          = ["https://kartdev.kpmgcloudops.com/signin-oidc","http://localhost:52321/signout-oidc","https://kartdev.kpmgcloudops.com/CentralHome","http://localhost:52321/signin-oidc","http://localhost:52321/CentralHome"]

#AD Group
KRTDevelopers_description                           = "This Group will be used for KART Application Developers"
analysisadminsgroupname                             = "CO-KRTAnalysisServicesAdminsDEV"
BuildVMAdmins_description                           = "Admins Group To have admin activity on Build VM"
RDPUsers_description                                = "KART Developer, QA, Business, Project Team RDP Users"
ATOTeam_description                                 = "For ATO User"
BusinessUsers_description                           = "For Business User"
DevopsProjectManagers_description                   = "Required for CI/CD pipeline release"
PBICapacityAdmins_description                       = "CO-KRTPBICapacityAdmins"
PBIWorkspaceMembers_name                            = "CO-KRTPBIWorkspaceMembersDEV"
PBIWorkspaceMembers_description                     = "For KART Power BI Workspace Members Group"
PBIWorkspaceAdmins_name                             = "CO-KRTPBIWorkspaceAdminsDEV"
PBIWorkspaceAdmins_description                      = "For KART PowerBI Workspace Admins Group"
ProjectTeam_description                             = "For KART Application Project Team Members"
SQLReadOnlyDev_description                          = "Would be used by Power BI Developers"
sqlserver_admingroup_name                           = "CO-KRTSQLAdminsDEV"
sqlserver_admingroup_name_description               = "KART SQL Admins"
development_group_name                              = "CO-KRTDevelopers"
development_group_name_description                  = "This Group will be used for KART Application Developers"

#AD User
analysisservice_admin_username                      = "CO-KRTAnalysisServicesAdminsDEV"
analysisservice_admin_user_password                 = ""
tenantfqdn                                          = "kpmgusadvspectrum.onmicrosoft.com"

#Analysis Service
automation_account_app_id     = "e151a841-4ed6-43dd-ae7b-b742d46fe226"
analysis_services_admins_name = "CO-KRTAnalysisServicesAdminsMS365DEV"
ipv4_firewall_rules           = [
    {
        name       = "kartasemangementIP",
        ip         = "52.224.124.50"
    },
    {
        name       = "AzureFirewallPIP1",
        ip         = "52.190.37.51"
    },
    {
        name       = "AzureFirewallPIP2",
        ip         = "52.190.37.75"
    },
    {
        name       = "AzureFirewallPIP3",
        ip         = "52.146.53.140"
    },
    {
        name       = "AzureFirewallPIP4",
        ip         = "52.146.53.139"
    },
    {
        name       = "AzureFirewallPIP5",
        ip         = "52.146.53.16"
    }
]

#App Service Plan
asp_tier                                            = "Isolated"
asp_size                                            = "I1"

#Application Gateway
app_gateway_hostname                                = "kartdev.kpmgcloudops.com"
ase_cert_name                                       = "kpmgcloudops.com.cer"
app_gateway_certname                                = "kartdev.kpmgcloudops.com.pfx"
ase_internal_ip                                     = "10.51.2.11"
# selfsigncertname                                  = "star_kpmgcloudops_com"
# selfsignauthcertcer                               = "star.kpmgcloudops.com.cer"

#App Service Environment
dns_suffix                                          = "kpmgcloudops.com"

#KeyVault
krtbuildvm_objectid                                 = "2085c9b5-c82d-4c16-aef0-a720ce7cf2bd"

#Network Security Rule
KPMG_Trusted_NW_address_prefixes                    = ["20.185.109.156/32","199.207.253.0/24","20.185.106.213/32","103.58.118.0/24","199.206.0.5/32","103.216.201.101/32"]

#Network Security Rule for Azure Firewall
kpmg_trusted_az_fw_nw_address_prefixes              = ["52.190.37.51/32","52.190.37.75/32","52.146.53.140/32","52.146.53.139/32","52.146.53.16/32"]

#Route Table
next_hop_in_ip_address                              = "10.6.24.4"

#Sql Elastic Pool
sql_elastic_pool_max_size                           = "1536"
sqlelasticpool_sku_name                             = "GP_Gen5"
sqlelasticpool_sku_tier                             = "GeneralPurpose"
sqlelasticpool_sku_family                           = "Gen5"
sqlelasticpool_sku_capacity                         = "10"
sqlelasticpool_min_capacity                         = "0"
sqlelasticpool_max_capacity                         = "1"

#Sql Server
sql_server_admin_username                           = "krtdevsqladmin1"
sqlserveradmin_password                             = ""
spiappsubnetid                                      = "/subscriptions/3507153c-e6a4-4e2f-ae04-f34c1fd4482f/resourceGroups/RGP-use-spi-vnet-dv/providers/Microsoft.Network/virtualNetworks/vnt-use-spi-dv/subnets/sub-use-spi-app-dv" #sub-use-app1-subnet-dv

#Storage Account
account_type                                        = "StorageV2"
account_tier                                        = "Standard"
replication_type                                    = "RAGRS"
kpmg_nat_ip_list                                    = ["203.199.72.210"]
pre_kpmg_nat_ip_list                                = ["203.199.72.210"]
post_kpmg_nat_ip_list                               = ["103.216.201.101"]
arch_kpmg_nat_ip_list                               = ["203.199.72.210"]
coreinfrasubnetid                                   = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/co-dv-eastus-infra1-subnet"
wvd_subnet_id                                       = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"
kartsharename                                       = "kart-projects-dev"
core_aks_subnet_id                                  = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/sub-use-core-aks-dv"
squid_proxy_vm_subnet                               = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/squid-proxy-vm-subnet"

#Subnet
krtagw1_subnet_adress_space                         = "10.51.2.96/27"
krtapp1_subnet_adress_space                         = "10.51.2.64/27"
krtase1_subnet_adress_space                         = "10.51.2.0/26"

#Virtual Machine
count_value_krtapp1vm                               = "1"
count_value_krtwrkstnvm                             = "1"
vm_size_app                                         = "Standard_D8s_v3"
vm_size_wrkstn                                      = "Standard_D8s_v3"
admin_password                                      = ""

#Virtual Network
address_space                                       = ["10.51.2.0/24"]
dns_server                                          = ["10.1.11.4","10.1.11.5"]

#Virtual Network Peering
coresubscriptionid                                  = "4cdcf904-fa57-4815-8cb3-e33b9b44f479"
transitsubscriptionid                               = "25f8d797-bee2-4a88-84cc-de328abd6731"
newcoresubscriptionid                               = "c72acede-d539-45d9-963d-3464ec4ddae0"
corevnetresourcegroup                               = "co-np-eastus-core1-rg"
transitvnetresourcegroup                            = "CO-NP-eastus-CONPTVnet-rg"
newcorevnetresourcegroup                            = "CO-dv-eastus-hubvnet-rg"
corevnetname                                        = "co-np-eastus-core1-vnet"
transitvnetname                                     = "CO-NP-eastus-transit1-Vnet"
newcorevnetname                                     = "CO-dv-eastus-hub-vnet"

#Azure Firewall Private IP
azfirewall_ip_address = "10.6.24.4"