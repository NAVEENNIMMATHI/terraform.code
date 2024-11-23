resource "azurerm_resource_group" "datadogrg" {
  name        = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-${upper(var.environment_acronym)}"
  location    = var.location
  tags        = var.tags
}