module "fw_pip_1" {
  source                  = "../../modules12/public_ip_domain_label"
  public_ip_name          = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "pip1-firewall-${var.firewall_environment}" : "pip-fwl-${var.location_acronym}-primary-${var.firewall_environment}-1"
  resource_group_name     = azurerm_resource_group.hubvnet.name
  resource_group_location = azurerm_resource_group.hubvnet.location
  allocation_method       = "Static"
  sku                     = "Standard"
  ip_version              = "IPv4"
  domain_name_label       = "azfw-cc-${var.firewall_pip_environment}-pip1"
  tags                    = var.tags_Networking
}

module "fw_pip_2" {
  source                  = "../../modules12/public_ip_domain_label"
  public_ip_name          = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "pip2-firewall-${var.firewall_environment}" : "pip-fwl-${var.location_acronym}-primary-${var.firewall_environment}-2"
  resource_group_name     = azurerm_resource_group.hubvnet.name
  resource_group_location = azurerm_resource_group.hubvnet.location
  allocation_method       = "Static"
  sku                     = "Standard"
  ip_version              = "IPv4"
  domain_name_label       = "azfw-cc-${var.firewall_pip_environment}-pip2"
  tags                    = var.tags_Networking
}

module "fw_pip_3" {
  source                  = "../../modules12/public_ip_domain_label"
  public_ip_name          = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "pip3-firewall-${var.firewall_environment}" : "pip-fwl-${var.location_acronym}-primary-${var.firewall_environment}-3"
  resource_group_name     = azurerm_resource_group.hubvnet.name
  resource_group_location = azurerm_resource_group.hubvnet.location
  allocation_method       = "Static"
  sku                     = "Standard"
  ip_version              = "IPv4"
  domain_name_label       = "azfw-cc-${var.firewall_pip_environment}-pip3"
  tags                    = var.tags_Networking
}

module "fw_pip_4" {
  source                  = "../../modules12/public_ip_domain_label"
  public_ip_name          = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "pip4-firewall-${var.firewall_environment}" : "pip-fwl-${var.location_acronym}-primary-${var.firewall_environment}-4"
  resource_group_name     = azurerm_resource_group.hubvnet.name
  resource_group_location = azurerm_resource_group.hubvnet.location
  allocation_method       = "Static"
  sku                     = "Standard"
  ip_version              = "IPv4"
  domain_name_label       = "azfw-cc-${var.firewall_pip_environment}-pip4"
  tags                    = var.tags_Networking
}
module "fw_pip_5" {
  source                  = "../../modules12/public_ip_domain_label"
  public_ip_name          = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "pip5-firewall-${var.firewall_environment}" : "pip-fwl-${var.location_acronym}-primary-${var.firewall_environment}-5"
  resource_group_name     = azurerm_resource_group.hubvnet.name
  resource_group_location = azurerm_resource_group.hubvnet.location
  allocation_method       = "Static"
  sku                     = "Standard"
  ip_version              = "IPv4"
  domain_name_label       = "azfw-cc-${var.firewall_pip_environment}-pip5"
  tags                    = var.tags_Networking
}