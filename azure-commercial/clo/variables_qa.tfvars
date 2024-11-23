subscription_id                                        = "96e9a7e6-da33-4993-89ca-b82e0b571aee"
client_id                                              = "65d6e9b3-65b7-42b9-9f30-89d6a33becf8"
tenant_id                                              = "188697ab-840f-44ec-8535-aaaa5680bab0"
client_secret                                          = ""

#environment specific variables
location                                               = "eastus"
location_acronym						               = "use"
environment                                            = "qa"
environment_acronym						               = "qa"
application								               = "Collateralized Loan Obligation"
application_acronym                                    = "clo"
tags= {
    Platform                = "Azure Commercial Cloud"
    Environment             = "QA"
    Node                    = "Spoke"
    Solution                = "Collateralized Loan Obligation Automation (CLO)"
    TechnicalOwner          = "Mirwais Bilal"
    TechnicalContact        = "mirwaisbilal@kpmg.com"
    BusinessOwner           = "Xin Gu (Cindy)"
    BusinessContact         = "xgu@kpmg.com"
    LOB                     = "Risk Advisory Solutions"
}

encryptapp_service_principal_name                       = "DiskEncryptApp"

#App Service Plan
app_service_plan_tier                                   = "Standard"
app_service_plan_size                                   = "S2"
app_service_plan_capacity                               = 1

#SQL Server and Database
clo_sql_admin_login                                     = "cloqasqladmin"
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
next_hop_in_ip_address                                  = "10.101.2.196"

#Virtual Network
dns_servers                                             = ["10.1.11.4","10.1.11.5"]
address_space                                           = ["10.71.3.0/24"]
subnet_adress_space_cloappgw                            = ["10.71.3.160/27"]
subnet_adress_space_clomgmt                             = ["10.71.3.128/27"]
subnet_adress_space_cloweb                              = ["10.71.3.0/25"]

hub_vnet_id                                             = "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet"
transit_vnet_id                                         = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa"
hubsubscriptionid                                       = "4cdcf904-fa57-4815-8cb3-e33b9b44f479"
transitsubscriptionid                                   = "5ce45d57-3192-4bfe-9c2f-cb567b30c586"
hubvnetresourcegroup                                    = "co-np-eastus-core1-rg"
transitvnetresourcegroup                                = "RGP-USE-COREVNET-QA"
hubvnetname                                             = "co-np-eastus-core1-vnet"
transitvnetname                                         = "vnt-use-core-qa"

#Application Gateway
frontend_ip_configuration_name                          = "appGatewayFrontendIP"
app_http_setting_name                                   = "appGatewayBackendHttpsSettings"
app_backend_address_pool_name                           = "appGatewayBackendPool"
appgateway_sku                                          = "WAF_Medium"
AppGatewaycertpassword                                  = ""
cert_environment_acronym                                = "qa"
