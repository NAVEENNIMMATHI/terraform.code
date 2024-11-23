# Gen 1 - Version 1
resource "azurerm_network_interface" "UEMCSPIREPGN1P1" {
  count                            = var.environment == "production" ? "1" : "0"
  
  name                            = var.environment == "production" ? "UEMC${upper(var.application_acronym)}REPGEN1P1-nic" : "VMW${upper(var.application_acronym)}REPGEN${upper(var.environment_acronym)}${count.index + 1}-nic"
  resource_group_name             = azurerm_resource_group.cospivnetrg.name
  location                        = azurerm_resource_group.cospivnetrg.location
  ip_configuration {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}REPGEN1P1-config" : "VMW${upper(var.application_acronym)}REPGEN${upper(var.environment_acronym)}${count.index + 1}-config"
    subnet_id                     = azurerm_subnet.spidb1_subnet.id
    private_ip_address_allocation = "dynamic"
  }

  tags                            = var.tags
}

resource "azurerm_virtual_machine" "UEMCSPIREPGN1P1" {
  count                            = var.environment == "production" ? "1" : "0"

  name                             = var.environment == "production" ? "UEMC${upper(var.application_acronym)}REPGN1P1" : "VMW${upper(var.application_acronym)}REPGEN${upper(var.environment_acronym)}${count.index + 1}"  # Name does not meet standard to meet 15 character limit requirement (no OS_profile config block)
  location                         = azurerm_resource_group.cospivnetrg.location
  resource_group_name              = azurerm_resource_group.cospivnetrg.name
  network_interface_ids            = [element(azurerm_network_interface.UEMCSPIREPGN1P1.*.id, count.index)]
  vm_size                          = var.UEMCSPIREPGN_vm_size

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_os_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}REPGN1P1_20181017_osdisk" : "VMW${upper(var.application_acronym)}REPGEN1${upper(var.environment_acronym)}${count.index + 1}_OSDisk"
    caching           = "ReadWrite"
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    managed_disk_type = var.wkstn_machine_disk_type
  }
  storage_data_disk {
    name              = var.environment == "production" ? "UEMCSPIREPGN1P1_20181017_uemcspirepgn1p1-datadisk-000-20181022-234023" : "VMW${upper(var.application_acronym)}REPGEN1${upper(var.environment_acronym)}${count.index + 1}_DataDisk_1"
    managed_disk_type = var.wkstn_machine_disk_type
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 0
    disk_size_gb      = var.wkstn_machine_disk_size
  }

  storage_data_disk {
    name              = var.environment == "production" ? "UEMCSPIREPGN1P1_20181017_uemcspirepgn1p1-datadisk-001-20181022-234023" : "VMW${upper(var.application_acronym)}REPGEN1${upper(var.environment_acronym)}${count.index + 1}_DataDisk_2"
    managed_disk_type = var.wkstn_machine_disk_type
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 1
    disk_size_gb      = var.wkstn_machine_disk_size
  }
  boot_diagnostics {
    enabled           = "true"
    storage_uri       = azurerm_storage_account.copeuscospivmlog01sa.primary_blob_endpoint
  }

  tags                = var.tags

  lifecycle {
    prevent_destroy   = false
  }
}

# Gen 1 - Version 2
resource "azurerm_network_interface" "UEMCSPIREPGN1P2" {
  count                            = var.environment == "production" ? "1" : "0"

  name                            = var.environment == "production" ? "UEMC${upper(var.application_acronym)}REPGEN1P2-nic" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}REPGN1${upper(var.environment_acronym)}${count.index + 1}-nic"
  resource_group_name             = azurerm_resource_group.cospivnetrg.name
  location                        = azurerm_resource_group.cospivnetrg.location

  ip_configuration {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}REPGEN1P2-config" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}REPGN1${upper(var.environment_acronym)}${count.index + 1}-config"
    subnet_id                     = azurerm_subnet.spidb1_subnet.id
    private_ip_address_allocation = "dynamic"
  }

  tags                            = var.tags
}

