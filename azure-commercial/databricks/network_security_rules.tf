# Network Security Rules - Databricks Workspace
# Mandatory NSGs are managed by Microsoft
# https://docs.microsoft.com/en-us/azure/databricks/administration-guide/cloud-configurations/azure/vnet-inject

/*
The following table only applies to Azure Databricks workspaces created after January 13, 2020.

Direction   Protocol    Source                                                                    Source Port   Destination	                  Dest Port   Used
Inbound     Any         VirtualNetwork	                                                          Any           VirtualNetwork	              Any	        Default
Inbound     TCP	        AzureDatabricks (service tag) Only if SCC is disabled                   	Any           VirtualNetwork                22	        Public IP
Inbound     TCP	        AzureDatabricks (service tag) Only if SCC is disabled                   	Any           VirtualNetwork                5557	      Public IP
Outbound    TCP	        VirtualNetwork	                                                          Any	          AzureDatabricks (service tag)	443	        Default
Outbound    TCP	        VirtualNetwork	                                                          Any	          SQL	                          3306	      Default
Outbound    TCP	        VirtualNetwork	                                                          Any	          Storage	                      443	        Default
Outbound    Any	        VirtualNetwork	                                                          Any	          VirtualNetwork	              Any	        Default
Outbound    TCP	        VirtualNetwork	                                                          Any	          EventHub	                    9093	      Default
*/

# Network Security Rules - Sql MI
# Mandatory NSGs are managed by Microsoft
# https://docs.microsoft.com/en-us/azure/azure-sql/managed-instance/connectivity-architecture-overview

/*
MANDATORY INBOUND SECURITY RULES WITH SERVICE-AIDED SUBNET CONFIGURATION
Name	        Port	                        Protocol	Source	            Destination	  Action
management	  9000, 9003, 1438, 1440, 1452	TCP	      SqlManagement	      MI SUBNET   	Allow
              9000, 9003	                  TCP	      CorpnetSaw	        MI SUBNET	    Allow
              9000, 9003	                  TCP	      CorpnetPublic	      MI SUBNET	    Allow
mi_subnet	    Any	                          Any	      MI SUBNET	          MI SUBNET	    Allow
health_probe	Any	                          Any	      AzureLoadBalancer	  MI SUBNET	    Allow

MANDATORY OUTBOUND SECURITY RULES WITH SERVICE-AIDED SUBNET CONFIGURATION
Name	        Port	                        Protocol	Source	            Destination	  Action
management	  443, 12000	                  TCP	      MI SUBNET	          AzureCloud	  Allow
mi_subnet	    Any	                          Any	      MI SUBNET	          MI SUBNET	    Allow
*/

# Additional Security Rules
# Inbound
resource "azurerm_network_security_rule" "databricks-control-plane-ssh" {
  access                      = "Allow"
  description                 = ""
  destination_address_prefix  = "*"
  destination_port_range      = "22"
  direction                   = "Inbound"
  name                        = "databricks-control-plane-ssh"
  network_security_group_name = module.databricksnsg.network_security_group_name
  priority                    = 103
  protocol                    = "*"
  resource_group_name         = module.databricksrg.resource_group_name
  source_address_prefixes     = ["23.101.152.95/32","20.42.4.208/32","20.42.4.210"]
  source_port_range           = "*"
}

resource "azurerm_network_security_rule" "databricks-control-plane-worker-proxy" {
  access                      = "Allow"
  description                 = ""
  destination_address_prefix  = "*"
  destination_port_range      = "5557"
  direction                   = "Inbound"
  name                        = "databricks-control-plane-worker-proxy"
  network_security_group_name = module.databricksnsg.network_security_group_name
  priority                    = 110
  protocol                    = "*"
  resource_group_name         = module.databricksrg.resource_group_name
  source_address_prefixes     = ["23.101.152.95/32","20.42.4.208/32","20.42.4.210"]
  source_port_range           = "*"
}

resource "azurerm_network_security_rule" "databricks-worker-to-worker-inbound" {
  access                      = "Allow"
  description                 = ""
  destination_address_prefix  = "*"
  destination_port_range      = "*"
  direction                   = "Inbound"
  name                        = "databricks-worker-to-worker-inbound"
  network_security_group_name = module.databricksnsg.network_security_group_name
  priority                    = 200
  protocol                    = "*"
  resource_group_name         = module.databricksrg.resource_group_name
  source_address_prefix       = "VirtualNetwork"
  source_port_range           = "*"
}

# Outbound
resource "azurerm_network_security_rule" "databricks-worker-to-webapp" {
  access                      = "Allow"
  description                 = ""
  destination_address_prefixes = ["40.70.58.221/32","20.42.4.209/32","20.42.4.211"]
  destination_port_range      = "*"
  direction                   = "Outbound"
  name                        = "databricks-worker-to-webapp"
  network_security_group_name = module.databricksnsg.network_security_group_name
  priority                    = 104
  protocol                    = "*"
  resource_group_name         = module.databricksrg.resource_group_name
  source_address_prefix       = "*"
  source_port_range           = "*"
}

resource "azurerm_network_security_rule" "databricks-worker-to-sql" {
  access                      = "Allow"
  description                 = ""
  destination_address_prefix  = "Sql"
  destination_port_range      = "*"
  direction                   = "Outbound"
  name                        = "databricks-worker-to-sql"
  network_security_group_name = module.databricksnsg.network_security_group_name
  priority                    = 110
  protocol                    = "*"
  resource_group_name         = module.databricksrg.resource_group_name
  source_address_prefix       = "*"
  source_port_range           = "*"
}

resource "azurerm_network_security_rule" "databricks-worker-to-storage" {
  access                      = "Allow"
  description                 = ""
  destination_address_prefix  = "Storage"
  destination_port_range      = "*"
  direction                   = "Outbound"
  name                        = "databricks-worker-to-storage"
  network_security_group_name = module.databricksnsg.network_security_group_name
  priority                    = 120
  protocol                    = "*"
  resource_group_name         = module.databricksrg.resource_group_name
  source_address_prefix       = "*"
  source_port_range           = "*"
}

resource "azurerm_network_security_rule" "databricks-worker-to-worker-outbound" {
  access                      = "Allow"
  description                 = ""
  destination_address_prefix  = "VirtualNetwork"
  destination_port_range      = "*"
  direction                   = "Outbound"
  name                        = "databricks-worker-to-worker-outbound"
  network_security_group_name = module.databricksnsg.network_security_group_name
  priority                    = 130
  protocol                    = "*"
  resource_group_name         = module.databricksrg.resource_group_name
  source_address_prefix       = "*"
  source_port_range           = "*"
}

resource "azurerm_network_security_rule" "databricks-worker-to-any" {
  access                      = "Allow"
  description                 = ""
  destination_address_prefix  = "AzureDataLake"
  destination_port_range      = "*"
  direction                   = "Outbound"
  name                        = "databricks-worker-to-any"
  network_security_group_name = module.databricksnsg.network_security_group_name
  priority                    = 140
  protocol                    = "*"
  resource_group_name         = module.databricksrg.resource_group_name
  source_address_prefix       = "*"
  source_port_range           = "*"
}

## May need to add inbound/oubound rule for Databricks Extended Infrastructure