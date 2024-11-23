#Authentication
client_id                                           = "b2967f11-d801-4812-b532-3f3a676e8b46"
client_secret                                       = ""
subscription_id                                     = "9e27f52c-3c97-4fda-9c8f-eadcd0ad195a"
tenant_id                                           = "b5031e57-d76f-422e-87c6-02b4cc749974"

#Project Details
application                                         = "kpmg aggregation and reporting tool"
application_acronym                                 = "krt"

#Environment Specific Variables
target_deployment_environment                       = "prod"
fun_environment                                     = "Prod"
environment                                         = "production"
environment_acronym                                 = "p"
application_url_environment_acronym                                = ""
location                                            = "eastus"
location_acronym                                    = "eus"
tags = {
    Platform                                        = "Azure Commercial Cloud"
    Environment                                     = "Production"
    Node                                            = "Spoke"
    Solution                                        = "KPMG Aggregation And Reporting Tool (KART)"
    TechnicalOwner                                  = "Prajal Doshi"
    TechnicalContact                                = "prajaldoshi@kpmg.com"
    BusinessOwner                                   = "Jeremy Taylor"
    BusinessContact                                 = "jstaylor@kpmg.com"
    LOB                                             = "Deal Advisory & Strategy"
    TagAutomationStatus                             = "Successful"
    Datadog                                         = "Monitored"
}
KART_Central_Connection_String = "Data Source=copeuskrtsqlserver1.database.windows.net,1433;initial catalog=KART_CENTRAL;Encrypt=True;TrustServerCertificate=True "
email_id                                            = "kartsupportprod@kpmg.com"

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
krt_app_registration_name                           = "KRTWebApplication"
reply_urls                                          = ["https://kart.kpmgcloudops.com/CentralHome","https://kart.kpmgcloudops.com/signin-oidc"]

#AD Group
KRTDevelopers_description                           = ""
analysisadminsgroupname                             = "CO-KRTAnalysisServicesAdmins"
BuildVMAdmins_description                           = ""
RDPUsers_description                                = ""
ATOTeam_description                                 = ""
BusinessUsers_description                           = ""
DevopsProjectManagers_description                   = ""
PBICapacityAdmins_description                       = ""
PBIWorkspaceMembers_name                            = "CO-KRTPBIWorkspaceMembers"
PBIWorkspaceMembers_description                     = ""
PBIWorkspaceAdmins_name                             = "CO-KRTPBIWorkspaceAdmins"
PBIWorkspaceAdmins_description                      = ""
ProjectTeam_description                             = ""
SQLReadOnlyDev_description                          = ""
sqlserver_admingroup_name                           = "CO-KRTSQLAdmins"
sqlserver_admingroup_name_description               = ""
development_group_name                              = "CO-KRTDevelopers"
development_group_name_description                  = ""

#AD User
analysisservice_admin_username                      = "CO-KRTAnalysisServicesAdmins"
analysisservice_admin_user_password                 = ""
tenantfqdn                                          = "kpmgusadvcloudops.onmicrosoft.com"

#Analysis Service
automation_account_app_id                           = "18a7cc6b-5ed9-4543-80a8-823c7811e425"
analysis_services_admins_name                       = "CO-KRTAnalysisServicesAdmins"
ipv4_firewall_rules         = [
    {
        name       = "PaloAltoFirewallPIP1",
        ip         = "20.185.106.126"
    },
    {
        name       = "PaloAltoFirewallPIP2",
        ip         = "20.185.110.197"
    },
    {
        name       = "kartasemangementIP",
        ip         = "52.170.100.57"
    },
    {
        name       = "AzureFirewallPIP1",
        ip         = "52.224.25.180"
    },
    {
        name       = "AzureFirewallPIP2",
        ip         = "52.224.25.158"
    },
    {
        name       = "AzureFirewallPIP3",
        ip         = "52.224.25.140"
    },
    {
        name       = "AzureFirewallPIP4",
        ip         = "20.42.39.126"
    },
    {
        name       = "AzureFirewallPIP5",
        ip         = "52.224.25.167"
    }
]

#App Service Plan
asp_tier                                            = "Isolated"
asp_size                                            = "I3"

#Application Gateway
app_gateway_hostname                                = "kart.kpmgcloudops.com"
ase_cert_name                                       = "kpmgcloudops.com.cer"
app_gateway_certname                                = "kart.kpmgcloudops.com.pfx"
ase_internal_ip                                     = "10.25.0.11"
# selfsigncertname                                    = "star_kpmgcloudops_com"
# selfsignauthcertcer                                 = "star.kpmgcloudops.com.cer"

#App Service Environment
dns_suffix                                          = "kpmgcloudops.com"

#Keyvault
krtbuildvm_objectid                                 = "bc0e53bd-e052-478d-8fd2-046d0b7d45df"

#Network Security Rule
KPMG_Trusted_NW_address_prefixes                    = ["103.216.201.101/32","199.207.253.0/24","199.206.0.5/32","103.58.118.0/24","20.185.110.197/32","20.185.106.126/32"]

#Network Security Rule for Azure Firewall
kpmg_trusted_az_fw_nw_address_prefixes              = ["52.224.25.180/32","52.224.25.158/32","52.224.25.140/32","20.42.39.126/32","52.224.25.167/32"]

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
sql_server_admin_username                           = "krtsqladmin01"
sqlserveradmin_password                             = ""
spiappsubnetid                                      = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-spi-vnet/subnets/co-p-eastus-spiapp1-subnet"

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
kartsharename                                       = "kart-projects-prod"
core_aks_subnet_id                                  = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/sub-use-core-aks-pd"
squid_proxy_vm_subnet                               = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/squid-proxy-vm-subnet"

#Subnet
krtagw1_subnet_adress_space                         = "10.25.0.128/26"
krtapp1_subnet_adress_space                         = "10.25.0.192/27"
krtase1_subnet_adress_space                         = "10.25.0.0/25"

#Virtual Machine
count_value_krtapp1vm                               = "1"
count_value_krtwrkstnvm                             = "4"
vm_size_app                                         = "Standard_D16s_v3"
vm_size_wrkstn                                      = "Standard_D16s_v3"
admin_password                                      = ""

#Virtual Network
address_space                                       = ["10.25.0.0/24"]
dns_server                                          = ["10.30.15.196","10.30.15.197"]

#Virtual Network Peering
coresubscriptionid                                  = "4c9dc048-01dc-4854-9063-8a3d4060993a"
transitsubscriptionid                               = "0d7a7f3c-a15d-4d37-924c-2507147fb74c"
newcoresubscriptionid                               = "4c9dc048-01dc-4854-9063-8a3d4060993a"
corevnetresourcegroup                               = "CO-P-eastus-hubvnet-rg"
transitvnetresourcegroup                            = "CO-P-eastus-transitvnet-rg"
newcorevnetresourcegroup                            = "CO-P-eastus-hubvnet-rg"
corevnetname                                        = "CO-P-eastus-hub-vnet"
transitvnetname                                     = "CO-P-eastus-transit-vnet"
newcorevnetname                                     = "CO-P-eastus-hub-vnet"

#Azure Firewall Private IP
azfirewall_ip_address = "10.30.3.4"