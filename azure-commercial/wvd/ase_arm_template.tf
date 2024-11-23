resource "azurerm_template_deployment" "abla_ase_arm_deployment" {
  name                = "abla_ase_arm_deployment"
  resource_group_name = "${module.applicationrg.resource_group_name}"

  template_body = <<DEPLOY
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "aseName": {
            "type": "string",
            "metadata": {
                "description": "Name of the App Service Environment"
            }
        },
        "aseLocation": {
            "type": "string",
            "defaultValue": "East US",
            "metadata": {
                "description": "Location of the App Service Environment"
            }
        },
        "existingVirtualNetworkName": {
            "type": "string",
            "metadata": {
              "description": "Name of the existing VNET"
            }
        },
        "existingVirtualNetworkResourceGroup": {
            "type": "string",
            "metadata": {
              "description": "Name of the existing VNET resource group"
            }
        },
        "subnetName": {
            "type": "string",
            "metadata": {
                "description": "Subnet name that will contain the App Service Environment"
            }
        },
         "internalLoadBalancingMode": {
            "type": "int",
            "defaultValue": 3,
            "allowedValues": [0,1,2,3],
            "metadata": {
                "description": "0 = public VIP only, 1 = only ports 80/443 are mapped to ILB VIP, 2 = only FTP ports are mapped to ILB VIP, 3 = both ports 80/443 and FTP ports are mapped to an ILB VIP."
            }
        },
        "dnsSuffix": {
            "type": "string",
            "metadata": {
                "description": "Used *only* when deploying an ILB enabled ASE.  Set this to the root domain associated with the ASE.  For example: contoso.com"
            }
        }
    },
    "variables":{
        "vnetID": "[resourceId(parameters('existingVirtualNetworkResourceGroup'), 'Microsoft.Network/virtualNetworks', parameters('existingVirtualNetworkName'))]"
    },
    "resources": [
      {
        "apiVersion": "2015-08-01",
        "type": "Microsoft.Web/hostingEnvironments",
        "name": "[parameters('aseName')]",
        "kind": "ASEV2",
        "location": "[parameters('aseLocation')]",
        "properties": {
          "name": "[parameters('aseName')]",
          "location": "[parameters('aseLocation')]",
          "ipSslAddressCount": 0,
          "internalLoadBalancingMode": 1,
          "dnsSuffix" : "[parameters('dnsSuffix')]",
          "virtualNetwork": {
            "Id": "[variables('vnetID')]",
            "Subnet": "[parameters('subnetName')]"
          }
        }
      }
    ]
}
DEPLOY

  # these key-value pairs are passed into the ARM Template's `parameters` block
  parameters {
    "aseName"     = "${var.abla_ase_name}"
    "aseLocation" = "${module.applicationrg.resource_group_location}"
    "existingVirtualNetworkName" = "${module.applicationvnet.virtual_network_name}"
    "existingVirtualNetworkResourceGroup" = "${module.applicationrg.resource_group_name}"
    "subnetName" = "${var.ablaase1_subnet_name}"

    "dnsSuffix" = "${var.abla_dnsSuffix}"
  }

  deployment_mode = "Incremental"
}
