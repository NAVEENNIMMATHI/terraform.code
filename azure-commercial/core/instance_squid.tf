resource "azurerm_network_interface" "squid-nic" {
  count = var.squid_vm_count

  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "nic-hub-vm-${var.legacy_env_acronym}-${count.index + 1}" : "nic-use-coresquid-${var.environment_acronym}-${count.index + 1}"
  location            = azurerm_resource_group.hubvnet.location
  resource_group_name = azurerm_resource_group.hubvnet.name
  tags                = var.tags_Networking

  ip_configuration {
    name                          = "ipconfig-nic-hub-vm-${var.legacy_env_acronym}-${count.index + 1}"
    subnet_id                     = azurerm_subnet.squidvmsubnet.id
    private_ip_address_allocation = "Dynamic"
    # load_balancer_backend_address_pools_ids = [azurerm_lb_backend_address_pool.squid-pool.id]
  }
}

resource "azurerm_network_interface_backend_address_pool_association" "squid" {
  count = var.squid_vm_count
  
  network_interface_id    = element(azurerm_network_interface.squid-nic.*.id, count.index)
  ip_configuration_name   = "ipconfig-nic-hub-vm-${var.legacy_env_acronym}-${count.index + 1}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.squid-pool.id
}

resource "azurerm_virtual_machine" "squid-vm" {
  count = var.squid_vm_count

  name                             = "VMLUSESQDPXY${count.index + 1}${upper(var.legacy_env_acronym)}"
  location                         = azurerm_resource_group.hubvnet.location
  resource_group_name              = azurerm_resource_group.hubvnet.name
  network_interface_ids            = [element(azurerm_network_interface.squid-nic.*.id, count.index)]
  vm_size                          = "Standard_DS3_v2"
  availability_set_id              = var.need_zones_squid  == true ? null : module.squidas.availability_set_id 
  zones                            = var.need_zones_squid  == true ? ["${count.index + 1}"] : null
  tags                             = var.tags_Networking
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_os_disk {
    name              = "SQDPXY-OSDisk-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    offer     = "RHEL"
    publisher = "RedHat"
    sku       = "7.8"
    version   = "latest"
  }

  os_profile {
    computer_name  = "VMLUSESQDPXY${count.index + 1}${upper(var.legacy_env_acronym)}"
    admin_username = "adminuser"
    admin_password = var.common_virtual_machine_password
  }

  os_profile_linux_config {
    disable_password_authentication = false #tfsec:ignore:AZU005
  }
}

resource "null_resource" "yum_update" {
  count      = var.squid_vm_count
  depends_on = [azurerm_virtual_machine.squid-vm]

  connection {
    type     = "ssh"
    user     = "adminuser"
    password = var.common_virtual_machine_password
    host     = azurerm_network_interface.squid-nic[count.index].private_ip_address
    port     = 22
    timeout  = "60m"
  }

  provisioner "remote-exec" {
    inline = [
      "echo ${var.common_virtual_machine_password} | sudo yum -y clean all",
      "echo ${var.common_virtual_machine_password} | sudo yum -y update",
    ]

    on_failure = continue
  }
}

resource "null_resource" "squid_config" {
  count      = var.squid_vm_count
  depends_on = [null_resource.yum_update]

  connection {
    type     = "ssh"
    user     = "adminuser"
    password = var.common_virtual_machine_password
    host     = azurerm_network_interface.squid-nic[count.index].private_ip_address
    port     = 22
    timeout  = "20m"
  }

  provisioner "file" {
    source      = "squid_config.sh"
    destination = "/home/adminuser/squid_config.sh"
  }

  provisioner "file" {
    source      = "squid_config.txt"
    destination = "/home/adminuser/squid_config.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "echo ${var.common_virtual_machine_password} | sudo yum -y install dos2unix",
      "echo ${var.common_virtual_machine_password} | sudo dos2unix /home/adminuser/squid_config.sh", # variabilized files gets encoded in DOS/MAC format when run through the pipeline, so we need to convert them back to UNIX format
      "echo ${var.common_virtual_machine_password} | sudo dos2unix /home/adminuser/squid_config.txt",
      "echo ${var.common_virtual_machine_password} | sudo /bin/bash /home/adminuser/squid_config.sh", # we pipe in sudo to execute the bash script, which in turn allows all commands to run using sudo
    ]
  }
}

resource "null_resource" "AzureDiskEncryption_ext_win_vm" {
  count      = var.squid_vm_count
  depends_on = [null_resource.squid_config]

  provisioner "local-exec" {
    command = "az login --service-principal --username ${var.client_id} --password ${var.client_secret} --tenant ${var.tenant_id}"
  }

  provisioner "local-exec" {
    #command= "az vm encryption enable --name ${azurerm_virtual_machine.squid-vm[count.index].name} --resource-group ${azurerm_resource_group.hubvnet.name} --aad-client-id ${var.client_id} --aad-client-secret ${var.client_secret}  --disk-encryption-keyvault ${data.azurerm_key_vault.diskencryptvault.id} --subscription ${data.azurerm_subscription.current.subscription_id} --volume-type all"
    command = "az vm encryption enable --name ${azurerm_virtual_machine.squid-vm[count.index].name} --resource-group ${azurerm_resource_group.hubvnet.name} --disk-encryption-keyvault ${azurerm_key_vault.azure_disk_encryption_kv.id}"
  }
}
