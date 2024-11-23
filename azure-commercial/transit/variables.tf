
variable "applicationname" {
   default = "transit"
}
variable "environment" {
   default = "P"
}
variable "location" {
   default = "eastus"
}
variable "L2Ops_ObjectID" {
   default = "d1da8a39-d3d0-4402-bd03-b3d4fb093029"
}
variable "SPN_ObjectID" {
   default = "46c70e4d-2526-402e-bde2-05141d6ed675"
}

variable "networkwatcherrgname" {
   default = "NetworkWatcherRG"
}

variable "transitvnet_address_space" {
   default     = "10.30.16.0/22"
}

variable "subnet_adress_space_mgmttransit" {
   default     = "10.30.16.0/26"
}

variable "subnet_adress_space_trusttransit" {
   default     = "10.30.16.64/26"
}

variable "subnet_adress_space_appgwtransit" {
   default     = "10.30.16.192/26"
}

variable "subnet_adress_space_untrusttransit" {
   default     = "10.30.17.0/26"
}

variable "BMSObjectID" {
   default     = "e7d02040-7211-43c4-96d3-5852d09ae471"
}

variable "uniqueresourcesuffix1" {
   default = "x"
}
variable "uniqueresourcesuffix2" {
   default = "y"
}

variable tags {
   type = "map"
default {
    Platform = "__tag_Platform__"
    Environment  = "__tag_environment__"
    Node = "__tag_node__"
    Solution = "__tag_solution__"
    CostCode = "__tag_costcode__"
    OwnerContact = "__tag_ownercontact__"    
  }
}