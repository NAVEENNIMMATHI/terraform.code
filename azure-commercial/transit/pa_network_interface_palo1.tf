# resource "azurerm_network_interface" "palo1trustnic" {
#         name                      = "${var.palo1_vm_name}-trust-nic"
#         resource_group_name       = "${azurerm_resource_group.transitpalofw.name}"
#         location                  = "${azurerm_resource_group.transitpalofw.location}"
#         enable_ip_forwarding      = "true"

#         ip_configuration {
#                 name                          = "${var.palo1_vm_name}-trust-config"
#                 subnet_id                     = "${azurerm_subnet.trusttransit.id}"
#                 private_ip_address_allocation = "Static"
#                 private_ip_address            = "${var.palo1_trust_nic_private_ip_address}"
#                 load_balancer_backend_address_pools_ids = ["${azurerm_lb_backend_address_pool.ilbbap.id}"]
#         }
    
#         tags {
#     Platform = "${var.tag_platform}"
#     Environment  = "${var.tag_environment}"
#     Node = "${var.tag_node}"
#     Solution = "${var.tag_solution}"
#     CostCode = "${var.tag_costcode}"
#     OwnerContact = "${var.tag_ownercontact}"    
#   }
# }

# resource "azurerm_network_interface" "palo1untrustnic" {
#         name                      = "${var.palo1_vm_name}-untrust-nic"
#         resource_group_name       = "${azurerm_resource_group.transitpalofw.name}"
#         location                  = "${azurerm_resource_group.transitpalofw.location}"
#         enable_ip_forwarding      = "true"

#         ip_configuration {
#                 name                          = "${var.palo1_vm_name}-untrust-config"
#                 subnet_id                     = "${azurerm_subnet.untrusttransit.id}"
#                 private_ip_address_allocation = "Static"
#                 private_ip_address            = "${var.palo1_untrust_nic_private_ip_address}"
#                 load_balancer_backend_address_pools_ids = ["${azurerm_lb_backend_address_pool.elbbap.id}"]
#                 public_ip_address_id          = "${azurerm_public_ip.palo1untrustpip.id}"
#         }

#         tags = "${var.tags}"
# }

# resource "azurerm_network_interface" "palo1managementnic" {
#         name                      = "${var.palo1_vm_name}-management-nic"
#         resource_group_name       = "${azurerm_resource_group.transitpalofw.name}"
#         location                  = "${azurerm_resource_group.transitpalofw.location}"

#         enable_ip_forwarding      = "true"

#         ip_configuration {
# 		name                          = "${var.palo1_vm_name}-management-config"
#                 subnet_id                     = "${azurerm_subnet.mgmttransit.id}"
#                 private_ip_address_allocation = "Static"
#                 private_ip_address            = "${var.palo1_management_nic_private_ip_address}"
#                 public_ip_address_id          = "${azurerm_public_ip.palo1managementpip.id}"
#         }

#         tags = "${var.tags}"
# }
