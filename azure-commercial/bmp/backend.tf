# Use the dynamically configured state file

terraform {
  backend "azurerm" {
    storage_account_name = "__TerraformStateStorageAccount__"
    container_name       = "__TerraformStateContainerName__"
    resource_group_name  = "__TerraformStateResourceGroup__"
    access_key           = "__TerraformStateStorageAccountKey__"
    key                  = "__Project__.__Stage__.tfstate"
  }
}

# Use the local tfstate file

# terraform {
#   backend "local" {
#     path = ".terraform/terraform.tfstate"
#   }
# }
