#Environment specific variable
environment                              = "development"
environment_acronym                      = "dv"
environment_acronym_aad_url              = "dev"
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

app_subnet_address_prefix                = "10.50.20.32/27"
redis_subnet_address_prefix              = "10.50.20.64/28"
aci_subnet_address_prefix                = "10.50.20.80/28"
ase_subnet_address_prefix                = "10.50.0.0/22"
service_endpoints                        = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault"]
appsubnet_service_endpoints              = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.ServiceBus"]
route_name                               = "OutboundTraffictoAzureFirewall"
route_address_prefix                     = "0.0.0.0/0"
route_next_hop_type                      = "VirtualAppliance"
route_next_hope_in_ip_address            = "10.6.24.4" 
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
keyvault_name                            = "kvl-use-common-57fad7dc"
keyvault_resource_group_name             = "RGP-USE-COMMON"
diagnostic_storage_account_resourcegroup_name = "RGP-USE-COMMON"
diagnostic_storage_account_name          = "stousecommon57fad7dc"


#Backup and Logs

encryptapp_service_principal_name        = "spn-devops-57fad7dc"
cicdbuild_subnet                         = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/co-dv-eastus-infra1-subnet"
core_aks_subnet_id                       = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/sub-use-core-aks-dv"

#SQl Server and Database

sql_server_version                       = "12.0"
sql_server_admin_username                = "fastpathadmin"
sql_server_admin_password                = ""
sql_database_edition                     = "Standard"
sql_database_performance_level           = "S0"



#ASE

ase_name                                 = "ase-use-dvapp-dv"
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

sharedrg_resource_group_name             = "RGP-USE-ASE-DV"
sharedvnet_virtual_network_name          = "vnt-use-ase-dv"
log_analytics_workspace_name             = "law-use-spokeapp-dv"
ase_subnet_name                          = "sub-use-ase-dv"
appgateway_subnet_name                   = "sub-use-appgateway-dv"


#Redis_cache

redis_capacity                           = "1"
redis_family                             = "P"
redis_sku_name                           = "Premium"


#B2C

ad_domain_name                           = "kpmgusadvspectrum"
fastpath_clientsecret                    = ""


#Web App

app_url                                  = "fastpathdev.kpmgcloudops.com"
api_url                                  = "apifastpathdev.kpmgcloudops.com"


#Api App

raygunapikey                             = "Mg4CzuaUNuAMmh58erufA"
smtp_server                              = "10.2.3.4"
smtp_port                                = "25"


#Key vault secret

spn_secret_key                           = ""
consumer_key                             = ""
consumer_secret                          = ""
intacctgatewaypwd                        = ""


#container

container_registry_name                  = "ecrusefastpathdv"
container_image_name                     = "ecrusefastpathdv.azurecr.io/clamav:latest"
container_cpu                            = "2"
container_memory                         = "8"
container_port                           = "3310"

support_webapp_name                      = "adminfastpathdev"
support_apiapp_name                      = "apiadminfastpathdev"
apiapp_name                              = "apifastpathdev"
webapp_name                              = "fastpathdev"

#support site - apiapp
#revisit - I cannot know the webhook values until deployed automation account and runbooks and created webhook for runbook.

salt                                     = ""
webhook_addproductmodules                = "https://d46d0aed-faa5-4be8-83cb-4321d6b4afc1.webhook.eus2.azure-automation.net/webhooks?token=lt4rN3vmdlChAJ505gJLkFlFr0t8GsCIqJwLS0vBE44%3d"
webhook_deleteenvironment                = "https://d46d0aed-faa5-4be8-83cb-4321d6b4afc1.webhook.eus2.azure-automation.net/webhooks?token=rugSEgPfWBamhxZaVAi0%2be8MwD8o8WJ0AXf%2b%2bS5FJO8%3d"
webhook_newenvironment                   = "https://d46d0aed-faa5-4be8-83cb-4321d6b4afc1.webhook.eus2.azure-automation.net/webhooks?token=QeyKlhwAkgvoVR%2foTvf9hV1wvZ%2fTIOJZ3rySEh5q63g%3d"
webhook_newuser                          = "https://d46d0aed-faa5-4be8-83cb-4321d6b4afc1.webhook.eus2.azure-automation.net/webhooks?token=FBE5tPElfACZlbB2qWZQxkOsR11eUh7KWO6Rn48%2fCJY%3d"


#Automation Account

apiroute                                 = "api"
vsopat                                   = ""
vsouri                                   = "https://dev.azure.com/CO-AzureCore/KpmgAdvisoryCloud/_apis/git/repositories/FastPath/items?path=/SQLScripts/{fileName}&versionDescriptor.version=master&versionDescriptor.versionType=branch&api-version=5.0"


#App Registration Admin

client_id                                = "c79c197f-2835-49dc-846a-06644d7f10c4"
client_secret                            = ""
subscription_id                          = "57fad7dc-7eeb-4a2c-b3b7-405d9f8d3cc8"