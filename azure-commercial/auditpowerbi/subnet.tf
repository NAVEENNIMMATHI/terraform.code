module "auditwstsubnet" {
  source                  = "../../modules12/subnet"
  subnet_name             = "sub-${var.location_acronym}-audit-wst-${var.environment_acronym}"
  virtual_network_name    = var.hubvnet_name
  resource_group_name     = var.hubvnet_resource_group_name
  address_prefix          = var.audit_wst_subnet_address_prefix
  service_endpoints       = ["Microsoft.Storage"]
}