resource "azurerm_virtual_machine" "UEMCSPIREPGN1P2" {
  count                            = var.environment == "production" ? "1" : "0"

  name                             = var.environment == "production" ? "UEMC${upper(var.application_acronym)}REPGN1P2" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}REPGN1${upper(var.environment_acronym)}${count.index + 1}"
  location                         = azurerm_resource_group.cospivnetrg.location
  resource_group_name              = azurerm_resource_group.cospivnetrg.name
  network_interface_ids            = [element(azurerm_network_interface.UEMCSPIREPGN1P2.*.id, count.index)]
  vm_size                          = var.UEMCSPIREPGN_vm_size
  
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    id                = var.environment == "production" ? var.gn_vm_image_id : ""
    publisher         = var.environment == "production" ? "" : "MicrosoftWindowsServer"
    offer             = var.environment == "production" ? "" : "WindowsServer"
    sku               = var.environment == "production" ? "" : "2016-Datacenter"
    version           = var.environment == "production" ? "" : "latest"
  }

  storage_os_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}REPGN1P2_OSDisk" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}REPGN1${upper(var.environment_acronym)}${count.index + 1}_OSDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.wkstn_machine_disk_type
  }
  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}REPGN1P2_DataDisk_1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}REPGN1${upper(var.environment_acronym)}${count.index + 1}_DataDisk_1"
    managed_disk_type = var.wkstn_machine_disk_type
    create_option     = var.environment == "production" ? "FromImage" : "Empty"
    lun               = 0
    disk_size_gb      = var.wkstn_machine_disk_size
  }

  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}REPGN1P2_DataDisk_2" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}REPGN1${upper(var.environment_acronym)}${count.index + 1}_DataDisk_2"
    managed_disk_type = var.wkstn_machine_disk_type
    create_option     = var.environment == "production" ? "FromImage" : "Empty"
    lun               = 1
    disk_size_gb      = var.wkstn_machine_disk_size
  }

  os_profile {
    computer_name     = var.environment == "production" ? "UEMC${upper(var.application_acronym)}REPGN1P2" : "VMW${upper(var.application_acronym)}REPGN1${upper(var.environment_acronym)}${count.index + 1}"
    admin_username    = "repgen1admin"
    admin_password    = var.SPIvmpassword
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  boot_diagnostics {
    enabled            = "true"
    storage_uri        = azurerm_storage_account.copeuscospivmlog01sa.primary_blob_endpoint
  }

  tags                = var.tags

  lifecycle {
    prevent_destroy   = false
  }
}

# Gen 2 - Version 2
resource "azurerm_network_interface" "UEMCSPIREPGNP2" {
  count                           = var.UEMCSPIREPGN_vm_count

  name                            = var.environment == "production" ? "UEMC${upper(var.application_acronym)}REPGEN${count.index + 2}P2-nic" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}REPGN${count.index + 1}${upper(var.environment_acronym)}-nic"
  resource_group_name             = azurerm_resource_group.cospivnetrg.name
  location                        = azurerm_resource_group.cospivnetrg.location

  ip_configuration {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}REPGEN${count.index + 2}P2-config" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}REPGN${count.index + 1}${upper(var.environment_acronym)}-config"
    subnet_id                     = azurerm_subnet.spidb1_subnet.id
    private_ip_address_allocation = "dynamic"
  }

  tags                            = var.tags
}

resource "azurerm_virtual_machine" "UEMCSPIREPGNP2" {
  count                            = var.UEMCSPIREPGN_vm_count

  name                             = var.environment == "production" ? "UEMC${upper(var.application_acronym)}REPGN${count.index + 2}P2" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}REPGN${count.index + 1}${upper(var.environment_acronym)}"
  location                         = azurerm_resource_group.cospivnetrg.location
  resource_group_name              = azurerm_resource_group.cospivnetrg.name
  network_interface_ids            = [element(azurerm_network_interface.UEMCSPIREPGNP2.*.id, count.index)]
  vm_size                          = var.UEMCSPIREPGN_vm_size
  availability_set_id              = azurerm_availability_set.aset_repgen.id
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    id                = var.environment == "production" ? var.gn_vm_image_id : ""
    publisher         = var.environment == "production" ? "" : "MicrosoftWindowsServer"
    offer             = var.environment == "production" ? "" : "WindowsServer"
    sku               = var.environment == "production" ? "" : "2016-Datacenter"
    version           = var.environment == "production" ? "" : "latest"
  }

  storage_os_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}REPGN${count.index + 2}P2_OSDisk" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}REPGN${count.index + 1}${upper(var.environment_acronym)}_OSDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.wkstn_machine_disk_type
  }
  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}REPGN${count.index + 2}P2_DataDisk_1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}REPGN${count.index + 1}${upper(var.environment_acronym)}_DataDisk_1"
    managed_disk_type = var.wkstn_machine_disk_type
    create_option     = var.environment == "production" ? "FromImage" : "Empty"
    lun               = 0
    disk_size_gb      = var.wkstn_machine_disk_size
  }

  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}REPGN${count.index + 2}P2_DataDisk_2" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}REPGN${count.index + 1}${upper(var.environment_acronym)}_DataDisk_2"
    managed_disk_type = var.wkstn_machine_disk_type
    create_option     = var.environment == "production" ? "FromImage" : "Empty"
    lun               = 1
    disk_size_gb      = var.wkstn_machine_disk_size
  }

  os_profile {
    computer_name     = var.environment == "production" ? "UEMC${upper(var.application_acronym)}REPGN${count.index + 2}P2" : "VMW${upper(var.application_acronym)}REPGN${count.index + 1}${upper(var.environment_acronym)}"
    admin_username    = var.environment == "production" ? "repgen${count.index + 2}admin" : "repgen${count.index + 1}admin"
    admin_password    = var.SPIvmpassword
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  boot_diagnostics {
    enabled            = "true"
    storage_uri        = azurerm_storage_account.copeuscospivmlog01sa.primary_blob_endpoint
  }

  tags                = var.tags

  lifecycle {
    prevent_destroy   = false
  }
}

