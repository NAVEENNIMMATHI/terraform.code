# Authentication

variable "client_id" {
    type = string
}
variable "client_secret" {
    type = string
}
variable "subscription_id" {
    type = string
}
variable "tenant_id" {
    type = string
}
variable "subscription_id_first_chars" {
    type = string
}


# Tags

variable "platform" {
    type = string
}
variable "environment" {
    type = string
}
variable "node" {
    type = string
}
variable "solution" {
    type = string
}
variable "service_group" {
    type = string
}