# Authentication
client_id       = "e0628e55-2ee3-4131-8fdd-330265aed576"
subscription_id = "3507153c-e6a4-4e2f-ae04-f34c1fd4482f"
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"
client_secret   = ""

# Project
environment                         = "dv"
environment_acronym                 = "dv"
location                            = "eastus"
location_acronym                    = "use"
project                             = "databricks"
project_acronym                     = "dtbr"
application_acronym                 = "spi"
palo_alto_ip_address                = "" # not used
azfirewall_ip_address               = "10.6.24.4"



spi_vnet_name                       = "vnt-use-spi-dv"
spi_vnet_resource_group_name        = "RGP-USE-SPI-VNET-DV"
spi_vnet_address_space              = "10.51.32.0/21"

controlplane_address_space          = "10.51.32.0/26"
sqlmi_address_space                 = "10.51.33.192/26"
webapp_address_space                = "10.51.38.192/26"

security_role_sql_managed_instance  = "sqlmi"

# Managed Instance
managedInstanceadministratorLogin          = "sqladmin"
managedInstanceadministratorLoginPassword  = ""

tags = {
  BusinessContact = "tschenk@kpmg.com"
  BusinessOwner   = "Tom Schenk"
  Environment     = "Development"
  LOB             = "Deal Advisory & Strategy"
  Node            = "Spoke"
  Platform        = "Azure Commercial Cloud"
  Solution        = "Databricks"
}