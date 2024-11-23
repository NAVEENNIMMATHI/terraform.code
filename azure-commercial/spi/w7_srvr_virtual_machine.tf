resource "azurerm_network_interface" "UEMCSPISRVR1P1" {
  count                            = "1"
  
  name                            = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SRVR1P1-nic" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SRVR${count.index + 1}${upper(var.environment_acronym)}-nic"
  resource_group_name             = azurerm_resource_group.cospivnetrg.name
  location                        = azurerm_resource_group.cospivnetrg.location
  ip_configuration {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SRVR1P1-config" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SRVR${count.index + 1}${upper(var.environment_acronym)}-config"
    subnet_id                     = azurerm_subnet.spiapp1_subnet.id
    private_ip_address_allocation = "dynamic"
  }

  tags                            = var.tags
}

resource "azurerm_virtual_machine" "UEMCSPISRVR1P1" {
  count                            = "1"
  
  name                            = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SRVR1P1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SRVR${count.index + 1}${upper(var.environment_acronym)}"
  location                        = azurerm_resource_group.cospivnetrg.location
  resource_group_name             = azurerm_resource_group.cospivnetrg.name
  network_interface_ids           = [azurerm_network_interface.UEMCSPISRVR1P1[count.index].id]
  vm_size                         = var.UEMCSPISRVR_vm_type
  availability_set_id             = azurerm_availability_set.aset_srvr.id
  delete_os_disk_on_termination   = "true"
  delete_data_disks_on_termination= "true"

  storage_image_reference {
    id                            = var.environment == "production" ? var.gn_vm_image_id : ""
    publisher                     = var.environment == "production" ? "" : "MicrosoftWindowsServer"
    offer                         = var.environment == "production" ? "" : "WindowsServer"
    sku                           = var.environment == "production" ? "" : "2016-Datacenter"
    version                       = var.environment == "production" ? "" : "latest"
  }

  storage_os_disk {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SRVR1P1_OSDisk" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SRVR${count.index + 1}${upper(var.environment_acronym)}_OSDisk"
    caching                       = "ReadWrite"
    create_option                 = "FromImage"
    managed_disk_type             = var.wkstn_machine_disk_type
  }
  storage_data_disk {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SRVR1P1_DataDisk_1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SRVR${count.index + 1}${upper(var.environment_acronym)}_DataDisk_1"
    managed_disk_type             = var.wkstn_machine_disk_type
    create_option                 = var.environment == "production" ? "FromImage" : "Empty"
    lun                           = 0
    disk_size_gb                  = var.wkstn_machine_disk_size
  }

  storage_data_disk {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SRVR1P1_DataDisk_2" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SRVR${count.index + 1}${upper(var.environment_acronym)}_DataDisk_2"
    managed_disk_type             = var.wkstn_machine_disk_type
    create_option                 = var.environment == "production" ? "FromImage" : "Empty"
    lun                           = 1
    disk_size_gb                  = var.wkstn_machine_disk_size
  }

  os_profile {
    computer_name                 = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SRVR1P1" : "VMW${upper(var.application_acronym)}SRVR${count.index + 1}${upper(var.environment_acronym)}"
    admin_username                = "srvr1admin"
    admin_password                = var.SPIvmpassword
  }

  os_profile_windows_config {
    provision_vm_agent            = true
  }

  boot_diagnostics {
    enabled                       = "true"
    storage_uri                   = azurerm_storage_account.copeuscospivmlog01sa.primary_blob_endpoint
  }

  tags                            = var.tags

  lifecycle {
    prevent_destroy               = false
  }
}

