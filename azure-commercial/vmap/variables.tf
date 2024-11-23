#Azure Environment variables#
variable "subscription_id" {
  type = string
}
variable "client_id" {
  type = string
}
variable "client_secret" {
  type = string
}
variable "tenant_id" {
  type = string
}

#Project Variables#
variable "application_acronym" {
  type = string
}

variable "environment_acronym" {
  type = string
}

variable "location_acronym" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
}

#App Service
variable "app_service_plan_tier" {
  type = string
}
variable "app_service_plan_size" {
  type = string
}

# Application Gateway
variable "application_gateway" {
  type = object({
    environment_acronym = string
    sku = object({
      name     = string
      tier     = string
      capacity = string
    })
  })
}

variable "dns_servers" {
  type = list(string)
}

variable "backend_cer_cert_name" {
  type    = string
  default = "kpmgcloudops.com"
}

variable "frontend_pfx_cert_name" {
  type = string
}

# Shared RAS Storage
variable "shared_state_storage_account" {
  type = object({
    name                = string
    resource_group_name = string
    container_name      = string
    blob_key_name       = string
  })
}

# Subnets
variable "subnets" {
  type = map(object({
    address_space = string
  }))
}

# SQL Server
variable "sql_server_version" {
  type    = string
  default = "12.0"
}


# Private DNS Variables
variable "pvt_dns_subscription_id" {
  type = string
}

variable "private_dns_zone_resource_group" {
  type = string
}


#App Service Environment variables
variable "ase_name" {
  type = string
}

variable "ase_resource_group_name" {
  type = string
}
