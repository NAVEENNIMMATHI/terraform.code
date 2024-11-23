resource "azurerm_network_interface" "analytics_nic" {
  count                           = var.count_value_analytics
  name                            = lower("nic-${var.location_acronym}-${var.application_acronym}-ANA${count.index + 1}-${var.environment_acronym}")
  resource_group_name             = module.applicationrg.resource_group_name
  location                        = module.applicationrg.resource_group_location
  enable_accelerated_networking   = true

  ip_configuration {
    name                          = upper("VML${var.location_acronym}${var.application_acronym}ANA${count.index + 1}-${var.environment_acronym}-config")
    subnet_id                     = module.wst1subnet.subnet_id
    private_ip_address_allocation = "dynamic"
  }

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "analytics_vm" {
  count                 = var.count_value_analytics
  availability_set_id   = module.analtics_as.availability_set_id
  name                  = upper("VML${var.location_acronym}${var.application_acronym}ANA${count.index + 1}${var.environment_acronym}")
  location              = module.applicationrg.resource_group_location
  resource_group_name   = module.applicationrg.resource_group_name
  network_interface_ids = [element(azurerm_network_interface.analytics_nic.*.id, count.index)]
  size                  = var.vm_size_analytics

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    name                 = "${upper("VML${var.location_acronym}${var.application_acronym}ANA${count.index + 1}${var.environment_acronym}")}_osDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = 256
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "8.2"
    version   = "latest"
  }

  admin_username = "azureuser"
  admin_password = var.vm_admin_password
  computer_name  = upper("VML${var.location_acronym}${var.application_acronym}ANA${count.index + 1}${var.environment_acronym}")

  disable_password_authentication = false

  boot_diagnostics {
    storage_account_uri = module.vmdiagnosticslogssa.primary_blob_endpoint
  }

  tags = var.tags
}

/* # We may use below in future
resource "azurerm_managed_disk" "data_disk_1" {
  count                = var.count_value_analytics
  name                 = "${upper("VML${var.location_acronym}${var.application_acronym}ANA${count.index + 1}${var.environment_acronym}")}_DataDisk_1"
  location             = module.applicationrg.resource_group_location
  resource_group_name  = module.applicationrg.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = 128
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_1_attachment" {
  count              = var.count_value_analytics
  managed_disk_id    = azurerm_managed_disk.data_disk_1.id
  virtual_machine_id = azurerm_linux_virtual_machine.analytics_vm.id
  lun                = 1
  caching            = "ReadWrite"
}
*/