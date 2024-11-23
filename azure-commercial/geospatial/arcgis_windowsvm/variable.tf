variable "resource_group_name" {
  type = string
}

variable "application_acronym" {
  type = string
}

variable "count_value" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "enable_accelerated_networking" {
  type    = bool
  default = false
}

variable "tags" {
  type = map(string)
}

variable "subnet_id" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "vm_name_suffix" {
  type    = string
  default = ""
}

variable "availability_set_id" {
  type = string
}

variable "azurerm_image_id" {
  type = string
}

variable "data_disk_size" {
  type = number
}

variable "admin_username" {
  type    = string
  default = "vmadmin01"
}

variable "admin_password" {
  type    = string
  sensitive = true
}

variable "storage_uri" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "storage_account_key" {
  type = string
}

variable "template_file" {
  type = string
}

variable "template_file_xml" {
  type = string
}

variable "loganalytics_workspace_id" {
  type = string
}

variable "loganalytics_workspace_key" {
  type = string
}

variable "backup_resource_group_name" {
  type    = string
  default = ""
}

variable "recovery_vault_name" {
  type    = string
  default = ""
}

variable "backup_policy_id" {
  type    = string
  default = ""
}

variable "custom_emails" {
  type    = string
  default = ""
}

variable "domain_user_name" {
  type    = string
  default = ""
}

variable "domain_user_password" {
  type    = string
  sensitive = true
}

variable "domain_name" {
  type    = string
  default = ""
}

variable "ou_path" {
  type    = string
  default = ""
}

variable "encryptappsp_key_password" {
  type    = string
  sensitive = true
}

variable "client_id" {
  type = string
}

variable "diskencryption_keyvault" {
  type = string
}

variable "application_environment_os" {
  type    = string
  default = ""
}

variable "prefix" {
  type    = string
  default = "UEMC"
}

variable "publisher" {
  type    = string
  default = "MicrosoftWindowsServer"
}

variable "offer" {
  type    = string
  default = "WindowsServer"
}

variable "sku" {
  type    = string
  default = "2016-Datacenter"
}

variable "vmimageversion" {
  type    = string
  default = "latest"
}

variable "enforce_vm_naming_convention" {
  type    = bool
  default = true
}

variable "computer_name" {
  type    = string
  default = ""
}

variable "vm_region" {
  type    = string
  default = "EUS"
}

variable "project_name" {
  type = string
}

variable "vm_workload_desc" {
  default = "BLD"
}

variable "vm_environment" {
  type = string
}

variable "os_disk_override" {
  type = map(string)
  default = {
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
}

variable "data_disk_1_override" {
  default = null

  type = object(
    {
      create_option     = string
      managed_disk_type = string
      disk_size_gb      = string
    }
  )
}

variable "data_disk_2_override" {
  default = null

  type = object(
    {
      create_option     = string
      managed_disk_type = string
      disk_size_gb      = string
    }
  )
}

variable "data_disk_3_override" {
  default = null

  type = object(
    {
      create_option     = string
      managed_disk_type = string
      disk_size_gb      = string
    }
  )
}

variable "data_disk_4_override" {
  default = null

  type = object(
    {
      create_option     = string
      managed_disk_type = string
      disk_size_gb      = string
    }
  )
}

variable "data_disk_5_override" {
  default = null

  type = object(
    {
      create_option     = string
      managed_disk_type = string
      disk_size_gb      = string
    }
  )
}

variable "virtual_machine_name" {
  type    = string
  default = ""
}

variable "network_interface_card_name" {
  type    = string
  default = ""
}

variable "ip_configuration_name" {
  type    = string
  default = ""
}

variable "storage_os_disk" {
  type    = string
  default = ""
}

variable "storage_data_disk_1" {
  type    = string
  default = ""
}

variable "storage_data_disk_2" {
  type    = string
  default = ""
}

variable "storage_data_disk_3" {
  type    = string
  default = ""
}

variable "storage_data_disk_4" {
  type    = string
  default = ""
}

variable "storage_data_disk_5" {
  type    = string
  default = ""
}

variable "auto_upgrade_minor_version" {
  type    = bool
  default = false
}

variable "user_assigned_identity" {
  default = null

  type = object(
    {
      type         = string
      identity_ids = list(string)
    }
  )
}

variable "os_type_letter" {
  type    = string
  default = ""
}


/*
Below may be refered in future
variable "system_assigned_identity" {
  default = null

  type = object(
    {
    type = string    
  }
  )
}

*/
