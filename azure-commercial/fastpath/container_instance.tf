resource "azurerm_container_group" "clamav" {
  depends_on          = [null_resource.import_container_image]

  name                = "acg-${var.location_acronym}-${var.application_name}-${var.environment_acronym}"
  location            = module.apprg.resource_group_location
  resource_group_name = module.apprg.resource_group_name
  ip_address_type     = "Private"
  os_type             = "Linux"
  network_profile_id  = module.acinwprofile.network_profile_id

  image_registry_credential {
    username          = azurerm_container_registry.acr.admin_username
    password          = azurerm_container_registry.acr.admin_password
    server            = azurerm_container_registry.acr.login_server
  }

  container {
    name              = "aci-${var.location_acronym}-${var.application_name}-${var.environment_acronym}"
    image             = var.container_image_name
    cpu               = var.container_cpu
    memory            = var.container_memory
    commands          = []
    environment_variables = {
      "MaxFileSize"     = "100M"
      "MaxScanSize"     = "100M"
      "StreamMaxLength" = "100M"
      "LogVerbose"      = "no"
    }
    ports {
      port              = var.container_port
      protocol          = "TCP"
    }
  }

  tags                  = var.tags
}

