# Authentication
subscription_id                 = "4c9dc048-01dc-4854-9063-8a3d4060993a"
client_id                       = "d43ed344-3d08-4001-8174-7e7a8f1920d9"
client_secret                   = ""
tenant_id                       = "b5031e57-d76f-422e-87c6-02b4cc749974"

# Project Details
application_acronym 		    = "ofr"
environment_acronym             = "p"
environment                     = "production"
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
    Environment                 = "Production" 
    Datadog                     = "Monitored" 
}

# Resource Group Variables
location		                = "eastus"
location_acronym                = "use"

# Application Gateway Variables
app_gw_allowed_ip_range		    = ["199.207.253.0/24", "199.206.0.5/32", "52.224.25.180", "52.224.25.158", "52.224.25.140", "20.42.39.126", "52.224.25.167"]
application_gw_sku_capacity	    = "2"
application_gw_sku_name		    = "WAF_Medium"
application_gw_sku_tier		    = "WAF"
application_gw_cert_name        = "ofr.kpmgcloudops.com"
application_gw_host_name        = "ofr.kpmgcloudops.com"

# App Service Plan Variables
app_service_plan_size 		    = "I2"
app_service_plan_tier		    = "Isolated"

#VNET and Subnet Varaibles 
app_subnet_address_prefixes     = ["10.6.3.0/25"]
build_subnet_address_prefixes   = ["10.6.3.128/26"]
agw_subnet_address_prefixes     = ["10.6.3.192/27"]
address_space		            = ["10.6.3.0/24"]
dns_server                      = ["10.30.15.197","10.30.15.196"]

#App Service Variables
app_service_environment_id      = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Web/hostingEnvironments/ase-use-core-pd"
app_service_url                 = "ofr.kpmgcloudops.com"

# App Service Environment Variables 
ase_internal_ip                 = "10.30.8.139"
ase_name                        = "ase-use-core-pd"
ase_subnet_id                   = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/sub-use-core-ase-pd"
core_subscription_id            = "4c9dc048-01dc-4854-9063-8a3d4060993a"
core_vnet_name                  = "CO-P-eastus-hub-vnet"
core_vnet_resource_group        = "CO-P-eastus-hubvnet-rg"

# Key Vault Variables
ato_ofr_spn_client_secret       = ""

# Key Vault Secret Variables
azuread_applicationobjectid                 = "5efd0248-5d7d-4378-b056-4b4b05769802"
azuread_clientid                            = "d4b0c10c-db6f-40aa-8b2f-5a64cfa95aee"
azuread_serviceprincipalobjectid            = "a9635576-509f-451e-b8da-7f34543f017c"
azuread_tenantid                            = "b5031e57-d76f-422e-87c6-02b4cc749974"
keyvault_url                                = "kvl-use-ofr-p.vault.azure.net"
logging_applicationinsights_loglevel_system = "Warning"
serilog_using_0                             = "Serilog.Sinks.Console"
serilog_using_1                             = "Serilog.Sinks.Datadog.Logs"
serilog_writeto_1_args_apikey               = "0959cb161a5717d51c55d2f176c45b57"
serilog_writeto_1_args_host                 = "ofr"
serilog_writeto_1_args_tags_0               = "Environment:Production"

# SQL Server
sql_server_admin_password               = ""
unique_guid                             = "c060cf30-ab07-42b8-bded-b31819a92f7b"

# Virtual Machine
vm_admin_password               = ""
build_agent_subnet_id           = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/co-p-eastus-infra1-subnet"
aks_agent_subnet_id             = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/sub-use-core-aks-pd"

# Route Table
firewall_ip_address           = "10.30.3.4"

#Build Agent SPN
build_agent_spn               = "spn-devops-4c9dc048"