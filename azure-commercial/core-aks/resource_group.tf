resource "azurerm_resource_group" "aks" {
  count = 1

  name     = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-AKS-${upper(var.environment_acronym)}"
  location = var.location

  tags = var.tags
}

resource "azurerm_resource_group" "aks_paired" {
  count = var.environment_acronym == "dv" || var.environment_acronym == "pd" ? 1 : 0

  name     = "RGP-${upper(var.location_acronym_paired)}-${upper(var.application_acronym)}-AKS-${upper(var.environment_acronym)}"
  location = var.location_paired

  tags = var.tags
}
