# Authentication
subscription_id 								= "adf88b05-d3d7-4dee-ba30-ea939f9a1b1c"
client_id       								= "76ea9629-a4e1-4a9a-ba2f-39840e53342a"
tenant_id       								= "188697ab-840f-44ec-8535-aaaa5680bab0"
client_secret                   = ""

# Project
environment                         = "qa"
environment_acronym                 = "qa"
location                            = "eastus"
location_acronym                    = "use"
project                             = "databricks"
project_acronym                     = "dtbr"
application_acronym                 = "spi"
palo_alto_ip_address                = "" # not used
azfirewall_ip_address               = "10.101.2.196"

spi_vnet_name                       = "vnt-use-spi-qa"
spi_vnet_resource_group_name        = "RGP-USE-SPI-VNET-QA"
spi_vnet_address_space              = "10.71.32.0/21"

controlplane_address_space          = "10.71.32.0/26"
sqlmi_address_space                 = "10.71.33.192/26"
webapp_address_space                = "10.71.38.192/26"

security_role_sql_managed_instance  = "sqlmi"

# Managed Instance
managedInstanceadministratorLogin          = "sqladmin"
managedInstanceadministratorLoginPassword  = ""

tags = {
  BusinessContact = "tschenk@kpmg.com"
  BusinessOwner   = "Tom Schenk"
  Environment     = "QA"
  LOB             = "Deal Advisory & Strategy"
  Node            = "Spoke"
  Platform        = "Azure Commercial Cloud"
  Solution        = "Databricks"
}
