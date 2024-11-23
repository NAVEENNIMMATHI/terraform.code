variable "subscription_id" {
  type    = string
}
variable "client_id" {
  type    = string
}
variable "tenant_id" {
  type    = string
}
variable "client_secret" {
  type = string
}

#ResourceGroup

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
variable "target_deployment_environment" {
  type    = string
}
