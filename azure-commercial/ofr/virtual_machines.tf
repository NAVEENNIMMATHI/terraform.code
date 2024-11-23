locals {
    vm_name = "VM${upper(var.location_acronym)}${upper(var.application_acronym)}WK${upper(var.environment_acronym)}"
}

resource "azurerm_network_interface" "ofr_workstation" {
  name                = "${local.vm_name}-nic"
  location            = azurerm_resource_group.ofr.location
  resource_group_name = azurerm_resource_group.ofr.name

  ip_configuration {
    name                          = "${local.vm_name}-config"
    subnet_id                     = azurerm_subnet.build.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.tags
}

resource "azurerm_windows_virtual_machine" "ofr_workstation" {
  name                      = local.vm_name
  resource_group_name       = azurerm_resource_group.ofr.name
  location                  = azurerm_resource_group.ofr.location
  size                      = "Standard_D4s_v3"
  admin_username            = "${local.vm_name}ADMIN"
  admin_password            = var.vm_admin_password
  license_type              = "Windows_Server"
  enable_automatic_updates  = true
  network_interface_ids     = [
    azurerm_network_interface.ofr_workstation.id,
  ]

  os_disk {
    name                 = "${local.vm_name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  tags = var.tags
}

resource "azurerm_managed_disk" "ofr_workstation" {
  name                 = "${local.vm_name}-datadisk"
  location             = azurerm_resource_group.ofr.location
  resource_group_name  = azurerm_resource_group.ofr.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "200"

  tags = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "ofr_workstation" {
  managed_disk_id    = azurerm_managed_disk.ofr_workstation.id
  virtual_machine_id = azurerm_windows_virtual_machine.ofr_workstation.id
  lun                = "10"
  caching            = "ReadOnly"
}