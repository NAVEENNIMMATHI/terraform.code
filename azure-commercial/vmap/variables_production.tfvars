# Azure Authentication
client_id       = "089028a6-c23d-4854-8ecf-2ed345a8b1bf"
client_secret   = ""
subscription_id = "5d3ae075-2601-49d3-9223-892e3d7f6fb1"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

# Project variables
application_acronym = "vmap"
environment_acronym = "pd"
location_acronym    = "use"
location            = "eastus"
tags = {
  Environment     = "Production"
  LOB             = "Risk Advisory Solutions"
  Node            = "Spoke"
  Platform        = "Azure Commercial Cloud"
  Solution        = "Virtual Machine Auto Provisioning (VMAP)"
  BusinessContact = "johnhlee@kpmg.com"
  BusinessOwner   = "Lee, John H"
}

# Application Gateway
application_gateway = {
  environment_acronym = ""
  sku = {
    name     = "WAF_Medium"
    tier     = "WAF"
    capacity = "2"
  }
}
dns_servers            = ["10.30.15.197", "10.30.15.196"]
frontend_pfx_cert_name = "vmap.kpmgcloudops.com"

#App Service
app_service_plan_size = "I2"
app_service_plan_tier = "Isolated"

# Shared RAS Storage
shared_state_storage_account = {
  name                = "stousebase5d3ae075"
  resource_group_name = "RGP-USE-BASE5D3AE075-PD"
  container_name      = "terraformstatecontainer"
  blob_key_name       = "iac-acc-shared-ras.pd.tfstate"
}

# Subnets
subnets = {
  "agw" = {
    address_space = "10.4.50.224/28"
  }
  "pe" = {
    address_space = "10.4.50.240/28"
  }
}

#Private DNS Variables
pvt_dns_subscription_id          = "4c9dc048-01dc-4854-9063-8a3d4060993a"
private_dns_zone_resource_group  = "rgp-use-core-private-dnszone-pd" # we only have one dns zone per tenant

#App Service Environment variables
ase_name                     = "ase-use-npapp-pd"
ase_resource_group_name      = "RGP-USE-ASE-PD"

