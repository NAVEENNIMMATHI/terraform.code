resource "azurerm_resource_group" "ofr" {
  name     = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-${upper(var.environment_acronym)}"
  location = var.location

  tags                    = var.tags
}