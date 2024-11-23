# resource "azurerm_network_interface" "UEMCAAD" {
#   count = length(var.static_ip_uemcaad)

#   name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "UEMCAAD${count.index + 1}P1-nic" : "VMWUSEAAD${count.index + 1}${upper(var.environment_acronym)}-nic"
#   resource_group_name = azurerm_resource_group.aadds.name
#   location            = azurerm_resource_group.aadds.location

#   ip_configuration {
#     name                          = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "UEMCAAD${count.index + 1}P1-config" : "VMWUSEAAD${count.index + 1}${upper(var.environment_acronym)}-config"
#     subnet_id                     = azurerm_subnet.aaddsvm.id
#     private_ip_address_allocation = "Static"
#     private_ip_address            = element(var.static_ip_uemcaad, count.index)
#   }

#   tags = var.tags
# }

# resource "azurerm_virtual_machine" "UEMCAAD" {
#   count = length(var.static_ip_uemcaad)

#   name                             = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "UEMCAAD${count.index + 1}P1" : "VMWUSEAAD${count.index + 1}${upper(var.environment_acronym)}"
#   location                         = azurerm_resource_group.aadds.location
#   resource_group_name              = azurerm_resource_group.aadds.name
#   network_interface_ids            = [element(azurerm_network_interface.UEMCAAD.*.id, count.index)]
#   vm_size                          = "Standard_DS2_v2"
#   delete_os_disk_on_termination    = true
#   delete_data_disks_on_termination = true
#   license_type                     = "Windows_Server"

#   storage_image_reference {
#     #id=var.eu_2016_windows_hardened_image
#     id        = var.environment == "production" ? var.eu_2016_windows_hardened_image : ""
#     publisher = var.environment == "production" ? "" : "MicrosoftWindowsServer"
#     offer     = var.environment == "production" ? "" : "WindowsServer"
#     sku       = var.environment == "production" ? "" : "2016-Datacenter"
#     version   = var.environment == "production" ? "" : "latest"
#   }

#   storage_os_disk {
#     name              = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "UEMCAAD${count.index + 1}P1_OSDisk" : "VMWUSEAAD${count.index + 1}${upper(var.environment_acronym)}_OSDisk"
#     caching           = "ReadWrite"
#     create_option     = "FromImage"
#     managed_disk_type = "Standard_LRS"
#   }

#   storage_data_disk {
#     name              = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "UEMCAAD${count.index + 1}P1_DataDisk_1" : "VMWUSEAAD${count.index + 1}${upper(var.environment_acronym)}_DataDisk_1"
#     managed_disk_type = "Standard_LRS"
#     create_option     = "Empty"
#     lun               = 0
#     disk_size_gb      = "200"
#   }

#   storage_data_disk {
#     name              = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "UEMCAAD${count.index + 1}P1_DataDisk_2" : "VMWUSEAAD${count.index + 1}${upper(var.environment_acronym)}_DataDisk_2"
#     managed_disk_type = "Standard_LRS"
#     create_option     = "Empty"
#     lun               = 1
#     disk_size_gb      = "200"
#   }

#   os_profile {
#     computer_name  = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "UEMCAAD${count.index + 1}P1" : "VMWUSEAAD${count.index + 1}${upper(var.environment_acronym)}"
#     admin_username = "uemcaad${count.index + 1}admin"
#     admin_password = var.common_virtual_machine_password
#   }

#   os_profile_windows_config {
#     provision_vm_agent = true
#   }

#   boot_diagnostics {
#     enabled     = "true"
#     storage_uri = azurerm_storage_account.vmdiagnosticslogs.primary_blob_endpoint
#   }

#   tags = var.tags

#   lifecycle {
#     prevent_destroy = false
#   }
# }

# resource "azurerm_virtual_machine_extension" "uemcaad_custom_ext_win_vm" {
#   count = var.environment == "production" ? 0 : length(var.static_ip_uemcaad)

#   name                       = "CustomScriptExtension"
#   virtual_machine_id         = element(azurerm_virtual_machine.UEMCAAD.*.id, count.index)
#   publisher                  = "Microsoft.Compute"
#   type                       = "CustomScriptExtension"
#   type_handler_version       = "1.9"
#   auto_upgrade_minor_version = false
#   settings                   = <<SETTINGS
#     {
#         "commandToExecute": "powershell -command \"[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('${base64encode(data.template_file.ps1.rendered)}')) | Out-File -filepath win_initialise_data_disk.ps1\" && powershell -ExecutionPolicy Unrestricted -File win_initialise_data_disk.ps1"
#     }
#   SETTINGS

#   tags = var.tags
# }