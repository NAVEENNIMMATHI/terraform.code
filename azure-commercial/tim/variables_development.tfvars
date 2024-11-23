#Auth Variables
client_id           = "c79c197f-2835-49dc-846a-06644d7f10c4"
client_secret       = ""
subscription_id     = "57fad7dc-7eeb-4a2c-b3b7-405d9f8d3cc8"
tenant_id           = "188697ab-840f-44ec-8535-aaaa5680bab0"
environment         = "Development"
environment_acronym = "dv"
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

service_principal_name = "spn-devops-57fad7dc"

#VM Variables
vm_count          = "1"
vm_size           = "Standard_D8s_v3"
vm_admin_password = ""
custom_emails     = "go-fmmanagedservices@kpmg.com"

# SQL Variables
sql_server_admin_username = "timadmin"
sql_server_admin_password = ""

#Subnet Variables
vnet_address_space           = ["10.51.4.0/24"]
timapp_subnet_address_prefix = "10.51.4.0/27"
dns_servers                  = ["10.1.11.4", "10.1.11.5"]

#Route Table Variables
route_next_hop_in_ip_address = "10.6.24.4"

#Transit Variables
transit_vnet_name                 = "CO-NP-eastus-transit1-Vnet"
transitvnet_resource_group_name   = "CO-NP-eastus-CONPTVnet-rg"
transittoappvnet_vnetpeering_name = "vnet-use-transit-dv-to-vnet-use-tim-dv"
transitsubscriptionid             = "25f8d797-bee2-4a88-84cc-de328abd6731"
transit_vnetpeering_name          = "vnet-use-tim-dv-to-vnet-use-transit-dv"

#Core Variables
core_vnet_name                 = "co-np-eastus-core1-vnet"
corevnet_resource_group_name   = "co-np-eastus-core1-rg"
coretoappvnet_vnetpeering_name = "vnet-use-core-dv-to-vnet-use-tim-dv"
coresubscriptionid             = "4cdcf904-fa57-4815-8cb3-e33b9b44f479"
core_vnetpeering_name          = "vnet-use-tim-dv-to-vnet-use-core-dv"