resource "azurerm_network_interface" "UEMCDATAFACTNIC" {
  count = var.df_vm_count

  name                =var.environment == "production" ?   "UEMCDATAFACTORYP${count.index + 1}-nic" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}ADF${count.index + 1}${upper(var.environment_acronym)}-nic"
  resource_group_name = azurerm_resource_group.cospidatafactoryrg.name
  location            = var.location

  ip_configuration {
    name                          =var.environment == "production" ?   "UEMCDATAFACTORYP${count.index + 1}-config" :"VMW${upper(var.location_acronym)}${upper(var.application_acronym)}ADF${count.index + 1}${upper(var.environment_acronym)}-config"
    subnet_id                     = var.datafactorysubnet
    private_ip_address_allocation = "dynamic"
  }

  tags = var.environment ==  "production" ? var.tags_vm : var.tags
}

resource "azurerm_windows_virtual_machine" "virtual_machine_df" {
  count = var.df_vm_count
  name                             = var.environment == "production" ? "UEMCDATAFACTP${count.index + 1}" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}ADF${count.index + 1}${upper(var.environment_acronym)}"
  computer_name                    = var.environment == "production" ? "UEMCDATAFACTP${count.index + 1}" : "VMW${upper(var.application_acronym)}ADF${count.index + 1}${upper(var.environment_acronym)}"
  location                         = var.location
  resource_group_name              = upper(azurerm_resource_group.cospidatafactoryrg.name)
  network_interface_ids            = [element(azurerm_network_interface.UEMCDATAFACTNIC.*.id, count.index)]
  size                             = var.UEMCDATAFACTORYVM_vm_size
  availability_set_id              = azurerm_availability_set.aset_df.id
  admin_username                   = "UEMCDATA${count.index + 1}ADMIN"
  admin_password                   = var.admin_password
  
  boot_diagnostics {

        storage_account_uri    = azurerm_storage_account.diagnosticslogssa.primary_blob_endpoint 
  }      

  license_type                     = "Windows_Server"   
  provision_vm_agent               = true   
  source_image_id                  = var.environment == "production" ? var.df_vm_image_id : null
  dynamic "source_image_reference" {
    for_each = var.environment == "production" ? [] : [var.environment]
    content {
    publisher = var.environment_acronym == "dev" ? "MicrosoftWindowsServer": null
    offer     = var.environment_acronym == "dev" ? "WindowsServer" : null
    sku       = var.environment_acronym == "dev" ? "2016-Datacenter" : null
    version   = var.environment_acronym == "dev" ? "latest" : null
     }
  }
  patch_mode                       = "Manual"
  enable_automatic_updates         = false

  os_disk {
    name              = var.environment == "production" ? "UEMCDATAFACTORYP${count.index + 1}_OSDisk" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}DF${count.index + 1}${upper(var.environment_acronym)}_OSDisk"
    caching           = "ReadWrite"
    disk_size_gb      =  127
    storage_account_type = var.df_machine_disk_type
  }


  lifecycle {
       prevent_destroy = false
  }

  tags = var.environment ==  "production" ? var.tags_vm : var.tags
}

resource "azurerm_managed_disk" "data_disk_df" {
  count =   var.df_vm_count == 0 ? 0 : var.df_vm_count * var.data_disk_count
   
  name              =  var.environment == "production" ? "UEMCDATAFACTORYP${ceil( (count.index+1) / 2)}_DataDisk_${(count.index % var.data_disk_count)+1}" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}DF${upper(var.environment_acronym)}${count.index + 1}DataDisk1"
  resource_group_name   = azurerm_resource_group.cospidatafactoryrg.name
  location              = var.location
  storage_account_type  = "Standard_LRS"
  create_option         = "Empty"
  #disk_size_gb          = element(var.df_machine_disk_size,count.index % var.data_disk_count)
  disk_size_gb          = 200

  tags = var.environment ==  "production" ? var.tags_vm : var.tags
  }

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attach_df" {
  count = var.df_vm_count == 0 ? 0 : var.df_vm_count * var.data_disk_count

  virtual_machine_id  = element(azurerm_windows_virtual_machine.virtual_machine_df.*.id, ceil((count.index + 1) * 1.0 / var.data_disk_count) - 1)
  managed_disk_id     = element(azurerm_managed_disk.data_disk_df.*.id, count.index)
  lun                 = count.index % var.data_disk_count
  caching             = "None"
  create_option       = var.environment ==  "production" ? "Empty" : "Attach"
}
 
