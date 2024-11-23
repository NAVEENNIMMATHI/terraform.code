az account set -s UNMGD.Advisory.CloudOperationsDAQA 
terraform init -backend-config="access_key=$(az storage account keys list --resource-group "co-qa-eastus-ablaterraformfiles-rg" --account-name "conpeusablatrfm01sa"  --query '[0].value' -o tsv)"
