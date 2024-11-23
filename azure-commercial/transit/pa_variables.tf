variable "paloapplicationnametagvalue" {
   default    = "Palo"
}

variable "ilb_frontend_private_ip_address" {
   default     = "10.30.16.100"
}

variable "ilbrule_name" {
   default     = "LB-Egress-All"
}
variable "elb_frontend_ip_configuration_name" {
   default     = "LB-Public-FrontEnd-Cyberark"
}

variable "elbrule_name" {
   default     = "LB-Public-HTTP"
}




variable "palo1_trust_nic_private_ip_address" {
   default     = "10.30.16.68"
}

variable "palo1_untrust_nic_private_ip_address" {
   default     = "10.30.17.4"
}

variable "palo1_management_nic_private_ip_address" {
   default     = "10.30.16.4"
}


variable "palo2_trust_nic_private_ip_address" {
   default     = "10.30.16.69"
}

variable "palo2_untrust_nic_private_ip_address" {
   default     = "10.30.17.5"
}

variable "palo2_management_nic_private_ip_address" {
   default     = "10.30.16.5"
}


variable "palo_vm_size" {
   default     = "Standard_D4_v2"
}

variable "palolicensetype" {
   default     = "byol"
}

variable "palovm_data_disk_size_gb" {
   default     = "200"
}

variable "palovm_password" {
   default     = "rH_s22an"
}
variable "palo1_vm_name" {
   default     = "UEMCPALO01P1"
}

variable "palo2_vm_name" {
   default     = "UEMCPALO02P1"
}

variable "unique_id" {
   default     = "kpmgprod"
}
