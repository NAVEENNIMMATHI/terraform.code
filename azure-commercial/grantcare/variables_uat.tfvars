# Backend Variables
client_id       = "2216ff1e-a4a3-4139-95e9-b4b89e001457"
subscription_id = "104a6d25-89e7-4297-9d68-76c0443b2cf6"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"
client_secret   = ""

location            = "eastus"
location_acronym    = "use"
application_acronym = "gc"
environment         = "uat"
environment_acronym = "uat"


tags = {
  BusinessOwner    = "May Boucherak"
  BusinessContact  = "mboucherak@kpmg.com"
  Environment      = "UAT"
  Instance         = "0001"
  LOB              = "Risk Advisory Solutions"
  Platform         = "Azure Commercial Cloud"
  Solution         = "GrantCare (GC)"
  Node             = "Spoke"
  TechnicalOwner   = "Sanooj Ramachandran"
  TechnicalContact = "sramachandran@kpmg.com"
  Version          = "1.0"
}

GCDevelopers_description="This Group will be used for Grantcare Application Developers"

d365ServicesaccountUser = "azuser-svcGCUAT"
tenantfqdn = "kpmgusadvcloudops.onmicrosoft.com"
d365Servicesaccount_password = ""
ServiceAccounts = "CO-ServiceAccounts"
ServiceAccountsllp= "KPMG LLP"
restrict_gateway_endpoint = "true"
#AD Groups
encryptapp_sp_name = "spn-devops-104a6d25"
cloudops_keyvault_admin_group_name = "CO-TerraformStorage-Admin"
client_keyvault_admin_group_name = "CO-RAS-UAT-KeyVault-Admins"
sastype="accountsas"
//spndisplayname = "spn-devops-104a6d25"