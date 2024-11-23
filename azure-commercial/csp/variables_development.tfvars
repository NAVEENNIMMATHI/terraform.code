#Backend Variables
subscription_id = "57fad7dc-7eeb-4a2c-b3b7-405d9f8d3cc8"
client_id       = "c79c197f-2835-49dc-846a-06644d7f10c4"
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"

#Secrets
client_secret     = ""
#vm_admin_password = ""
csp_clarizen_api_key = ""
csp_sync_blob_key = ""
csp_success_spn_key = ""

#Tags
tags = {
  Environment = "Development"
  LOB         = "Consulting"
  Node        = "Spoke"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Cyber Success Platform (CSP)"

}

#Environment Variables
application_acronym           = "csp"
location_acronym              = "use"
location                      = "eastus"
environment_acronym           = "dv"
target_deployment_environment = "development"


#Data Sources
spoke_vnet_name    = "vnt-use-ase-dv"
spoke_vnet_rg_name = "RGP-USE-ASE-DV"
spoke_law_name     = "law-use-spokeapp-dv"
spoke_law_rg_name  = "rgp-use-ase-dv"





# Private DNS Zone
#private_dns_zone_subscription            = "c72acede-d539-45d9-963d-3464ec4ddae0" # dev-core
#private_dns_zone_resource_group_name     = "rgp-use-core-private-dnszone-dv"
#private_dns_zone_name_blob               = "privatelink.blob.core.windows.net"
#private_dns_zone_name_dfs                = "privatelink.dfs.core.windows.net"
#private_dns_zone_name_database           = "privatelink.database.windows.net"
#private_dns_zone_name_databricks         = "privatelink.azuredatabricks.net"
#private_dns_zone_name_datafactory        = "privatelink.datafactory.azure.net"
#private_dns_zone_name_automation_agensvc = "privatelink.agentsvc.azure-automation.net"
#private_dns_zone_name_automation         = "privatelink.azure-automation.net"
#private_dns_zone_name_vaultcore          = "privatelink.vaultcore.azure.net"
#private_dns_zone_name_servicebus         = "privatelink.servicebus.windows.net"
#private_dns_zone_name_synapse            = "privatelink.sql.azuresynapse.net"
#private_dns_zone_name_dev_synapse        = "privatelink.dev.azuresynapse.net"
#private_dns_zone_name_azurewebsites      = "privatelink.azurewebsites.net"
#private_dns_zone_name_azurecr            = "privatelink.azurecr.io"
#private_dns_zone_name_azmk8s            =  "privatelink.eastus.azmk8s.io"
#private_dns_zone_name_postgres           = "privatelink.postgres.database.azure.com"

#RouteTable
firewall_primary_core = "10.6.24.4"
azfwsubscriptionid       = "c72acede-d539-45d9-963d-3464ec4ddae0"
firewall_network_name    = "firewall-primary-dev-core"
firewall_network_rg_name = "CO-dv-eastus-hubvnet-rg"

#key_vault
pipeline_service_principal_name        = "spn-devops-57fad7dc"

kpmg_nat_ip_list = ["199.206.0.5", "199.207.253.101", "199.207.253.96", "199.206.0.0/25","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.58.118.81/28","199.247.33.6/28"]

                   #Power Apps IP Source - https://docs.microsoft.com/en-us/connectors/common/outbound-ip-addresses#power-platform
                  
powerapps_whitelist_ips = ["104.41.132.180", "13.91.93.63", "52.173.245.164", "40.71.249.205", "40.114.40.132", "52.232.188.154", "52.188.157.160", "104.209.247.23", "52.162.242.161",
                          "104.42.122.49", "40.112.195.87", "40.77.68.110", "40.65.220.25", "13.91.97.196", "40.71.193.203", "104.210.14.156", "13.66.130.243", "65.52.197.64",
                          "40.113.242.246", "40.71.11.80/28", "40.71.15.160/27", "52.162.107.160/28", "52.162.111.192/27", "13.89.171.80/28", "13.89.178.64/27", "40.70.146.208/28", "40.70.151.96/27",
                          "13.86.223.32/27", "40.112.243.160/28", "20.98.144.224/27", "20.98.145.0/28", "20.88.153.176/28", "20.88.153.192/27", "20.98.192.80/28", "20.98.192.96/27",
                          "20.51.4.192/27","20.51.4.224/28", "20.59.77.0/27", "20.66.6.112/28"]

#spn
spn_redirect_url = ["https://cybersuccessdev.powerappsportals.com/signin-openid_1"]

# ad-user Variables
tenant_fqdn                    = "kpmgusadvspectrum.onmicrosoft.com"
csp_service_account_user       = "azuser-svcCSPDEV"
csp_service_account_password   = ""