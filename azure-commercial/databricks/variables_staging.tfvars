# Authentication
client_id       = "b964573c-e75c-4c3c-a59f-5d69a287e284"
client_secret   = ""
subscription_id = "84c5a4ce-8d9d-45f0-b15a-552d0f67db83"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

# Project
environment                         = "stg"
environment_acronym                 = "stg"
location                            = "eastus"
location_acronym                    = "use"
project                             = "databricks"
project_acronym                     = "dtbr"
application_acronym                 = "spi"
palo_alto_ip_address                = "10.30.16.100" # ! Value for Prod - Update when stg-core exists

spi_vnet_name                       = "vnt-use-spi-stg"
spi_vnet_resource_group_name        = "RGP-USE-SPI-VNET-STG"

controlplane_address_space          = "10.71.32.0/26"
sqlmi_address_space                 = "10.71.33.192/26"
webapp_address_space                = "10.71.38.192/26"

security_role_sql_managed_instance  = "sqlmi"

tags = {
  BusinessContact = "tschenk@kpmg.com"
  BusinessOwner   = "Tom Schenk"
  Environment     = "Staging"
  LOB             = "Deal Advisory & Strategy"
  Node            = "Spoke"
  Platform        = "Azure Commercial Cloud"
  Solution        = "Databricks"
}

