locals {
  panoramavm_name = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "UEMCPANORAMAP1" : "VMW${upper(var.location_acronym)}PANO1${upper(var.environment_acronym)}"
}

resource "azurerm_network_interface" "panoramanic" {
  count = var.environment == "production" ? 1 : 0

  name                = "${local.panoramavm_name}-nic"
  resource_group_name = azurerm_resource_group.panorama.name
  location            = azurerm_resource_group.panorama.location
  # network_security_group_id = azurerm_network_security_group.panoramansg.id

  ip_configuration {
    name                          = "${local.panoramavm_name}-config"
    subnet_id                     = azurerm_subnet.secmgmt.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.panorama_nic_private_ip_address
    public_ip_address_id          = azurerm_public_ip.panoramapip[0].id
  }

  tags = var.tags_Networking
}

resource "azurerm_virtual_machine" "panoramavm" {
  count = var.environment == "production" ? 1 : 0

  name                             = local.panoramavm_name
  resource_group_name              = azurerm_resource_group.panorama.name
  location                         = azurerm_resource_group.panorama.location
  network_interface_ids            = [azurerm_network_interface.panoramanic[count.index].id]
  vm_size                          = "Standard_D16_v3"
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  plan {
    name      = "byol"
    product   = "panorama"
    publisher = "paloaltonetworks"
  }

  storage_image_reference {
    publisher = "paloaltonetworks"
    offer     = "panorama"
    sku       = "byol"
    version   = "8.1.0"
  }

  storage_os_disk {
    name              = "${local.panoramavm_name}_OSDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_data_disk {
    name              = "${local.panoramavm_name}_DataDisk_1"
    managed_disk_type = "Standard_LRS"
    create_option     = "Empty"
    lun               = 0
    disk_size_gb      = "200"
  }

  os_profile {
    computer_name  = local.panoramavm_name
    admin_username = "uemcpanoramaadmin"
    admin_password = var.common_virtual_machine_password
  }

  os_profile_linux_config {
    disable_password_authentication = false #tfsec:ignore:AZU005
  }

  boot_diagnostics {
    enabled     = "true"
    storage_uri = azurerm_storage_account.vmdiagnosticslogs.primary_blob_endpoint
  }

  tags = merge(var.tags_Networking, { "SecAgentExclusion" = "Virtual Appliance" })

  lifecycle {
    prevent_destroy = false
  }
}
