module "kip_purview_poc" {
  source = "../../modules/purview_assets/module"
  environment_acronym = var.environment_acronym
  location = var.location
  location_acronym = var.location_acronym
  environment = var.environment
  application_acronym = var.application_acronym
  tags = var.tags
}

####Private DNS Zone#####
#1
data "azurerm_private_dns_zone" "storage_private_link_blob" {
  name                = var.private_dns_zone_blob
  resource_group_name = var.private_dns_zone_resource_group
  provider            = azurerm.dnscore
}
  
resource "azurerm_private_endpoint" "pe_blob" {
  name                = "Purview-priv-mg-blob"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  subnet_id           = module.privatelinksubnet.subnet_id

  private_service_connection {
    name                           = "Purview-priv-mg-blob-psc"
    private_connection_resource_id = "/subscriptions/${var.subscription_id}/resourceGroups/${module.kip_purview_poc.managed_resource_group_name}/providers/Microsoft.Storage/storageAccounts/${data.external.powershell.result.storage_account}"
                                     
    is_manual_connection           = false
    subresource_names              = ["blob"]
    
  }

  private_dns_zone_group     {
    name                           = "privatelink-blob-core-windows-net"
    private_dns_zone_ids           = [data.azurerm_private_dns_zone.storage_private_link_blob.id]
     
  }  

  depends_on = [ module.kip_purview_poc ]

    lifecycle {
    ignore_changes = [
      subnet_id, 
      private_service_connection,
    ]
  }

  tags               = var.tags
  
}



#2
data "azurerm_private_dns_zone" "servicebus_private_link" {
  name                = var.private_dns_zone_servicebus
  resource_group_name = var.private_dns_zone_resource_group
  provider            = azurerm.dnscore
}

resource "azurerm_private_endpoint" "pe_name" {
  name                = "Purview-priv-mg-namespace"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  subnet_id           = module.privatelinksubnet.subnet_id

  lifecycle{
    ignore_changes = [private_service_connection,]
  }
  private_service_connection {
    name                           = "Purview-priv-mg-namespace-psc"
    private_connection_resource_id = "/subscriptions/${var.subscription_id}/resourceGroups/${module.kip_purview_poc.managed_resource_group_name}/providers/Microsoft.EventHub/namespaces/${data.external.powershell2.result.event_hub}"
                                     
    is_manual_connection           = false
    subresource_names              = ["namespace"]
  }
 
  private_dns_zone_group     {
    name                           = "privatelink-servicebus-windows-net"
    private_dns_zone_ids           = [data.azurerm_private_dns_zone.servicebus_private_link.id]
     
  }  
  
  depends_on = [ module.kip_purview_poc ]
  
  tags               = var.tags

}

#3
data "azurerm_private_dns_zone" "storage_private_link_queue" {
  name                = var.private_dns_zone_queue
  resource_group_name = var.private_dns_zone_resource_group
  provider            = azurerm.dnscore
}

resource "azurerm_private_endpoint" "pe_queue" {
  name                = "Purview-priv-mg-queue"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  subnet_id           = module.privatelinksubnet.subnet_id

  lifecycle{
    ignore_changes = [private_service_connection,]
  }
  private_service_connection {
    name                           = "Purview-priv-mg-queue-psc"
    private_connection_resource_id = "/subscriptions/${var.subscription_id}/resourceGroups/${module.kip_purview_poc.managed_resource_group_name}/providers/Microsoft.Storage/storageAccounts/${data.external.powershell.result.storage_account}"
                                     
    is_manual_connection           = false
    subresource_names              = ["queue"]

  }

  private_dns_zone_group     {
    name                           = "privatelink-queue-core-windows-net"
    private_dns_zone_ids           = [data.azurerm_private_dns_zone.storage_private_link_queue.id]
     
  }  

  depends_on = [ module.kip_purview_poc ]

  tags               = var.tags

}

#4
data "azurerm_private_dns_zone" "purview_private_link" {
  name                = var.private_dns_zone_purview
  resource_group_name = var.private_dns_zone_resource_group
  provider            = azurerm.dnscore
}

resource "azurerm_private_endpoint" "pe_account" {
  name                = "Purview-priv-mg-account"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  subnet_id           = module.privatelinksubnet.subnet_id

  lifecycle{
    ignore_changes = [private_service_connection,]
  }
  private_service_connection {
    name                           = "Purview-priv-mg-account-psc"
    private_connection_resource_id = "/subscriptions/${var.subscription_id}/resourceGroups/${module.kip_purview_poc.managed_resource_group_name}/providers/Microsoft.Purview/accounts/${module.kip_purview_poc.name}"
                                     
    is_manual_connection           = false
    subresource_names              = ["account"]

  }

  private_dns_zone_group     {
    name                           = "privatelink-purview-azure-com"
    private_dns_zone_ids           = [data.azurerm_private_dns_zone.purview_private_link.id]
     
  }  

  depends_on = [ module.kip_purview_poc ]

  tags               = var.tags

}

#5
data "azurerm_private_dns_zone" "purviewstudio_private_link" {
  name                = var.private_dns_zone_purviewstudio
  resource_group_name = var.private_dns_zone_resource_group
  provider            = azurerm.dnscore
}

resource "azurerm_private_endpoint" "pe_portal" {
  name                = "Purview-priv-mg-portal"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  subnet_id           = module.privatelinksubnet.subnet_id

  lifecycle{
    ignore_changes = [private_service_connection,]
  }
  private_service_connection {
    name                           = "Purview-priv-mg-portal-psc"
    private_connection_resource_id = "/subscriptions/${var.subscription_id}/resourceGroups/${module.kip_purview_poc.managed_resource_group_name}/providers/Microsoft.Purview/accounts/${module.kip_purview_poc.name}"
                                     
    is_manual_connection           = false
    subresource_names              = ["portal"]

  }

  private_dns_zone_group     {
    name                           = "privatelink-purviewstudio-azure-com"
    private_dns_zone_ids           = [data.azurerm_private_dns_zone.purviewstudio_private_link.id]
     
  }   

  depends_on = [ module.kip_purview_poc ]

  tags               = var.tags

}


data "external" "powershell" {
  program = ["pwsh", "..\\..\\modules\\purview_assets\\scripts\\storage_account.ps1", "${var.subscription_id}"]
  depends_on = [
    module.kip_purview_poc
  ]
}

data "external" "powershell2" {
  program = ["pwsh", "..\\..\\modules\\purview_assets\\scripts\\eventhub.ps1", "${var.subscription_id}"]
  depends_on = [
    module.kip_purview_poc
  ]
}

data "external" "powershell3" {
   program = ["pwsh", "..\\..\\modules\\purview_assets\\scripts\\purview_account.ps1", "${azuread_group.KipPurviewCollectionAdmin.object_id}", "${module.kip_purview_poc.name}", "${var.environment == "production" ? "co-pd-eastus-kip-rg" : "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-${upper(var.environment_acronym)}"}"]
  
  depends_on = [
    module.kip_purview_poc
  ]
}