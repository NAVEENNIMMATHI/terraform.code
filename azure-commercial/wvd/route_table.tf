module "ablasqlroutetable" {
  source                        = "../../modules/route_table"
  route_table_name              = "${var.ablasql_routetable_name}"
  resource_group_location       = "${module.applicationrg.resource_group_location}"
  resource_group_name           = "${module.applicationrg.resource_group_name}"
  disable_bgp_route_propagation = "${var.disable_bgp_route_propagation}"
  tags                          = "${var.tags}"
  route_name                    = "${var.route_name}"
  route_address_prefix          = "${var.route_address_prefix}"
  route_next_hop_type           = "${var.route_next_hop_type}"
  route_next_hope_in_ip_address = "${var.route_next_hope_in_ip_address}"
  subnet_id                     = ""
}

# resource "azurerm_route_table" "ablaaseroutetable" {
#   name                          = "${var.ablaase_routetable_name}"
#   location                      = "${module.applicationrg.resource_group_location}"
#   resource_group_name           = "${module.applicationrg.resource_group_name}"
#   disable_bgp_route_propagation = false

#   route {
#     name                        = "conpeastusablaase-route"
#     address_prefix              = "0.0.0.0/0"
#     next_hop_type               = "Internet"
#   }
#   tags = {
#     displayName = "UDR - Subnet"
#   }
# }
