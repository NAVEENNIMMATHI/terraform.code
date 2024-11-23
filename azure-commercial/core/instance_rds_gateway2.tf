locals {
  rdgw2vm_name = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "UEMCRDSGW2P1" : "VMW${upper(var.location_acronym)}RDSGW2${upper(var.environment_acronym)}"
}

resource "azurerm_network_interface" "rdgw2nic" {
  count = var.environment_acronym == "pd" ? 1 : 0
  
  name                = "${local.rdgw2vm_name}-nic"
  resource_group_name = azurerm_resource_group.rds.name
  location            = azurerm_resource_group.rds.location

  ip_configuration {
    name                          = "${local.rdgw2vm_name}-config"
    subnet_id                     = azurerm_subnet.rdgw.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.rdgw2_nic_private_ip_address
  }

  tags = var.tags
}

resource "azurerm_virtual_machine" "rdgw2vm" {
  count = var.environment_acronym == "pd" ? 1 : 0

  name                  = local.rdgw2vm_name
  location              = azurerm_resource_group.rds.location
  resource_group_name   = azurerm_resource_group.rds.name
  network_interface_ids = [element(azurerm_network_interface.rdgw2nic.*.id, count.index)]
  vm_size               = "Standard_DS13_v2"

  availability_set_id = azurerm_availability_set.rdsgwas.id

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  license_type = "Windows_Server"

  storage_image_reference {
    #id=var.eu_2016_windows_hardened_image
    id        = var.environment == "production" ? var.eu_2016_windows_hardened_image : ""
    publisher = var.environment == "production" ? "" : "MicrosoftWindowsServer"
    offer     = var.environment == "production" ? "" : "WindowsServer"
    sku       = var.environment == "production" ? "" : "2016-Datacenter"
    version   = var.environment == "production" ? "" : "latest"
  }

  storage_os_disk {
    name              = "${local.rdgw2vm_name}_OSDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_data_disk {
    name              = "${local.rdgw2vm_name}_DataDisk_1"
    managed_disk_type = "Standard_LRS"
    create_option     = "Empty"
    lun               = 0
    disk_size_gb      = "200"
  }

  storage_data_disk {
    name              = "${local.rdgw2vm_name}_DataDisk_2"
    managed_disk_type = "Standard_LRS"
    create_option     = "Empty"
    lun               = 1
    disk_size_gb      = "200"
  }

  os_profile {
    computer_name  = local.rdgw2vm_name
    admin_username = var.rdgw2_admin_username
    admin_password = var.common_virtual_machine_password
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  boot_diagnostics {
    enabled     = "true"
    storage_uri = azurerm_storage_account.vmdiagnosticslogs.primary_blob_endpoint
  }

  tags = var.tags

  lifecycle {
    prevent_destroy = false
  }
}

# resource "azurerm_virtual_machine_extension" "rdgw2vm_custom_ext_win_vm" {
#   count = var.environment_acronym == "dv" ? 1 : 0

#   name                       = "CustomScriptExtension"
#   virtual_machine_id         = element(azurerm_virtual_machine.rdgw2vm.*.id, count.index)
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