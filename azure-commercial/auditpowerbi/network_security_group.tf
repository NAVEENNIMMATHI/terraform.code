module "auditwstnsg"{
    source                      = "../../modules12/network_security_group"
    name                        = "nsg-${var.location_acronym}-audit-wst-${var.environment_acronym}"
    location                    = module.auditpbirg.resource_group_location
    resource_group_name         = module.auditpbirg.resource_group_name
    tags                        = var.tags
}