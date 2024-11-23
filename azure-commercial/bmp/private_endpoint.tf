resource "azurerm_private_endpoint" "keyvault_appsubnet" {
  name                = lower("pep-${var.location_acronym}-${var.application_acronym}-appsub-${var.environment_acronym}")
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  subnet_id           = azurerm_subnet.bmpapp1subnet.id
  private_service_connection {
    name                           = lower("pe-kv-${var.location_acronym}-${var.application_acronym}-appsub-${var.environment_acronym}")
    private_connection_resource_id = module.keyvault_main.key_vault_id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }
  private_dns_zone_group   {
    name                           = "privatelink-vaultcore-azure-net"
    private_dns_zone_ids            = [data.azurerm_private_dns_zone.vault_private_link.id]
  }

  tags = var.tags
}

resource "azurerm_private_endpoint" "keyvault_restsubnet" {
  name                = lower("pep-${var.location_acronym}-${var.application_acronym}-restsub-${var.environment_acronym}")
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  subnet_id           = azurerm_subnet.bmprest1subnet.id
  private_service_connection {
    name                           = lower("pe-kv-${var.location_acronym}-${var.application_acronym}-restsub-${var.environment_acronym}")
    private_connection_resource_id = module.keyvault_main.key_vault_id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }
  private_dns_zone_group   {
    name                           = "privatelink-vaultcore-azure-net"
    private_dns_zone_ids            = [data.azurerm_private_dns_zone.vault_private_link.id]
  }
  
  tags = var.tags
}

resource "azurerm_private_endpoint" "keyvault_pesubnet_vault" {
  name                = lower("pep-${var.location_acronym}-${var.application_acronym}-pesub-vault-${var.environment_acronym}")
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  subnet_id           = azurerm_subnet.bmppesubnet.id
  private_service_connection {
    name                           = lower("pe-kv-${var.location_acronym}-${var.application_acronym}-pesub-vault-${var.environment_acronym}")
    private_connection_resource_id = module.keyvault_main.key_vault_id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }
  private_dns_zone_group   {
    name                           = "privatelink-vaultcore-azure-net"
    private_dns_zone_ids            = [data.azurerm_private_dns_zone.vault_private_link.id]
  }
  
  tags = var.tags
}


resource "azurerm_private_endpoint" "functionappsa_pesubnet_blob" {
  name                = lower("pe-functionappsa-${var.location_acronym}-${var.application_acronym}-pesub-blob-${var.environment_acronym}")
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  subnet_id           = azurerm_subnet.bmppesubnet.id
  private_service_connection {
    name                           = lower("pe-functionappsa-${var.location_acronym}-${var.application_acronym}-pesub-blob-${var.environment_acronym}")
    private_connection_resource_id = module.functionappsa.id
    subresource_names              = ["blob"]#,"file","queue","table","web"]
    is_manual_connection           = false
  }
  private_dns_zone_group     {
    name                           = "privatelink.blob.core.windows.net"
    private_dns_zone_ids           = [data.azurerm_private_dns_zone.storage_private_link_blob.id]     
  }
  tags               = var.tags
}


resource "azurerm_private_endpoint" "functionappsa_pesubnet_file" {
  name                = lower("pe-functionappsa-${var.location_acronym}-${var.application_acronym}-pesub-file-${var.environment_acronym}")
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  subnet_id           = azurerm_subnet.bmppesubnet.id
  private_service_connection {
    name                           = lower("pe-functionappsa-${var.location_acronym}-${var.application_acronym}-pesub-file-${var.environment_acronym}")
    private_connection_resource_id =  module.functionappsa.id
    subresource_names              = ["file"]#,"file","queue","table","web"]
    is_manual_connection           = false
  }
  private_dns_zone_group     {
    name                           = "privatelink.file.core.windows.net"
    private_dns_zone_ids           = [data.azurerm_private_dns_zone.storage_private_link_file.id]     
  }
  tags               = var.tags
}