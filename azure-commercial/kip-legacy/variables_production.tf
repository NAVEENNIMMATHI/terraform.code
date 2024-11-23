#Application Gateway
variable "kiphostname" {
    type = string
}

variable "kipauthcertcer" {
    type = string
}

variable "kipcertname" {
    type = string
}

variable "kipsslcertpfx" {
    type = string
}

variable "kipcertpfxpwd" {
    type = string
}

variable "kipresthostname" {
    type = string
}

variable "kiprestauthcertcer" {
    type = string
}

variable "kiprestcertname" {
    type = string
}

variable "kiprestsslcertpfx" {
    type = string
}

variable "kiprestcertpfxpwd" {
    type = string
}

variable "mep-kiphostname" {
    type = string
}

variable "mep-kipauthcertcer" {
    type = string
}

variable "mep-kipcertname" {
    type = string
}

variable "mep-kipsslcertpfx" {
    type = string
}

variable "mep-kipcertpfxpwd" {
    type = string
}

variable "meprest-kiphostname" {
    type = string
}

variable "meprest-kipauthcertcer" {
    type = string
}

variable "meprest-kipcertname" {
    type = string
}

variable "meprest-kipsslcertpfx" {
    type = string
}

variable "meprest-kipcertpfxpwd" {
    type = string
}

#App Services
variable "app_service_name_kip" {
    type = string
}

variable "app_service_name_kiprest" {
    type = string
}

variable "app_service_name_mep-kip" {
    type = string
}

variable "app_service_name_meprest-kip" {
    type = string
}

variable "functionapp_name_prod" {
    type = string
}

