resource "azurerm_network_interface" "UEMCSPISSIS1P1" {
  count                            = "1"

  name                            = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SSIS1P1-nic" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SSIS${count.index + 1}${upper(var.environment_acronym)}-nic"
  resource_group_name             = azurerm_resource_group.cospivnetrg.name
  location                        = azurerm_resource_group.cospivnetrg.location

  ip_configuration {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SSIS1P1-config" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SSIS${count.index + 1}${upper(var.environment_acronym)}-config"
    subnet_id                     = azurerm_subnet.spidb1_subnet.id
    private_ip_address_allocation = "dynamic"
  }

  tags                            = var.tags
}

resource "azurerm_virtual_machine" "UEMCSPISSIS1P1" {
  count                            = "1"

  name                            = var.environment== "production" ? "UEMC${upper(var.application_acronym)}SSIS1P1" : "VMW${upper(var.application_acronym)}SSIS${count.index + 1}${upper(var.environment_acronym)}"   # Name does not meet standard to meet 15 character limit requirement (no OS_profile config block)
  location                        = azurerm_resource_group.cospivnetrg.location
  resource_group_name             = azurerm_resource_group.cospivnetrg.name
  network_interface_ids           = [azurerm_network_interface.UEMCSPISSIS1P1[count.index].id]
  vm_size                         = var.ssis_vm_size

  delete_os_disk_on_termination   = "true"
  delete_data_disks_on_termination= "true"

  dynamic "storage_image_reference" {
    for_each = var.environment == "production" ? [] : [{}]
    content {
      publisher         = "MicrosoftWindowsServer"
      offer             = "WindowsServer"
      sku               = "2016-Datacenter"
      version           = "latest"
    }
  }

  dynamic "os_profile" {
    for_each = var.environment == "production" ? [] : [{}]
    content {
      computer_name     = "VMW${upper(var.application_acronym)}SSIS${count.index + 1}${upper(var.environment_acronym)}"
      admin_username    = "${var.environment_acronym}ssisqladmin"
      admin_password    = var.SPIvmpassword
    }  
  }

  dynamic "os_profile_windows_config" {
    for_each = var.environment == "production" ? [] : [{}]

    content {
      provision_vm_agent = true
    }
  }

  storage_os_disk {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SSIS1P1_20181016_osdisk" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SSIS${count.index + 1}${upper(var.environment_acronym)}_OSDisk"
    caching                       = "ReadWrite"
    create_option                 = var.environment == "production" ? "Attach" : "FromImage"
    managed_disk_type             = var.wkstn_machine_disk_type
  }

  storage_data_disk {
    name                          = var.environment == "production" ? "UEMCSPISSIS1P1_20181016_uemcspissis1p1-datadisk-000-20181022-135342" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SSIS${count.index + 1}${upper(var.environment_acronym)}_DataDisk_1"
    managed_disk_type             = var.wkstn_machine_disk_type
    create_option                 = var.environment == "production" || var.environment == "qa" ? "Attach" : "Empty"
    lun                           = 0
    disk_size_gb                  = "256"
  }

  storage_data_disk {
    name                          = var.environment == "production" ? "UEMCSPISSIS1P1_20181016_uemcspissis1p1-datadisk-001-20181022-135342" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SSIS${count.index + 1}${upper(var.environment_acronym)}_DataDisk_2"
    managed_disk_type             = var.wkstn_machine_disk_type
    create_option                 = var.environment == "production" || var.environment == "qa" ? "Attach" : "Empty"
    lun                           = 1
    disk_size_gb                  = "256"
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

