# Backend Variables
subscription_id = "5d3ae075-2601-49d3-9223-892e3d7f6fb1"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"
client_id       = "089028a6-c23d-4854-8ecf-2ed345a8b1bf"
client_secret   = ""

location_acronym    = "use"
application_acronym = "gc"
environment_acronym = "pd"
location            = "eastus"
environment         = "production"

tags = {
  BusinessOwner    = "May Boucherak"
  BusinessContact  = "mboucherak@kpmg.com"
  Environment      = "Production"
  Instance         = "0001"
  LOB              = "Risk Advisory Solutions"
  Platform         = "Azure Commercial Cloud"
  Solution         = "GrantCare (GC)"
  Node             = "Spoke"
  TechnicalOwner   = "Sanooj Ramachandran"
  TechnicalContact = "sramachandran@kpmg.com"
  Version          = "1.0"
  Datadog          = "Monitored"
}

GCDevelopers_description = "This Group will be used for Grantcare Application Developers"


d365ServicesaccountUser = "azuser-svcGCPD"
tenantfqdn = "kpmgusadvcloudops.onmicrosoft.com"
d365Servicesaccount_password = ""
ServiceAccounts = "CO-ServiceAccounts"
ServiceAccountsllp= "KPMG LLP"
restrict_gateway_endpoint = "true"

#AD Groups
encryptapp_sp_name = "spn-devops-5d3ae075"
cloudops_keyvault_admin_group_name = "CO-TerraformStorage-Admin"
client_keyvault_admin_group_name = "CO-RAS-PD-KeyVault-Admins"

//spndisplayname = "spn-devops-5d3ae075"
sastype="accountsas"