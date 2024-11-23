client_id                                                  =  "e0628e55-2ee3-4131-8fdd-330265aed576"
subscription_id                                            =  "3507153c-e6a4-4e2f-ae04-f34c1fd4482f"
tenant_id                                                  =  "188697ab-840f-44ec-8535-aaaa5680bab0"
client_secret                                              =  ""

location                                    			   = "eastus"
location_acronym										   = "use"
environment                               				   = "development"
environment_acronym										   = "dv"
application												   = "fpi"
application_acronym                                        = "fpi"

vm_environment                                             = "dv"
app_environment_acronym                                    = "dev"

paloalto_hop_address                                       =  "10.1.16.100"

#Below references should be removed in future
vm_image_id                                                =  ""

#Tags Variables
tags                                                       = {
          Environment                                      =  "Development"
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
fpivnet_address_space                                      =  ["10.51.1.0/24"]
dns_servers                                                =  ["10.1.11.4", "10.1.11.5"]
address_prefix_frontend                                    =  "10.51.1.0/27"
address_prefix_backend                                     =  "10.51.1.32/27"
SVCEP_frontend                                             =  ["Microsoft.Storage"]
SVCEP_backend                                              =  ["Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.Storage"]
vnetpeering1_remote_vnet_name                              =  "CO-dv-eastus-hub-vnet"
vnetpeering1_remote_vnet_id                                =  "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet"
vnetpeering1_remote_vnet_resource_group_name               =  "CO-dv-eastus-hubvnet-rg"
coresubscriptionid                                         =  "c72acede-d539-45d9-963d-3464ec4ddae0"
corevnetresourcegroup                                      =  "CO-dv-eastus-hubvnet-rg"
corevnetname                                               =  "CO-dv-eastus-hub-vnet"

#Public IP Variables
domain_name_label                                          =  "fpidev"

#ApplicationGateway Variables
host_name                                                  =  "fpidev.kpmgcloudops.com"
host_name1                                                 =  "fpirestdev.kpmgcloudops.com"
backend_address_pool_name                                  =  "appGatewayBackendPool"
frontend_ip_configuration_name                             =  "appGatewayFrontendIP"
frontend_port_name                                         =  "appGatewayFrontendPort"
frontend_port2_name                                        =  "appGatewayFrontendPortHttps"
http_listener_ssl_certificate_name                         =  "fpidev.kpmgcloudops.com"
http_listener_rest_ssl_certificate_name                    =  "fpirestdev.kpmgcloudops.com"
http_listener_ssl_certificate                              =  "fpidev.kpmgcloudops.com"
http_listener_ssl_certificate_password                     =  ""
gateway_ip_configuration_name                              =  "appGatewayIPConfig"
listener_name                                              =  "appGatewayListener"
listener2_name                                             =  "appGatewayListenerHttps"
listener3_name                                             =  "fpirestGatewayListenerHttps"
app_listener_host_name                                     =  "fpidev.kpmgcloudops.com"
fpirest_listener_host_name                                 =  "fpirestdev.kpmgcloudops.com"
probe_name                                                 =  "healthprobefpi"
probe_host_name                                            =  "fpidev.kpmgcloudops.com"
probe_name1                                                 =  "healthproberestfpi"
probe_host_name1                                            =  "fpirestdev.kpmgcloudops.com"
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
firewall_network_name                                      = "firewall-primary-dev-core"
firewall_network_rg_name                                   = "CO-dv-eastus-hubvnet-rg"
azure_firewall_subscription_id                             = "c72acede-d539-45d9-963d-3464ec4ddae0"

# KIP app gateway IP for outbound connection
KIPAGW_PIP								                   = ["52.152.171.172/32"]

#Service Principal
encryptapp_service_principal_name       = "EncryptApp"