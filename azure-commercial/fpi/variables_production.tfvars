client_id                                                  =  "b2967f11-d801-4812-b532-3f3a676e8b46"
subscription_id                                            =  "9e27f52c-3c97-4fda-9c8f-eadcd0ad195a"
tenant_id                                                  =  "b5031e57-d76f-422e-87c6-02b4cc749974"
client_secret                                              =  ""

location                                    			   =  "eastus"
location_acronym                                           =  "use"
environment                                                =  "production"
environment_acronym                                        =  "p"
application												   =  "fpi"
application_acronym                                        =  "fpi"

vm_environment                                             =  "p"
app_environment_acronym                                    =  ""

paloalto_hop_address                                       =  "10.30.16.100"

vm_image_id                                                =  "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/co-p-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/cis-hardened-win2016-20190111-image"

#Tags Variables
tags                                                       = {
          Environment                                      =  "Production"
          BusinessContact                                  =  "spichaimani@kpmg.com"
          BusinessOwner                                    =  "Sakthi Pichaimani"
          LOB                                              =  "Deal Advisory & Strategy"
          Node                                             =  "Spoke"
          Platform                                         =  "Azure Commercial Cloud"
          Solution                                         =  "Financial Profitability Insights (FPI)"
          TechnicalContact                                 =  "zgalovic@kpmg.com"
          TechnicalOwner                                   =  "Zoran Galovic"
          Datadog                                          =  "Monitored"
}

#SQLServer Variables
sqlserver_password                                         =  ""
sql_serverPool_count                                       =  "2"
sql_serverPool2_count                                      =  "1"
sql_serverPool_expansion_count                             =  "3"
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
fpivnet_address_space                                      =  ["10.32.12.0/24", "10.32.13.0/24"]
dns_servers                                                =  ["10.30.15.197","10.30.15.196"]
address_prefix_frontend                                    =  "10.32.13.0/24"
address_prefix_backend                                     =  "10.32.12.0/28"
SVCEP_frontend                                             =  ["Microsoft.Storage"]
SVCEP_backend                                              =  ["Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.Storage"]
vnetpeering1_remote_vnet_name                              =  "CO-P-eastus-hub-vnet"
vnetpeering1_remote_vnet_id                                =  "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
vnetpeering1_remote_vnet_resource_group_name               =  "CO-P-eastus-hubvnet-rg"
coresubscriptionid                                         =  "4c9dc048-01dc-4854-9063-8a3d4060993a"
corevnetresourcegroup                                      =  "CO-P-eastus-hubvnet-rg"
corevnetname                                               =  "CO-P-eastus-hub-vnet"

#Public IP Variables
domain_name_label                                          =  "fpi"

#ApplicationGateway Variables
host_name                                                  =  "fpi.kpmgcloudops.com"
host_name1                                                 =  "fpirest.kpmgcloudops.com"
backend_address_pool_name                                  =  "co-p-spi-fpi-vnet-fpibackendaddresspool"
frontend_ip_configuration_name                             =  "co-p-spi-fpi-vnet-fpifrontendip"
frontend_port_name                                         =  "co-p-spi-fpi-vnet-fpifrontendport"
frontend_port2_name                                        =  "fpi-p-fe"
http_listener_ssl_certificate_name                         =  "fpi.kpmgcloudops.com"
http_listener_rest_ssl_certificate_name                    =  "fpirest.kpmgcloudops.com"
http_listener_ssl_certificate                              =  "fpi.kpmgcloudops.com"
http_listener_ssl_certificate_password                     =  ""
gateway_ip_configuration_name                              =  "my-gateway-ip-configuration"
listener_name                                              =  "co-p-spi-fpi-vnet-fpihttplistener"
listener2_name                                             =  "co-p-spi-fpi-vnet-fpihttpslistener"
listener3_name                                             =  "fpirestGatewayListenerHttps"
app_listener_host_name                                     =  "fpi.kpmgcloudops.com"
fpirest_listener_host_name                                 =  "fpirest.kpmgcloudops.com"
probe_name                                                 =  "healthprobefpi"
probe_host_name                                            =  "fpi.kpmgcloudops.com"
probe_name1                                                 =  "healthproberestfpi"
probe_host_name1                                            =  "fpirest.kpmgcloudops.com"
request_routing_rule_name                                  =  "co-p-spi-fpi-vnet-fpirequestroute"
request_routing_rule2_name                                 =  "co-p-spi-fpi-vnet-fpirequestroute-https"
request_routing_rule3_name                                 =  "requestRouteRestHttps"
backend_http_settings_name1                                =  "co-p-spi-fpi-vnet-fpibackend-httpsetting"
backend_http_settings_name2                                =  "co-p-spi-fpi-vnet-fpibackend-httpssetting"
backend_http_settings_name3                               =  "fpirestGatewayBackendSettingsHttps"
#VirtualMachine Variables
vm_count                                                   =  "4"
vm_size                                                    =  "Standard_F16s"
admin_password                                             =  ""
vm_workload_desc                                           =  "APP"

#StorageAccount Variables
account_replication_type                                   =  "LRS"

#Azure Firewall Variables
firewall_network_name                                      = "firewall-primary-prod-hub"
firewall_network_rg_name                                   = "CO-P-eastus-hubvnet-rg"
azure_firewall_subscription_id                             = "4c9dc048-01dc-4854-9063-8a3d4060993a"

# KIP app gateway IP for outbound connection
KIPAGW_PIP								   = ["52.249.195.183/32"]

#Service Principal
encryptapp_service_principal_name       = "DiskEncryptApp"