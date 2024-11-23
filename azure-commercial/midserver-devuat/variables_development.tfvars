subscription_id = "4cdcf904-fa57-4815-8cb3-e33b9b44f479"
client_id       = "77b50f76-a2b7-4bad-9bc6-cbf0ca85426c"
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"

#Secrets
admin_password = ""
client_secret   = ""

tags = {
  Environment = "Development"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Core - SNOW"
}

application_acronym = "midsvrp"
location = "eastus"
location_acronym = "use"
environment_acronym = "dv"


corevnetname = "co-np-eastus-core1-vnet"
corevnetrg = "co-np-eastus-core1-rg"
fw_ip = "10.6.24.4"
midserver_subnet_adress_space = "10.1.15.144/28"
mgmt_subnet_address_space = "10.1.12.0/24"
ad_subnet_address_space = "10.1.11.0/24"

vm_size = "Standard_D4s_v4"
vm_count = "1"
domain_name = "kconp.local"
ou_path = "OU=AADDC Computers,DC=kconp,DC=local"
encryptapp_keyvault_name ="CONPEUSKEYV1"
encryptapp_keyvault_rg = "co-np-eastus-core1-rg"
encryptapp_sp_name = "EncryptApp"