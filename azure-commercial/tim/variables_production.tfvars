#Auth Variables
client_id           = "089028a6-c23d-4854-8ecf-2ed345a8b1bf"
client_secret       = ""
subscription_id     = "5d3ae075-2601-49d3-9223-892e3d7f6fb1"
tenant_id           = "b5031e57-d76f-422e-87c6-02b4cc749974"
environment         = "production"
environment_acronym = "pd"
application_acronym = "tim"
location            = "eastus"
location_acronym    = "use"

tags = {
  BusinessContact  = "pemmanuel@kpmg.com"
  BusinessOwner    = "Priya Emmanuel"
  Environment      = "Production"
  Instance         = "0001"
  LOB              = "Consulting"
  Platform         = "Azure Commercial Cloud"
  Solution         = "Transformation Impact Modeler Tool (TIM)"
  Node             = "Spoke"
  TechnicalContact = "amihelich@kpmg.com"
  TechnicalOwner   = "Allyce Stanley"
  Version          = "1.0"
  Datadog          = "Monitored"
}

service_principal_name = "spn-devops-5d3ae075"

#VM Variables
vm_count          = "1"
vm_size           = "Standard_D8s_v3"
vm_admin_password = ""
custom_emails     = "go-fmmanagedservices@kpmg.com"

#SQL Variables
sql_server_admin_username = "timadmin"
sql_server_admin_password = ""

#Subnet Variables
vnet_address_space           = ["10.33.11.0/24"]
timapp_subnet_address_prefix = "10.33.11.0/27"
dns_servers                  = ["10.30.15.197", "10.30.15.196"]

#Route Table Variables
route_next_hop_in_ip_address = "10.30.3.4"


#Transif Variables
transit_vnet_name                 = "CO-P-eastus-transit-vnet"
transitvnet_resource_group_name   = "CO-P-eastus-transitvnet-rg"
transittoappvnet_vnetpeering_name = "vnet-use-transit-ps-to-vnet-use-tim-pd"
transitsubscriptionid             = "0d7a7f3c-a15d-4d37-924c-2507147fb74c"
transit_vnetpeering_name          = "vnet-use-tim-pd-to-vnet-use-transit-pd"

#Core Variables
core_vnet_name                 = "CO-P-eastus-hub-vnet"
corevnet_resource_group_name   = "CO-P-eastus-hubvnet-rg"
coretoappvnet_vnetpeering_name = "vnet-use-core-pd-to-vnet-use-tim-pd"
coresubscriptionid             = "4c9dc048-01dc-4854-9063-8a3d4060993a"
core_vnetpeering_name          = "vnet-use-tim-pd-to-vnet-use-core-pd"