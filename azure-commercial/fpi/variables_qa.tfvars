client_id                                                  =  "76ea9629-a4e1-4a9a-ba2f-39840e53342a"
subscription_id                                            =  "adf88b05-d3d7-4dee-ba30-ea939f9a1b1c"
tenant_id                                                  =  "188697ab-840f-44ec-8535-aaaa5680bab0"
client_secret                                              =  ""

location                                    			   = "eastus"
location_acronym										   = "use"
environment                               				   = "qa"
environment_acronym										   = "qa"
application												   = "fpi"
application_acronym                                        = "fpi"

vm_environment                                             = "qa"
app_environment_acronym                                    = "qa"

paloalto_hop_address                                       =  "10.101.2.196"

#Below references should be removed in future
vm_image_id                                                =  ""

#Tags Variables
tags                                                       = {
          Environment                                      =  "QA"
          BusinessContact                                  =  "spichaimani@kpmg.com"
          BusinessOwner                                    =  "Sakthi Pichaimani"
          LOB                                              =  "Deal Advisory & Strategy"
          Node                                             =  "Spoke"
          Platform                                         =  "Azure Commercial Cloud"
          Solution                                         =  "Financial Profitability Insights (FPI)"
          TechnicalContact                                 =  "zgalovic@kpmg.com"
          TechnicalOwner                                   =  "Zoran Galovic"
}

#SQLServer Variables
sqlserver_password                                         =  ""
sql_serverPool_count                                       =  "0"
sql_serverPool2_count                                      =  "0"
sql_serverPool_expansion_count                             =  "0"
ep_max_size_gb                                             =  "756"
ep_max_size_gb2                                            =  "1024"
ep_sku_name                                                =  "GP_Gen5"
ep_sku_tier                                                =  "GeneralPurpose"
ep_sku_family                                              =  "Gen5"
ep_sku_capacity                                            =  "4"
ep_sku_capacity2                                           =  "8"
ep_sku_capacity3                                           =  "2"
ep_per_database_settings_min_capacity                      =  "0"
ep_per_database_settings_max_capacity                      =  "4"
ep_per_database_settings_max_capacity2                     =  "2"
ep_per_database_settings_max_capacity3                     =  "2"

#VirtualNetwork Variables
fpivnet_address_space                                      =  ["10.71.1.0/24"]
dns_servers                                                =  ["10.1.11.4", "10.1.11.5"]
address_prefix_frontend                                    =  "10.71.1.0/27"
address_prefix_backend                                     =  "10.71.1.32/27"
SVCEP_frontend                                             =  ["Microsoft.Storage"]
SVCEP_backend                                              =  ["Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.Storage"]
vnetpeering1_remote_vnet_name                              =  "vnt-use-core-qa"
vnetpeering1_remote_vnet_id                                =  "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa"
vnetpeering1_remote_vnet_resource_group_name               =  "RGP-USE-COREVNET-QA"
coresubscriptionid                                         =  "5ce45d57-3192-4bfe-9c2f-cb567b30c586"
corevnetresourcegroup                                      =  "RGP-USE-COREVNET-QA"
corevnetname                                               =  "vnt-use-core-qa"

#Public IP Variables
domain_name_label                                          =  "fpiqa"

#ApplicationGateway Variables
host_name                                                  =  "fpiqa.kpmgcloudops.com"
host_name1                                                 =  "fpirestqa.kpmgcloudops.com"
backend_address_pool_name                                  =  "appGatewayBackendPool"
frontend_ip_configuration_name                             =  "appGatewayFrontendIP"
frontend_port_name                                         =  "appGatewayFrontendPort"
frontend_port2_name                                        =  "appGatewayFrontendPortHttps"
http_listener_ssl_certificate_name                         =  "fpiqa.kpmgcloudops.com"
http_listener_rest_ssl_certificate_name                    =  "fpirestqa.kpmgcloudops.com"
http_listener_ssl_certificate                              =  "fpiqa.kpmgcloudops.com"
http_listener_ssl_certificate_password                     =  ""
gateway_ip_configuration_name                              =  "appGatewayIPConfig"
listener_name                                              =  "appGatewayListener"
listener2_name                                             =  "appGatewayListenerHttps"
listener3_name                                             =  "fpirestGatewayListenerHttps"
app_listener_host_name                                     =  "fpiqa.kpmgcloudops.com"
fpirest_listener_host_name                                 =  "fpirestqa.kpmgcloudops.com"
probe_name                                                 =  "healthprobefpi"
probe_host_name                                            =  "fpiqa.kpmgcloudops.com"
probe_name1                                                =  "healthproberestfpi"
probe_host_name1                                           =  "fpirestqa.kpmgcloudops.com"
request_routing_rule_name                                  =  "requestRoute"
request_routing_rule2_name                                 =  "requestRouteHttps"
request_routing_rule3_name                                 =  "requestRouteRestHttps"
backend_http_settings_name1                                =  "appGatewayBackendSettings"
backend_http_settings_name2                                =  "appGatewayBackendSettingsHttps"
backend_http_settings_name3                               =  "fpirestGatewayBackendSettingsHttps"

#VirtualMachine Variables
vm_count                                                   =  "1"
vm_size                                                    =  "Standard_F16s_v2"
admin_password                                             =  ""
vm_workload_desc                                           =  "APP"

#StorageAccount Variables
account_replication_type                                   =  "LRS"

#Azure Firewall Variables
firewall_network_name                                      = "fwl-use-primary-qa-core"
firewall_network_rg_name                                   = "RGP-USE-COREVNET-QA"
azure_firewall_subscription_id                             = "5ce45d57-3192-4bfe-9c2f-cb567b30c586"

# KIP app gateway IP for outbound connection
KIPAGW_PIP								   = ["52.168.51.104/32"]

#Service Principal
encryptapp_service_principal_name       = "EncryptApp"