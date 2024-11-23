locals {
  legacy_prefix       = "co-${var.environment_acronym}-${var.location}-datafactory-wkst"
  common_prefix       = "avs-${var.location_acronym}-df-${var.application_acronym}-${var.environment_acronym}"
}

resource "azurerm_availability_set" "aset_df" {
  name                = var.environment == "production" ? "${local.legacy_prefix}-as" : "${local.common_prefix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.cospidatafactoryrg.name
  platform_fault_domain_count = 2
  managed             = true

  tags                = var.environment ==  "production" ? var.tags_vm : var.tags
}