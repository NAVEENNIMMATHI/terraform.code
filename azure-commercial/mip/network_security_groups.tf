# Network security group for license manager
module "nsg_license_manager" {
  source              = "../../modules/network_security_group"
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-${var.license_manager_acronym}-${var.environment_acronym}"
  location            = module.mathworks_rg_shared.resource_group_location
  resource_group_name = module.mathworks_rg_shared.resource_group_name

  tags = var.tags
}

# Network security group association for license manager
module "nsg_association_license_manager" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = module.subnet_license_manager.subnet_id
  network_security_group_id = module.nsg_license_manager.network_security_group_id
}

# Network security group for App Gateway
module "nsg_app_gateway" {
  source              = "../../modules/network_security_group"
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-agw-${var.environment_acronym}"
  location            = module.mathworks_rg_shared.resource_group_location
  resource_group_name = module.mathworks_rg_shared.resource_group_name

  tags = var.tags
}

# Network security group association for App Gateway
module "nsg_association_app_gateway" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = module.subnet_app_gateway.subnet_id
  network_security_group_id = module.nsg_app_gateway.network_security_group_id
}

# Network security group for AKS
module "nsg_aks" {
  source              = "../../modules/network_security_group"
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-${var.client}-aks-${var.environment_acronym}"
  location            = module.mathworks_rg_client.resource_group_location
  resource_group_name = module.mathworks_rg_client.resource_group_name

  tags = var.tags
}

# Network security group association for AKS
module "nsg_association_aks" {
  source                    = "../../modules/network_security_group_association"
  subnet_id                 = module.subnet_aks.subnet_id
  network_security_group_id = module.nsg_aks.network_security_group_id
}