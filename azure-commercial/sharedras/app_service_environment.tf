resource "azurerm_template_deployment" "ase_arm_spoke_deployment" {
  name                = var.environment_acronym == "dv" ? "ase_arm_spoke_deployment" : (var.environment_acronym == "qa" ? "ase_arm_spoke_deployment" : "ase_arm_npspoke_deployment")
  resource_group_name = module.sharedrg.resource_group_name

  template_body = <<DEPLOY
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "ase_name": {
            "type": "string",
            "metadata": {
                "description": "Name of the App Service Environment"
            }
        },

        "ase_location": {
            "type": "string",
            "defaultValue": "eastus",
            "metadata": {
                "description": "Location of the App Service Environment"
            }
        },
        "virtualnetwork_name": {
            "type": "string",
            "metadata": {
              "description": "Name of the existing VNET"
            }
        },
        "virtualnetwork_resourceGroup": {
            "type": "string",
            "metadata": {
              "description": "Name of the existing VNET resource group"
            }
        },
        "subnet_name": {
            "type": "string",
            "metadata": {
                "description": "Subnet name that will contain the App Service Environment"
            }
        },
         "internalloadbalancingmode": {
            "type": "int",
            "defaultValue": 3,
            "allowedValues": [0,1,2,3],
            "metadata": {
                "description": "0 = public VIP only, 1 = only ports 80/443 are mapped to ILB VIP, 2 = only FTP ports are mapped to ILB VIP, 3 = both ports 80/443 and FTP ports are mapped to an ILB VIP."
            }
        },
        "dns_suffix": {
            "type": "string",
            "metadata": {
                "description": "Used *only* when deploying an ILB enabled ASE.  Set this to the root domain associated with the ASE.  For example: contoso.com"
            }
        }
        
    },
    "variables":{
        "vnetID": "[resourceId(parameters('virtualnetwork_resourceGroup'), 'Microsoft.Network/virtualNetworks', parameters('virtualnetwork_name'))]"
    },
    "resources": [
      {
        "apiVersion": "2015-08-01",
        "type": "Microsoft.Web/hostingEnvironments",
        "name": "[parameters('ase_name')]",
        "kind": "ASEV2",
        "location": "[parameters('ase_location')]",
        "properties": {
          "name": "[parameters('ase_name')]",
          "location": "[parameters('ase_location')]",
          "ipSslAddressCount": 0,
          "internalLoadBalancingMode": 1,
          "dnsSuffix" : "[parameters('dns_suffix')]",
          "virtualNetwork": {
            "Id": "[variables('vnetID')]",
            "Subnet": "[parameters('subnet_name')]"
          }
        }

      }
    ]
}
DEPLOY

  # these key-value pairs are passed into the ARM Template's `parameters` block
  parameters = {
    "ase_Name"                     = var.ase_name
    "ase_Location"                 = module.sharedrg.resource_group_location
    "virtualnetwork_name"          = module.sharedvnet.virtual_network_name
    "virtualnetwork_resourceGroup" = module.sharedrg.resource_group_name
    "subnet_name"                  = module.asesubnet.subnet_name
    "dns_Suffix"                   = var.dns_suffix
    
  }

  deployment_mode = "Incremental"

  timeouts {
    create = "15h"
    delete = "120m"
  }
}