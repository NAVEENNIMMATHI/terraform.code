#Auth Variables
client_id           = "65d6e9b3-65b7-42b9-9f30-89d6a33becf8"
client_secret       = ""
subscription_id     = "96e9a7e6-da33-4993-89ca-b82e0b571aee"
tenant_id           = "188697ab-840f-44ec-8535-aaaa5680bab0"
environment         = "QA"
environment_acronym = "qa"
application_acronym = "tim"
location            = "eastus"
location_acronym    = "use"

tags = {
  BusinessContact  = "pemmanuel@kpmg.com"
  BusinessOwner    = "Priya Emmanuel"
  Environment      = "QA"
  Instance         = "0001"
  LOB              = "Consulting"
  Platform         = "Azure Commercial Cloud"
  Solution         = "Transformation Impact Modeler Tool (TIM)"
  Node             = "Spoke"
  TechnicalContact = "amihelich@kpmg.com"
  TechnicalOwner   = "Allyce Stanley"
  Version          = "1.0"
}

service_principal_name = "spn-devops-96e9a7e6"

#VM Variables
vm_count          = "1"
vm_size           = "Standard_D2s_v3"
vm_admin_password = ""
custom_emails     = "go-fmmanagedservices@kpmg.com"

# SQL Variables
sql_server_admin_username = "timadmin"
sql_server_admin_password = ""

#Subnet Variables
vnet_address_space           = ["10.71.4.0/24"]
timapp_subnet_address_prefix = "10.71.4.0/27"
dns_servers                  = ["10.1.11.4", "10.1.11.5"]

#Route Table Variables
route_next_hop_in_ip_address = "10.101.2.196"

#Transit Variables
transit_vnet_name                 = "CO-NP-eastus-transit1-Vnet"
transitvnet_resource_group_name   = "CO-NP-eastus-CONPTVnet-rg"
transittoappvnet_vnetpeering_name = "vnet-use-transit-qa-to-vnet-use-tim-qa"
transitsubscriptionid             = "25f8d797-bee2-4a88-84cc-de328abd6731"
transit_vnetpeering_name          = "vnet-use-tim-qa-to-vnet-use-transit-qa"

#Core Variables
core_vnet_name                 = "co-np-eastus-core1-vnet"
corevnet_resource_group_name   = "co-np-eastus-core1-rg"
coretoappvnet_vnetpeering_name = "vnet-use-core-qa-to-vnet-use-tim-qa"
coresubscriptionid             = "4cdcf904-fa57-4815-8cb3-e33b9b44f479"
core_vnetpeering_name          = "vnet-use-tim-qa-to-vnet-use-core-qa"