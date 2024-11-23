#!/bin/bash
az account set -s UNMGD.Advisory.CloudOperationsProdSPI
terraform init -backend-config="access_key=$(az storage account keys list --resource-group "co-p-eastus-bmpterraformfiles-rg" --account-name "copeusbmptrfm01sa"  --query '[0].value' -o tsv)"
