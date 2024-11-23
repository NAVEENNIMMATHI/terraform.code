module "azure_automation" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.azure-automation.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_sql" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.database.windows.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_synapse_analytics" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.sql.azuresynapse.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_storage_blob" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.blob.core.windows.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_storage_table" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.table.core.windows.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_storage_queue" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.queue.core.windows.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_storage_file" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.file.core.windows.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_storage_web" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.web.core.windows.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_storage_datalake" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.dfs.core.windows.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_cosmos_sql" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.documents.azure.com"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_cosmos_mongo" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.mongo.cosmos.azure.com"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_cosmos_cassandra" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.cassandra.cosmos.azure.com"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_storage_cosmos_gremlin" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.gremlin.cosmos.azure.com"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_storage_cosmos_table" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.table.cosmos.azure.com"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_postgresqlserver" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.postgres.database.azure.com"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_mysqlserver" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.mysql.database.azure.com"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_mariadb" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.mariadb.database.azure.com"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_keyvault" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.vaultcore.azure.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_kubernetes" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.eastus.azmk8s.io"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_search" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.search.windows.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_container_registry" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.azurecr.io"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_app_config" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.azconfig.io"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_backup" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.eastus.backup.windowsazure.com"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_site_recovery" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "eastus.privatelink.siterecovery.windowsazure.com"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_event_hub" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.servicebus.windows.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
} #For ServiceBus and Relay as well
module "azure_iot_hub" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.azure-devices.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_event_grid" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.eventgrid.azure.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_webapp" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.azurewebsites.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_machine_learning" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.api.azureml.ms"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_machine_learning_notebooks" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.notebooks.azure.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_signalr" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.service.signalr.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_monitor_oms" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.oms.opinsights.azure.com"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_monitor_ods" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.ods.opinsights.azure.com"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_monitor_automation" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.agentsvc.azure-automation.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_cognitive_services" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.cognitiveservices.azure.com"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_file_sync" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.afs.azure.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_data_factory" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.datafactory.azure.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_data_factory_portal" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.adf.azure.com"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}
module "azure_redis_cache" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.redis.cache.windows.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}

# module "addns" {
#   source              = "../../modules/private_dns_zone"
#   dnssuffix           = "kconp.local"
#   resource_group_name = module.applicationrg.resource_group_name
#   tags                = var.tags
# }
module "kpmgcloudops" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "kpmgcloudops.com"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
  count               = var.environment_acronym == "dv" ? 1 : 0        
}
module "ase" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "appserviceenvironment.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}

module "azure_databricks" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.azuredatabricks.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}

module "purview_azure" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.purview.azure.com"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}

module "purviewstudio_azure" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.purviewstudio.azure.com"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}

module "dev_azuresynapse" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "privatelink.dev.azuresynapse.net"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}

module "uat_checkpoint" {
  source              = "../../modules/private_dns_zone"
  dnssuffix           = "mdpcheckpointuat.us.kworld.kpmg.com"
  resource_group_name = module.applicationrg.resource_group_name
  vnet_link_name      = "to_azure_dns"
  virtual_network_id  = var.environment_acronym == "dv" ? "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet" : "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
  environment_acronym = var.environment_acronym == "dv" ? "dv" : "pd"
  tags                = var.tags
}