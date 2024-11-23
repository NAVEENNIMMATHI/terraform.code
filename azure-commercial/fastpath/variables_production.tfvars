#Environment specific variable
environment                              = "production"
environment_acronym                      = "pd"
environment_acronym_aad_url              = ""
application_name                         = "fastpath"
application_acronym                      = "fp"
location                                 = "eastus"
location_acronym                         = "use"
tags = {
    BusinessContact                      = "hmcgarry@kpmg.com"
    BusinessOwner                        = "Mick McGarry"
    Environment                          = "Production"
    Instance                             = "0001"
    LOB                                  = "Consulting"
    Platform                             = "Azure Commercial Cloud"
    Solution                             = "FastPath"
    Node                                 = "Spoke"
    TagAutomationStatus                  = "Successful"
    TechnicalContact                     = "tianhuigu@kpmg.com"
    TechnicalOwner                       = "Tianhui Gu"
    Version                              = "1.0"
    Datadog                              = "Monitored"
}

#VNet, subnet, Routes, NSG

app_subnet_address_prefix                = "10.4.20.32/27"
redis_subnet_address_prefix              = "10.4.20.64/28"
aci_subnet_address_prefix                = "10.4.20.80/28"
ase_subnet_address_prefix                = "10.4.16.0/22"
service_endpoints                        = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault"]
appsubnet_service_endpoints              = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.ServiceBus"]
#route_name                               = "OutboundTraffictoPaloAlto"
route_name                               = "OutboundTraffictoAzFirewall"
route_address_prefix                     = "0.0.0.0/0"
route_next_hop_type                      = "VirtualAppliance"
#route_next_hope_in_ip_address            = "10.30.16.100"
route_next_hope_in_ip_address            = "10.30.3.4"

disable_bgp_route_propagation            = "false"


#Virtual Machine

vm_count                                 = "1"
vm_os_type                               = "VMW"
vm_workload_desc                         = "CICD"
vm_size                                  = "Standard_D8s_v3"
vm_admin_password                        = ""
tenant_id                                = "b5031e57-d76f-422e-87c6-02b4cc749974"
custom_emails                            = "go-fmmanagedservices@kpmg.com"
domain_user_name                         = "a-kkohli"
domain_user_password                     = ""
domain_name                              = "KCO.local"
ou_path                                  = "OU=AADDC Computers,DC=kco,DC=local"
encryptappsp_key_password                = ""
data_disk_size                           = "200"
keyvault_name                            = "kvl-use-base5d3ae075"
keyvault_resource_group_name             = "RGP-USE-BASE5D3AE075-PD"
diagnostic_storage_account_resourcegroup_name = "RGP-USE-BASE5D3AE075-PD"
diagnostic_storage_account_name          = "stousebase5d3ae075"


#Backup and Logs

encryptapp_service_principal_name        = "spn-devops-5d3ae075"
cicdbuild_subnet                         = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/co-p-eastus-infra1-subnet"
core_aks_subnet_id                       = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/sub-use-core-aks-pd"

#SQl Server and Database

sql_server_version                       = "12.0"
sql_server_admin_username                = "fastpathadmin"
sql_server_admin_password                = ""
sql_database_edition                     = "Standard"
sql_database_performance_level           = "S0"



#ASE

ase_name                                 = "ase-use-npapp-pd"
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

sharedrg_resource_group_name             = "RGP-USE-ASE-PD"
sharedvnet_virtual_network_name          = "vnt-use-ase-pd"
log_analytics_workspace_name             = "law-use-spokeapp-pd"
ase_subnet_name                          = "sub-use-ase-pd"
appgateway_subnet_name                   = "sub-use-appgateway-pd"


#Redis_cache

redis_capacity                           = "1"
redis_family                             = "P"
redis_sku_name                           = "Premium"


#B2C

ad_domain_name                           = "kpmgusadvcloudops"
fastpath_clientsecret                    = ""


#Web App

webapp_name                              = "fppd"
app_url                                  = "fastpath.kpmgcloudops.com"
api_url                                  = "apifastpath.kpmgcloudops.com"


#Api App

apiapp_name                              = "apifastpath"
raygunapikey                             = "Mg4CzuaUNuAMmh58erufA"
smtp_server                              = "10.2.3.4"
smtp_port                                = "25"


#Key vault secret

spn_secret_key                           = ""
consumer_key                             = "a8ad48672c2faa09094ef775fab1bd3eb99337eab8cdd782dece58e3bae727d5a8ad48672c2faa09094ef775fab1bd3eb99337eab8cdd782dece58e3bae727d5"
consumer_secret                          = ""
intacctgatewaypwd                        = ""


#container

container_registry_name                  = "ecrusefastpathpd"
container_image_name                     = "ecrusefastpathpd.azurecr.io/clamav:latest"
container_cpu                            = "2"
container_memory                         = "8"
container_port                           = "3310"


#support site - webapp

support_webapp_name                      = "adminfastpath"


#support site - apiapp

support_apiapp_name                      = "apiadminfastpath"
salt                                     = ""
webhook_addproductmodules                = "https://07dc9226-eba2-49eb-b338-e98f32b826da.webhook.eus2.azure-automation.net/webhooks?token=qQQ9RZP7UGCiYRjZ3wp8WOqxtTa924Sx4rEsuFmLV0M%3d"
webhook_deleteenvironment                = "https://07dc9226-eba2-49eb-b338-e98f32b826da.webhook.eus2.azure-automation.net/webhooks?token=M6WdL%2f6tBVHJwOVYNNa%2bVthw%2fI8MBngxDvrfY4cIU80%3d"
webhook_newenvironment                   = "https://07dc9226-eba2-49eb-b338-e98f32b826da.webhook.eus2.azure-automation.net/webhooks?token=XeTmKQQwbjG9nomKCTukClNNaB7ry2j713ri3oMna%2bQ%3d"
webhook_newuser                          = "https://07dc9226-eba2-49eb-b338-e98f32b826da.webhook.eus2.azure-automation.net/webhooks?token=%2fARZWh1PN1aWmjbBhMEBC%2fudZpPcrdKvaHVL7sD5OEc%3d"


#Automation Account

apiroute                                 = "api"
vsopat                                   = "o5vvwd2nhav6ag37uxvg2qdawimzmzwmpjmy774ifqtu437un4uq"
vsouri                                   = "https://dev.azure.com/CO-AzureCore/KpmgAdvisoryCloud/_apis/git/repositories/FastPath/items?path=/SQLScripts/{fileName}&versionDescriptor.version=master&versionDescriptor.versionType=branch&api-version=5.0"


#App Registration Admin

admin_clientid                           = "412e63ef-5ec0-40ec-aa36-8ebfcf7ef6bd"
fastpath_clientid                        = "2002edfb-a228-4e85-9e99-8946e944c564"
client_id                                = "089028a6-c23d-4854-8ecf-2ed345a8b1bf"
client_secret                            = ""
subscription_id                          = "5d3ae075-2601-49d3-9223-892e3d7f6fb1"
