module "sharedvnet"{
    source                  = "../../modules/virtual_network"
    virtual_network_name    = "vnt-${var.location_acronym}-ase-${var.environment_acronym}"
    resource_group_location = module.sharedrg.resource_group_location
    resource_group_name     = module.sharedrg.resource_group_name
    address_space           = var.vnet_address_space
    dns_server              = var.environment_acronym == "dv" ? [data.azurerm_firewall.firewall.ip_configuration[0].private_ip_address] : var.dns_servers
    tags                    = var.tags
}