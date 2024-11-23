resource "azurerm_network_interface" "UEMCSPIAPDB1P" {
  count                           = var.UEMCSPIAPDB1P_vm_count
  
  name                            = var.environment == "production" ? "UEMC${upper(var.application_acronym)}APDB1P${count.index + 1}-nic" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APDB${count.index + 1}${upper(var.environment_acronym)}-nic"
  resource_group_name             = azurerm_resource_group.cospivnetrg.name
  location                        = azurerm_resource_group.cospivnetrg.location

  ip_configuration {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}APDB1P${count.index + 1}-config" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APDB${count.index + 1}${upper(var.environment_acronym)}-config"
    subnet_id                     = azurerm_subnet.spidb1_subnet.id
    private_ip_address_allocation = "dynamic"
  }

  tags                = var.tags
}

resource "azurerm_virtual_machine" "UEMCSPIAPDB1P" {
  count                            = var.UEMCSPIAPDB1P_vm_count

  name                             = var.environment == "production" ? "UEMC${upper(var.application_acronym)}APDB1P${count.index + 1}" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APDB${count.index + 1}${upper(var.environment_acronym)}"
  location                         = azurerm_resource_group.cospivnetrg.location
  resource_group_name              = azurerm_resource_group.cospivnetrg.name
  network_interface_ids            = [element(azurerm_network_interface.UEMCSPIAPDB1P.*.id, count.index)]
  vm_size                          = var.UEMCSPIAPDB1P_vm_size
  availability_set_id              = azurerm_availability_set.aset_spiapdb.id
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    id                = var.environment == "production" ? var.apdb_vm_image_id : ""
    publisher         = var.environment == "production" ? "" : "MicrosoftWindowsServer"
    offer             = var.environment == "production" ? "" : "WindowsServer"
    sku               = var.environment == "production" ? "" : "2016-Datacenter"
    version           = var.environment == "production" ? "" : "latest"
  }

  storage_os_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}APDB1P${count.index + 1}_OSDisk" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APDB${count.index + 1}${upper(var.environment_acronym)}_OSDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.UEMCSPIAPDB1P_disk_type
  }
  storage_data_disk {
    name              = var.environment == "production" ? "UEMCSPIAPDB1P1_DataDisk_1_CTASK0012536" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APDB${count.index + 1}${upper(var.environment_acronym)}_DataDisk_1"
    managed_disk_type = "Premium_LRS"
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 2
    disk_size_gb      = "1024"
  }

  storage_data_disk {
    name              = var.environment == "production" ? "UEMCSPIAPDB1P1_DataDisk_2_CTASK0012536" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APDB${count.index + 1}${upper(var.environment_acronym)}_DataDisk_2"
    managed_disk_type = "Premium_LRS"
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 3
    disk_size_gb      = "512"
  }
  storage_data_disk {
    name              = var.environment == "production" ? "UEMCSPIAPDB1P1_Datadisk_3" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APDB${count.index + 1}${upper(var.environment_acronym)}_DataDisk_3"
    managed_disk_type = "Premium_LRS"
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 4
    disk_size_gb      = "300"
  }
  storage_data_disk {
    name              = var.environment == "production" ? "UEMCSPIAPDB1P1_Datadisk_4" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APDB${count.index + 1}${upper(var.environment_acronym)}_DataDisk_4"
    managed_disk_type = "Premium_LRS"
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 5
    disk_size_gb      = "200"
  }
  storage_data_disk {
    name              = var.environment == "production" ? "uemcspiapdb1p1-datadisk-002-20200315-121801" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APDB${count.index + 1}${upper(var.environment_acronym)}_DataDisk_5"
    managed_disk_type = "Premium_LRS"
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 6
    disk_size_gb      = "1024"
  }
  storage_data_disk {
    name              = var.environment == "production" ? "uemcspiapdb1p1-datadisk-003-20200315-121801" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APDB${count.index + 1}${upper(var.environment_acronym)}_DataDisk_6"
    managed_disk_type = "Premium_LRS"
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 7
    disk_size_gb      = "1100"
  }

  os_profile {
    computer_name     = var.environment == "production" ? "UEMC${upper(var.application_acronym)}APDB1P${count.index + 1}" : "VMW${upper(var.application_acronym)}APDB${count.index + 1}${upper(var.environment_acronym)}"
    admin_username    = var.environment == "production" ? "apdb${count.index + 1}admin" : "${var.environment_acronym}apdb${count.index + 1}admin"
    admin_password    = var.SPIvmpassword
  }

  os_profile_windows_config {
    provision_vm_agent= true
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

