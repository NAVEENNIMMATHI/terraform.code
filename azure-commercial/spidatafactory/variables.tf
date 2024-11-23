variable "subscription_id" {
  type    = string
}
variable "client_id" {
  type    = string
}
variable "client_secret" {
  type    = string
}
variable "tenant_id" {
  type    = string
}

#ResourceGroup
variable  "loganalyticsresourcegroupname" {
   type = string
}

variable "application_acronym" {
  type    = string
}
variable "location_acronym" {
  type    = string
}
variable "environment_acronym" {
  type    = string
}
variable "location" {
  type    = string
}

variable "tags" {
  type = map(string)
}

variable "tags_rg" {
  type = map(string)
}

variable "tags_sto" {
  type = map(string)
}

variable "tags_diag" {
  type = map(string)
}

variable "tags_vm" {
  type = map(string)
  
}


variable "application_datalake" {
  type = string
}                   
variable "application_datafactory" {
  type = string
}    
variable "environment" {
  type = string
}


variable "controlplanesubnet" {
  type = string
} 
variable "databrickssubnet" {
  type = string
}   
variable "datafactorysubnet" {
  type = string
} 
variable "spiappsubnet" {
  type = string
} 
variable "kipadfsubnet" {
  type = string
} 

variable "bastion1subnet" {
  type = string
}

variable "spiappgwsubnet" {
  type = string
} 
variable "spiase1subnet" {
  type = string
} 
variable "spidb1subnet" {
  type = string
} 
variable "spitabextsubnet" {
  type = string
} 
variable "spiweb1subnet" {
  type = string
} 
variable "gatewaysubnet" {
  type = string
} 


variable "UEMCDATAFACTORYVM_vm_size" {
  type = string
}

variable "df_machine_disk_type" {
  type = string
}
variable "df_machine_disk_size" {
   type= string
}

variable "df_vm_count" {
  type= string
}

variable "admin_password" {
  type= string
}
variable "df_vm_image_id" {
  type = string
}

variable "data_disk_count" {
  type = string
}
