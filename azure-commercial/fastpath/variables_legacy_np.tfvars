#Environment specific variable
environment                              = "legacy_development"
environment_acronym                      = "np"
application_name                         = "fastpath"
application_acronym                      = "fp"
location                                 = "eastus"
location_acronym                         = "use"
tags = {
    BusinessContact                      = "hmcgarry@kpmg.com"
    BusinessOwner                        = "Mick McGarry"
    Environment                          = "Development"
    Instance                             = "0001"
    LOB                                  = "Consulting"
    Platform                             = "Azure Commercial Cloud"
    Solution                             = "FastPath"
    Node                                 = "Spoke"
    TechnicalContact                     = "tianhuigu@kpmg.com"
    TechnicalOwner                       = "Tianhui Gu"
    Version                              = "1.0"
}


#VNet, subnet, Routes, NSG

app_subnet_address_prefix                = "10.4.20.32/27"
redis_subnet_address_prefix              = "10.4.20.64/28"
aci_subnet_address_prefix                = "10.4.20.80/28"
service_endpoints                        = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault"]
appsubnet_service_endpoints              = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.ServiceBus"]
route_name                               = "OutboundTraffictoPaloAlto"
route_address_prefix                     = "0.0.0.0/0"
route_next_hop_type                      = "VirtualAppliance"
route_next_hope_in_ip_address            = "10.1.16.100"
disable_bgp_route_propagation            = "false"


#Virtual Machine

vm_count                                 = "1"
vm_os_type                               = "VMW"
vm_workload_desc                         = "CICD"
vm_size                                  = "Standard_D8s_v3"
vm_admin_password                        = ""
tenant_id                                = "188697ab-840f-44ec-8535-aaaa5680bab0"
custom_emails                            = "go-fmmanagedservices@kpmg.com"
domain_user_name                         = "a-mansingshinde"
domain_user_password                     = ""
domain_name                              = "kconp.local"
ou_path                                  = "OU=AADDC Computers,DC=kconp,DC=local"
encryptappsp_key_password                = ""
data_disk_size                           = "200"
keyvault_name                            = "kvl-use-basee74c5c8b"
keyvault_resource_group_name             = "RGP-USE-BASEE74C5C8B-NP"
diagnostic_storage_account_resourcegroup_name = "RGP-USE-BASEE74C5C8B-NP"
diagnostic_storage_account_name          = "stousebasee74c5c8b"


#Backup and Logs

encryptapp_service_principal_name        = "spn-devops-rcdigital"
cicdbuild_subnet                         = "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourcegroups/co-np-eastus-core1-rg/providers/microsoft.network/virtualnetworks/co-np-eastus-core1-vnet/subnets/co-np-eastus-infra1-subnet"
core_aks_subnet_id                       = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/sub-use-core-aks-dv"

#SQl Server and Database

sql_server_version                       = "12.0"
sql_server_admin_username                = "fastpathadmin"
sql_server_admin_password                = ""
sql_database_edition                     = "Standard"
sql_database_performance_level           = "S0"



#ASE

ase_name                                 = "ase-use-npapp-np"
dns_suffix                               = "kpmgcloudops.com"

#App Service Plan

asp_tier                                 = "Isolated"
asp_size                                 = "I3"


#SQL Elastic Pool

sql_elastic_pool_max_size                = "1000"
sqlelasticpool_sku_name                  = "GP_Gen5"
sqlelasticpool_sku_tier                  = "GeneralPurpose"
sqlelasticpool_sku_family                = "Gen5"
sqlelasticpool_sku_capacity              = "14"
sqlelasticpool_min_capacity              = "0"
sqlelasticpool_max_capacity              = "14"


#Following variable will be used to query shared services

sharedrg_resource_group_name             = "RGP-USE-ASE-NP"
sharedvnet_virtual_network_name          = "vnt-use-ase-np"
log_analytics_workspace_name             = "law-use-spokeapp-np"
ase_subnet_name                          = "sub-use-ase-np"
appgateway_subnet_name                   = "sub-use-appgateway-np"


#Redis_cache

redis_capacity                           = "1"
redis_family                             = "P"
redis_sku_name                           = "Premium"



#B2C

ad_domain_name                           = "kpmgusadvspectrum"
fastpath_clientsecret                    = ""


#Web App

webapp_name                              = "fpnp"
app_url                                  = "fpnp.kpmgcloudops.com"
api_url                                  = "apifpnp.kpmgcloudops.com"


#Api App

apiapp_name                              = "apifpnp"
raygunapikey                             = "Mg4CzuaUNuAMmh58erufA"
smtp_server                              = "10.2.3.4"
smtp_port                                = "25"


#Key vault secret

spn_secret_key                           = ""
consumer_key                             = ""
consumer_secret                          = ""
intacctgatewaypwd                        = ""



#container

container_registry_name                  = "ecrusefastpathnp"
container_image_name                     = "ecrusefastpathnp.azurecr.io/clamav:latest"
container_cpu                            = "2"
container_memory                         = "8"
container_port                           = "3310"


#support site - webapp

support_webapp_name                      = "adminfpnp"


#support site - apiapp

support_apiapp_name                      = "apiadminfpnp"
salt                                     = ""
webhook_addproductmodules                = "https://f3810745-f509-4743-9f5c-98f35a351ba1.webhook.eus2.azure-automation.net/webhooks?token=7k78n52%2f1rkMd6%2bFQ6JywUNGN7%2bXwK5EFaZESmTtNU8%3d"
webhook_deleteenvironment                = "https://f3810745-f509-4743-9f5c-98f35a351ba1.webhook.eus2.azure-automation.net/webhooks?token=XtEBi6iDBfsHul%2bbrJjBxg4MVeUyuoxH%2bz8K8UQTKqw%3d"
webhook_newenvironment                   = "https://f3810745-f509-4743-9f5c-98f35a351ba1.webhook.eus2.azure-automation.net/webhooks?token=KlQqsO3eKqiIxrN0EwUiE5FX%2bAMbPGDmh%2f0%2f1ptz93E%3d"
webhook_newuser                          = "https://f3810745-f509-4743-9f5c-98f35a351ba1.webhook.eus2.azure-automation.net/webhooks?token=GZT4AvO1Xih%2fFuZJu5%2b1e%2fpCiYO%2bV118F8SqRH%2bKC8U%3d"


#Automation Account

apiroute                                 = "api"
vsopat                                   = ""
vsouri                                   = "https://dev.azure.com/CO-AzureCore/KpmgAdvisoryCloud/_apis/git/repositories/FastPath/items?path=/SQLScripts/{fileName}&versionDescriptor.version=master&versionDescriptor.versionType=branch&api-version=5.0"


#App Registration Admin

admin_clientid                           = "6abe7c1c-23a9-4d1f-8bbb-e68569561196"
fastpath_clientid                        = "addfc5e7-acde-4514-bdcd-dc22c3cdb72f"
client_id                                = "2995a923-5fd3-4b7d-8cbe-ef1074ef7921"
client_secret                            = ""
subscription_id                          = "e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2"
