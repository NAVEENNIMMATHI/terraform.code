#Backend Variables
subscription_id = "104a6d25-89e7-4297-9d68-76c0443b2cf6"
client_id       = "2216ff1e-a4a3-4139-95e9-b4b89e001457"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"
pipeline_service_principal_name = "spn-devops-104a6d25"

#Secrets
client_secret = ""


#Environment Variables
application_acronym = "impact"
location_acronym    = "use"
location            = "eastus"
environment_acronym = "uat"

#Tags
tags = {
  Environment = "UAT"
  LOB         = "Advisory Other"
  Node        = "Spoke"
  Platform    = "Azure Commercial Cloud"
  Solution    = "KPMG Impact"
}

#sub_network

private_endpoint_subnet_address_space = "10.50.86.64/27"
agw1_subnet_adress_space              = "10.50.86.0/28"
apim_subnet_address_space             = "10.50.86.16/28"
function_subnet_address_space         = "10.50.86.48/28"

shared_vnet_name    = "vnt-use-ase-uat"
shared_vnet_rg_name = "RGP-USE-ASE-UAT"

#storage_account
account_tier     = "Standard"
replication_type = "ZRS"
dls_replication_type = "RAGRS"

#core subnet
coreinfrasubnetid  = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-infra1-uat"
core_aks_subnet_id = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-core-aks-uat"

#Private DNS
pvt_dns_subscription_id = "4c9dc048-01dc-4854-9063-8a3d4060993a" # pd-core
pvt_dns_resource_group  = "RGP-USE-CORE-PRIVATE-DNSZONE-PD"

# Private DNS Zone
private_dns_zone_subscription        = "4c9dc048-01dc-4854-9063-8a3d4060993a" # pd-core
private_dns_zone_resource_group_name = "RGP-USE-CORE-PRIVATE-DNSZONE-PD"
private_dns_zone_name_blob           = "privatelink.blob.core.windows.net"
private_dns_zone_name_dfs            = "privatelink.dfs.core.windows.net"
private_dns_zone_name_database       = "privatelink.database.windows.net"
#private_dns_zone_name_databricks         = "privatelink.azuredatabricks.net"
#private_dns_zone_name_datafactory        = "privatelink.datafactory.azure.net"
#private_dns_zone_name_automation_agensvc = "privatelink.agentsvc.azure-automation.net"
#private_dns_zone_name_automation         = "privatelink.azure-automation.net"
private_dns_zone_name_vaultcore = "privatelink.vaultcore.azure.net"
#private_dns_zone_name_servicebus         = "privatelink.servicebus.windows.net"
#private_dns_zone_name_synapse            = "privatelink.sql.azuresynapse.net"
#private_dns_zone_name_dev_synapse        = "privatelink.dev.azuresynapse.net"
private_dns_zone_name_synapse       = "privatelink.sql.azuresynapse.net"
private_dns_zone_name_dev_synapse   = "privatelink.dev.azuresynapse.net"
private_dns_zone_name_azurewebsites = "privatelink.azurewebsites.net"
private_dns_zone_name_azurecr       = "privatelink.azurecr.io"


## DLS Storage
impact_multi_tenant = { 
  client1 = {
    clients =["williams","coterra"]
    folders = ["cxl-raw","cxl-re-trigger","cxl-scripts","cxl-error-files"]
  }
}

impact_multi_tenant_clients = {
    clients = [
    "Williams",
    "Coterra",

  ]
}

impact_multi_tenant_folders = {
    folders = [
    "cxl-raw",
    "cxl-re-trigger",
    "cxl-scripts",
    "cxl-error-files",
  ]
}


#Data Sources
# spoke_vnet_name    = "vnt-use-ase-dv"
# spoke_vnet_rg_name = "RGP-USE-IMPACT-DV"
spoke_law_name    = "law-use-sharedras-uat"
spoke_law_rg_name = "rgp-use-ase-uat"

# SQL Server
sql_server_admin          = ""
sql_server_admin_password = ""
sql_server_name           = ""
unique_guid               = "a965f232-c96a-4d57-9e9e-7fea006a6cc6"

#Firewal IP's
AZFW_PIP = ["52.170.175.39", "52.170.174.246", "52.188.26.32", "52.188.27.2", "52.188.26.99"]
KPMG_VPN_US                                = ["20.185.109.156/32","103.216.201.101/32","199.206.0.5/32","99.207.253.0/24","54.173.33.56/32","199.207.253.0/24","20.185.106.213/32","199.206.0.5/32"]
KGS_Bangalore                              = ["103.133.112.80/28","103.58.118.80/28"]

#App Service
initial_user                  = "admin"
appservice_log_retention_days = "7"
appservice_log_retention_mb   = "35"

#App Service Plan / shared services
app_service_plan_tier_func = "ElasticPremium"
app_service_plan_size_func = "EP1"
app_service_plan_tier      = "PremiumV2"
app_service_plan_size      = "P1v2"
shared_resource_group_name = "RGP-USE-ASE-UAT"
ase_name                   = "ase-use-sharedras-uat"

azfirewall_ip_address = "10.100.2.196"

# Application Gateway
application_gateway = {
  environment_acronym = "uat"
  subnet_address = "10.50.86.0/28"
  sku = {
	name     = "WAF_V2"
  tier     = "WAF_V2"
  capacity = 2
  }
}
webapp_cert_name = "impact-uat.kpmgcloudops.com"
api_pfx_cert_name = "impactapi-uat.kpmgcloudops.com"
api_developer_pfx_cert_name       = "impactapi-uat-developer.kpmgcloudops.com"

# APIM
apimsku                    = "Developer_1"
publisher_name             = "impact publisher"
publisher_email            = "go-fmmanagedservices@kpmg.com"
apim_subnet_address_prefix = "10.50.86.16/28"
virtual_network_type       = "Internal"
probe_path                 = "/status-0123456789abcdef"


#Docker
docker_image = "impact-ui-uat"