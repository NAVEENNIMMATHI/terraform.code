# Authentication
client_id       = "b2967f11-d801-4812-b532-3f3a676e8b46"
client_secret   = ""
subscription_id = "9e27f52c-3c97-4fda-9c8f-eadcd0ad195a"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

# Project
environment                         = "p"
environment_acronym                 = "p"
location                            = "eastus"
location_acronym                    = "use"
project                             = "databricks"
project_acronym                     = "dtbr"
application_acronym                 = "spi"
palo_alto_ip_address                = "10.30.16.100"
azfirewall_ip_address               = "10.30.3.4" # not used

spi_vnet_name                       = "CO-P-eastus-spi-vnet"
spi_vnet_resource_group_name        = "CO-P-eastus-cospivnet-rg"
spi_vnet_address_space              = "10.32.0.0/21"


controlplane_address_space          = "10.32.0.0/26"
sqlmi_address_space                 = "10.32.1.192/26"
webapp_address_space                = "10.32.6.192/26"

security_role_sql_managed_instance  = "sqlmi"

# Managed Instance
managedInstanceadministratorLogin          = "sqladmin"
managedInstanceadministratorLoginPassword  = ""

tags = {
  BusinessContact = "tschenk@kpmg.com"
  BusinessOwner   = "Tom Schenk"
  Environment     = "Production"
  LOB             = "Deal Advisory & Strategy"
  Node            = "Spoke"
  Platform        = "Azure Commercial Cloud"
  Solution        = "Databricks"
  Datadog         = "Monitored"
}

