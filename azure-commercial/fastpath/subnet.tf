module "appsubnet" {
  source                    = "../../modules/subnet"
  subnet_name               = (var.environment == "legacy_development" || var.environment == "production") ? "sub-${var.location_acronym}-app-${var.environment_acronym}" : "sub-${var.location_acronym}-${var.application_name}-app-${var.environment_acronym}"
  virtual_network_name      = var.sharedvnet_virtual_network_name
  resource_group_name       = var.sharedrg_resource_group_name
  address_prefix            = var.app_subnet_address_prefix
  service_endpoints         = var.appsubnet_service_endpoints
  enforce_private_link_endpoint_network_policies = true
}

module "redissubnet" {
  source                    = "../../modules/subnet"
  subnet_name               = (var.environment == "legacy_development" || var.environment == "production") ? "sub-${var.location_acronym}-redis-${var.environment_acronym}" : "sub-${var.location_acronym}-${var.application_name}-redis-${var.environment_acronym}"
  virtual_network_name      = var.sharedvnet_virtual_network_name
  resource_group_name       = var.sharedrg_resource_group_name
  address_prefix            = var.redis_subnet_address_prefix
  service_endpoints         = var.service_endpoints
}

resource "azurerm_subnet" "acisubnet" {
  name                      = (var.environment == "legacy_development" || var.environment == "production") ? "sub-${var.location_acronym}-aci-${var.environment_acronym}" : "sub-${var.location_acronym}-${var.application_name}-aci-${var.environment_acronym}"
  resource_group_name       = var.sharedrg_resource_group_name
  virtual_network_name      = var.sharedvnet_virtual_network_name
  address_prefix            = var.aci_subnet_address_prefix
  service_endpoints         = ["Microsoft.ContainerRegistry"]

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

