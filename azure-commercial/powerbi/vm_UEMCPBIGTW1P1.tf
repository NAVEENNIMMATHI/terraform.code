resource "azurerm_network_interface" "UEMCPBIGTW1P1" {
  name                =  var.environment == "production" ? "UEMC${upper(var.application_acronym)}GTW1${upper(var.environment_acronym)}1-nic" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}GTW1${upper(var.environment_acronym)}-nic"
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  ip_configuration {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}GTW1${upper(var.environment_acronym)}1-config" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}GTW1${upper(var.environment_acronym)}-config"
    subnet_id                     = data.terraform_remote_state.spi.outputs.powerbi_subnet_id
    private_ip_address_allocation = "dynamic"
  }

  tags                = var.tags

}

resource "azurerm_virtual_machine" "UEMCPBIGTW1P1" {
  name                =  var.environment == "production" ? "UEMC${upper(var.application_acronym)}GTW1${upper(var.environment_acronym)}1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}GTW1${upper(var.environment_acronym)}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
  # force an interpolation expression to be interpreted as a list by wrapping it
  # in an extra set of list brackets. That form was supported for compatibility in
  # v0.11, but is no longer supported in Terraform v0.12.
  #
  # If the expression in the following list itself returns a list, remove the
  # brackets to avoid interpretation as a list of lists. If the expression
  # returns a single list item then leave it as-is and remove this TODO comment.
  # count                            = length(azurerm_network_interface.UEMCPBIGTW1P1.*.id)
  # network_interface_ids            = [element(azurerm_network_interface.UEMCPBIGTW1P1.*.id, count.index)]
  network_interface_ids            = [azurerm_network_interface.UEMCPBIGTW1P1.id]
  vm_size                          = var.UEMCPBIGTW1P1_vm_size
  availability_set_id              = module.availabilityset.availability_set_id
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  #license_type          = "Windows_Server"
  tags                             = var.tags

  lifecycle {
    prevent_destroy    = false
  }

  storage_image_reference {
    id                 = var.environment == "production" ? var.vm_image_id : ""
    publisher          = var.environment == "production" ? "" : "MicrosoftWindowsServer"
    offer              = var.environment == "production" ? "" : "WindowsServer"
    sku                = var.environment == "production" ? "" : "2016-Datacenter"
    version            = var.environment == "production" ? "" : "latest"
  }

  storage_os_disk {
    name               =  var.environment == "production" ? "UEMC${upper(var.application_acronym)}GTW1${upper(var.environment_acronym)}1_OSDisk" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}GTW1${upper(var.environment_acronym)}_OSDisk"
    caching            = "ReadWrite"
    create_option      = "FromImage"
    managed_disk_type  = "Standard_LRS"
  }
  storage_data_disk {
    name               =  var.environment == "production" ? "UEMC${upper(var.application_acronym)}GTW1${upper(var.environment_acronym)}1_DataDisk_1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}GTW1${upper(var.environment_acronym)}_DataDisk_1"
    managed_disk_type  = "Standard_LRS"
    create_option      = var.environment == "production" ? "Empty" : "Empty"
    lun                = 0
    disk_size_gb       = "200"
  }

  storage_data_disk {
    name               =  var.environment == "production" ? "UEMC${upper(var.application_acronym)}GTW1${upper(var.environment_acronym)}1_DataDisk_2" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}GTW1${upper(var.environment_acronym)}_DataDisk_2"
    managed_disk_type  = "Standard_LRS"
    create_option      = var.environment == "production" ? "Empty" : "Empty"
    lun                = 1
    disk_size_gb       = "200"
  }

  os_profile {
    computer_name      = var.environment == "production" ? "UEMC${upper(var.application_acronym)}GTW1${upper(var.environment_acronym)}1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}GTW1${upper(var.environment_acronym)}"
    admin_username     = var.environment == "production" ? "pbigtw1p1admin" : "pbigtw1${lower(var.environment_acronym)}admin"
    admin_password     = var.vmpassword
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  boot_diagnostics {
    enabled            = "true"
    storage_uri        = data.terraform_remote_state.spi.outputs.vm_storage_uri
  }
}

