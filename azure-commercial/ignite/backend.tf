/*

Do *NOT* add any values to this file that are secret or non-global.  Please use partial backend configuration instead.

Please name your local backend config "local.backend" to be automatically ignored from git tracking (see .gitignore)

Please use pipeline.backend for plugging into pipelines.  This can also serve as a template for creating your local.backend.

https://www.terraform.io/docs/backends/config.html

Partial Configuration
You do not need to specify every required argument in the backend configuration. Omitting certain arguments may be desirable to avoid storing secrets, such as access keys, within the main configuration. When some or all of the arguments are omitted, we call this a partial configuration.

With a partial configuration, the remaining configuration arguments must be provided as part of the initialization process. There are several ways to supply the remaining arguments:

Interactively: Terraform will interactively ask you for the required values, unless interactive input is disabled. Terraform will not prompt for optional values.

File: A configuration file may be specified via the init command line. To specify a file, use the -backend-config=PATH option when running terraform init. If the file contains secrets it may be kept in a secure data store, such as Vault, in which case it must be downloaded to the local disk before running Terraform.

Command-line key/value pairs: Key/value pairs can be specified via the init command line. Note that many shells retain command-line flags in a history file, so this isn't recommended for secrets. To specify a single key/value pair, use the -backend-config="KEY=VALUE" option when running terraform init.

When running terraform init, us the following example so that the backend is configured with your local values:
terraform init -backend-config="local.backend"

*/

terraform {

backend "azurerm" {
storage_account_name = "__TerraformStateStorageAccount__"
container_name       = "__TerraformStateContainerName__"
resource_group_name  = "__TerraformStateResourceGroup__"
access_key           = "__TerraformStateStorageAccountKey__"
key                  = "__Project__.__Stage__.tfstate"
 }
}