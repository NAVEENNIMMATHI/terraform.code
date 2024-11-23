resource "azurerm_network_interface" "fpinic" {
  name                             = var.environment=="production" ? "UEMCSPIFPI1P${count.index+1}-nic" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}${count.index+1}${upper(var.environment_acronym)}-nic"
  resource_group_name              = module.rgfpi.resource_group_name
  location                         = module.rgfpi.resource_group_location
  count                            = var.vm_count
  tags                             = var.tags
  ip_configuration {
    name                           = var.environment=="production" ? "UEMCSPIFPI1P${count.index+1}-config" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}${count.index+1}${upper(var.environment_acronym)}-config"
    subnet_id                      = azurerm_subnet.backend.id
    private_ip_address_allocation  = "dynamic"
  }
}

resource "azurerm_virtual_machine" "fpivm" {
  name                             = var.environment=="production" ? "UEMCSPIFPI1P${count.index+1}" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}${count.index+1}${upper(var.environment_acronym)}"
  location                         = module.rgfpi.resource_group_location
  resource_group_name              = var.environment == "production" ? module.rgfpi.resource_group_name : upper(module.rgfpi.resource_group_name)
  network_interface_ids            = [element(azurerm_network_interface.fpinic.*.id, count.index)]
  vm_size                          = var.vm_size
  availability_set_id              = module.fpias.availability_set_id
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true
  count                            = var.vm_count
  tags                             = var.tags

  lifecycle {
    prevent_destroy                = false
  }

  storage_image_reference {
    id                             = var.environment == "production" ? var.vm_image_id : ""
    publisher                      = var.environment == "production" ? "" : "MicrosoftWindowsServer"
    offer                          = var.environment == "production" ? "" : "WindowsServer"
    sku                            = var.environment == "production" ? "" : "2016-Datacenter"
    version                        = var.environment == "production" ? "" : "latest"
  }

  storage_os_disk {
    name                           = var.environment=="production" ? "UEMCSPI${upper(var.application_acronym)}1${upper(var.vm_environment)}${count.index + 1}_OSDisk" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}${count.index+1}${upper(var.environment_acronym)}_OSDisk"     
    caching                        = "ReadWrite"
    create_option                  = "FromImage"
    managed_disk_type              = "Standard_LRS"
  }

  storage_data_disk {
    name                           = var.environment=="production" ? "UEMCSPI${upper(var.application_acronym)}1${upper(var.vm_environment)}${count.index + 1}_DataDisk_1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}${count.index+1}${upper(var.environment_acronym)}_DataDisk_1"     
    managed_disk_type              = "Standard_LRS"
    create_option                  = "Empty"
    lun                            = 0
    disk_size_gb                   = "200"
  }

  storage_data_disk {
    name                           = var.environment=="production" ? "UEMCSPI${upper(var.application_acronym)}1${upper(var.vm_environment)}${count.index + 1}_DataDisk_2" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}${count.index+1}${upper(var.environment_acronym)}_DataDisk_2"     
    managed_disk_type              = "Standard_LRS"
    create_option                  = "Empty"
    lun                            = 1
    disk_size_gb                   = "200"
  }

  os_profile {
    computer_name                  = var.environment=="production" ? "UEMCSPI${upper(var.application_acronym)}1${upper(var.vm_environment)}${count.index + 1}" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}${count.index+1}${upper(var.environment_acronym)}"
    admin_username                 = var.environment=="production" ? "spifpi1${var.vm_environment}${count.index + 1}admin" : "VM${var.location_acronym}${var.application_acronym}${var.vm_workload_desc}${count.index+1}${var.environment_acronym}ADMIN"
    admin_password                 = var.admin_password
  }

  os_profile_windows_config {
    provision_vm_agent             = true
  }

  boot_diagnostics {
    enabled                        = "true"
    storage_uri                    = module.vmdiagnosticslogssa.primary_blob_endpoint
  }

  identity {
    type                           = "SystemAssigned"
  }
  
}