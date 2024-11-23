variable "tenant_id" {
  type    = string
  default = ""
}

variable "client_id" {
  type    = string
  default = ""
}

variable "client_secret" {
  type    = string
  default = ""
}

variable "subscription_id" {
  type    = string
  default = ""
}

variable "environment_acronym" {
  type = string
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "location_acronym" {
  type    = string
  default = "use"
}

variable "resource_group_failover_location" {
  type    = string
  default = "eastus2"
}

variable "application_acronym" {
  type = string
}

variable "tags" {
  type = map(string)
}

##########Diagnostic Setting Name
variable "aad_diagnostic_setting_name" {
  type = string
}

variable "act_diagnostic_setting_name" {
  type = string
}

variable "authorization_rule_name"{
  type = string
}

##############App Service and Plan
variable "app_service_plan_tier" {
  type = string
}

variable "app_service_plan_size" {
  type = string
}

##############App Service Environment

variable "app_service_environment_id" {
  type = string
}

variable "ase_subnet_id" {
  type = string
}

variable "ase_name" {
  type = string
}

################Datadog API
variable "dd_api_key"{
  type = string
  default="a3b2fa8be439a602d1836598bfbe6fbf"
}


variable "environment"{
  type = string
}

variable "core_aks_subnet_id" {
  type = string
}