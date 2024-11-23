 resource "azurerm_private_endpoint" "shared_vault" {
   count                            = var.environment_acronym == "dv" ? 1 : 0
   name                             = "pe-${var.location_acronym}-shared-vault-${var.application_acronym}-${var.environment_acronym}"
   resource_group_name              = azurerm_resource_group.co-p-eastus-terraformfiles-rg.name
   location                         = azurerm_resource_group.co-p-eastus-terraformfiles-rg.location
   subnet_id                        = azurerm_subnet.sub_pvtendpnt_core.id
   private_service_connection {
     name                           = "pe-svc-${var.location_acronym}-shared-vault-${var.application_acronym}-${var.environment_acronym}"
     private_connection_resource_id = azurerm_key_vault.key_vault_common[count.index].id
     is_manual_connection           = false
     subresource_names              = ["vault"]
   }
   tags                             = var.tags
   private_dns_zone_group   {
     name                           = "privatelink-vaultcore-azure-net"
     private_dns_zone_ids            = [data.azurerm_private_dns_zone.vault_private_link.id]
   
   }
}

resource "azurerm_private_endpoint" "pe-ama-use-dsc" {
  name                = "pe-ama-use-dsc-${var.environment_acronym}"
  location            = "eastus"
  resource_group_name = var.automation_account_resource_group_name
  subnet_id           = azurerm_subnet.sub_pvtendpnt_core.id
  tags                = var.tags_NodeMgmt

  private_dns_zone_group {
    name                 = data.azurerm_private_dns_zone.automation_private_link.name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.automation_private_link.id]
  }

  private_service_connection {
    name                           = "psc-ama-use-dsc-${var.environment_acronym}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_automation_account.ama-use-dsc.id
    subresource_names = ["DSCAndHybridWorker"]
  }

}
