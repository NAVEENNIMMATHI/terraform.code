resource "azurerm_subnet" "controlplane" {
  name                 = var.environment == "p" ? "co-p-eastus-spi-databricks-controlplane-subnet" : "sub-${var.location_acronym}-${var.application_acronym}-${var.project_acronym}-controlplane-${var.environment_acronym}"
  virtual_network_name = var.spi_vnet_name
  resource_group_name  = var.spi_vnet_resource_group_name
  address_prefixes     = [var.controlplane_address_space]
  service_endpoints    = ["Microsoft.Storage", "Microsoft.Sql"]
  delegation {
    name                    = var.environment == "p" ? "9e465e3ec01646aa8c7711aaa7382428" : "controlplanedelegation"
    service_delegation {
      name                  = "Microsoft.Databricks/workspaces"
      actions = [
                  "Microsoft.Network/virtualNetworks/subnets/join/action",
                  "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
                  "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
                ]
    }
  }
}

resource "azurerm_subnet" "webapp" {
  name                 = var.environment == "p" ? "co-p-eastus-spi-databricks-webapp-subnet" : "sub-${var.location_acronym}-${var.application_acronym}-${var.project_acronym}-webapp-${var.environment_acronym}"
  virtual_network_name = var.spi_vnet_name
  resource_group_name  = var.spi_vnet_resource_group_name
  address_prefixes     = [var.webapp_address_space]
  service_endpoints    = ["Microsoft.Storage", "Microsoft.Sql"]
  delegation {
    name                    = var.environment == "p" ? "418104e37b434f93ab718227cec34577" : "webappdelegation"
    service_delegation {
      name                  = "Microsoft.Databricks/workspaces"
      actions = [
                  "Microsoft.Network/virtualNetworks/subnets/join/action",
                  "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
                  "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
                ]
    }
  }
}

resource "azurerm_subnet" "sqlmi" {
  name                 = var.environment == "p" ? "co-p-eastus-databricks-sqlmi-subnet" : "sub-${var.location_acronym}-${var.application_acronym}-${var.project_acronym}-sqlmi-${var.environment_acronym}"
  virtual_network_name = var.spi_vnet_name
  resource_group_name  = var.spi_vnet_resource_group_name
  address_prefixes     = [var.sqlmi_address_space]
  service_endpoints    = []
  delegation {
    name                    = var.environment == "p" ? "dlg-co-p-eastus-databricks-sql-mi" : "dlg-smi-use-spi-dv"
    service_delegation {
      name                  = "Microsoft.Sql/managedInstances"
      actions = [
                  "Microsoft.Network/virtualNetworks/subnets/join/action",
                  "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
                  "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
                ]
    }
  }
}
