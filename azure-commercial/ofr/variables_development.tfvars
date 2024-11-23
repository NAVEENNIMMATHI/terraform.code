# Authentication
subscription_id                 = "c72acede-d539-45d9-963d-3464ec4ddae0"
client_id                       = "f294bc17-39a8-477e-aeac-b73870cc67b5"
client_secret                   = ""
tenant_id                       = "188697ab-840f-44ec-8535-aaaa5680bab0"

# Project Details
application_acronym 		    = "ofr"
environment_acronym             = "dev"
environment                     = "dev"
tags = {
    BusinessContact		        = "jmcclung@kpmg.com"
    BusinessOwner		        = "Josh McClung"
    LOB		                    = "Advisory Other"
    Node		                = "Spoke"
    Platform		            = "Azure Commercial Cloud"
    Solution		            = "Operational Fitness Review (OFR)"
    TechnicalContact		    = "anakkala@kpmg.com"
    TechnicalOwner		        = "Anil Nakkala"
    Version		                = "1.0" 
    Environment                 = "Development"   
    Datadog                     = "Monitored"
}

# Resource Group Variables
location		                = "eastus"
location_acronym                = "use"

# Application Gateway Variables
app_gw_allowed_ip_range		    = ["199.207.253.0/24", "199.206.0.5/32", "52.190.37.51", "52.190.37.75", "52.146.53.140", "52.146.53.139", "52.146.53.16"]
application_gw_sku_capacity	    = "2"
application_gw_sku_name		    = "WAF_Medium"
application_gw_sku_tier		    = "WAF"
application_gw_cert_name        = "ofrdev.kpmgcloudops.com"
application_gw_host_name        = "ofrdev.kpmgcloudops.com"

# App Service Plan Variables
app_service_plan_size 		    = "I2"
app_service_plan_tier		    = "Isolated"

#VNET and Subnet Varaibles 
app_subnet_address_prefixes     = ["10.102.0.0/25"]
build_subnet_address_prefixes   = ["10.102.0.128/26"]
agw_subnet_address_prefixes     = ["10.102.0.192/27"]
address_space		            = ["10.102.0.0/24"]
dns_server                      = ["10.1.11.4","10.1.11.5"]

# App Service Variables
app_service_environment_id      = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Web/hostingEnvironments/ase-use-core-dv"
app_service_url                 = "ofrdev.kpmgcloudops.com"

# App Service Environment Variables 
ase_internal_ip                 =  "10.6.27.11"
ase_name                        =  "ase-use-core-dv"
ase_subnet_id                   =  "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/microsoft.network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/sub-use-core-ase-dv"
core_subscription_id            =  "c72acede-d539-45d9-963d-3464ec4ddae0"
core_vnet_name                  =  "CO-dv-eastus-hub-vnet"
core_vnet_resource_group        =  "CO-dv-eastus-hubvnet-rg"

# Key Vault Variables
ato_ofr_spn_client_secret       = ""

# Key Vault Secret Variables
azuread_applicationobjectid                 = "87c056fc-5a25-4a82-a47e-53d79657e77a"
azuread_clientid                            = "bd55a32a-998e-4a81-8b87-5d3052d0dfd3"
azuread_serviceprincipalobjectid            = "9d194543-e184-4fb5-8477-8966706602ce"
azuread_tenantid                            = "188697ab-840f-44ec-8535-aaaa5680bab0"
keyvault_url                                = "kvl-use-ofr-dev.vault.azure.net"
logging_applicationinsights_loglevel_system = "Information"
serilog_using_0                             = "Serilog.Sinks.Console"
serilog_using_1                             = "Serilog.Sinks.Datadog.Logs"
serilog_writeto_1_args_apikey               = "9bdc41504447b97618684d8566e1b926"
serilog_writeto_1_args_host                 = "ofrdev"
serilog_writeto_1_args_tags_0               = "Environment:NonProd"

# SQL Server
sql_server_admin_password       = ""
unique_guid                     = "fe6ddd80-758c-48c2-92f7-459b86bb684a"

# Virtual Machine
vm_admin_password               = ""
build_agent_subnet_id           = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/co-dv-eastus-infra1-subnet"
aks_agent_subnet_id             = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/sub-use-core-aks-dv"

# Route Table
firewall_ip_address           = "10.6.24.4"

#Build Agent SPN
build_agent_spn               = "spn-devops-c72acede"