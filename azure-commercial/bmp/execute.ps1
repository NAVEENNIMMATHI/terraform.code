az account set -s UNMGD.Advisory.CloudOperationsSPI
terraform init -backend-config="access_key=$(az storage account keys list --resource-group "RGP-USE-AZCOP" --account-name "stouseazcop0feb4855"  --query '[0].value' -o tsv)"
