# Version 5
resource "azurerm_network_interface" "UEMCSPIWRKSTP2" {
  count = var.wkst_v5_count

  name                = "VM${upper(var.location_acronym)}${upper(var.application_acronym)}WS${upper(var.environment_acronym)}${count.index + 1}-nic"
  resource_group_name = azurerm_resource_group.cospivnetrg.name
  location            = azurerm_resource_group.cospivnetrg.location

  ip_configuration {
    name                          = "VM${upper(var.location_acronym)}${upper(var.application_acronym)}WS${upper(var.environment_acronym)}${count.index + 1}-config"
    subnet_id                     = azurerm_subnet.spiapp1_subnet.id
    private_ip_address_allocation = "dynamic"
  }

  #tags = var.tags
  tags = count.index == var.spiwsp13_index || count.index == var.spiwsp16_index ? var.tags_cons : var.tags
}

resource "azurerm_virtual_machine" "UEMCSPIWRKSTP2" {
  count = var.wkst_v5_count

  name                             = "VM${upper(var.location_acronym)}${upper(var.application_acronym)}WS${upper(var.environment_acronym)}${count.index + 1}"
  location                         = azurerm_resource_group.cospivnetrg.location
  resource_group_name              = azurerm_resource_group.cospivnetrg.name
  network_interface_ids            = [element(azurerm_network_interface.UEMCSPIWRKSTP2.*.id, count.index)]
  vm_size                          = var.UEMCSPIWKSTN_vm_size
  availability_set_id              = azurerm_availability_set.aset_wrkst.id
  delete_os_disk_on_termination    = "true"
  delete_data_disks_on_termination = "true"

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "VM${upper(var.location_acronym)}${upper(var.application_acronym)}WS${upper(var.environment_acronym)}${count.index + 1}OSDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "StandardSSD_LRS"
  }
  storage_data_disk {
    name              = "VM${upper(var.location_acronym)}${upper(var.application_acronym)}WS${upper(var.environment_acronym)}${count.index + 1}DataDisk1"
    managed_disk_type = "StandardSSD_LRS"
    create_option     = "Empty"
    lun               = 0
    disk_size_gb      = var.wkstn_machine_disk_size
  }

  storage_data_disk {
    name              = "VM${upper(var.location_acronym)}${upper(var.application_acronym)}WS${upper(var.environment_acronym)}${count.index + 1}DataDisk2"
    managed_disk_type = "StandardSSD_LRS"
    create_option     = "Empty"
    lun               = 1
    disk_size_gb      = var.wkstn_machine_disk_size
  }

  os_profile {
    computer_name  = "VM${upper(var.location_acronym)}${upper(var.application_acronym)}WS${upper(var.environment_acronym)}${count.index + 1}"
    admin_username = "workstation_admin"
    admin_password = var.SPIvmpassword
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  boot_diagnostics {
    enabled     = "true"
    storage_uri = azurerm_storage_account.copeuscospivmlog01sa.primary_blob_endpoint
  }

  #tags = var.tags
  tags = count.index == var.spiwsp13_index || count.index == var.spiwsp16_index ? var.tags_cons : var.tags
  
  lifecycle {
    prevent_destroy = false
  }
}

# Version 4
resource "azurerm_network_interface" "UEMCSPIWRKSTP4" {
  count = var.wkstnvm_count

  name                = var.environment == "production" ? "UEMC${upper(var.application_acronym)}WRKST${count.index + 2}P4-nic" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}WRKST${count.index + 1}${upper(var.environment_acronym)}-nic"
  resource_group_name = azurerm_resource_group.cospivnetrg.name
  location            = azurerm_resource_group.cospivnetrg.location

  ip_configuration {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}WRKST${count.index + 2}P4-config" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}WRKST${count.index + 1}${upper(var.environment_acronym)}-config"
    subnet_id                     = azurerm_subnet.spiapp1_subnet.id
    private_ip_address_allocation = "dynamic"
  }

  tags = var.tags
 

}

