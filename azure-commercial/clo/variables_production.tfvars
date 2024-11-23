subscription_id                                        = "5d3ae075-2601-49d3-9223-892e3d7f6fb1"
client_id                                              = "089028a6-c23d-4854-8ecf-2ed345a8b1bf"
tenant_id                                              = "b5031e57-d76f-422e-87c6-02b4cc749974"
client_secret                                          = ""

#environment specific variables
location                                               = "eastus"
location_acronym						               = "use"
environment                                            = "production"
environment_acronym						               = "p"
application								               = "Collateralized Loan Obligation"
application_acronym                                    = "clo"
tags= {
    Platform                = "Azure Commercial Cloud"
    Environment             = "Production"
    Node                    = "Spoke"
    Solution                = "Collateralized Loan Obligation Automation (CLO)"
    TechnicalOwner          = "Mirwais Bilal"
    TechnicalContact        = "mirwaisbilal@kpmg.com"
    BusinessOwner           = "Xin Gu (Cindy)"
    BusinessContact         = "xgu@kpmg.com"
    LOB                     = "Risk Advisory Solutions"
    Datadog                 = "Monitored"
}

encryptapp_service_principal_name                       = "DiskEncryptApp"

#App Service Plan
app_service_plan_tier                                   = "Standard"
app_service_plan_size                                   = "S2"
app_service_plan_capacity                               = 1

#SQL Server and Database
clo_sql_admin_login                                     = "clopsqladmin"
clo_sql_admin_login_password                            = ""
clo_paas_sql_database_edition                           = "GeneralPurpose"
clo_paas_sql_database_collation                         = "SQL_Latin1_General_CP1_CI_AS"
clo_paas_sql_database_max_size_bytes                    = "34359738368"
clo_paas_sql_database_requested_service_objective_name  = "GP_Gen5_2"

#KeyVault
eastus_acronym                                          = "eus"
client_keyvault_admin_group_name                        = "CO-RAS-VM-AdminsPD"
cloudops_keyvault_admin_group_name                      = "CO-TerraformStorage-Admin"
svc_cloweb_user_principal_name                          = "azuser-svc-CLOPWeb@kpmgusadvcloudops.onmicrosoft.com"
tech_owner                                              = "A-mirwaisbilal"

#Virtual Machine
count_value_appvm                                       = 1
count_value_bstnhosts                                   = 2
vm_image_id                                             = "/subscriptions/5d3ae075-2601-49d3-9223-892e3d7f6fb1/resourceGroups/co-p-eastus-clovmimage-rg/providers/Microsoft.Compute/images/cis-hardened-win2016-20190111-image"
admin_password                                          = ""

#Route Table
#next_hop_in_ip_address                                 = "10.30.16.100"
next_hop_in_ip_address                                  = "10.30.3.4"

#Virtual Network
address_space                                           = ["10.32.9.128/27","10.32.9.160/27","10.32.9.192/27","10.32.9.224/27"]
dns_servers                                             = ["10.30.15.197", "10.30.15.196"]
subnet_adress_space_cloappgw                            = ["10.32.9.160/27"]
subnet_adress_space_clomgmt                             = ["10.32.9.192/27"]
subnet_adress_space_cloweb                              = ["10.32.9.128/27"]

hub_vnet_id                                             = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
transit_vnet_id                                         = "/subscriptions/0d7a7f3c-a15d-4d37-924c-2507147fb74c/resourceGroups/CO-P-eastus-transitvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-transit-vnet"
hubsubscriptionid                                       = "4c9dc048-01dc-4854-9063-8a3d4060993a"
transitsubscriptionid                                   = "0d7a7f3c-a15d-4d37-924c-2507147fb74c"
hubvnetresourcegroup                                    = "CO-P-eastus-hubvnet-rg"
transitvnetresourcegroup                                = "CO-P-eastus-transitvnet-rg"
hubvnetname                                             = "CO-P-eastus-hub-vnet"
transitvnetname                                         = "CO-P-eastus-transit-vnet"

#Application Gateway
frontend_ip_configuration_name                          = "appGatewayFrontendIP"
app_http_setting_name                                   = "appGatewayBackendHttpsSettings"
app_backend_address_pool_name                           = "appGatewayBackendPool"
appgateway_sku                                          = "WAF_Medium"
AppGatewaycertpassword                                  = ""
cert_environment_acronym                                = ""
