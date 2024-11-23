resource "azurerm_container_registry" "acr" {
    name                = var.acr_name
    resource_group_name = var.resource_group_name
    location            = var.cluster_location
    sku                 = var.sku
    admin_enabled       = var.admin_enabled

    tags = var.tags
}