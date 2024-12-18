#Auth Variables
client_id           = "ceb0da68-d291-448a-9fb1-18613a3c2084"
client_secret       = ""
subscription_id     = "f4afed22-229f-47b8-b3b4-fc85d3b6ba0d"
tenant_id           = "188697ab-840f-44ec-8535-aaaa5680bab0"
environment         = "np"
environment_acronym = "np"
application_acronym = "tim"
location            = "eastus"
location_acronym    = "use"

tags = {
  BusinessContact  = "pemmanuel@kpmg.com"
  BusinessOwner    = "Priya Emmanuel"
  Environment      = "Development"
  Instance         = "0001"
  LOB              = "Consulting"
  Platform         = "Azure Commercial Cloud"
  Solution         = "Transformation Impact Modeler Tool (TIM)"
  Node             = "Spoke"
  TechnicalContact = "amihelich@kpmg.com"
  TechnicalOwner   = "Allyce Stanley"
  Version          = "1.0"
}

service_principal_name = "spn-devops-f4afed22"

#VM Variables
vm_count          = "1"
vm_size           = "Standard_D4s_v3"
vm_admin_password = ""
custom_emails     = "go-fmmanagedservices@kpmg.com"

#SQL Variables
sql_server_admin_username = "timadmin"
sql_server_admin_password = ""

#Subnet Variables
vnet_address_space           = ["10.1.26.0/24"]
timapp_subnet_address_prefix = "10.1.26.0/27"
dns_servers                  = ["10.1.11.4", "10.1.11.5"]

#Route Table Variables
route_next_hop_in_ip_address = "10.1.16.100"

#Transif Variables
transitvnet_resource_group_name   = "CO-NP-eastus-CONPTVnet-rg"
transittoappvnet_vnetpeering_name = "vnet-use-transit-ts-to-vnet-use-tim-ts"
transit_vnet_name                 = "CO-NP-eastus-transit1-Vnet"
transitsubscriptionid             = "25f8d797-bee2-4a88-84cc-de328abd6731"
transit_vnetpeering_name          = "vnet-use-tim-np-to-vnet-use-transit-np"

#Core Variables
core_vnet_name                 = "co-np-eastus-core1-vnet"
corevnet_resource_group_name   = "co-np-eastus-core1-rg"
coretoappvnet_vnetpeering_name = "vnet-use-core-ts-to-vnet-use-tim-ts"
coresubscriptionid             = "4cdcf904-fa57-4815-8cb3-e33b9b44f479"
core_vnetpeering_name          = "vnet-use-tim-np-to-vnet-use-core-np"