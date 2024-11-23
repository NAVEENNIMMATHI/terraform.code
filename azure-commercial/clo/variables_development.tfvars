subscription_id                                        = "57fad7dc-7eeb-4a2c-b3b7-405d9f8d3cc8"
client_id                                              = "c79c197f-2835-49dc-846a-06644d7f10c4"
tenant_id                                              = "188697ab-840f-44ec-8535-aaaa5680bab0"
client_secret                                          = ""

#environment specific variables
location                                               = "eastus"
location_acronym						               = "use"
environment                                            = "development"
environment_acronym						               = "dv"
application								               = "Collateralized Loan Obligation"
application_acronym                                    = "clo"
tags= {
    Platform                = "Azure Commercial Cloud"
    Environment             = "Development"
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
clo_sql_admin_login                                     = "clodvsqladmin"
clo_sql_admin_login_password                            = ""
clo_paas_sql_database_edition                           = "GeneralPurpose"
clo_paas_sql_database_collation                         = "SQL_Latin1_General_CP1_CI_AS"
clo_paas_sql_database_max_size_bytes                    = "34359738368"
clo_paas_sql_database_requested_service_objective_name  = "GP_Gen5_2"

#KeyVault
eastus_acronym                                          = "eus"
cloudops_keyvault_admin_group_name                      = "CO-Certificate-KeyVault"
client_keyvault_admin_group_name                        = "CO-RAS-VM-Admins"
svc_cloweb_user_principal_name                          = "azuser-svcCLOWeb@kpmgusadvspectrum.onmicrosoft.com"
tech_owner                                              = "a-mirwaisbilal"

#Virtual Machine
count_value_appvm                                       = 1
count_value_bstnhosts                                   = 2
#vm_image_id                                             = "/subscriptions/5d3ae075-2601-49d3-9223-892e3d7f6fb1/resourceGroups/co-p-eastus-clovmimage-rg/providers/Microsoft.Compute/images/cis-hardened-win2016-20190111-image"
admin_password                                          = ""

#Route Table
next_hop_in_ip_address                                  = "10.6.24.4"

#Virtual Network
dns_servers                                             = ["10.1.11.4","10.1.11.5"]
address_space                                           = ["10.51.3.0/24"]
subnet_adress_space_cloappgw                            = ["10.51.3.160/27"]
subnet_adress_space_clomgmt                             = ["10.51.3.128/27"]
subnet_adress_space_cloweb                              = ["10.51.3.0/25"]

hub_vnet_id                                             = "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet"
transit_vnet_id                                         = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet"
hubsubscriptionid                                       = "4cdcf904-fa57-4815-8cb3-e33b9b44f479"
transitsubscriptionid                                   = "c72acede-d539-45d9-963d-3464ec4ddae0"
hubvnetresourcegroup                                    = "co-np-eastus-core1-rg"
transitvnetresourcegroup                                = "CO-dv-eastus-hubvnet-rg"
hubvnetname                                             = "co-np-eastus-core1-vnet"
transitvnetname                                         = "CO-dv-eastus-hub-vnet"

#Application Gateway
frontend_ip_configuration_name                          = "appGatewayFrontendIP"
app_http_setting_name                                   = "appGatewayBackendHttpsSettings"
app_backend_address_pool_name                           = "appGatewayBackendPool"
appgateway_sku                                          = "WAF_Medium"
AppGatewaycertpassword                                  = ""
cert_environment_acronym                                = "dev"
