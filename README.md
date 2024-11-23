# About Terraform
Terraform is a tool for building, changing, and versioning infrastructure.

Terraform generates an execution plan describing what it will do to reach the desired state based on the configuration files that we define, and then executes it to build the described infrastructure. As the configuration changes, Terraform is able to determine what changed and create incremental execution plans which can be applied.

The infrastructure Terraform can manage includes low-level components such as compute instances, storage, and networking, as well as high-level components such as DNS entries, SaaS features, etc.

To learn more about Terraform, click [here](https://www.terraform.io/intro/index.html).

# Repository Structure
Every project in the Terraform Repository has its own dedicated folder. There is also a modules folder that contains multiple shared resources.

Modules can be used to create lightweight abstractions so that you can describe your infrastructure in terms of its architecture, rather than directly in terms of physical objects. This modules folder is referenced by other project folders to deploy infrastructure as per the client’s requirement.

Whenever a new project requirement comes in, we must create a folder with the project name and then add the configuration files into it.

# Terraform Standards and Best Practices

## Project Structure

The general structure of a project is as follows:

```
Project/
|-- input.tf (also variables.tf, variable.tf)
|-- variables.var
|-- backend.tf
|-- version.tf (also versions.tf)
|-- project-specific-files
|-- azure-pipelines.yml
|-- README
```

* input.tf (also variables.tf, variable.tf): All of the variables (names and settings) for a given project.
* variables.var: Tokenized pipeline variable declarations for variables that are defined through a pipeline.
* backend.tf: Connection information for a given subscription.
* version.tf (also versions.tf): Version declarations for Terraform and provider blocks.
* project-specific-files: Additional Terraform files, PowerShell scripts, or anything else required for the project.
* azure-pipelines.yml: Build pipeline definition in YAML.
* README: Documentation about a project.

## Naming Conventions

* Use _ (underscore) instead of - (dash) for resource names, data source names, variable names, and outputs.
    * Good: output "instance_ip_addr" {}
    * Bad: output "instance-ip-addr" {}
* Only use lowercase letters.
    * Good: variable "image_id" {}
    * Bad: variable "image_ID" {}
* Do not repeat the resource type in a resource name.
    * Good: resource "route_table" "public" {}
    * Bad: resource "route_table" "public_route_table" {}
* Resource name should be named this if there is no more descriptive and general name available, or if resource module creates single resource of this type.

If you are ever unsure, you may also refer to the following resource [here](https://www.terraform-best-practices.com).

## Terraform Versions

All projects should be created using Terraform 12. AzureRM and AzureAD versions are upgraded on a regular basis based on new features and bug fixes introduced as part of that provider.

## Pipelines

Code should be written in a way that pipelines can deploy infrastructure to any environment (Development, QA, UAT, Staging, Production).

## Development

It is strongly recommend that teams work using a Windows Virtual Desktop (WVD), *not* using the build machines that the pipelines use for deployment. 

For more information on requesting and connecting to WVD, read [these instructions](https://deliverybackbone.amr.kpmg.com/collaboration/display/DEACO/WVD%2BTraining%2BDocument).


# Getting Started With Terraform

## Download

Terraform is distributed as a single binary and supports the following platforms: macOS (64-bit), FreeBSD (32-bit, 64-bit, Arm), Linux (32-bit, 64-bit, Arm), OpenBSD (32-bit, 64-bit), Solaris (64-bit), and Windows (32-bit, 64-bit).

Terraform can be downloaded [here](https://www.terraform.io/downloads.html). To install Terraform, you must move your unzipped Terraform executable to a directory included in your system's PATH.

## Code Editors

Terraform files use the .tf extension. While working with .tf files, it is strongly suggested that you use a source-code editor with an extension that adds syntax highlighting and other features. 

One option is to use Microsoft Visual Studio Code with the [official HashiCorp Terraform Visual Studio Code Extension](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform).

## Local Development

When running Terraform commands locally, it may be useful to create a backend file with values that are pointing to the state file. These values are generally supplied through a pipeline.

Create a file called **local.backend** - this is included in the .gitignore file so it will not be tracked through git. This is done to ensure that access keys do not get committed to the Master branch.

An example **local.backend** file looks like this:

```
storage_account_name = "my-storage-account-name"
container_name = "my-container-name"
resource_group_name = "my-resource-group-name"
access_key = "my-access-key"
key = "my-state-file-name"
```

## Commands

Terraform is controlled via a command-line interface (CLI). Below we've outlined regulary used commands.

To learn more about other Terraform Commands, click [here](https://www.terraform.io/docs/commands/index.html).

### Common Commands

The terraform init command is used to initialize a working directory containing Terraform configuration files:

`terraform init`

In situations where the backend settings are dynamic or sensitive and cannot be statically specified, values can be passed in using a configuration file:

`terraform init -backend-config="FILENAME"` 

In some cases you may need to specify the directory to the provider plugins if the machine that you are working in has restricted access to the internet:

`terraform init -backend-config="FILENAME" -plugin-dir="DIRECTORY"` 

***

The terraform plan command is used to create an execution plan. Terraform performs a refresh, unless explicitly disabled, and then determines what actions are necessary to achieve the desired state specified in the configuration files:

`terraform plan`

We can set variables in the Terraform configuration from a variable file:

`terraform plan -var-file="FILENAME"`

It is suggested that you save the output of your plan in a file (our standard is to call this file current.tfplan) so that it can be used in the apply step:

`terraform plan -var-file="FILENAME" -out="current.tfplan"`

***

The terraform apply command is used to apply the changes required to reach the desired state of the configuration, or the pre-determined set of actions generated by a terraform plan execution plan:

`terraform apply`

Set variables in the Terraform configuration from a variable file, assuming your values are stored in a file called local.backend:

`terraform apply -var-file="FILENAME"`

You can provide Terraform with a file containing an already generated plan: 

`terraform apply "current.tfplan" -var-file="FILENAME"`

***

The terraform state command is used for advanced state management. As your Terraform usage becomes more advanced, there are some cases where you may need to modify the Terraform state. Rather than modify the state directly, the terraform state commands can be used in many cases instead.

The terraform state mv command is used to move items in a Terraform state:

`terraform state mv "SOURCE" "DESTINATION"`

The terraform state rm command is used to remove items from the Terraform state:

`terraform state rm "ADDRESS"`

For more information on how to manage Terraform state using Terraform commands, visit this link [here](https://www.terraform.io/docs/commands/state/index.html).

***

The terraform import command is used to import existing resources into Terraform. Import will find the existing resource from ID and import it into your Terraform state at the given ADDRESS:

`terraform import "ADDRESS" "ID"`

# Trainings and Tutorials

To learn more about provisioning infrastructure with Terraform, you can visit the [official HashiCorp tutorial page](https://learn.hashicorp.com/terraform).

To learn more about managing code with git, checkout this [free e-book](https://git-scm.com/book/en/v2).