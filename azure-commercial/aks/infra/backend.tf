terraform {
    backend "azurerm" {
        resource_group_name  = "#{TerraformStateResourceGroup}#"
        storage_account_name = "#{TerraformStateStorageAccount}#"
        container_name       = "#{TerraformStateContainerName}#"
        access_key           = "#{TerraformStateStorageAccountKey}#"
        key                  = "#{ProjectName}#.#{Stage}#.tfstate"
    }
}