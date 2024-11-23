variable "app_location" {}
variable "kpmg_nat_ip_list" {
  type = list(string)
  default = []
}
variable "client_id" {
  default = ""
}

variable "loganalytics_workspace_id" {
  default = ""
}

variable "storage_account_name" {
  default = ""
}
variable "loganalytics_workspace_key" {
  default = ""
}
variable "storage_account_key" {
  default = ""
}
variable "diskencryption_keyvault" {
  default = ""
}

variable "app_rg_name" {}
variable tags {
  type = "map"
}
variable "alteryx_tags"{
  type="map"
}
variable "tableau_tags"{
  type="map"
}

variable "vm_region" {}

variable "project_name" {}

variable "vm_environment" {}

variable "application_acronym" {}

variable "hdinsights_tags"{
  type = "map"
}
variable "hd_insights_str_name" {}

variable "virtual_network_name" {}
variable "address_space" {
  type = list(string)
}

variable "core_subnet_name" {}
variable "insights_subnet_name" {}
variable "core_subnet_address_prefix" {}
variable "insights_subnet_address_prefix" {}
variable "core_nsg_name" {}
variable "insights_nsg_name" {}
variable "vm_avset_name" {}
variable "vm_str_name" {}
variable "private_ip_address_allocation" {}
variable "dls_name" {}
variable "vm_name" {}
variable "vm_size" {}
variable "azurerm_image_id" {}
variable "image_reference_offer" {}
variable "image_reference_publisher" {}
variable "image_reference_sku" {}
variable "image_reference_version" {}
variable "data_disk_size" {}
variable "admin_name" {}
variable "admin_password" {}
variable "df_name" {}
variable "hd_insights_name" {}
variable "container_access_type" {}
variable "gateway_username" {}
variable "gateway_password" {}
variable "head_vm_size" {}
variable "head_username" {}
variable "head_password" {}
variable "worker_vm_size" {}
variable "worker_username" {}
variable "worker_password" {}
variable "zookeeper_vm_size" {}
variable "zookeeper_username" {}
variable "zookeeper_password" {}
variable "bastion_subnet_name" {}
variable "bastion_subnet_address_prefix" {}
variable "bastion_pip_name" {}
variable "bastion_name" {}