subscription_id                                        = "104a6d25-89e7-4297-9d68-76c0443b2cf6"
client_id                                              = "2216ff1e-a4a3-4139-95e9-b4b89e001457"
tenant_id                                              = "b5031e57-d76f-422e-87c6-02b4cc749974"
client_secret                                          = ""

#environment specific variables
location                                               = "eastus"
location_acronym						               = "use"
environment                                            = "uat"
environment_acronym						               = "uat"
application								               = "Collateralized Loan Obligation"
application_acronym                                    = "clo"
tags= {
    Platform                = "Azure Commercial Cloud"
    Environment             = "UAT"
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
clo_sql_admin_login                                     = "clouatsqladmin"
clo_sql_admin_login_password                            = ""
clo_paas_sql_database_edition                           = "GeneralPurpose"
clo_paas_sql_database_collation                         = "SQL_Latin1_General_CP1_CI_AS"
clo_paas_sql_database_max_size_bytes                    = "34359738368"
clo_paas_sql_database_requested_service_objective_name  = "GP_Gen5_2"

#KeyVault
eastus_acronym                                          = "eus"
cloudops_keyvault_admin_group_name                      = "CO-TerraformStorage-Admin"
client_keyvault_admin_group_name                        = "CO-RAS-VM-Admins"
svc_cloweb_user_principal_name                          = "azuser-svc-CLOPWeb@kpmgusadvcloudops.onmicrosoft.com"
tech_owner                                              = "A-mirwaisbilal"

#Virtual Machine
count_value_appvm                                       = 1
count_value_bstnhosts                                   = 2
//vm_image_id                                             = "/subscriptions/5d3ae075-2601-49d3-9223-892e3d7f6fb1/resourceGroups/co-p-eastus-clovmimage-rg/providers/Microsoft.Compute/images/cis-hardened-win2016-20190111-image"
admin_password                                          = ""

#Route Table
next_hop_in_ip_address                                  = "10.100.2.196"

#Virtual Network
dns_servers                                             = ["10.30.15.197", "10.30.15.196"]
address_space                                           = ["10.51.3.0/24"]
subnet_adress_space_cloappgw                            = ["10.51.3.160/27"]
subnet_adress_space_clomgmt                             = ["10.51.3.128/27"]
subnet_adress_space_cloweb                              = ["10.51.3.0/25"]

hub_vnet_id                                             = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
transit_vnet_id                                         = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat"
hubsubscriptionid                                       = "4c9dc048-01dc-4854-9063-8a3d4060993a"
transitsubscriptionid                                   = "931d8a2f-96bb-44d3-9b06-6c05c41c4060"
hubvnetresourcegroup                                    = "CO-P-eastus-hubvnet-rg"
transitvnetresourcegroup                                = "RGP-USE-COREVNET-UAT"
hubvnetname                                             = "CO-P-eastus-hub-vnet"
transitvnetname                                         = "vnt-use-core-uat"

#Application Gateway
frontend_ip_configuration_name                          = "appGatewayFrontendIP"
app_http_setting_name                                   = "appGatewayBackendHttpsSettings"
app_backend_address_pool_name                           = "appGatewayBackendPool"
appgateway_sku                                          = "WAF_Medium"
AppGatewaycertpassword                                  = ""
cert_environment_acronym                                = "" #blank for now
