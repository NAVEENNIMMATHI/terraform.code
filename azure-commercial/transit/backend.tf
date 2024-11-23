# terraform {
#   provider "azurerm" {}

#   backend "azurerm" {
#     storage_account_name = "stouseazcop19e14801"
#     container_name       = "terraformstatecontainer"
#     resource_group_name  = "RGP-USE-AZCOP"
#     access_key           = ""
#     key                  = "transit.Validation.tfstate"
#   }
# }


terraform {
  #provider "azurerm" {}

  backend "azurerm" {
    storage_account_name = "__TerraformStateStorageAccount__"
    container_name       = "__TerraformStateContainerName__"
    resource_group_name  = "__TerraformStateResourceGroup__"
    access_key           = "__TerraformStateStorageAccountKey__"
    key                  = "__Project__.__Environment__.tfstate"
  }
}