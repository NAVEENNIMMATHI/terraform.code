client_id                                                  =  "9975dc86-7489-483c-b49c-47bdff5e2eb8"
subscription_id                                            =  "b75fc3c3-04a4-45a6-b126-8279f505e873"
tenant_id                                                  =  "b5031e57-d76f-422e-87c6-02b4cc749974"
client_secret                                              =  ""

location                                    			   =  "eastus"
location_acronym                                           =  "use"
environment                                                =  "uat"
environment_acronym                                        =  "uat"
application												   =  "fpi"
application_acronym                                        =  "fpi"

vm_environment                                             = "uat"
app_environment_acronym                                    = "uat"

paloalto_hop_address                                       =  "10.100.2.196"

#Below references should be removed in future
vm_image_id                                                =  ""

#Tags Variables
tags                                                       = {
          Environment                                      =  "UAT"
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
ep_max_size_gb                                             =  "1024"
ep_max_size_gb2                                            =  "1024"
ep_sku_name                                                =  "GP_Gen5"
ep_sku_tier                                                =  "GeneralPurpose"
ep_sku_family                                              =  "Gen5"
ep_sku_capacity                                            =  "24"
ep_sku_capacity2                                           =  "24"
ep_sku_capacity3                                           =  "24"
ep_per_database_settings_min_capacity                      =  "0"
ep_per_database_settings_max_capacity                      =  "8"
ep_per_database_settings_max_capacity2                     =  "8"
ep_per_database_settings_max_capacity3                     =  "8"

#VirtualNetwork Variables
fpivnet_address_space                                      =  ["10.51.1.0/24"]
dns_servers                                                =  ["10.30.15.197","10.30.15.196"]
address_prefix_frontend                                    =  "10.51.1.0/27"
address_prefix_backend                                     =  "10.51.1.32/27"
SVCEP_frontend                                             =  ["Microsoft.Storage"]
SVCEP_backend                                              =  ["Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.Storage"]
vnetpeering1_remote_vnet_name                              =  "vnt-use-core-uat"
vnetpeering1_remote_vnet_id                                =  "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat"
vnetpeering1_remote_vnet_resource_group_name               =  "RGP-USE-COREVNET-UAT"
coresubscriptionid                                         =  "931d8a2f-96bb-44d3-9b06-6c05c41c4060"
corevnetresourcegroup                                      =  "RGP-USE-COREVNET-UAT"
corevnetname                                               =  "vnt-use-core-uat"

#Public IP Variables
domain_name_label                                          =  "fpiuat"

#ApplicationGateway Variables
host_name                                                  =  "fpiuat.kpmgcloudops.com"
host_name1                                                 =  "fpirestuat.kpmgcloudops.com"
backend_address_pool_name                                  =  "appGatewayBackendPool"
frontend_ip_configuration_name                             =  "appGatewayFrontendIP"
frontend_port_name                                         =  "appGatewayFrontendPort"
frontend_port2_name                                        =  "appGatewayFrontendPortHttps"
http_listener_ssl_certificate_name                         =  "fpiuat.kpmgcloudops.com"
http_listener_rest_ssl_certificate_name                    =  "fpirestuat.kpmgcloudops.com"
http_listener_ssl_certificate                              =  "fpiuat.kpmgcloudops.com"
http_listener_ssl_certificate_password                     =  ""
gateway_ip_configuration_name                              =  "appGatewayIPConfig"
listener_name                                              =  "appGatewayListener"
listener2_name                                             =  "appGatewayListenerHttps"
listener3_name                                             =  "fpirestGatewayListenerHttps"
app_listener_host_name                                     =  "fpiuat.kpmgcloudops.com"
fpirest_listener_host_name                                 =  "fpirestuat.kpmgcloudops.com"
probe_name                                                 =  "healthprobefpi"
probe_host_name                                            =  "fpiuat.kpmgcloudops.com"
probe_name1                                                =  "healthproberestfpi"
probe_host_name1                                           =  "fpirestuat.kpmgcloudops.com"
request_routing_rule_name                                  =  "requestRoute"
request_routing_rule2_name                                 =  "requestRouteHttps"
request_routing_rule3_name                                 =  "requestRouteRestHttps"
backend_http_settings_name1                                =  "appGatewayBackendSettings"
backend_http_settings_name2                                =  "appGatewayBackendSettingsHttps"
backend_http_settings_name3                               =  "fpirestGatewayBackendSettingsHttps"
#VirtualMachine Variables
vm_count                                                   =  "1"
vm_size                                                    =  "Standard_F16s"
admin_password                                             =  ""
vm_workload_desc                                           =  "APP"

#StorageAccount Variables
account_replication_type                                   =  "LRS"

#Azure Firewall Variables
firewall_network_name                                      = "fwl-use-primary-uat-core"
firewall_network_rg_name                                   = "RGP-USE-COREVNET-UAT"
azure_firewall_subscription_id                             = "931d8a2f-96bb-44d3-9b06-6c05c41c4060"

# KIP app gateway IP for outbound connection
KIPAGW_PIP								   = ["52.224.104.52/32"]

#Service Principal
encryptapp_service_principal_name       = "DiskEncryptApp"