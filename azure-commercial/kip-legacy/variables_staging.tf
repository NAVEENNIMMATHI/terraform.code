#Application Insights
variable "app_insights_name_kipuat" {
    type = string
}

variable "app_insights_name_kiprestuat" {
    type = string
}

variable "app_insights_name_mep-kipuat" {
    type = string
}

variable "app_insights_name_meprest-kipuat" {
    type = string
}

#Application Gateway
variable "kipuathostname" {
    type = string
}

variable "kipuatauthcertcer" {
    type = string
}

variable "kipuatcertname" {
    type = string
}

variable "kipuatsslcertpfx" {
    type = string
}

variable "kipuatcertpfxpwd" {
    type = string
}

variable "kiprestuathostname" {
    type = string
}

variable "kiprestuatauthcertcer" {
    type = string
}

variable "kiprestuatcertname" {
    type = string
}

variable "kiprestuatsslcertpfx" {
    type = string
}

variable "kiprestuatcertpfxpwd" {
    type = string
}

variable "mep-kipuathostname" {
    type = string
}

variable "mep-kipuatauthcertcer" {
    type = string
}

variable "mep-kipuatcertname" {
    type = string
}

variable "mep-kipuatsslcertpfx" {
    type = string
}

variable "mep-kipuatcertpfxpwd" {
    type = string
}

variable "meprest-kipuathostname" {
    type = string
}

variable "meprest-kipuatauthcertcer" {
    type = string
}

variable "meprest-kipuatcertname" {
    type = string
}

variable "meprest-kipuatsslcertpfx" {
    type = string
}

variable "meprest-kipuatcertpfxpwd" {
    type = string
}

#App Services
variable "app_service_name_kipuat" {
    type = string
}

variable "app_service_name_kiprestuat" {
    type = string
}

variable "app_service_name_mep-kipuat" {
    type = string
}

variable "app_service_name_meprest-kipuat" {
    type = string
}

variable "functionapp_name_uat" {
    type = string
}

