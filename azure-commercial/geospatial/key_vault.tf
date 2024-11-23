
resource "azurerm_key_vault" "geospatial_key_vault" {
  name                        = "kvl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  location                    = module.geospatial_rg.resource_group_location
  resource_group_name         = module.geospatial_rg.resource_group_name
  enabled_for_disk_encryption = true
  sku_name                    = "standard"
  purge_protection_enabled    = true
  soft_delete_retention_days  = 90
  tenant_id                   = data.azurerm_client_config.current.tenant_id
 
  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"

    ip_rules                   = []

    virtual_network_subnet_ids = [
        module.geospatial_pep_subnet.subnet_id,
        module.geospatial_agw_subnet.subnet_id,
        
    ]
  }

  tags = var.tags
}