resource "azurerm_virtual_machine" "UEMCSPIWRKSTP4" {
  count = var.wkstnvm_count

  name                             = var.environment == "production" ? "UEMC${upper(var.application_acronym)}WRKST${count.index + 2}P4" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}WRKST${count.index + 1}${upper(var.environment_acronym)}"
  location                         = azurerm_resource_group.cospivnetrg.location
  resource_group_name              = azurerm_resource_group.cospivnetrg.name
  network_interface_ids            = [element(azurerm_network_interface.UEMCSPIWRKSTP4.*.id, count.index)]
  vm_size                          = var.UEMCSPIWKSTN_vm_size
  availability_set_id              = azurerm_availability_set.aset_wrkst.id
  delete_os_disk_on_termination    = "true"
  delete_data_disks_on_termination = "true"

  storage_image_reference {
    id        = var.environment == "production" ? var.wkstn_vm_image_id : ""
    publisher = var.environment == "production" ? "" : "MicrosoftWindowsServer"
    offer     = var.environment == "production" ? "" : "WindowsServer"
    sku       = var.environment == "production" ? "" : "2016-Datacenter"
    version   = var.environment == "production" ? "" : "latest"
  }

  storage_os_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}WRKST${count.index + 2}P4_OSDisk" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}WRKST${count.index + 1}${upper(var.environment_acronym)}_OSDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "StandardSSD_LRS"
  }
  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}WRKST${count.index + 2}P4_DataDisk_1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}WRKST${count.index + 1}${upper(var.environment_acronym)}_DataDisk_1"
    managed_disk_type = "StandardSSD_LRS"
    create_option     = var.environment == "production" ? "FromImage" : "Empty"
    lun               = 0
    disk_size_gb      = var.wkstn_machine_disk_size
  }

  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}WRKST${count.index + 2}P4_DataDisk_2" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}WRKST${count.index + 1}${upper(var.environment_acronym)}_DataDisk_2"
    managed_disk_type = "StandardSSD_LRS"
    create_option     = var.environment == "production" ? "FromImage" : "Empty"
    lun               = 1
    disk_size_gb      = var.wkstn_machine_disk_size
  }

  os_profile {
    computer_name  = var.environment == "production" ? "UEMC${upper(var.application_acronym)}WRKST${count.index + 2}P4" : "VMW${upper(var.application_acronym)}WRKST${count.index + 1}${upper(var.environment_acronym)}"
    admin_username = var.environment == "production" ? "wrkst${count.index + 2}admin" : "wrkst${count.index + 1}admin"
    admin_password = var.SPIvmpassword
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  boot_diagnostics {
    enabled     = "true"
    storage_uri = azurerm_storage_account.copeuscospivmlog01sa.primary_blob_endpoint
  }

  tags = var.tags

  lifecycle {
    prevent_destroy = false
  }
}

# Version 3
resource "azurerm_network_interface" "UEMCSPIWRKST1P1" {
  count = var.environment == "production" ? "1" : "0"

  name                = var.environment == "production" ? "UEMC${upper(var.application_acronym)}WRKST1P1-nic" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}WRKST3${upper(var.environment_acronym)}${count.index + 1}-nic"
  resource_group_name = azurerm_resource_group.cospivnetrg.name
  location            = azurerm_resource_group.cospivnetrg.location
  ip_configuration {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}Wrkst1P1-config" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}WRKST3${upper(var.environment_acronym)}${count.index + 1}-config"
    subnet_id                     = azurerm_subnet.spiapp1_subnet.id
    private_ip_address_allocation = "dynamic"
  }

  tags = var.tags
}

