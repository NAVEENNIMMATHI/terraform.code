#Authentication Variables
variable "subscription_id" {
  type = string
}
variable "client_id" {
  type = string
}
variable "tenant_id" {
  type = string
}
variable "client_secret" {
  type = string
}

#Environment Variables
variable "location_acronym" {
  type = string
}
variable "application_acronym" {
  type = string
}
variable "environment_acronym" {
  type = string
}
variable "location" {
  type = string
}
variable "tags" {
  type = map
}

#Networking variables
# variable "vnet_address_space" {
#     type = string
# }
# variable "subnet_address_space" {
#     type = string
# }