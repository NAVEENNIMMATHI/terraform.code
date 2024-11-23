# Authentication
subscription_id = "b75fc3c3-04a4-45a6-b126-8279f505e873"
client_id       = "9975dc86-7489-483c-b49c-47bdff5e2eb8"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"
client_secret   = ""

# Project
environment                         = "uat"
environment_acronym                 = "uat"
location                            = "eastus"
location_acronym                    = "use"
project                             = "databricks"
project_acronym                     = "dtbr"
application_acronym                 = "spi"
palo_alto_ip_address                = "" # not used
azfirewall_ip_address               = "10.100.2.196"

spi_vnet_name                       = "vnt-use-spi-uat"
spi_vnet_resource_group_name        = "RGP-USE-SPI-VNET-UAT"
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
  Environment     = "UAT"
  LOB             = "Deal Advisory & Strategy"
  Node            = "Spoke"
  Platform        = "Azure Commercial Cloud"
  Solution        = "Databricks"
}

