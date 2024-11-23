module "auditpbirg" {
  source                  = "../../modules12/resource_group"
  resource_group_name     = "RGP-${upper(var.location_acronym)}-AUDIT-PBI-${upper(var.environment_acronym)}"
  resource_group_location = "eastus"
  tags                    = var.tags
}