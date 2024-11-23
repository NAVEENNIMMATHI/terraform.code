resource "azurerm_resource_group" "uswcoredr" {
  name     = "RGP-${upper(var.location_dr_acronym)}-CORE-DR-${upper(var.environment_acronym_rg)}"
  location = var.location_dr
  tags = var.tags
}