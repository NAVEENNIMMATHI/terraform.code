resource "azurerm_network_interface" "rstudio_gurobi_nic" {
  name                          = var.environment == "production" ? "UEMCRSTUDGRB1P1-nic" : lower("nic-${var.location_acronym}-${var.application_acronym}-${var.rstudio_gurobivm_name_prefix1}-${var.environment_acronym}")
  resource_group_name           = module.applicationrg.resource_group_name
  location                      = module.applicationrg.resource_group_location
  count                         = var.rstudio_gurobivm_count
  enable_accelerated_networking = true

  ip_configuration {
    name                          = var.environment == "production" ? "UEMCRSTUDGRB1P1-config" : upper("VML${var.location_acronym}${var.application_acronym}${var.rstudio_gurobivm_name_prefix1}${var.environment_acronym}-config")
    subnet_id                     = module.gurobi_subnet.subnet_id
    private_ip_address_allocation = "dynamic"
  }
  tags = var.tags
}

resource "azurerm_virtual_machine" "rstudiogurobivminstance" {
  name                             = var.environment == "production" ? "UEMCRSTUDGRB1P1" : upper("VML${var.location_acronym}${var.application_acronym}${var.rstudio_gurobivm_name_prefix1}${var.environment_acronym}")
  location                         = module.applicationrg.resource_group_location
  resource_group_name              = module.applicationrg.resource_group_name
  network_interface_ids            = ["${element(azurerm_network_interface.rstudio_gurobi_nic.*.id, count.index)}"]
  vm_size                          = var.rstudio_gurobivm_size
  count                            = var.rstudio_gurobivm_count
  availability_set_id              = module.availabilityset_gurobi.availability_set_id
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true
  tags                             = var.tags

  lifecycle {
    prevent_destroy = false
    ignore_changes = [
      delete_os_disk_on_termination,
      delete_data_disks_on_termination
    ]
  }

  storage_image_reference {
    id        = var.target_deployment_environment == "prod" ? var.vm_linux_image_id : ""
    publisher = var.target_deployment_environment == "prod" ? "" : "RedHat"
    offer     = var.target_deployment_environment == "prod" ? "" : "RHEL"
    sku       = var.target_deployment_environment == "prod" ? "" : "7.5"
    version   = var.target_deployment_environment == "prod" ? "" : "latest"
  }

  storage_os_disk {
    name              = var.environment == "production" ? "UEMCRSTUDGRB1P1_OSDisk" : "${upper("VML${var.location_acronym}${var.application_acronym}${var.rstudio_gurobivm_name_prefix1}${var.environment_acronym}")}_OSDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_data_disk {
    name              = var.environment == "production" ? "UEMCRSTUDGRB1P1_DataDisk_1" : "${upper("VML${var.location_acronym}${var.application_acronym}${var.rstudio_gurobivm_name_prefix1}${var.environment_acronym}")}_DataDisk_1"
    managed_disk_type = "Premium_LRS"
    create_option     = var.target_deployment_environment == "prod" ? "Attach" : "Empty"
    lun               = 0
    disk_size_gb      = "512"
  }
  storage_data_disk {
    name              = var.environment == "production" ? "UEMCRSTUDGRB1P1_LogDisk_1" : "${upper("VML${var.location_acronym}${var.application_acronym}${var.rstudio_gurobivm_name_prefix1}${var.environment_acronym}")}_LogDisk_1"
    managed_disk_type = "Premium_LRS"
    create_option     = var.target_deployment_environment == "prod" ? "Attach" : "Empty"
    lun               = 1
    disk_size_gb      = "128"
  }

  os_profile {
    computer_name  = var.environment == "production" ? "UEMCRSTUDGRB1P1" : upper("VML${var.location_acronym}${var.application_acronym}${var.rstudio_gurobivm_name_prefix1}${var.environment_acronym}")
    admin_username = var.rstudio_gurobivm_adminname
    admin_password = var.rstudio_gurobivm_admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

  boot_diagnostics {
    enabled     = "true"
    storage_uri = var.environment == "production" ? "https://coprstudiovmlog01sa.blob.core.windows.net/" : module.vmdiagnosticslogs.primary_blob_endpoint
  }
}

#####################################################
####### Latest VMs to replace legacy VMs ############
#####################################################

resource "azurerm_network_interface" "rstudio_gurobi2_nic" {  
  name                          = lower("nic-${var.location_acronym}-${var.application_acronym}-GU2-${var.environment_acronym}")
  resource_group_name           = module.applicationrg.resource_group_name
  location                      = module.applicationrg.resource_group_location  
  enable_accelerated_networking = true

  ip_configuration {
    name                          = upper("VML${var.location_acronym}${var.application_acronym}GU2${var.environment_acronym}-config")
    subnet_id                     = module.gurobi_subnet.subnet_id
    private_ip_address_allocation = "dynamic"
  }
  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "rstudiogurobi2vminstance" {
  depends_on            = [module.availabilityset_gurobi]
  availability_set_id   = module.availabilityset_gurobi.availability_set_id
  name                  = upper("VML${var.location_acronym}${var.application_acronym}GU2${var.environment_acronym}")
  location              = module.applicationrg.resource_group_location
  resource_group_name   = module.applicationrg.resource_group_name
  network_interface_ids = [ azurerm_network_interface.rstudio_gurobi2_nic.id ]
  size                  = var.rstudio_gurobivm_size

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    name                  = "${upper("VML${var.location_acronym}${var.application_acronym}GU2${var.environment_acronym}")}_osDisk"
    caching               = "ReadWrite"
    storage_account_type  = "Premium_LRS"
    disk_size_gb          = 256
  }

  source_image_reference {    
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "8.2"
    version   = "latest"
  }

  admin_username  = "azureuser"
  admin_password  = var.rstudio_gurobivm_admin_password
  computer_name   = upper("VML${var.location_acronym}${var.application_acronym}GU2${var.environment_acronym}")
  
  disable_password_authentication = false
  
  boot_diagnostics {
    storage_account_uri = module.vmdiagnosticslogs.primary_blob_endpoint
  }

  tags = var.tags
}

resource "azurerm_managed_disk" "managed_disk_rstudiogurobi2vminstance_data_1" {
  depends_on           = [azurerm_linux_virtual_machine.rstudiogurobi2vminstance]
  name                 = "${upper("VML${var.location_acronym}${var.application_acronym}GU2${var.environment_acronym}")}_DataDisk_1"
  location             = module.applicationrg.resource_group_location
  resource_group_name  = module.applicationrg.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = 512
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "managed_disk_rstudiogurobi2vminstance_data_1" {
  depends_on         = [azurerm_managed_disk.managed_disk_rstudiogurobi2vminstance_data_1]
  managed_disk_id    = azurerm_managed_disk.managed_disk_rstudiogurobi2vminstance_data_1.id
  virtual_machine_id = azurerm_linux_virtual_machine.rstudiogurobi2vminstance.id
  lun                = 0
  caching            = "ReadWrite"
}

resource "azurerm_managed_disk" "managed_disk_rstudiogurobi2vminstance_log_1" {
  depends_on           = [azurerm_linux_virtual_machine.rstudiogurobi2vminstance]
  name                 = "${upper("VML${var.location_acronym}${var.application_acronym}GU2${var.environment_acronym}")}_LogDisk_1"
  location             = module.applicationrg.resource_group_location
  resource_group_name  = module.applicationrg.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = 128
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "managed_disk_rstudiogurobi2vminstance_log_1" {
  depends_on         = [azurerm_managed_disk.managed_disk_rstudiogurobi2vminstance_log_1]
  managed_disk_id    = azurerm_managed_disk.managed_disk_rstudiogurobi2vminstance_log_1.id
  virtual_machine_id = azurerm_linux_virtual_machine.rstudiogurobi2vminstance.id
  lun                = 1
  caching            = "ReadWrite"
}

resource "azurerm_virtual_machine_extension" "dependency_agent_linux_gurobi" {
  depends_on                    = [azurerm_linux_virtual_machine.rstudiogurobi2vminstance]
  name                          = "DependencyAgentLinux"
  virtual_machine_id            = azurerm_linux_virtual_machine.rstudiogurobi2vminstance.id
  publisher                     = "Microsoft.Azure.Monitoring.DependencyAgent"
  type                          = "DependencyAgentLinux"
  type_handler_version          = "9.10"
  auto_upgrade_minor_version    = "true"
  tags                          = var.tags
}

resource "azurerm_virtual_machine_extension" "oms_agent_for_linux_gurobi" {
  depends_on = [azurerm_virtual_machine_extension.dependency_agent_linux_gurobi]  
  name                          = "OmsAgentForLinux"
  virtual_machine_id            = azurerm_linux_virtual_machine.rstudiogurobi2vminstance.id
  publisher                     = "Microsoft.EnterpriseCloud.Monitoring"
  type                          = "OmsAgentForLinux"
  type_handler_version          = "1.0"
  auto_upgrade_minor_version    = "true"
  tags                          = var.tags
  settings = <<BASE_SETTINGS
  {
    "workspaceId" : "${var.log_analytics_workspace_id}"
  }
  BASE_SETTINGS
  protected_settings = <<PROTECTED_SETTINGS
  {
    "workspaceKey" : "${var.log_analytics_workspace_key}"
  }
  PROTECTED_SETTINGS
}

#resource "azurerm_virtual_machine_extension" "datadog_agent_for_linux_gurobi" {
#  depends_on = [azurerm_virtual_machine_extension.oms_agent_for_linux_gurobi]
#  
#  name                          = "DatadogAgent"
#  virtual_machine_id            = azurerm_linux_virtual_machine.rstudiogurobi2vminstance.id
#  publisher                     = "Datadog.Agent"
#  type                          = "DatadogLinuxAgent"
#  type_handler_version          = "1.1"
#  auto_upgrade_minor_version    = "true"
#
#  settings = <<SETTINGS
#        {
#          "site": "${var.datadog_site}"
#        }
#    
#SETTINGS
#
#  protected_settings = <<PROTECTED_SETTINGS
#  {
#    "api_key": "${var.datadog_api_key}"
#  }
#  PROTECTED_SETTINGS
#
#}

resource "null_resource" "gurobi_create_working_dir" {
  depends_on = [azurerm_virtual_machine_extension.oms_agent_for_linux_gurobi]
  triggers  = {
    forced_iteration = uuid()
  }

  connection {
    type     = "ssh"
    user     = "azureuser"
    #private_key = data.azurerm_key_vault_secret.rstu_private_key.value
    password = var.rstudio_gurobivm_admin_password
    host     = azurerm_network_interface.rstudio_gurobi2_nic.private_ip_address
    port     = 22
    timeout  = "10m"
  }

  provisioner "remote-exec" {
    inline = [
      "if [ -d $HOME/provisioner ]; then rm -Rf $HOME/provisioner; fi",
      "mkdir $HOME/provisioner",
    ]
  }
  
}

resource "null_resource" "gurobi_copy_scripts_dir" {
  depends_on = [null_resource.gurobi_create_working_dir]
  triggers  = {
    forced_iteration = uuid()
  }

  connection {
    type     = "ssh"
    user     = "azureuser"
    #private_key = data.azurerm_key_vault_secret.rstu_private_key.value
    password = var.rstudio_gurobivm_admin_password
    host     = azurerm_network_interface.rstudio_gurobi2_nic.private_ip_address
    port     = 22
    timeout  = "10m"
  }

  provisioner "file" {
    source      = "./vm_scripts/"
    destination = "$HOME/provisioner/"
  }
}

resource "null_resource" "gurobi_configure_vm_disk" {
  depends_on = [null_resource.gurobi_copy_scripts_dir]
  triggers  = {
    forced_iteration = uuid()
  }

  connection {
    type     = "ssh"
    user     = "azureuser"
    #private_key = data.azurerm_key_vault_secret.rstu_private_key.value
    password = var.rstudio_gurobivm_admin_password
    host     = azurerm_network_interface.rstudio_gurobi2_nic.private_ip_address
    port     = 22
    timeout  = "60m"
  }

  provisioner "remote-exec" {
    inline = [
      "workingDir=\"$HOME/provisioner\"",
      "logFilePath=\"$workingDir/provisioner_disk.log\"",
      "provisionerLogPrefix=\"${var.provisioner_log_prefix}\"",
      "sudoPassword=\"${var.rstudio_gurobivm_admin_password}\"",

      "chmod +x $workingDir/*sh",

      "echo 'Truncate Log.. \n' > $logFilePath",

      "echo \"$provisionerLogPrefix Provisioner Starting \" >> $logFilePath",

      "echo \"$provisionerLogPrefix Provisioner 'Convert files to unix' Started \" >> $logFilePath",
      "echo \"$sudoPassword\" | sudo -S yum -y install dos2unix",
      "echo \"$sudoPassword\" | sudo -S find $workingDir -type f -print0 | xargs -0 dos2unix",
      "echo \"$provisionerLogPrefix Provisioner 'Convert files to unix' Complete \" >> $logFilePath",

    #  "echo \"$provisionerLogPrefix Provisioner 'vm_common_disk_config.sh' Starting \" >> $logFilePath",
    #  "echo \"$sudoPassword\" | sudo -S $workingDir/vm_common_disk_config.sh \"$logFilePath\"",
    #  "echo \"$provisionerLogPrefix Provisioner 'vm_common_disk_config.sh' Complete \" >> $logFilePath",

      "echo \"$provisionerLogPrefix Running sudo lvextend -r -L 10G /dev/mapper/rootvg-rootlv Starting \" >> $logFilePath",
      "echo \"$sudoPassword\" | sudo -S lvextend -r -L 10G /dev/mapper/rootvg-rootlv",
      "echo \"$provisionerLogPrefix Provisioner sudo lvextend -r -L 10G /dev/mapper/rootvg-rootlv Complete \" >> $logFilePath",

      "echo \"$provisionerLogPrefix Running sudo lvextend -r -L 10G /dev/mapper/rootvg-homelv Starting \" >> $logFilePath",
      "echo \"$sudoPassword\" | sudo -S lvextend -r -L 10G /dev/mapper/rootvg-homelv",
      "echo \"$provisionerLogPrefix Provisioner sudo lvextend -r -L 10G /dev/mapper/rootvg-homelv Complete \" >> $logFilePath",

      "echo \"$provisionerLogPrefix Provisioner Complete \" >> $logFilePath",
      "cat $logFilePath",
    ]
  }
}

resource "null_resource" "gurobi_configure_vm" {
  depends_on = [null_resource.gurobi_configure_vm_disk]
  triggers  = {
    forced_iteration = uuid()
  }

  connection {
    type     = "ssh"
    user     = "azureuser"
    #private_key = data.azurerm_key_vault_secret.rstu_private_key.value
    password = var.rstudio_gurobivm_admin_password
    host     = azurerm_network_interface.rstudio_gurobi2_nic.private_ip_address
    port     = 22
    timeout  = "60m"
  }

  provisioner "remote-exec" {
    inline = [
      "workingDir=\"$HOME/provisioner\"",
      "logFilePath=\"$workingDir/provisioner.log\"",
      "provisionerLogPrefix=\"${var.provisioner_log_prefix}\"",
      "sudoPassword=\"${var.rstudio_gurobivm_admin_password}\"",

      "vm_name=\"${azurerm_linux_virtual_machine.rstudiogurobi2vminstance.computer_name}\"",
      "domain_name=\"${var.aad_domains[var.environment]}\"",
      "domain_join_username=\"${var.aad_domain_join_usernames[var.environment]}\"",
      "domain_join_password=\"${var.domainjoinpassword}\"",
      "aad_ou_domain_name=\"${var.aad_ou_domain_names[var.environment]}\"",

      "rconnect_ip=\"${azurerm_linux_virtual_machine.rstudioconnect2vminstance.private_ip_address}\"",
      "rpro_ip=\"${azurerm_linux_virtual_machine.rstudioserverpro2vminstance.private_ip_address}\"",
      "rpm_ip=\"${azurerm_linux_virtual_machine.rstudiorpm2vminstance.private_ip_address}\"",

      "artifactory_ip=\"${data.azurerm_public_ip.core_aks.ip_address}\"",
      "artifactory_url=\"${var.artifactory_url}\"",
      "qualys_agent=\"${var.qualys_agent}\"",

      "gurobi_license_file=\"${var.gurobi_license_file}\"",
      "mongodb_user=\"${var.mongodb_user}\"",
      "mongodb_user_password=\"${var.mongodb_user_password}\"",
      "gurobi_manager_server=\"gurobi.${var.fulcrum_domain_url}\"",
      "host_name=\"$vm_name.$domain_name\"",

      "rstudio_gurobi_package=\"${var.rstudio_gurobi_package}\"",
      "rstudio_workbench_rhel_package=\"${var.rstudio_workbench_rhel_package}\"",
      "pandoc_package=\"${var.pandoc_package}\"",
      "fulcrum_domain_url=\"${var.fulcrum_domain_url}\"",

      "chmod +x $workingDir/*sh",

      "echo 'Truncate Log.. \n' > $logFilePath",

      "echo \"$provisionerLogPrefix Provisioner Starting \" >> $logFilePath",

      "echo \"$provisionerLogPrefix Provisioner 'Convert files to unix' Started \" >> $logFilePath",
      "echo \"$sudoPassword\" | sudo -S yum -y install dos2unix",
      "echo \"$sudoPassword\" | sudo -S find $workingDir -type f -print0 | xargs -0 dos2unix",
      "echo \"$provisionerLogPrefix Provisioner 'Convert files to unix' Complete \" >> $logFilePath",

      "echo \"$provisionerLogPrefix Provisioner 'vm_common_artifactory.sh' Starting \" >> $logFilePath",
      "echo \"$sudoPassword\" | sudo -S $workingDir/vm_common_artifactory.sh \"$logFilePath\" \"$artifactory_ip\" \"$artifactory_url\"",
      "echo \"$provisionerLogPrefix Provisioner 'vm_common_artifactory.sh' Complete \" >> $logFilePath",

      "echo \"vm_name=$vm_name\" >> $logFilePath",
      "echo \"domain_name=$domain_name\" >> $logFilePath",
      "echo \"domain_join_username=$domain_join_username\" >> $logFilePath",

      "echo \"$provisionerLogPrefix Provisioner 'vm_common_join_domain.sh' Starting \" >> $logFilePath",
      "echo \"$sudoPassword\" | sudo -S $workingDir/vm_common_join_domain.sh \"$logFilePath\" \"$vm_name\" \"$domain_name\" \"$domain_join_username\" \"$domain_join_password\" \"$aad_ou_domain_name\"",
      "echo \"$provisionerLogPrefix Provisioner 'vm_common_join_domain.sh' Complete \" >> $logFilePath",

      "echo \"rstudio_gurobi_package=$rstudio_gurobi_package\" >> $logFilePath",
      "echo \"gurobi_license_file=$gurobi_license_file\" >> $logFilePath",
      "echo \"gurobi_manager_server=$gurobi_manager_server\" >> $logFilePath",

      "echo \"$provisionerLogPrefix Provisioner 'vm_gurobi_softwares.sh' Starting \" >> $logFilePath",
      "echo \"$sudoPassword\" | sudo -S $workingDir/vm_gurobi_softwares.sh \"$logFilePath\" \"$rstudio_gurobi_package\" \"$artifactory_url\" \"$gurobi_license_file\" \"$gurobi_manager_server\" \"$host_name\"",
      "echo \"$provisionerLogPrefix Provisioner 'vm_gurobi_softwares.sh' Complete \" >> $logFilePath",

      #"echo \"$provisionerLogPrefix Provisioner 'vm_gurobi_datadog_config.sh' Starting \" >> $logFilePath",
      #"echo \"$sudoPassword\" | sudo -S $workingDir/vm_gurobi_datadog_config.sh \"$logFilePath\"",
      #"echo \"$provisionerLogPrefix Provisioner 'vm_gurobi_datadog_config.sh' Complete \" >> $logFilePath",

      "echo \"$provisionerLogPrefix Provisioner Complete \" >> $logFilePath",
      "cat $logFilePath",
    ]
  }
}