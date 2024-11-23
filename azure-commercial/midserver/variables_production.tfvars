subscription_id = "4c9dc048-01dc-4854-9063-8a3d4060993a"
client_id       = "d43ed344-3d08-4001-8174-7e7a8f1920d9"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

#Secrets
admin_password = ""
client_secret   = ""

tags = {
  Environment = "Production"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - SNOW"
  Datadog     = "Monitored"
}

application_acronym = "midsvr"
location = "eastus"
location_acronym = "use"
environment_acronym = "pd"


corevnetname = "CO-P-eastus-hub-vnet"
corevnetrg = "CO-P-eastus-hubvnet-rg"
fw_ip = "10.30.3.4"
midserver_subnet_adress_space = "10.30.10.0/28"
mgmt_subnet_address_space = "10.30.0.0/24"
ad_subnet_address_space = "10.30.15.192/27"

vm_size = "Standard_D4s_v4"
vm_count = "1"
domain_name = "kco.local"
ou_path = "OU=AADDC Computers,DC=kco,DC=local"
encryptapp_keyvault_name ="kvl-use-ade-4c9dc048"
encryptapp_keyvault_rg = "RGP-USE-COREKV-P"
encryptapp_sp_name = "DiskEncryptApp"

snow_spn_name = "ServiceNowMid-PD"
snow_spn_url = "https://kpmgmsprod.service-now.com/oath_redirect.do"
user_domain = "kpmgusadvcloudops.onmicrosoft.com"