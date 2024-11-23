terraform {
  backend "azurerm" {
    resource_group_name  = "__TerraformStateResourceGroup__"
    storage_account_name = "__TerraformStateStorageAccount__"
    container_name       = "__TerraformStateContainerName__"
    access_key           = "__TerraformStateStorageAccountKey__"
    key                  = "__Project__.__Stage__.tfstate"
  }
}

