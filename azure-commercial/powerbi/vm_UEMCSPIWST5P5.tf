resource "azurerm_network_interface" "UEMCSPIWST5P5" {
  count               = var.environment == "production" ? "1" : "0"

  name                = "UEMC${upper(var.application_acronym_spi)}WST5${upper(var.environment_acronym)}5-nic"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  ip_configuration {
    name                          = "UEMC${upper(var.application_acronym_spi)}WST5${upper(var.environment_acronym)}5-config"
    subnet_id                     = data.terraform_remote_state.spi.outputs.powerbi_subnet_id
    private_ip_address_allocation = "dynamic"
  }

  tags                = var.tags

}

resource "azurerm_virtual_machine" "UEMCSPIWST5P5" {
  count               = var.environment == "production" ? "1" : "0"

  name                = "UEMC${upper(var.application_acronym_spi)}WST5${upper(var.environment_acronym)}5"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
  # force an interpolation expression to be interpreted as a list by wrapping it
  # in an extra set of list brackets. That form was supported for compatibility in
  # v0.11, but is no longer supported in Terraform v0.12.
  #
  # If the expression in the following list itself returns a list, remove the
  # brackets to avoid interpretation as a list of lists. If the expression
  # returns a single list item then leave it as-is and remove this TODO comment.
  # count                            = length(azurerm_network_interface.UEMCPBIGTW1P1.*.id)
  # network_interface_ids            = [element(azurerm_network_interface.UEMCSPIWST5P5.*.id, count.index)]
  network_interface_ids            = [azurerm_network_interface.UEMCSPIWST5P5[count.index].id]
  vm_size                          = var.UEMCSPIWST5P5_vm_size
  availability_set_id              = module.availabilityset_wkst.availability_set_id
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  #license_type          = "Windows_Server"
  tags = var.tags

  lifecycle {
    prevent_destroy = false
  }

  storage_image_reference {
    id        = var.environment == "production" ? var.wkstn_vm_image_id : ""
    publisher = var.environment == "production" ? "" : "MicrosoftWindowsServer"
    offer     = var.environment == "production" ? "" : "WindowsServer"
    sku       = var.environment == "production" ? "" : "2016-Datacenter"
    version   = var.environment == "production" ? "" : "latest"
  }

  storage_os_disk {
    name              = "UEMC${upper(var.application_acronym_spi)}WST5${upper(var.environment_acronym)}5_OSDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "StandardSSD_LRS"
  }
  storage_data_disk {
    name              = "UEMC${upper(var.application_acronym_spi)}WST5${upper(var.environment_acronym)}5_DataDisk_1"
    managed_disk_type = "StandardSSD_LRS"
    create_option     = var.environment == "production" ? "Empty" : "Empty"
    lun               = 0
    disk_size_gb      = "512"
  }

  storage_data_disk {
    name              = "UEMC${upper(var.application_acronym_spi)}WST5${upper(var.environment_acronym)}5_DataDisk_2"
    managed_disk_type = "StandardSSD_LRS"
    create_option     = var.environment == "production" ? "Empty" : "Empty"
    lun               = 1
    disk_size_gb      = "512"
  }

  os_profile {
    computer_name  = "UEMC${upper(var.application_acronym_spi)}WST5${upper(var.environment_acronym)}5"
    admin_username = "spiwst5p5admin"
    admin_password = var.vmpassword
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  boot_diagnostics {
    enabled     = "true"
    storage_uri = data.terraform_remote_state.spi.outputs.vm_storage_uri
  }
}

