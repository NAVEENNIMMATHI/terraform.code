module "cmp_nsg_agw" {
  source              = "../../modules/network_security_group"
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-agw-${var.environment_acronym}"
  resource_group_name = module.cmp_rg_shared.resource_group_name
  location            = module.cmp_rg_shared.resource_group_location
  tags                = var.tags
}

module "cmp_nsg_association_agw" {
  source                    = "../../modules/network_security_group_association"
  network_security_group_id = module.cmp_nsg_agw.network_security_group_id
  subnet_id                 = module.cmp_agw_subnet.subnet_id
}

module "cmp_nsg_clients" {
  for_each = var.cmp_clients
  
  source              = "../../modules/network_security_group"
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-${each.key}-vm-${var.environment_acronym}"
  resource_group_name =upper("RGP-${var.location_acronym}-${var.application_acronym}-${each.key}-${var.environment_acronym}")
  location            = var.location
  tags                = var.tags
}

module "cmp_nsg_association_clients" {
  for_each = var.cmp_clients

  source                    = "../../modules/network_security_group_association"
  network_security_group_id = module.cmp_nsg_clients[each.key].network_security_group_id
  subnet_id                 = module.cmp_subnet_client_vm[each.key].subnet_id
}