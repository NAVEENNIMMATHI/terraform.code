resource "azurerm_template_deployment" "mi_arm_deployment" {
  name                = "mi_arm_deployment"
  resource_group_name = module.applicationrg.resource_group_name

  count               = var.environment == "production" ? "0" : "1"

  template_body = <<DEPLOY
{
  "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "virtualNetworkAddressPrefix": {
      "type": "string",
      "defaultValue": "virtualNetworkAddressPrefix",
      "metadata": {
        "description": "virtualNetworkAddressPrefix"
      }
    },
    "managedInstanceSubnetPrefix": {
      "type": "string",
      "defaultValue": "managedInstanceSubnetPrefix",
      "metadata": {
        "description": "managedInstanceSubnetPrefix"
      }
    },
    "routeTableToAzureService": {
      "type": "string",
      "defaultValue": "RouteToAzureSqlMiMngSvc",
      "metadata": {
        "description": "The name of the existing or new route table that enables access to Azure SQL Managed Instance Management Service that controls the instance, manages backups and other maintenance operations"
      }
    },
    "nsgForManagedInstanceSubnet": {
      "type": "string",
      "defaultValue": "nsg-ManagedInstances",
      "metadata": {
        "description": "Name of network security group dedicated to managed instance subnet"
      }
    },
    "FirewallIPAddress": {
      "type": "string",
      "defaultValue": "FirewallIPAddress",
      "metadata": {
        "description": "FirewallIPAddress"
      }
    },
    "location": {
      "type": "string",
      "defaultValue": "[resourceGroup().location]",
      "metadata": {
        "description": "Azure data center location where all resources will be deployed"
      }
    },
    
    "managedInstanceName": {
      "type": "string",
      "metadata": {
        "description": "Enter managed instance name."
      }
    },
    "administratorLogin": {
      "type": "string",
      "metadata": {
        "description": "Enter user name."
      }
    },
    "administratorLoginPassword": {
      "type": "securestring",
      "metadata": {
        "description": "Enter password."
      }
    },
    "skuName": {
            "type": "string",
            "allowedValues":[
                "GP_Gen4",
                "GP_Gen5",
                "BC_Gen4",
                "BC_Gen5"
            ],
            "defaultValue": "GP_Gen5",
            "metadata": {
                "description": "Enter sku name."
            }
        },
                "vCores": {
            "type": "int",
            "defaultValue": 8,
            "allowedValues":[
                8,
                16,
                24,
                32,
                40,
                64,
                80
            ],              
            "metadata": {
                "description": "Enter number of vCores."
            }
        },
            "subnetId": {
      "type": "string",
      "metadata": {
        "description": "string"
      }
    },
            "storageSizeInGB": {
            "type": "int",         
            "defaultValue": 8192,
            "minValue": 32,
            "maxValue": 8192,
            "metadata": {
                "description": "Enter storage size."
            }
        },
        "licenseType": {
            "type": "string",
            "defaultValue": "LicenseIncluded",
            "allowedValues":[
                "BasePrice",
                "LicenseIncluded"
            ],             
            "metadata": {
                "description": "Enter license type."
            }
        }
  },
  "variables": {},
  "resources": [
    {
      "apiVersion": "2019-06-01",
      "type": "Microsoft.Network/networkSecurityGroups",
      "name": "[parameters('nsgForManagedInstanceSubnet')]",
      "location": "[parameters('location')]",
      "properties": {
        "securityRules": [
          {
            "name": "allow_management_inbound",
            "properties": {
                "description": "Allow inbound management traffic",
                "protocol": "Tcp",
                "sourcePortRange": "*",
                "sourceAddressPrefix": "*",
                "destinationAddressPrefix": "*",
                "access": "Allow",
                "priority": 100,
                "direction": "Inbound",
                "destinationPortRanges": [
                    "9000",
                    "9003",
                    "1438",
                    "1440",
                    "1452"
                ]
            }
        },
        {
            "name": "allow_misubnet_inbound",
            "properties": {
                "description": "Allow inbound traffic inside the subnet",
                "protocol": "*",
                "sourcePortRange": "*",
                "destinationPortRange": "*",
                "sourceAddressPrefix": "[parameters('virtualNetworkAddressPrefix')]",
                "destinationAddressPrefix": "*",
                "access": "Allow",
                "priority": 200,
                "direction": "Inbound"
            }
        },
        {
            "name": "allow_health_probe_inbound",
            "properties": {
                "description": "Allow health probe",
                "protocol": "*",
                "sourcePortRange": "*",
                "destinationPortRange": "*",
                "sourceAddressPrefix": "AzureLoadBalancer",
                "destinationAddressPrefix": "*",
                "access": "Allow",
                "priority": 300,
                "direction": "Inbound"
            }
        },
        {
            "name": "allow_tds_inbound",
            "properties": {
                "description": "Allow access to data",
                "protocol": "TCP",
                "sourcePortRange": "*",
                "destinationPortRange": "1433",
                "sourceAddressPrefix": "VirtualNetwork",
                "destinationAddressPrefix": "*",
                "access": "Allow",
                "priority": 1000,
                "direction": "Inbound"
            }
        },
        {
            "name": "allow_redirect_inbound",
            "properties": {
                "description": "Allow inbound redirect traffic to Managed Instance inside the virtual network",
                "protocol": "Tcp",
                "sourcePortRange": "*",
                "destinationPortRange": "11000-11999",
                "sourceAddressPrefix": "VirtualNetwork",
                "destinationAddressPrefix": "*",
                "access": "Allow",
                "priority": 1100,
                "direction": "Inbound"
            }
        },
        {
            "name": "allow_geodr_inbound",
            "properties": {
                "description": "Allow inbound geodr traffic inside the virtual network",
                "protocol": "Tcp",
                "sourcePortRange": "*",
                "destinationPortRange": "5022",
                "sourceAddressPrefix": "VirtualNetwork",
                "destinationAddressPrefix": "*",
                "access": "Allow",
                "priority": 1200,
                "direction": "Inbound"
            }
        },
        {
            "name": "deny_all_inbound",
            "properties": {
                "description": "Deny all other inbound traffic",
                "protocol": "*",
                "sourcePortRange": "*",
                "destinationPortRange": "*",
                "sourceAddressPrefix": "*",
                "destinationAddressPrefix": "*",
                "access": "Deny",
                "priority": 4096,
                "direction": "Inbound"
            }
        },
        {
            "name": "allow_management_outbound",
            "properties": {
                "description": "Allow outbound management traffic",
                "protocol": "Tcp",
                "sourcePortRange": "*",
                "sourceAddressPrefix": "*",
                "destinationAddressPrefix": "*",
                "access": "Allow",
                "priority": 100,
                "direction": "Outbound",
                "destinationPortRanges": [
                    "80",
                    "443",
                    "12000"
                ]
            }
        },
        {
            "name": "allow_misubnet_outbound",
            "properties": {
                "description": "Allow outbound traffic inside the subnet",
                "protocol": "*",
                "sourcePortRange": "*",
                "destinationPortRange": "*",
                "sourceAddressPrefix": "*",
                "destinationAddressPrefix": "[parameters('virtualNetworkAddressPrefix')]",
                "access": "Allow",
                "priority": 200,
                "direction": "Outbound"
            }
        },
        {
            "name": "allow_linkedserver_outbound",
            "properties": {
                "description": "Allow outbound linkedserver traffic inside the virtual network",
                "protocol": "Tcp",
                "sourcePortRange": "*",
                "destinationPortRange": "1433",
                "sourceAddressPrefix": "*",
                "destinationAddressPrefix": "VirtualNetwork",
                "access": "Allow",
                "priority": 1000,
                "direction": "Outbound"
            }
        },
        {
            "name": "allow_redirect_outbound",
            "properties": {
                "description": "Allow outbound redirect traffic to Managed Instance inside the virtual network",
                "protocol": "Tcp",
                "sourcePortRange": "*",
                "destinationPortRange": "11000-11999",
                "sourceAddressPrefix": "*",
                "destinationAddressPrefix": "VirtualNetwork",
                "access": "Allow",
                "priority": 1100,
                "direction": "Outbound"
            }
        },
        {
            "name": "allow_geodr_outbound",
            "properties": {
                "description": "Allow outbound geodr traffic inside the virtual network",
                "protocol": "Tcp",
                "sourcePortRange": "*",
                "destinationPortRange": "5022",
                "sourceAddressPrefix": "*",
                "destinationAddressPrefix": "VirtualNetwork",
                "access": "Allow",
                "priority": 1200,
                "direction": "Outbound"
            }
        },
        {
            "name": "deny_all_outbound",
            "properties": {
                "description": "Deny all other outbound traffic",
                "protocol": "*",
                "sourcePortRange": "*",
                "destinationPortRange": "*",
                "sourceAddressPrefix": "*",
                "destinationAddressPrefix": "*",
                "access": "Deny",
                "priority": 4096,
                "direction": "Outbound"
            }
        }
        ],
        "defaultSecurityRules": [
            {
                "name": "AllowVnetInBound",
                "properties": {
                    "description": "Allow inbound traffic from all VMs in VNET",
                    "protocol": "*",
                    "sourcePortRange": "*",
                    "destinationPortRange": "*",
                    "sourceAddressPrefix": "VirtualNetwork",
                    "destinationAddressPrefix": "VirtualNetwork",
                    "access": "Allow",
                    "priority": 65000,
                    "direction": "Inbound"
                }
            },
            {
                "name": "AllowAzureLoadBalancerInBound",
                "properties": {
                    "description": "Allow inbound traffic from azure load balancer",
                    "protocol": "*",
                    "sourcePortRange": "*",
                    "destinationPortRange": "*",
                    "sourceAddressPrefix": "AzureLoadBalancer",
                    "destinationAddressPrefix": "*",
                    "access": "Allow",
                    "priority": 65001,
                    "direction": "Inbound"
                }
            },
            {
                "name": "DenyAllInBound",
                "properties": {
                    "description": "Deny all inbound traffic",
                    "protocol": "*",
                    "sourcePortRange": "*",
                    "destinationPortRange": "*",
                    "sourceAddressPrefix": "*",
                    "destinationAddressPrefix": "*",
                    "access": "Deny",
                    "priority": 65500,
                    "direction": "Inbound"
                }
            },
            {
                "name": "AllowVnetOutBound",
                "properties": {
                    "description": "Allow outbound traffic from all VMs to all VMs in VNET",
                    "protocol": "*",
                    "sourcePortRange": "*",
                    "destinationPortRange": "*",
                    "sourceAddressPrefix": "VirtualNetwork",
                    "destinationAddressPrefix": "VirtualNetwork",
                    "access": "Allow",
                    "priority": 65000,
                    "direction": "Outbound"
                }
            },
            {
                "name": "AllowInternetOutBound",
                "properties": {
                    "description": "Allow outbound traffic from all VMs to Internet",
                    "protocol": "*",
                    "sourcePortRange": "*",
                    "destinationPortRange": "*",
                    "sourceAddressPrefix": "*",
                    "destinationAddressPrefix": "Internet",
                    "access": "Allow",
                    "priority": 65001,
                    "direction": "Outbound"
                }
            },
            {
                "name": "DenyAllOutBound",
                "properties": {
                    "description": "Deny all outbound traffic",
                    "protocol": "*",
                    "sourcePortRange": "*",
                    "destinationPortRange": "*",
                    "sourceAddressPrefix": "*",
                    "destinationAddressPrefix": "*",
                    "access": "Deny",
                    "priority": 65500,
                    "direction": "Outbound"
                }
            }
        ]
      }
    },
    {
        "type": "Microsoft.Network/networkSecurityGroups/securityRules",
        "apiVersion": "2019-06-01",
        "name": "[concat(parameters('nsgForManagedInstanceSubnet'), '/allow_geodr_inbound')]",
        "dependsOn": [
            "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('nsgForManagedInstanceSubnet'))]"
        ],
        "properties": {
            "description": "Allow inbound geodr traffic inside the virtual network",
            "protocol": "Tcp",
            "sourcePortRange": "*",
            "destinationPortRange": "5022",
            "sourceAddressPrefix": "VirtualNetwork",
            "destinationAddressPrefix": "*",
            "access": "Allow",
            "priority": 1200,
            "direction": "Inbound"
        }
    },
    {
        "type": "Microsoft.Network/networkSecurityGroups/securityRules",
        "apiVersion": "2019-06-01",
        "name": "[concat(parameters('nsgForManagedInstanceSubnet'), '/allow_geodr_outbound')]",
        "dependsOn": [
            "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('nsgForManagedInstanceSubnet'))]"
        ],
        "properties": {
            "description": "Allow outbound geodr traffic inside the virtual network",
            "protocol": "Tcp",
            "sourcePortRange": "*",
            "destinationPortRange": "5022",
            "sourceAddressPrefix": "*",
            "destinationAddressPrefix": "VirtualNetwork",
            "access": "Allow",
            "priority": 1200,
            "direction": "Outbound"
        }
    },
    {
        "type": "Microsoft.Network/networkSecurityGroups/securityRules",
        "apiVersion": "2019-06-01",
        "name": "[concat(parameters('nsgForManagedInstanceSubnet'), '/allow_health_probe_inbound')]",
        "dependsOn": [
            "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('nsgForManagedInstanceSubnet'))]"
        ],
        "properties": {
            "description": "Allow health probe",
            "protocol": "*",
            "sourcePortRange": "*",
            "destinationPortRange": "*",
            "sourceAddressPrefix": "AzureLoadBalancer",
            "destinationAddressPrefix": "*",
            "access": "Allow",
            "priority": 300,
            "direction": "Inbound"
        }
    },
    {
        "type": "Microsoft.Network/networkSecurityGroups/securityRules",
        "apiVersion": "2019-06-01",
        "name": "[concat(parameters('nsgForManagedInstanceSubnet'), '/allow_linkedserver_outbound')]",
        "dependsOn": [
            "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('nsgForManagedInstanceSubnet'))]"
        ],
        "properties": {
            "description": "Allow outbound linkedserver traffic inside the virtual network",
            "protocol": "Tcp",
            "sourcePortRange": "*",
            "destinationPortRange": "1433",
            "sourceAddressPrefix": "*",
            "destinationAddressPrefix": "VirtualNetwork",
            "access": "Allow",
            "priority": 1000,
            "direction": "Outbound"
        }
    },
    {
        "type": "Microsoft.Network/networkSecurityGroups/securityRules",
        "apiVersion": "2019-06-01",
        "name": "[concat(parameters('nsgForManagedInstanceSubnet'), '/allow_management_inbound')]",
        "dependsOn": [
            "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('nsgForManagedInstanceSubnet'))]"
        ],
        "properties": {
            "description": "Allow inbound management traffic",
            "protocol": "Tcp",
            "sourcePortRange": "*",
            "sourceAddressPrefix": "*",
            "destinationAddressPrefix": "*",
            "access": "Allow",
            "priority": 100,
            "direction": "Inbound",
            "destinationPortRanges": [
                "9000",
                "9003",
                "1438",
                "1440",
                "1452"
            ]
        }
    },
    {
        "type": "Microsoft.Network/networkSecurityGroups/securityRules",
        "apiVersion": "2019-06-01",
        "name": "[concat(parameters('nsgForManagedInstanceSubnet'), '/allow_management_outbound')]",
        "dependsOn": [
            "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('nsgForManagedInstanceSubnet'))]"
        ],
        "properties": {
            "description": "Allow outbound management traffic",
            "protocol": "Tcp",
            "sourcePortRange": "*",
            "sourceAddressPrefix": "*",
            "destinationAddressPrefix": "*",
            "access": "Allow",
            "priority": 100,
            "direction": "Outbound",
            "destinationPortRanges": [
                "80",
                "443",
                "12000"
            ]
        }
    },
    {
        "type": "Microsoft.Network/networkSecurityGroups/securityRules",
        "apiVersion": "2019-06-01",
        "name": "[concat(parameters('nsgForManagedInstanceSubnet'), '/allow_misubnet_inbound')]",
        "dependsOn": [
            "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('nsgForManagedInstanceSubnet'))]"
        ],
        "properties": {
            "description": "Allow inbound traffic inside the subnet",
            "protocol": "*",
            "sourcePortRange": "*",
            "destinationPortRange": "*",
            "sourceAddressPrefix": "[parameters('virtualNetworkAddressPrefix')]",
            "destinationAddressPrefix": "*",
            "access": "Allow",
            "priority": 200,
            "direction": "Inbound"
        }
    },
    {
        "type": "Microsoft.Network/networkSecurityGroups/securityRules",
        "apiVersion": "2019-06-01",
        "name": "[concat(parameters('nsgForManagedInstanceSubnet'), '/allow_misubnet_outbound')]",
        "dependsOn": [
            "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('nsgForManagedInstanceSubnet'))]"
        ],
        "properties": {
            "description": "Allow outbound traffic inside the subnet",
            "protocol": "*",
            "sourcePortRange": "*",
            "destinationPortRange": "*",
            "sourceAddressPrefix": "*",
            "destinationAddressPrefix": "[parameters('virtualNetworkAddressPrefix')]",
            "access": "Allow",
            "priority": 200,
            "direction": "Outbound"
        }
    },
    {
        "type": "Microsoft.Network/networkSecurityGroups/securityRules",
        "apiVersion": "2019-06-01",
        "name": "[concat(parameters('nsgForManagedInstanceSubnet'), '/allow_redirect_inbound')]",
        "dependsOn": [
            "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('nsgForManagedInstanceSubnet'))]"
        ],
        "properties": {
            "description": "Allow inbound redirect traffic to Managed Instance inside the virtual network",
            "protocol": "Tcp",
            "sourcePortRange": "*",
            "destinationPortRange": "11000-11999",
            "sourceAddressPrefix": "VirtualNetwork",
            "destinationAddressPrefix": "*",
            "access": "Allow",
            "priority": 1100,
            "direction": "Inbound"
        }
    },
    {
        "type": "Microsoft.Network/networkSecurityGroups/securityRules",
        "apiVersion": "2019-06-01",
        "name": "[concat(parameters('nsgForManagedInstanceSubnet'), '/allow_redirect_outbound')]",
        "dependsOn": [
            "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('nsgForManagedInstanceSubnet'))]"
        ],
        "properties": {
            "description": "Allow outbound redirect traffic to Managed Instance inside the virtual network",
            "protocol": "Tcp",
            "sourcePortRange": "*",
            "destinationPortRange": "11000-11999",
            "sourceAddressPrefix": "*",
            "destinationAddressPrefix": "VirtualNetwork",
            "access": "Allow",
            "priority": 1100,
            "direction": "Outbound"
        }
    },
    {
        "type": "Microsoft.Network/networkSecurityGroups/securityRules",
        "apiVersion": "2019-06-01",
        "name": "[concat(parameters('nsgForManagedInstanceSubnet'), '/allow_tds_inbound')]",
        "dependsOn": [
            "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('nsgForManagedInstanceSubnet'))]"
        ],
        "properties": {
            "description": "Allow access to data",
            "protocol": "TCP",
            "sourcePortRange": "*",
            "destinationPortRange": "1433",
            "sourceAddressPrefix": "VirtualNetwork",
            "destinationAddressPrefix": "*",
            "access": "Allow",
            "priority": 1000,
            "direction": "Inbound"
        }
    },
    {
        "type": "Microsoft.Network/networkSecurityGroups/securityRules",
        "apiVersion": "2019-06-01",
        "name": "[concat(parameters('nsgForManagedInstanceSubnet'), '/deny_all_inbound')]",
        "dependsOn": [
            "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('nsgForManagedInstanceSubnet'))]"
        ],
        "properties": {
            "provisioningState": "Succeeded",
            "description": "Deny all other inbound traffic",
            "protocol": "*",
            "sourcePortRange": "*",
            "destinationPortRange": "*",
            "sourceAddressPrefix": "*",
            "destinationAddressPrefix": "*",
            "access": "Deny",
            "priority": 4096,
            "direction": "Inbound"
        }
    },
    {
        "type": "Microsoft.Network/networkSecurityGroups/securityRules",
        "apiVersion": "2019-06-01",
        "name": "[concat(parameters('nsgForManagedInstanceSubnet'), '/deny_all_outbound')]",
        "dependsOn": [
            "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('nsgForManagedInstanceSubnet'))]"
        ],
        "properties": {
            "description": "Deny all other outbound traffic",
            "protocol": "*",
            "sourcePortRange": "*",
            "destinationPortRange": "*",
            "sourceAddressPrefix": "*",
            "destinationAddressPrefix": "*",
            "access": "Deny",
            "priority": 4096,
            "direction": "Outbound"
        }
    },
    {
      "type": "Microsoft.Network/routeTables",
      "apiVersion": "2019-04-01",
      "name": "[parameters('routeTableToAzureService')]",
      "location": "[parameters('location')]",
      "properties": {
          "disableBgpRoutePropagation": false,
          "routes": [
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-102-133-16-nexthop-internet", "properties": { "addressprefix": "102.133.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-102-37-18-nexthop-internet", "properties": { "addressprefix": "102.37.0.0/18", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-103-25-156-24-nexthop-internet", "properties": { "addressprefix": "103.25.156.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-103-25-157-24-nexthop-internet", "properties": { "addressprefix": "103.25.157.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-103-25-158-23-nexthop-internet", "properties": { "addressprefix": "103.25.158.0/23", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-103-255-140-22-nexthop-internet", "properties": { "addressprefix": "103.255.140.0/22", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-103-36-96-22-nexthop-internet", "properties": { "addressprefix": "103.36.96.0/22", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-103-9-8-22-nexthop-internet", "properties": { "addressprefix": "103.9.8.0/22", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-104-146-15-nexthop-internet", "properties": { "addressprefix": "104.146.0.0/15", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-104-208-13-nexthop-internet", "properties": { "addressprefix": "104.208.0.0/13", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-104-40-13-nexthop-internet", "properties": { "addressprefix": "104.40.0.0/13", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-111-221-16-20-nexthop-internet", "properties": { "addressprefix": "111.221.16.0/20", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-111-221-64-18-nexthop-internet", "properties": { "addressprefix": "111.221.64.0/18", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-129-75-16-nexthop-internet", "properties": { "addressprefix": "129.75.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-13-104-14-nexthop-internet", "properties": { "addressprefix": "13.104.0.0/14", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-13-64-11-nexthop-internet", "properties": { "addressprefix": "13.64.0.0/11", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-131-107-16-nexthop-internet", "properties": { "addressprefix": "131.107.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-1-24-nexthop-internet", "properties": { "addressprefix": "131.253.1.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-12-22-nexthop-internet", "properties": { "addressprefix": "131.253.12.0/22", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-128-17-nexthop-internet", "properties": { "addressprefix": "131.253.128.0/17", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-16-23-nexthop-internet", "properties": { "addressprefix": "131.253.16.0/23", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-18-24-nexthop-internet", "properties": { "addressprefix": "131.253.18.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-21-24-nexthop-internet", "properties": { "addressprefix": "131.253.21.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-22-23-nexthop-internet", "properties": { "addressprefix": "131.253.22.0/23", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-24-21-nexthop-internet", "properties": { "addressprefix": "131.253.24.0/21", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-3-24-nexthop-internet", "properties": { "addressprefix": "131.253.3.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-32-20-nexthop-internet", "properties": { "addressprefix": "131.253.32.0/20", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-5-24-nexthop-internet", "properties": { "addressprefix": "131.253.5.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-6-24-nexthop-internet", "properties": { "addressprefix": "131.253.6.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-61-24-nexthop-internet", "properties": { "addressprefix": "131.253.61.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-62-23-nexthop-internet", "properties": { "addressprefix": "131.253.62.0/23", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-64-18-nexthop-internet", "properties": { "addressprefix": "131.253.64.0/18", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-8-24-nexthop-internet", "properties": { "addressprefix": "131.253.8.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-132-245-16-nexthop-internet", "properties": { "addressprefix": "132.245.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-134-170-16-nexthop-internet", "properties": { "addressprefix": "134.170.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-134-177-16-nexthop-internet", "properties": { "addressprefix": "134.177.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-137-116-15-nexthop-internet", "properties": { "addressprefix": "137.116.0.0/15", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-137-135-16-nexthop-internet", "properties": { "addressprefix": "137.135.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-138-196-16-nexthop-internet", "properties": { "addressprefix": "138.196.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-138-91-16-nexthop-internet", "properties": { "addressprefix": "138.91.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-139-217-16-nexthop-internet", "properties": { "addressprefix": "139.217.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-139-219-16-nexthop-internet", "properties": { "addressprefix": "139.219.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-141-251-16-nexthop-internet", "properties": { "addressprefix": "141.251.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-146-147-16-nexthop-internet", "properties": { "addressprefix": "146.147.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-147-243-16-nexthop-internet", "properties": { "addressprefix": "147.243.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-150-171-16-nexthop-internet", "properties": { "addressprefix": "150.171.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-150-242-48-22-nexthop-internet", "properties": { "addressprefix": "150.242.48.0/22", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-157-54-15-nexthop-internet", "properties": { "addressprefix": "157.54.0.0/15", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-157-56-14-nexthop-internet", "properties": { "addressprefix": "157.56.0.0/14", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-157-60-16-nexthop-internet", "properties": { "addressprefix": "157.60.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-167-105-16-nexthop-internet", "properties": { "addressprefix": "167.105.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-167-220-16-nexthop-internet", "properties": { "addressprefix": "167.220.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-168-61-16-nexthop-internet", "properties": { "addressprefix": "168.61.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-168-62-15-nexthop-internet", "properties": { "addressprefix": "168.62.0.0/15", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-191-232-13-nexthop-internet", "properties": { "addressprefix": "191.232.0.0/13", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-192-197-157-24-nexthop-internet", "properties": { "addressprefix": "192.197.157.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-192-32-16-nexthop-internet", "properties": { "addressprefix": "192.32.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-192-48-225-24-nexthop-internet", "properties": { "addressprefix": "192.48.225.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-192-84-159-24-nexthop-internet", "properties": { "addressprefix": "192.84.159.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-192-84-160-23-nexthop-internet", "properties": { "addressprefix": "192.84.160.0/23", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-193-149-64-19-nexthop-internet", "properties": { "addressprefix": "193.149.64.0/19", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-193-221-113-24-nexthop-internet", "properties": { "addressprefix": "193.221.113.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-194-110-197-24-nexthop-internet", "properties": { "addressprefix": "194.110.197.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-194-69-96-19-nexthop-internet", "properties": { "addressprefix": "194.69.96.0/19", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-198-105-232-22-nexthop-internet", "properties": { "addressprefix": "198.105.232.0/22", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-198-200-130-24-nexthop-internet", "properties": { "addressprefix": "198.200.130.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-198-206-164-24-nexthop-internet", "properties": { "addressprefix": "198.206.164.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-199-103-122-24-nexthop-internet", "properties": { "addressprefix": "199.103.122.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-199-103-90-23-nexthop-internet", "properties": { "addressprefix": "199.103.90.0/23", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-199-242-32-20-nexthop-internet", "properties": { "addressprefix": "199.242.32.0/20", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-199-242-48-21-nexthop-internet", "properties": { "addressprefix": "199.242.48.0/21", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-199-30-16-20-nexthop-internet", "properties": { "addressprefix": "199.30.16.0/20", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-199-60-28-24-nexthop-internet", "properties": { "addressprefix": "199.60.28.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-199-74-210-24-nexthop-internet", "properties": { "addressprefix": "199.74.210.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-20-128-16-nexthop-internet", "properties": { "addressprefix": "20.128.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-20-135-16-nexthop-internet", "properties": { "addressprefix": "20.135.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-20-136-16-nexthop-internet", "properties": { "addressprefix": "20.136.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-20-140-15-nexthop-internet", "properties": { "addressprefix": "20.140.0.0/15", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-20-143-16-nexthop-internet", "properties": { "addressprefix": "20.143.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-20-144-14-nexthop-internet", "properties": { "addressprefix": "20.144.0.0/14", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-20-150-15-nexthop-internet", "properties": { "addressprefix": "20.150.0.0/15", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-20-160-12-nexthop-internet", "properties": { "addressprefix": "20.160.0.0/12", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-20-176-14-nexthop-internet", "properties": { "addressprefix": "20.176.0.0/14", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-20-180-14-nexthop-internet", "properties": { "addressprefix": "20.180.0.0/14", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-20-184-13-nexthop-internet", "properties": { "addressprefix": "20.184.0.0/13", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-20-192-10-nexthop-internet", "properties": { "addressprefix": "20.192.0.0/10", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-20-33-16-nexthop-internet", "properties": { "addressprefix": "20.33.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-20-34-15-nexthop-internet", "properties": { "addressprefix": "20.34.0.0/15", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-20-36-14-nexthop-internet", "properties": { "addressprefix": "20.36.0.0/14", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-20-40-13-nexthop-internet", "properties": { "addressprefix": "20.40.0.0/13", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-20-48-12-nexthop-internet", "properties": { "addressprefix": "20.48.0.0/12", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-20-64-10-nexthop-internet", "properties": { "addressprefix": "20.64.0.0/10", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-202-89-224-20-nexthop-internet", "properties": { "addressprefix": "202.89.224.0/20", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-204-13-120-21-nexthop-internet", "properties": { "addressprefix": "204.13.120.0/21", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-204-14-180-22-nexthop-internet", "properties": { "addressprefix": "204.14.180.0/22", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-204-152-140-23-nexthop-internet", "properties": { "addressprefix": "204.152.140.0/23", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-204-152-18-23-nexthop-internet", "properties": { "addressprefix": "204.152.18.0/23", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-204-231-192-24-nexthop-internet", "properties": { "addressprefix": "204.231.192.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-204-231-194-23-nexthop-internet", "properties": { "addressprefix": "204.231.194.0/23", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-204-231-197-24-nexthop-internet", "properties": { "addressprefix": "204.231.197.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-204-231-198-23-nexthop-internet", "properties": { "addressprefix": "204.231.198.0/23", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-204-231-200-21-nexthop-internet", "properties": { "addressprefix": "204.231.200.0/21", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-204-231-208-20-nexthop-internet", "properties": { "addressprefix": "204.231.208.0/20", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-204-231-236-24-nexthop-internet", "properties": { "addressprefix": "204.231.236.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-204-79-135-24-nexthop-internet", "properties": { "addressprefix": "204.79.135.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-204-79-179-24-nexthop-internet", "properties": { "addressprefix": "204.79.179.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-204-79-180-24-nexthop-internet", "properties": { "addressprefix": "204.79.180.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-204-79-181-24-nexthop-internet", "properties": { "addressprefix": "204.79.181.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-204-79-188-24-nexthop-internet", "properties": { "addressprefix": "204.79.188.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-204-79-195-24-nexthop-internet", "properties": { "addressprefix": "204.79.195.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-204-79-196-23-nexthop-internet", "properties": { "addressprefix": "204.79.196.0/23", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-204-79-252-24-nexthop-internet", "properties": { "addressprefix": "204.79.252.0/24", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-205-174-224-20-nexthop-internet", "properties": { "addressprefix": "205.174.224.0/20", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-206-138-168-21-nexthop-internet", "properties": { "addressprefix": "206.138.168.0/21", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-206-191-224-19-nexthop-internet", "properties": { "addressprefix": "206.191.224.0/19", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-207-46-16-nexthop-internet", "properties": { "addressprefix": "207.46.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-207-68-128-18-nexthop-internet", "properties": { "addressprefix": "207.68.128.0/18", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-208-68-136-21-nexthop-internet", "properties": { "addressprefix": "208.68.136.0/21", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-208-76-44-22-nexthop-internet", "properties": { "addressprefix": "208.76.44.0/22", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-208-84-21-nexthop-internet", "properties": { "addressprefix": "208.84.0.0/21", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-209-240-192-19-nexthop-internet", "properties": { "addressprefix": "209.240.192.0/19", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-213-199-128-18-nexthop-internet", "properties": { "addressprefix": "213.199.128.0/18", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-216-220-208-20-nexthop-internet", "properties": { "addressprefix": "216.220.208.0/20", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-216-32-180-22-nexthop-internet", "properties": { "addressprefix": "216.32.180.0/22", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-23-96-13-nexthop-internet", "properties": { "addressprefix": "23.96.0.0/13", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-40-64-10-nexthop-internet", "properties": { "addressprefix": "40.64.0.0/10", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-42-159-16-nexthop-internet", "properties": { "addressprefix": "42.159.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-51-10-15-nexthop-internet", "properties": { "addressprefix": "51.10.0.0/15", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-51-103-16-nexthop-internet", "properties": { "addressprefix": "51.103.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-51-104-15-nexthop-internet", "properties": { "addressprefix": "51.104.0.0/15", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-51-107-16-nexthop-internet", "properties": { "addressprefix": "51.107.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-51-116-16-nexthop-internet", "properties": { "addressprefix": "51.116.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-51-120-128-17-nexthop-internet", "properties": { "addressprefix": "51.120.128.0/17", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-51-120-16-nexthop-internet", "properties": { "addressprefix": "51.120.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-51-124-16-nexthop-internet", "properties": { "addressprefix": "51.124.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-51-13-17-nexthop-internet", "properties": { "addressprefix": "51.13.0.0/17", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-51-132-16-nexthop-internet", "properties": { "addressprefix": "51.132.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-51-136-15-nexthop-internet", "properties": { "addressprefix": "51.136.0.0/15", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-51-138-16-nexthop-internet", "properties": { "addressprefix": "51.138.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-51-140-14-nexthop-internet", "properties": { "addressprefix": "51.140.0.0/14", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-51-144-15-nexthop-internet", "properties": { "addressprefix": "51.144.0.0/15", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-51-18-16-nexthop-internet", "properties": { "addressprefix": "51.18.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-51-4-15-nexthop-internet", "properties": { "addressprefix": "51.4.0.0/15", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-51-51-16-nexthop-internet", "properties": { "addressprefix": "51.51.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-51-53-16-nexthop-internet", "properties": { "addressprefix": "51.53.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-51-8-16-nexthop-internet", "properties": { "addressprefix": "51.8.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-52-112-14-nexthop-internet", "properties": { "addressprefix": "52.112.0.0/14", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-52-125-16-nexthop-internet", "properties": { "addressprefix": "52.125.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-52-126-15-nexthop-internet", "properties": { "addressprefix": "52.126.0.0/15", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-52-130-15-nexthop-internet", "properties": { "addressprefix": "52.130.0.0/15", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-52-132-14-nexthop-internet", "properties": { "addressprefix": "52.132.0.0/14", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-52-136-13-nexthop-internet", "properties": { "addressprefix": "52.136.0.0/13", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-52-145-16-nexthop-internet", "properties": { "addressprefix": "52.145.0.0/16", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-52-146-15-nexthop-internet", "properties": { "addressprefix": "52.146.0.0/15", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-52-148-14-nexthop-internet", "properties": { "addressprefix": "52.148.0.0/14", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-52-152-13-nexthop-internet", "properties": { "addressprefix": "52.152.0.0/13", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-52-160-11-nexthop-internet", "properties": { "addressprefix": "52.160.0.0/11", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-52-224-11-nexthop-internet", "properties": { "addressprefix": "52.224.0.0/11", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-52-96-12-nexthop-internet", "properties": { "addressprefix": "52.96.0.0/12", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-64-4-18-nexthop-internet", "properties": { "addressprefix": "64.4.0.0/18", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-65-52-14-nexthop-internet", "properties": { "addressprefix": "65.52.0.0/14", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-66-119-144-20-nexthop-internet", "properties": { "addressprefix": "66.119.144.0/20", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-70-37-128-18-nexthop-internet", "properties": { "addressprefix": "70.37.128.0/18", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-70-37-17-nexthop-internet", "properties": { "addressprefix": "70.37.0.0/17", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-91-190-216-21-nexthop-internet", "properties": { "addressprefix": "91.190.216.0/21", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_mi-94-245-64-18-nexthop-internet", "properties": { "addressprefix": "94.245.64.0/18", "nextHopType": "Internet" }},
{"name": "Microsoft.Sql-managedInstances_UseOnly_subnet-to-vnetlocal", "properties": { "addressprefix": "[parameters('managedInstanceSubnetPrefix')]", "nextHopType": "VnetLocal" }},
{"name": "OutboundTraffictoPaloAlto", "properties": { "addressprefix": "0.0.0.0/0", "nextHopType": "VirtualAppliance", "nextHopIpAddress": "[parameters('FirewallIPAddress')]" }}

          ]
      }
  },


       {
            "type": "Microsoft.Sql/managedInstances",
            "apiVersion": "2018-06-01-preview",
            "dependsOn":[
                "[parameters('routeTableToAzureService')]",
                "[parameters('nsgForManagedInstanceSubnet')]"
            ],
            "identity": {
                "type": "SystemAssigned"
            },
            "location": "[parameters('location')]",
            "name": "[parameters('managedInstanceName')]",
            "sku": {
                "name": "[parameters('skuName')]"
            },
            "properties": {
                "administratorLogin": "[parameters('administratorLogin')]",
                "administratorLoginPassword": "[parameters('administratorLoginPassword')]",
                "subnetId": "[parameters('subnetId')]",
                "storageSizeInGB": "[parameters('storageSizeInGB')]",
                "vCores": "[parameters('vCores')]",
                "licenseType": "[parameters('licenseType')]"
            }
        }    

  ]
}

DEPLOY


  # these key-value pairs are passed into the ARM Template's `parameters` block
  parameters = {
    "virtualNetworkAddressPrefix" = var.address_space_string_format
    "managedInstanceSubnetPrefix" = var.db1_subnet_adress_space
    "routeTableToAzureService"    = azurerm_route_table.rt-uemcbmpdb1p1.name
    "nsgForManagedInstanceSubnet" = azurerm_network_security_group.nsg-uemcbmpdb1p1.name
    "FirewallIPAddress"           = var.FirewallIPAddress
    "location"                    = module.applicationrg.resource_group_location
    "managedInstanceName"         = "smi-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
    "administratorLogin"          = var.managedInstanceadministratorLogin
    "administratorLoginPassword"  = var.managedInstanceadministratorLoginPassword
    "skuName"                     = var.managedInstanceskuName
    "subnetId"                    = azurerm_subnet.bmpdb1subnet.id
    "licenseType"                 = var.managedInstancelicenseType
  }

  deployment_mode = "Incremental"

  depends_on = [
    azurerm_subnet.bmpdb1subnet,
    azurerm_network_security_group.nsg-uemcbmpdb1p1,    
    azurerm_subnet_network_security_group_association.bmpdb1subnet_nsg_association,
    azurerm_route_table.rt-uemcbmpdb1p1,
    azurerm_subnet_route_table_association.bmpdb1subnet_subnet,
  ]

  timeouts {
    create = "15h"
    delete = "360m"
  }
}

