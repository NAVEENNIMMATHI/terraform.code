resource "azurerm_shared_image_gallery" "imagegallery" {
  count               = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? 1 : 0
  name                = "sig${var.location_acronym}${var.application_acronym}${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.imagegallery.name
  location            = azurerm_resource_group.imagegallery.location
  description         = "Shared images gallery."
  tags                = var.tags_NodeMgmt 
}