#public IP
resource "azurerm_public_ip" "cmp_agw_public_ip" {
  name                    = lower("pip-${var.location_acronym}-agw-${var.application_acronym}-${var.environment_acronym}")
  location                = module.cmp_rg_shared.resource_group_location
  resource_group_name     = module.cmp_rg_shared.resource_group_name
  domain_name_label       = "agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  sku                     = "Standard"
  allocation_method       = "Static"
  tags                    = var.tags
}