resource "azurerm_virtual_machine" "UEMCSPIWRKST1P1" {
  count = var.environment == "production" ? "1" : "0"

  name                             = var.environment == "production" ? "UEMC${upper(var.application_acronym)}WRKST1P1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}WRKST3${upper(var.environment_acronym)}${count.index + 1}"
  location                         = azurerm_resource_group.cospivnetrg.location
  resource_group_name              = azurerm_resource_group.cospivnetrg.name
  network_interface_ids            = [element(azurerm_network_interface.UEMCSPIWRKST1P1.*.id, count.index)]
  vm_size                          = var.UEMCSPIWKSTN_vm_size
  availability_set_id              = azurerm_availability_set.aset_wrkst.id
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    id        = var.environment == "production" ? var.wkstn1_vm_image_id : ""
    publisher = var.environment == "production" ? "" : "MicrosoftWindowsServer"
    offer     = var.environment == "production" ? "" : "WindowsServer"
    sku       = var.environment == "production" ? "" : "2016-Datacenter"
    version   = var.environment == "production" ? "" : "latest"
  }

  storage_os_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}WRKST1P1_OSDisk" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}WRKST3${upper(var.environment_acronym)}${count.index + 1}_OSDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "StandardSSD_LRS"
  }
  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}WRKST1P1_DataDisk_1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}WRKST3${upper(var.environment_acronym)}${count.index + 1}_DataDisk_1"
    managed_disk_type = "StandardSSD_LRS"
    create_option     = var.environment == "production" ? "FromImage" : "Empty"
    lun               = 0
    disk_size_gb      = var.wkstn_machine_disk_size
  }

  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}WRKST1P1_DataDisk_2" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}WRKST3${upper(var.environment_acronym)}${count.index + 1}_DataDisk_2"
    managed_disk_type = "StandardSSD_LRS"
    create_option     = var.environment == "production" ? "FromImage" : "Empty"
    lun               = 1
    disk_size_gb      = var.wkstn_machine_disk_size
  }

  os_profile {
    computer_name  = var.environment == "production" ? "UEMC${upper(var.application_acronym)}WRKST1P1" : "VMW${upper(var.application_acronym)}WRKST3${upper(var.environment_acronym)}${count.index + 1}"
    admin_username = "wrkst1admin"
    admin_password = var.SPIvmpassword
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  boot_diagnostics {
    enabled     = "true"
    storage_uri = azurerm_storage_account.copeuscospivmlog01sa.primary_blob_endpoint
  }

  tags = var.tags

  lifecycle {
    prevent_destroy = false
  }

}

# Version 1
resource "azurerm_network_interface" "UEMCSPIWRKST1P4" {
  count = var.environment == "production" ? "1" : "0"

  name                = var.environment == "production" ? "UEMC${upper(var.application_acronym)}WRKST1P4-nic" : "VMW${upper(var.application_acronym)}WRKST1${upper(var.environment_acronym)}${count.index + 1}-nic"
  resource_group_name = azurerm_resource_group.cospivnetrg.name
  location            = azurerm_resource_group.cospivnetrg.location

  ip_configuration {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}WRKST1P4-config" : "VMW${upper(var.application_acronym)}WRKST1${upper(var.environment_acronym)}${count.index + 1}-config"
    subnet_id                     = azurerm_subnet.spiapp1_subnet.id
    private_ip_address_allocation = "dynamic"
  }

  tags = var.tags
}

resource "azurerm_virtual_machine" "UEMCSPIWRKST1P4" {
  count = var.environment == "production" ? "1" : "0"

  name                  = var.environment == "production" ? "UEMC${upper(var.application_acronym)}WRKST1P4" : "VMW${upper(var.application_acronym)}WRKST1${upper(var.environment_acronym)}${count.index + 1}" # Name does not meet standard to meet 15 character limit requirement (no OS_profile config block)
  location              = azurerm_resource_group.cospivnetrg.location
  resource_group_name   = azurerm_resource_group.cospivnetrg.name
  network_interface_ids = [element(azurerm_network_interface.UEMCSPIWRKST1P4.*.id, count.index)]
  vm_size               = var.UEMCSPIWKSTN_vm_size

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  primary_network_interface_id = azurerm_network_interface.UEMCSPIWRKST1P4[0].id

  storage_os_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}WRKST1P4_OSDisk_New" : "VMW${upper(var.application_acronym)}WRKST1${upper(var.environment_acronym)}${count.index + 1}_OSDisk"
    caching           = "ReadWrite"
    create_option     = var.environment == "production" ? "Attach" : "FromImage"
    managed_disk_type = "StandardSSD_LRS"
  }
  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}WRKST1P4_DataDisk_1" : "VMW${upper(var.application_acronym)}WRKST1${upper(var.environment_acronym)}${count.index + 1}_DataDisk_1"
    managed_disk_type = "StandardSSD_LRS"
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 0
    disk_size_gb      = 1024
  }

  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}WRKST1P4_DataDisk_2" : "VMW${upper(var.application_acronym)}WRKST1${upper(var.environment_acronym)}${count.index + 1}_DataDisk_2"
    managed_disk_type = "StandardSSD_LRS"
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 1
    disk_size_gb      = var.wkstn_machine_disk_size
  }
  boot_diagnostics {
    enabled     = "true"
    storage_uri = azurerm_storage_account.copeuscospivmlog01sa.primary_blob_endpoint
  }

  tags = var.tags

  lifecycle {
    prevent_destroy = false
  }
}

