#Backend Variables
subscription_id = "104a6d25-89e7-4297-9d68-76c0443b2cf6"
client_id       = "2216ff1e-a4a3-4139-95e9-b4b89e001457"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

#Secrets
client_secret     = ""
#vm_admin_password = ""
csp_clarizen_api_key = ""
csp_sync_blob_key = ""
csp_success_spn_key = ""

#Tags
tags = {
  Environment = "UAT"
  LOB         = "Consulting"
  Node        = "Spoke"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Cyber Success Platform (CSP)"

}

#Environment Variables
application_acronym           = "csp"
location_acronym              = "use"
location                      = "eastus"
environment_acronym           = "uat"
target_deployment_environment = "uat"


#Data Sources
spoke_vnet_name    = "vnt-use-ase-uat"
spoke_vnet_rg_name = "RGP-USE-ASE-UAT"
spoke_law_name     = "law-use-sharedras-uat"
spoke_law_rg_name  = "rgp-use-ase-uat"

#RouteTable
firewall_primary_core = "10.6.24.4" #Need To Confirm
azfwsubscriptionid       = "931d8a2f-96bb-44d3-9b06-6c05c41c4060"
firewall_network_name    = "fwl-use-primary-uat-core"
firewall_network_rg_name = "RGP-USE-COREVNET-UAT"

#key_vault
pipeline_service_principal_name        = "spn-devops-104a6d25"

kpmg_nat_ip_list = ["199.206.0.5", "199.207.253.101", "199.207.253.96", "199.206.0.0/25","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.58.118.81/28","199.247.33.6/28"]

                   #Power Apps IP Source - https://docs.microsoft.com/en-us/connectors/common/outbound-ip-addresses#power-platform
                  
powerapps_whitelist_ips = ["104.41.132.180", "13.91.93.63", "52.173.245.164", "40.71.249.205", "40.114.40.132", "52.232.188.154", "52.188.157.160", "104.209.247.23", "52.162.242.161",
                          "104.42.122.49", "40.112.195.87", "40.77.68.110", "40.65.220.25", "13.91.97.196", "40.71.193.203", "104.210.14.156", "13.66.130.243", "65.52.197.64",
                          "40.113.242.246", "40.71.11.80/28", "40.71.15.160/27", "52.162.107.160/28", "52.162.111.192/27", "13.89.171.80/28", "13.89.178.64/27", "40.70.146.208/28", "40.70.151.96/27",
                          "13.86.223.32/27", "40.112.243.160/28", "20.98.144.224/27", "20.98.145.0/28", "20.88.153.176/28", "20.88.153.192/27", "20.98.192.80/28", "20.98.192.96/27",
                          "20.51.4.192/27","20.51.4.224/28", "20.59.77.0/27", "20.66.6.112/28"]

#spn
spn_redirect_url = ["https://cybersuccessuat.powerappsportals.com/signin-openid_1"]

# ad-user Variables
tenant_fqdn                    = "kpmgusadvcloudops.onmicrosoft.com"
csp_service_account_user       = "azuser-svcCSPUAT"
csp_service_account_password   = ""