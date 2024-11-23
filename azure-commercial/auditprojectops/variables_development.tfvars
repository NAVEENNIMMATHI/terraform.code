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
  LOB         = "Consulting" # can this be changed to Audit?
  Node        = "Spoke"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Audit Project Operations"

}

#Environment Variables
application_acronym           = "projectops"
location_acronym              = "use"
location                      = "eastus"
environment_acronym           = "dv"

agent_subnet_id    = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/co-dv-eastus-infra1-subnet"
wvd_subnet_id      = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"

kpmg_nat_ip_list = ["199.206.0.0/25", "103.133.112.80/28", "103.58.118.80/28", "103.216.201.96/28", "103.58.118.81/28", "199.247.33.6/28"]

                   #Power Apps IP Source - https://docs.microsoft.com/en-us/connectors/common/outbound-ip-addresses#power-platform
                  
powerapps_whitelist_ips = ["104.41.132.180", "13.91.93.63", "52.173.245.164", "40.71.249.205", "40.114.40.132", 
                          "52.232.188.154", "52.188.157.160", "104.209.247.23", "52.162.242.161", "104.42.122.49", 
                          "40.112.195.87", "40.77.68.110", "40.65.220.25", "13.91.97.196", "40.71.193.203", "104.210.14.156", 
                          "13.66.130.243", "65.52.197.64", "40.113.242.246", 
                          "40.71.11.80/28", "40.71.15.160/27", "52.162.107.160/28", "52.162.111.192/27", "13.89.171.80/28", 
                          "13.89.178.64/27", "40.70.146.208/28", "40.70.151.96/27", "13.86.223.32/27", "40.112.243.160/28", 
                          "20.98.144.224/27", "20.98.145.0/28", "20.88.153.176/28", "20.88.153.192/27", "20.98.192.80/28", 
                          "20.98.192.96/27",  "20.51.4.192/27", "20.51.4.224/28", "20.59.77.0/27", "20.66.6.112/28"]

d365_service_account_user      = "azuser-svcProjectOpsDV"
tenant_fqdn                    = "kpmgusadvspectrum.onmicrosoft.com"
d365_service_account_password  = ""
co_service_accounts_group_name = "CO-ServiceAccounts"


