#Environment specific variable
environment                              = "uat"
environment_acronym                      = "uat"
environment_acronym_aad_url              = "uat"
application_name                         = "fastpath"
application_acronym                      = "fp"
location                                 = "eastus"
location_acronym                         = "use"
tags = {
    BusinessContact                      = "hmcgarry@kpmg.com"
    BusinessOwner                        = "Mick McGarry"
    Environment                          = "UAT"
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
ase_subnet_address_prefix            = "10.50.0.0/22"
service_endpoints                        = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault"]
appsubnet_service_endpoints              = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.ServiceBus"]
route_name                               = "OutboundTraffictoAzureFirewall"
route_address_prefix                     = "0.0.0.0/0"
route_next_hop_type                      = "VirtualAppliance"
route_next_hope_in_ip_address            = "10.100.2.196"
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
keyvault_name                            = "kvl-use-common-104a6d25"
keyvault_resource_group_name             = "RGP-USE-COMMON"
diagnostic_storage_account_resourcegroup_name = "RGP-USE-COMMON"
diagnostic_storage_account_name          = "stousecommon104a6d25"


#Backup and Logs

encryptapp_service_principal_name        = "spn-devops-104a6d25"
cicdbuild_subnet                         = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-infra1-uat"
core_aks_subnet_id                       = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-core-aks-uat"

#SQl Server and Database

sql_server_version                       = "12.0"
sql_server_admin_username                = "fastpathadmin"
sql_server_admin_password                = ""
sql_database_edition                     = "Standard"
sql_database_performance_level           = "S0"



#ASE

ase_name                                 = "ase-use-sharedras-uat"
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

sharedrg_resource_group_name             = "RGP-USE-ASE-UAT"
sharedvnet_virtual_network_name          = "vnt-use-ase-uat"
log_analytics_workspace_name             = "law-use-sharedras-uat"
ase_subnet_name                          = "sub-use-ase-uat"
appgateway_subnet_name                   = "sub-use-appgateway-uat"


#Redis_cache

redis_capacity                           = "1"
redis_family                             = "P"
redis_sku_name                           = "Premium"


#B2C

ad_domain_name                           = "kpmgusadvcloudops"
fastpath_clientsecret                    = ""


#Web App

app_url                                  = "fastpathuat.kpmgcloudops.com"
api_url                                  = "apifastpathuat.kpmgcloudops.com"


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

container_registry_name                  = "ecrusefastpathuat"
container_image_name                     = "ecrusefastpathuat.azurecr.io/clamav:latest"
container_cpu                            = "2"
container_memory                         = "8"
container_port                           = "3310"

support_webapp_name                      = "adminfastpathuat"
support_apiapp_name                      = "apiadminfastpathuat"
apiapp_name                              = "apifastpathuat"
webapp_name                              = "fastpathuat"

#support site - apiapp
#revisit - I cannot know the webhook values until deployed automation account and runbooks and created webhook for runbook.

salt                                     = ""
webhook_addproductmodules                = ""
webhook_deleteenvironment                = ""
webhook_newenvironment                   = ""
webhook_newuser                          = ""


#Automation Account

apiroute                                 = "api"
vsopat                                   = ""
vsouri                                   = "https://dev.azure.com/CO-AzureCore/KpmgAdvisoryCloud/_apis/git/repositories/FastPath/items?path=/SQLScripts/{fileName}&versionDescriptor.version=master&versionDescriptor.versionType=branch&api-version=5.0"


#App Registration Admin

admin_clientid                           = "412e63ef-5ec0-40ec-aa36-8ebfcf7ef6bd"
fastpath_clientid                        = "2002edfb-a228-4e85-9e99-8946e944c564"
client_id                                = "2216ff1e-a4a3-4139-95e9-b4b89e001457"
client_secret                            = ""
subscription_id                          = "104a6d25-89e7-4297-9d68-76c0443b2cf6"
