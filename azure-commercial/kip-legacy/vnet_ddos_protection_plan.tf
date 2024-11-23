# resource "azurerm_network_ddos_protection_plan" "applicationvnetddosprotectionplan" {
#   name                  = var.applicationvnetddosprotectionplan
#   resource_group_name   = module.applicationrg.resource_group_name
#   location              = module.applicationrg.resource_group_location

#   tags = var.tags
# }