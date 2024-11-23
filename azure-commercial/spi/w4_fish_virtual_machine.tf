resource "azurerm_network_interface" "UEMCSPIFISH" {
  count                            = "1"
  
  name                            = var.environment == "production" ? "uemc${lower(var.application_acronym)}fish2p1465" : "nic-${var.location_acronym}-${var.application_acronym}-fish-${var.environment_acronym}-1"
# name                            = var.environment == "production" ? "uemc${lower(var.application_acronym)}fish2p1465" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}FISH${count.index + 1}${upper(var.environment_acronym)}-nic"
  resource_group_name             = azurerm_resource_group.cospivnetrg.name
  location                        = azurerm_resource_group.cospivnetrg.location
  ip_configuration {
    name                          = "ipconfig1"
  # name                          = var.environment == "production" ? "ipconfig1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}FISH${count.index + 1}${upper(var.environment_acronym)}-config"
    subnet_id                     = azurerm_subnet.spiapp1_subnet.id
    private_ip_address_allocation = "dynamic"
  }

  tags                      = var.tags
}

resource "azurerm_virtual_machine" "UEMCSPIFISH" {
  count                            = "1"

  name                             = var.environment == "production" ? "UEMC${upper(var.application_acronym)}FISH2P1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}FISH${upper(var.environment_acronym)}"
# name                             = var.environment == "production" ? "UEMC${upper(var.application_acronym)}FISH2P1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}FISH${count.index + 1}${upper(var.environment_acronym)}"
  location                         = azurerm_resource_group.cospivnetrg.location
  resource_group_name              = azurerm_resource_group.cospivnetrg.name
  network_interface_ids            = [element(azurerm_network_interface.UEMCSPIFISH.*.id, count.index)]
  vm_size                          = var.fish_vm_size
  availability_set_id              = azurerm_availability_set.aset_fish.id
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    id                = var.environment == "production" ? var.fish_vm_image_id : ""
    publisher         = var.environment == "production" ? "" : "MicrosoftWindowsServer"
    offer             = var.environment == "production" ? "" : "WindowsServer"
    sku               = var.environment == "production" ? "" : "2016-Datacenter"
    version           = var.environment == "production" ? "" : "latest"
  }

  storage_os_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}FISH2P1_disk1_f962425f18e942d1871bab90f09e9df6" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}FISH${upper(var.environment_acronym)}_OS_DISK"
  # name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}FISH2P1_disk1_f962425f18e942d1871bab90f09e9df6" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}FISH${count.index + 1}${upper(var.environment_acronym)}_OSDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_data_disk {
    name              = "UEMC${upper(var.application_acronym)}FISH1P1_DataDisk_2"
  # name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}FISH1P1_DataDisk_2" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}FISH${count.index + 1}${upper(var.environment_acronym)}_DataDisk_2"
    managed_disk_type = var.wkstn_machine_disk_type
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 1
    disk_size_gb      = var.wkstn_machine_disk_size
  }
  storage_data_disk {
    name              = "UEMCSPIFISH1P1_DataDisk_3"
  # name              = var.environment == "production" ? "UEMCSPIFISH1P1_DataDisk_3" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}FISH${count.index + 1}${upper(var.environment_acronym)}_DataDisk_3"
    managed_disk_type = "StandardSSD_LRS"
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 3
    disk_size_gb      = "1024"
  }

  storage_data_disk {
    name              = "UEMCSPIFISH1P1_DataDisk_1_New3_restore"
  # name              = var.environment == "production" ? "UEMCSPIFISH1P1_DataDisk_1_New3_restore" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}FISH${count.index + 1}${upper(var.environment_acronym)}_DataDisk_1"
    managed_disk_type = "StandardSSD_LRS"
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 0
    disk_size_gb      = "16000"
  }
  storage_data_disk {
    name              = "UEMCSPIFISH1P1_DataDisk_4"
  # name              = var.environment == "production" ? "UEMCSPIFISH1P1_DataDisk_4" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}FISH${count.index + 1}${upper(var.environment_acronym)}_DataDisk_4"
    managed_disk_type = "StandardSSD_LRS"
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 2
    disk_size_gb      = "32767"
  }

  os_profile {
    computer_name     = "UEMC${upper(var.application_acronym)}FISH2P1"
  # computer_name     = "UEMC${upper(var.application_acronym)}FISH2P1" : "VMW${upper(var.application_acronym)}FISH${count.index + 1}${upper(var.environment_acronym)}"
    admin_username    = var.environment == "production" ? "jkota" : "${upper(var.application_acronym)}vmadmin01"
    admin_password    = var.SPIvmpassword
  }

  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = true
  }

  boot_diagnostics {
    enabled                   = "true"
    storage_uri               = module.copeastuscospivnetrg209.primary_blob_endpoint
  }

  tags                        = var.tags

  lifecycle {
    prevent_destroy           = false
  }

}

