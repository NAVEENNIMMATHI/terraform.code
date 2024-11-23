#Auth Variables
client_id           = "2216ff1e-a4a3-4139-95e9-b4b89e001457"
client_secret       = ""
subscription_id     = "104a6d25-89e7-4297-9d68-76c0443b2cf6"
tenant_id           = "b5031e57-d76f-422e-87c6-02b4cc749974"
environment         = "uat"
environment_acronym = "uat"
application_acronym = "tim"
location            = "eastus"
location_acronym    = "use"

tags = {
  BusinessContact  = "pemmanuel@kpmg.com"
  BusinessOwner    = "Priya Emmanuel"
  Environment      = "UAT"
  Instance         = "0001"
  LOB              = "Consulting"
  Platform         = "Azure Commercial Cloud"
  Solution         = "Transformation Impact Modeler Tool (TIM)"
  Node             = "Spoke"
  TechnicalContact = "amihelich@kpmg.com"
  TechnicalOwner   = "Allyce Stanley"
  Version          = "1.0"
}

service_principal_name = "spn-devops-104a6d25"

#VM Variables
vm_count          = "1"
vm_size           = "Standard_D4s_v3"
vm_admin_password = ""
custom_emails     = "go-fmmanagedservices@kpmg.com"

#SQL Variables
sql_server_admin_username = "timadmin"
sql_server_admin_password = ""

#Subnet Variables
vnet_address_space           = ["10.51.4.0/24"]
timapp_subnet_address_prefix = "10.51.4.0/27"
dns_servers                  = ["10.30.15.197", "10.30.15.196"]

#Route Table Variables
route_next_hop_in_ip_address = "10.30.16.100"

#Transif Variables
transit_vnet_name                 = "CO-P-eastus-transit-vnet"
transitvnet_resource_group_name   = "CO-P-eastus-transitvnet-rg"
transittoappvnet_vnetpeering_name = "vnet-use-transit-uat-to-vnet-use-tim-uat"
transitsubscriptionid             = "0d7a7f3c-a15d-4d37-924c-2507147fb74c"
transit_vnetpeering_name          = "vnet-use-tim-uat-to-vnet-use-transit-uat"

#Core Variables
core_vnet_name                 = "CO-P-eastus-hub-vnet"
corevnet_resource_group_name   = "CO-P-eastus-hubvnet-rg"
coretoappvnet_vnetpeering_name = "vnet-use-core-uat-to-vnet-use-tim-uat"
coresubscriptionid             = "4c9dc048-01dc-4854-9063-8a3d4060993a"
core_vnetpeering_name          = "vnet-use-tim-uat-to-vnet-use-core-uat"