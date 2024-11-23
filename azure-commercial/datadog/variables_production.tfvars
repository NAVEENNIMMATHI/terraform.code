# Authentication
tenant_id                       = "b5031e57-d76f-422e-87c6-02b4cc749974"
subscription_id                 = "4c9dc048-01dc-4854-9063-8a3d4060993a"
client_id                       = "d43ed344-3d08-4001-8174-7e7a8f1920d9"
client_secret                   = ""

#Diagnostic Setting Name
aad_diagnostic_setting_name     = "aad-logs-datadog-diag"
act_diagnostic_setting_name     = "activitylog-datadog-diag"
authorization_rule_name         = "RootManageSharedAccessKey"

# Project Details
application_acronym 		    = "datadog"
environment_acronym             = "p"
environment                     = "production"
tags = {
    BusinessContact		        = "jmcclung@kpmg.com"
    BusinessOwner		        = "Josh McClung"
    LOB		                    = "Advisory Other"
    Node		                = "Spoke"
    Platform		            = "Azure Commercial Cloud"
    Solution		            = "Core - DataDog"
    TechnicalContact		    = "anakkala@kpmg.com"
    TechnicalOwner		        = "Anil Nakkala"
    Version		                = "1.0"  
    Environment                 = "Production" 
    Datadog                     = "Monitored" 
}

# Resource Group Variables
location		                = "eastus"
location_acronym                = "use"

# App Service Plan Variables
app_service_plan_size 		    = "I1"
app_service_plan_tier		    = "Isolated"

#App Service Variables
app_service_environment_id      = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Web/hostingEnvironments/ase-use-core-pd"

# App Service Environment Variables 
ase_name                        = "ase-use-core-pd"
ase_subnet_id                   = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/sub-use-core-ase-pd"

#DD API Key
dd_api_key                      =  "0959cb161a5717d51c55d2f176c45b57"

#Core AKS
core_aks_subnet_id              = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/sub-use-core-aks-pd"