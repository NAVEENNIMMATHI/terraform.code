#Backend Variables
subscription_id = "57fad7dc-7eeb-4a2c-b3b7-405d9f8d3cc8"
client_id       = "c79c197f-2835-49dc-846a-06644d7f10c4"
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"

#Secrets
client_secret     = ""
vm_admin_password = ""

#Tags
tags = {
  Environment = "Development"
  LOB         = "Consulting"
  Node        = "Spoke"
  Platform    = "Azure Commercial Cloud"
  Solution    = "OpKey"

}

#Environment Variables
application_acronym           = "opkey"
location_acronym              = "use"
location                      = "eastus"
environment_acronym           = "dv"
target_deployment_environment = "development"


#Data Sources
spoke_vnet_name    = "vnt-use-ase-dv"
spoke_vnet_rg_name = "RGP-USE-ASE-DV"
spoke_law_name     = "law-use-spokeapp-dv"
spoke_law_rg_name  = "rgp-use-ase-dv"


#Network component
cmp_agw_subnet_address_prefix        = "10.50.76.0/28"
vnet_address_space                   = ["10.51.112.0/24"]
kpmg_trusted_address_prefixes        = ["20.185.109.156/32", "54.173.33.56/32", "199.207.253.0/24", "20.185.106.213/32", "103.58.118.0/24", "199.206.0.5/32", "103.216.201.101/32"]
source_address_prefix                = "10.6.18.0/25"


#Subnets
opkey_agw_subnet_cidr         = "10.50.85.0/27"
opkey_app_subnet_cidr         = "10.50.85.32/27"
opkey_pep_subnet_cidr         = "10.50.85.64/28"
opkey_data_subnet_cidr        = "10.50.85.80/28"

#Client Virtual Machine
vm_count_cmp_client = 1
vm_size_build       = "Standard_D4s_v3"
clientvm_sku        = "2019-Datacenter"


# Private DNS Zone
private_dns_zone_subscription        = "c72acede-d539-45d9-963d-3464ec4ddae0" # dev-core
private_dns_zone_resource_group_name = "rgp-use-core-private-dnszone-dv"
#private_dns_zone_name_blob               = "privatelink.blob.core.windows.net"
#private_dns_zone_name_dfs                = "privatelink.dfs.core.windows.net"
#private_dns_zone_name_database           = "privatelink.database.windows.net"
#private_dns_zone_name_databricks         = "privatelink.azuredatabricks.net"
#private_dns_zone_name_datafactory        = "privatelink.datafactory.azure.net"
#private_dns_zone_name_automation_agensvc = "privatelink.agentsvc.azure-automation.net"
#private_dns_zone_name_automation         = "privatelink.azure-automation.net"
private_dns_zone_name_vaultcore = "privatelink.vaultcore.azure.net"
#private_dns_zone_name_servicebus         = "privatelink.servicebus.windows.net"
#private_dns_zone_name_synapse            = "privatelink.sql.azuresynapse.net"
#private_dns_zone_name_dev_synapse        = "privatelink.dev.azuresynapse.net"
#private_dns_zone_name_azurewebsites      = "privatelink.azurewebsites.net"
private_dns_zone_name_azurecr = "privatelink.azurecr.io"
#private_dns_zone_name_azmk8s            =  "privatelink.eastus.azmk8s.io"
#private_dns_zone_name_postgres = "privatelink.postgres.database.azure.com"




# Application Gateway
/*application_gateway = {
  environment_acronym = "dev"
  subnet_address      = "10.50.76.0/28"
  sku = {
    name     = "WAF_V2"
    tier     = "WAF_V2"
    capacity = 2
  }
}*/

#RouteTable
firewall_primary_core    = "10.6.24.4"
azfwsubscriptionid       = "c72acede-d539-45d9-963d-3464ec4ddae0"
firewall_network_name    = "firewall-primary-dev-core"
firewall_network_rg_name = "CO-dv-eastus-hubvnet-rg"
