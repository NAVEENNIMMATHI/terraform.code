# Azure Authentication
client_id       = "65d6e9b3-65b7-42b9-9f30-89d6a33becf8"
client_secret   = ""
subscription_id = "96e9a7e6-da33-4993-89ca-b82e0b571aee"
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"

# Project variables
application_acronym = "idp"
environment_acronym = "qa"
location_acronym    = "use"
location            = "eastus"
tags = {
  Environment     = "QA"
  LOB             = "Risk Advisory Solutions"
  Node            = "Spoke"
  Platform        = "Azure Commercial Cloud"
  Solution        = "Integrated Data Platform (IDP)"
  BusinessContact = "johnhlee@kpmg.com"
  BusinessOwner   = "Lee, John H"
}

# Application Gateway
application_gateway = {
  environment_acronym = "QA"
  sku = {
    name     = "WAF_Medium"
    tier     = "WAF"
    capacity = "2"
  }
}
dns_servers            = ["10.1.11.4", "10.1.11.5"]
frontend_pfx_cert_name = "idpqa.kpmgcloudops.com"

#App Service
app_service_plan_size = "I2"
app_service_plan_tier = "Isolated"

# Shared RAS Storage
shared_state_storage_account = {
  name                = "stousecommon96e9a7e6"
  resource_group_name = "RGP-USE-COMMON"
  container_name      = "terraformstatecontainer"
  blob_key_name       = "iac-acc-shared-ras.qa.tfstate"
}

# Subnets
subnets = {
  "agw" = {
    address_space = "10.70.7.224/28"
  }
  "pe" = {
    address_space = "10.70.7.240/28"
  }
}

# SQL Server
unique_guid = "abc4459f-df94-48cb-a103-3e3a6d7eb6c4"


