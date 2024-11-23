# Authentication
tenant_id                       = "188697ab-840f-44ec-8535-aaaa5680bab0"
subscription_id                 = "c72acede-d539-45d9-963d-3464ec4ddae0"
client_id                       = "f294bc17-39a8-477e-aeac-b73870cc67b5"
client_secret                   = ""

#Diagnostic Setting Name
aad_diagnostic_setting_name     = "aad-logs-datadog-diag"
act_diagnostic_setting_name     = "activitylog-datadog-diag"
authorization_rule_name         = "RootManageSharedAccessKey"

# Project Details
application_acronym 		    = "datadog"
environment_acronym             = "dev"
environment                     = "dev"
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
    Environment                 = "Development"  
}

# Resource Group Variables
location		                = "eastus"
location_acronym                = "use"

# App Service Plan Variables
app_service_plan_size 		    = "I1"
app_service_plan_tier		    = "Isolated"

# App Service Variables
app_service_environment_id      = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Web/hostingEnvironments/ase-use-core-dv"

# App Service Environment Variables 
ase_name                        =  "ase-use-core-dv"
ase_subnet_id                   =  "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/microsoft.network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/sub-use-core-ase-dv"

#DD API Key
dd_api_key                      =  "a3b2fa8be439a602d1836598bfbe6fbf"

#Core AKS
core_aks_subnet_id              = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/sub-use-core-aks-dv"