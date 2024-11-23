resource "azurerm_network_interface" "appvm_nic" {
  name                = var.environment == "production" ? "UEMCBMPAPP${count.index + 2}P1-nic" : "nic-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}-${count.index + 2}"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  count               = var.count_value_bmpapp1vm

  ip_configuration {
    name                          = var.environment == "production" ? "UEMCBMPAPP${count.index + 2}P1-config" : "ipc-${var.location_acronym}-${var.application_acronym}-app-${var.environment_acronym}-${count.index + 2}"
    subnet_id                     = azurerm_subnet.bmpapp1subnet.id
    private_ip_address_allocation = "dynamic"
  }

  tags = var.tags
}

resource "azurerm_virtual_machine" "appvm" {
  name                = var.environment == "production" ? "UEMCBMPAPP${count.index + 2}P1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APP${count.index + 2}${upper(var.environment_acronym)}"
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
  count                            = var.count_value_bmpapp1vm
  network_interface_ids            = [element(azurerm_network_interface.appvm_nic.*.id, count.index)]
  vm_size                          = "Standard_D4s_v3"
  availability_set_id              = module.bmpapp1as.availability_set_id
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  #license_type          = "Windows_Server"
  tags = var.tags

  lifecycle {
    prevent_destroy = false
  }

  storage_image_reference {
    id        = var.environment == "production" ? var.azurerm_image_id : ""
    publisher = var.environment == "production" ? "" : "MicrosoftWindowsServer"
    offer     = var.environment == "production" ? "" : "WindowsServer"
    sku       = var.environment == "production" ? "" : "2016-Datacenter"
    version   = var.environment == "production" ? "" : "latest"
  }

  storage_os_disk {
    name              = var.environment == "production" ? "UEMCBMPAPP${count.index + 2}P1_OSDisk" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APP${count.index + 2}${upper(var.environment_acronym)}_OS_Disk_1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  storage_data_disk {
    name              = var.environment == "production" ? "UEMCBMPAPP${count.index + 2}P1_DataDisk_1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APP${count.index + 2}${upper(var.environment_acronym)}_DataDisk_1"
    managed_disk_type = "Standard_LRS"
    create_option     = "Empty"
    lun               = 0
    disk_size_gb      = "200"
  }

  storage_data_disk {
    name              = var.environment == "production" ? "UEMCBMPAPP${count.index + 2}P1_DataDisk_2" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APP${count.index + 2}${upper(var.environment_acronym)}_DataDisk_2"
    managed_disk_type = "Standard_LRS"
    create_option     = "Empty"
    lun               = 1
    disk_size_gb      = "200"
  }

  os_profile {
    computer_name  = var.environment == "production" ? "UEMCBMPAPP${count.index + 2}P1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APP${count.index + 2}${upper(var.environment_acronym)}"
    admin_username = "bmpapp${count.index + 2}p1admin"
    admin_password = var.admin_password
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  boot_diagnostics {
    enabled     = "true"
    storage_uri = module.vmdiagnosticslogssa.primary_blob_endpoint
  }
}

