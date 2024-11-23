module "route-table" {
  source = "../../modules/route_table"
  
  route_table_name        = "co${var.environment}${var.application_rg_location}${var.application_acronym}-routetable" 
  resource_group_name     = "${module.applicationrg.resource_group_name}" 
  resource_group_location = "${module.applicationrg.resource_group_location}"
  disable_bgp_route_propagation = "false"  

  route_name       = "routethroughfirewall-${var.proj_poc_name}"
  route_address_prefix = "0.0.0.0/0" 
  route_next_hope_in_ip_address = "${module.firewallnetwork.firewall_private_ip}"
  route_next_hop_type = "VirtualAppliance" 
  subnet_id = ""
  
  tags = "${var.tags}"
}