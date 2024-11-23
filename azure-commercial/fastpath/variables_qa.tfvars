#Environment specific variable
environment                              = "qa"
environment_acronym                      = "qa"
environment_acronym_aad_url              = "qa"
application_name                         = "fastpath"
application_acronym                      = "fp"
location                                 = "eastus"
location_acronym                         = "use"
tags = {
    BusinessContact                      = "hmcgarry@kpmg.com"
    BusinessOwner                        = "Mick McGarry"
    Environment                          = "QA"
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

app_subnet_address_prefix                = "10.70.20.32/27"
redis_subnet_address_prefix              = "10.70.20.64/28"
aci_subnet_address_prefix                = "10.70.20.80/28"
ase_subnet_address_prefix                = "10.70.0.0/22"
service_endpoints                        = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault"]
appsubnet_service_endpoints              = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.ServiceBus"]
route_name                               = "OutboundTraffictoAzureFirewall"
route_address_prefix                     = "0.0.0.0/0"
route_next_hop_type                      = "VirtualAppliance"
route_next_hope_in_ip_address            = "10.101.2.196"
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
keyvault_name                            = "kvl-use-common-96e9a7e6"
keyvault_resource_group_name             = "RGP-USE-COMMON"
diagnostic_storage_account_resourcegroup_name = "RGP-USE-COMMON"
diagnostic_storage_account_name          = "stousecommon96e9a7e6"


#Backup and Logs

encryptapp_service_principal_name        = "spn-devops-96e9a7e6"
cicdbuild_subnet                         = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-infra1-qa"
core_aks_subnet_id                       = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-core-aks-qa"

#SQl Server and Database

sql_server_version                       = "12.0"
sql_server_admin_username                = "fastpathadmin"
sql_server_admin_password                = ""
sql_database_edition                     = "Standard"
sql_database_performance_level           = "S0"



#ASE

ase_name                                 = "ase-use-qaapp-qa"
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

sharedrg_resource_group_name             = "RGP-USE-ASE-QA"
sharedvnet_virtual_network_name          = "vnt-use-ase-qa"
log_analytics_workspace_name             = "law-use-spokeapp-qa"
ase_subnet_name                          = "sub-use-ase-qa"
appgateway_subnet_name                   = "sub-use-appgateway-qa"


#Redis_cache

redis_capacity                           = "1"
redis_family                             = "P"
redis_sku_name                           = "Premium"


#B2C

ad_domain_name                           = "kpmgusadvspectrum"
fastpath_clientsecret                    = ""


#Web App

app_url                                  = "fastpathqa.kpmgcloudops.com"
api_url                                  = "apifastpathqa.kpmgcloudops.com"


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

container_registry_name                  = "ecrusefastpathqa"
container_image_name                     = "ecrusefastpathqa.azurecr.io/clamav:latest"
container_cpu                            = "2"
container_memory                         = "8"
container_port                           = "3310"

support_webapp_name                      = "adminfastpathqa"
support_apiapp_name                      = "apiadminfastpathqa"
apiapp_name                              = "apifastpathqa"
webapp_name                              = "fastpathqa"

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

admin_clientid                           = "6abe7c1c-23a9-4d1f-8bbb-e68569561196"
fastpath_clientid                        = "addfc5e7-acde-4514-bdcd-dc22c3cdb72f"
client_id                                = "65d6e9b3-65b7-42b9-9f30-89d6a33becf8"
client_secret                            = ""
subscription_id                          = "96e9a7e6-da33-4993-89ca-b82e0b571aee"
