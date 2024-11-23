variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "kubernetes_cluster_name" {
  type = string
}

variable "aks_prefix" {
  type = string
}

variable "aks_node_pool_name" {
  type = string
}

variable "aks_node_count" {
  type = number
}

variable "aks_node_size" {
  type = string
}


variable "cluster_subnet_id" {
  type = string
}

variable "log_analytics_workspace_id" {
  type = string
}

#variable "api_server_auth_ips" {
#  type = list(string)
#  default = [""]
#}

variable "tags" {
  type = map(string)
}

variable "kubernetes_version" {
  type = string
}

variable "identity_type" {
  type = string
}

variable "enable_auto_scaling" {
  type = bool
}

variable "default_node_pool_type" {
  type = string
}

variable "network_profile_outbound_type" {
  type = string
}

variable "aks_admin_group_object_ids" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}
variable "min_count" {
 type = number
}
variable "max_count" {
 type= number
}
variable "rtable_id" { type = string }

variable "node_resource_group" {
  type = string
}

variable "vm_max_map_count" {
   type=number
}


