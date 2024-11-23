subscription_id = "931d8a2f-96bb-44d3-9b06-6c05c41c4060"
client_id       = "98839278-b29e-4f18-be7c-556056236579"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

#Secrets
admin_password = ""
client_secret   = ""

tags = {
  Environment = "UAT"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - SNOW"
}

application_acronym = "midsvr"
location = "eastus"
location_acronym = "use"
environment_acronym = "uat"


corevnetname = "vnt-use-core-uat"
corevnetrg = "RGP-USE-COREVNET-UAT"
fw_ip = "10.100.2.196"
midserver_subnet_adress_space = "10.100.10.0/28"
mgmt_subnet_address_space = "10.30.0.0/24"
ad_subnet_address_space = "10.30.15.192/27"

vm_size = "Standard_D4s_v4"
vm_count = "1"
domain_name = "kco.local"
ou_path = "OU=AADDC Computers,DC=kco,DC=local"
encryptapp_keyvault_name ="kvl-use-ade-931d8a2f"
encryptapp_keyvault_rg = "RGP-USE-COMMON"
encryptapp_sp_name = "DiskEncryptApp"

snow_spn_name = "ServiceNowMid-UAT"
snow_spn_url = "https://kpmgmsuat.service-now.com/oath_redirect.do"
user_domain = "kpmgusadvcloudops.onmicrosoft.com"