# resource "azurerm_virtual_machine" "palo1vm" {
#         name                = "${var.palo1_vm_name}"
#         resource_group_name = "${azurerm_resource_group.transitpalofw.name}"
#         location            = "${azurerm_resource_group.transitpalofw.location}"
# 	network_interface_ids = ["${azurerm_network_interface.palo1managementnic.id}","${azurerm_network_interface.palo1untrustnic.id}","${azurerm_network_interface.palo1trustnic.id}"]
#         primary_network_interface_id = "${azurerm_network_interface.palo1managementnic.id}"
#         vm_size               = "${var.palo_vm_size}"
#         availability_set_id   = "${azurerm_availability_set.paloaltofwas.id}"
        
#         delete_os_disk_on_termination = true
#         delete_data_disks_on_termination = true
        

# 	plan {
#  		name = "${var.palolicensetype}"
# 		product ="vmseries1"
#  		publisher = "paloaltonetworks"
#         }
        
# 	tags = "${var.tags}"
        
# 	lifecycle {
#               prevent_destroy = false
#         }
        
# 	storage_image_reference {
#                 publisher = "paloaltonetworks"
#                 offer     = "vmseries1"
#                 sku       = "${var.palolicensetype}"
#                 version   = "8.0.0"
#         }

#         storage_os_disk {
#                 name              = "${var.palo1_vm_name}_OSDisk"
#                 caching           = "ReadWrite"
#                 create_option     = "FromImage"
#                 managed_disk_type = "Standard_LRS"
#         }

#         storage_data_disk {
#                 name              = "${var.palo1_vm_name}_DataDisk_1"
#                 managed_disk_type = "Standard_LRS"
#                 create_option     = "Empty"
#                 lun               = 0
#                 disk_size_gb      = "${var.palovm_data_disk_size_gb}"
#         }

#         storage_data_disk {
#                 name              = "${var.palo1_vm_name}_DataDisk_2"
#                 managed_disk_type = "Standard_LRS"
#                 create_option     = "Empty"
#                 lun               = 1
#                 disk_size_gb      = "${var.palovm_data_disk_size_gb}"
#         }

#         os_profile {
#                 computer_name  = "${var.palo1_vm_name}"
#                 admin_username = "uemcpalo01admin"
#                 admin_password = "${var.palovm_password}"
#         }
  
# 	os_profile_linux_config {
#     		disable_password_authentication = false
#          }   


#         boot_diagnostics {
#                 enabled     = "true"
#                 storage_uri = "${azurerm_storage_account.vmdiagnosticslogs.primary_blob_endpoint}"
#         }

# }