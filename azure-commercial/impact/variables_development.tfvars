#Backend Variables
subscription_id                 = "57fad7dc-7eeb-4a2c-b3b7-405d9f8d3cc8"
client_id                       = "c79c197f-2835-49dc-846a-06644d7f10c4"
tenant_id                       = "188697ab-840f-44ec-8535-aaaa5680bab0"
pipeline_service_principal_name = "spn-devops-57fad7dc"

#Secrets
client_secret = ""


#Environment Variables
application_acronym = "impact"
location_acronym    = "use"
location            = "eastus"
environment_acronym = "dv"

#Tags
tags = {
  Environment = "Development"
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

shared_vnet_name    = "vnt-use-ase-dv"
shared_vnet_rg_name = "RGP-USE-ASE-DV"

#storage_account
account_tier     = "Standard"
replication_type = "ZRS"
dls_replication_type = "RAGRS"

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

#core subnet
coreinfrasubnetid  = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/co-dv-eastus-infra1-subnet"
core_aks_subnet_id = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/sub-use-core-aks-dv"

#Private DNS
pvt_dns_subscription_id = "c72acede-d539-45d9-963d-3464ec4ddae0"
pvt_dns_resource_group  = "rgp-use-core-private-dnszone-dv"

# Private DNS Zone
private_dns_zone_subscription        = "c72acede-d539-45d9-963d-3464ec4ddae0" # dev-core
private_dns_zone_resource_group_name = "rgp-use-core-private-dnszone-dv"
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
#private_dns_zone_name_azmk8s            =  "privatelink.eastus.azmk8s.io"
#3private_dns_zone_name_postgres = "privatelink.postgres.database.azure.com"


#Data Sources
# spoke_vnet_name    = "vnt-use-ase-dv"
# spoke_vnet_rg_name = "RGP-USE-IMPACT-DV"
spoke_law_name    = "law-use-spokeapp-dv"
spoke_law_rg_name = "rgp-use-ase-dv"

# SQL Server
sql_server_admin          = ""
sql_server_admin_password = "MU1wNGN0JDIwMjM="
sql_server_name           = ""
unique_guid               = "25ca3988-00e6-495d-9fc1-aa69735d482a"

#Firewal IP's
AZFW_PIP      = ["52.190.37.51", "52.190.37.75", "52.146.53.140", "52.146.53.139", "52.146.53.16"]
KPMG_VPN_US   = ["20.185.109.156/32","103.216.201.101/32","199.206.0.5/32","99.207.253.0/24","54.173.33.56/32","199.207.253.0/24","20.185.106.213/32","199.206.0.5/32"]
KGS_Bangalore = ["103.133.112.80/28","103.58.118.80/28"]

#App Service
initial_user                  = "admin"
appservice_log_retention_days = "7"
appservice_log_retention_mb   = "35"

#App Service Plan / shared services
app_service_plan_tier_func = "ElasticPremium"
app_service_plan_size_func = "EP1"
app_service_plan_tier      = "PremiumV2"
app_service_plan_size      = "P1v2"
shared_resource_group_name = "RGP-USE-ASE-DV"
ase_name                   = "ase-use-dvapp-dv"

azfirewall_ip_address = "10.6.24.4"

# Application Gateway
application_gateway = {
  environment_acronym = "dev"
  subnet_address = "10.50.86.0/28"
  sku = {
	name     = "WAF_V2"
  tier     = "WAF_V2"
  capacity = 2
  }
}
webapp_cert_name = "impact-dev.kpmgcloudops.com"
api_pfx_cert_name = "impactapi-dev.kpmgcloudops.com"
api_developer_pfx_cert_name       = "impactapi-dev-developer.kpmgcloudops.com"

# APIM
apimsku                    = "Developer_1"
publisher_name             = "impact publisher"
publisher_email            = "go-fmmanagedservices@kpmg.com"
apim_subnet_address_prefix = "10.50.86.16/28"
virtual_network_type       = "Internal"
probe_path                 = "/status-0123456789abcdef"

#Docker
docker_image = "impact-ui-dev"