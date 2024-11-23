resource "azurerm_resource_group_template_deployment" "sql_mi_arm_deployment" {
    deployment_mode     = "Incremental"
    name                = var.environment == "p" ? "Microsoft.SQLManagedInstance.createManagedInstance_d7b142a065ed4" : "sql_mi_arm_deployment"
    resource_group_name = module.databricksrg.resource_group_name
    parameters_content  = jsonencode(
        {
            administratorLogin              = {
                value = "${var.managedInstanceadministratorLogin}"
            }
            administratorLoginPassword      = {
                value = "${var.managedInstanceadministratorLoginPassword}"
            }
            collation                       = {
                value = "SQL_Latin1_General_CP1_CI_AS"
            }
            createNSG                       = {
                value = false
            }
            createRT                        = {
                value = false
            }
            dnsZonePartner                  = {
                value = ""
            }
            hardwareFamily                  = {
                value = "Gen5"
            }
            licenseType                     = {
                value = "LicenseIncluded"
            }
            location                        = {
                value = "eastus"
            }
            managedInstanceName             = {
                value = "${var.environment == "p" ? "co-p-eastus-databricks-sql-mi" : "smi-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"}"
            }
            nsgForPublicEndpoint            = {
                value = "${var.environment == "p" ? "allowFromAzureCloudTo3342NSG" : "${module.databricksnsgsqlmi.network_security_group_name}"}"
            }
            proxyOverride                   = {
                value = "Proxy"
            }
            publicDataEndpointEnabled       = {
                value = false
            }
            skuEdition                      = {
                value = "GeneralPurpose"
            }
            skuName                         = {
                value = "GP_Gen5"
            }
            storageSizeInGB                 = {
                value = 256
            }
            subnetName                      = {
                value = "${azurerm_subnet.sqlmi.name}"
            }
            timezoneId                      = {
                value = "UTC"
            }
            vCores                          = {
                value = 8
            }
            virtualNetworkName              = {
                value = "${var.spi_vnet_name}"
            }
            virtualNetworkResourceGroupName = {
                value = "${var.spi_vnet_resource_group_name}"
            }
        }
    )
    tags                = {
        "marketplaceItemId" = "Microsoft.SQLManagedInstance"
        "primaryResourceId" = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/co-p-eastus-spidatabricks-rg/providers/Microsoft.Sql/managedInstances/co-p-eastus-databricks-sql-mi"
    }
    template_content    = jsonencode(
        {
            "$schema"        = "http://schema.management.azure.com/schemas/2014-04-01-preview/deploymentTemplate.json#"
            contentVersion = "1.0.0.1"
            parameters     = {
                administratorLogin              = {
                    type = "String"
                }
                administratorLoginPassword      = {
                    type = "SecureString"
                }
                collation                       = {
                    defaultValue = "SQL_Latin1_General_CP1_CI_AS"
                    type         = "String"
                }
                createNSG                       = {
                    defaultValue = false
                    type         = "Bool"
                }
                createRT                        = {
                    defaultValue = false
                    type         = "Bool"
                }
                dnsZonePartner                  = {
                    defaultValue = ""
                    type         = "String"
                }
                hardwareFamily                  = {
                    defaultValue = "Gen4"
                    type         = "String"
                }
                licenseType                     = {
                    defaultValue = "LicenseIncluded"
                    type         = "String"
                }
                location                        = {
                    type = "String"
                }
                managedInstanceName             = {
                    type = "String"
                }
                nsgForPublicEndpoint            = {
                    defaultValue = ""
                    type         = "String"
                }
                proxyOverride                   = {
                    defaultValue = ""
                    type         = "String"
                }
                publicDataEndpointEnabled       = {
                    defaultValue = false
                    type         = "Bool"
                }
                skuEdition                      = {
                    defaultValue = "GeneralPurpose"
                    type         = "String"
                }
                skuName                         = {
                    defaultValue = "GP_Gen4"
                    type         = "String"
                }
                storageSizeInGB                 = {
                    defaultValue = 32
                    type         = "Int"
                }
                subnetName                      = {
                    type = "String"
                }
                timezoneId                      = {
                    defaultValue = "UTC"
                    type         = "String"
                }
                vCores                          = {
                    defaultValue = 16
                    type         = "Int"
                }
                virtualNetworkName              = {
                    type = "String"
                }
                virtualNetworkResourceGroupName = {
                    type = "String"
                }
            }
            resources      = [
                {
                    apiVersion = "2017-10-01"
                    condition  = "[parameters('createNSG')]"
                    location   = "[parameters('location')]"
                    name       = "[variables('networkSecurityGroupName')]"
                    properties = {
                        copy = [
                            {
                                count = "[length(variables('unionNSGs'))]"
                                input = {
                                    name       = "[variables('unionNSGs')[copyIndex('securityRules')].name]"
                                    properties = {
                                        "[if(contains(variables('unionNSGs')[copyIndex('securityRules')].properties, 'destinationPortRange'), 'destinationPortRange', 'destinationPortRanges')]" = "[if(contains(variables('unionNSGs')[copyIndex('securityRules')].properties, 'destinationPortRange'), variables('unionNSGs')[copyIndex('securityRules')].properties.destinationPortRange, variables('unionNSGs')[copyIndex('securityRules')].properties.destinationPortRanges)]"
                                        access                                                                                                                                                 = "[variables('unionNSGs')[copyIndex('securityRules')].properties.access]"
                                        description                                                                                                                                            = "[variables('unionNSGs')[copyIndex('securityRules')].properties.description]"
                                        destinationAddressPrefix                                                                                                                               = "[replace(variables('unionNSGs')[copyIndex('securityRules')].properties.destinationAddressPrefix, '<subnet_range>', reference(resourceId(parameters('virtualNetworkResourceGroupName'), 'Microsoft.Network/virtualNetworks/subnets', parameters('virtualNetworkName'), parameters('subnetName')), '2017-10-01').addressPrefix)]"
                                        direction                                                                                                                                              = "[variables('unionNSGs')[copyIndex('securityRules')].properties.direction]"
                                        priority                                                                                                                                               = "[variables('unionNSGs')[copyIndex('securityRules')].properties.priority]"
                                        protocol                                                                                                                                               = "[variables('unionNSGs')[copyIndex('securityRules')].properties.protocol]"
                                        sourceAddressPrefix                                                                                                                                    = "[replace(variables('unionNSGs')[copyIndex('securityRules')].properties.sourceAddressPrefix, '<subnet_range>', reference(resourceId(parameters('virtualNetworkResourceGroupName'), 'Microsoft.Network/virtualNetworks/subnets', parameters('virtualNetworkName'), parameters('subnetName')), '2017-10-01').addressPrefix)]"
                                        sourcePortRange                                                                                                                                        = "[variables('unionNSGs')[copyIndex('securityRules')].properties.sourcePortRange]"
                                    }
                                }
                                name  = "securityRules"
                            },
                        ]
                    }
                    type       = "Microsoft.Network/networkSecurityGroups"
                },
                {
                    apiVersion = "2018-02-01"
                    condition  = "[parameters('createRT')]"
                    location   = "[parameters('location')]"
                    name       = "[variables('routeTableName')]"
                    properties = {
                        copy                       = [
                            {
                                count = "[length(variables('routesUnion'))]"
                                input = {
                                    name       = "[concat('SqlManagement_', copyIndex('routes'))]"
                                    properties = {
                                        addressPrefix = "[replace(variables('routesUnion')[copyIndex('routes')].properties.addressPrefix, '<subnet_range>', reference(resourceId(parameters('virtualNetworkResourceGroupName'), 'Microsoft.Network/virtualNetworks/subnets', parameters('virtualNetworkName'), parameters('subnetName')), '2017-10-01').addressPrefix)]"
                                        nextHopType   = "[variables('routesUnion')[copyIndex('routes')].properties.nextHopType]"
                                    }
                                }
                                name  = "routes"
                            },
                        ]
                        disableBgpRoutePropagation = false
                    }
                    type       = "Microsoft.Network/routeTables"
                },
                {
                    apiVersion    = "2017-05-10"
                    dependsOn     = [
                        "[variables('routeTableName')]",
                        "[variables('networkSecurityGroupName')]",
                    ]
                    name          = "updateSubnetTemplate"
                    properties    = {
                        mode     = "Incremental"
                        template = {
                            "$schema"       = "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#"
                            contentVersion = "1.0.0.0"
                            resources      = [
                                {
                                    apiVersion = "2018-04-01"
                                    name       = "[concat(parameters('virtualNetworkName'), '/', parameters('subnetName'))]"
                                    properties = {
                                        addressPrefix        = "[reference(resourceId(parameters('virtualNetworkResourceGroupName'), 'Microsoft.Network/virtualNetworks/subnets', parameters('virtualNetworkName'), parameters('subnetName')), '2018-04-01').addressPrefix]"
                                        delegations          = [
                                            {
                                                name       = "[concat('dlg-', parameters('managedInstanceName'))]"
                                                properties = {
                                                    serviceName = "Microsoft.Sql/managedInstances"
                                                }
                                            },
                                        ]
                                        networkSecurityGroup = {
                                            id = "[if(parameters('createNSG'), resourceId('Microsoft.Network/networkSecurityGroups', variables('networkSecurityGroupName')), reference(resourceId(parameters('virtualNetworkResourceGroupName'), 'Microsoft.Network/virtualNetworks/subnets', parameters('virtualNetworkName'), parameters('subnetName')), '2018-04-01').networkSecurityGroup.id)]"
                                        }
                                        routeTable           = {
                                            id = "[if(parameters('createRT'), resourceId('Microsoft.Network/routeTables', variables('routeTableName')), reference(resourceId(parameters('virtualNetworkResourceGroupName'), 'Microsoft.Network/virtualNetworks/subnets', parameters('virtualNetworkName'), parameters('subnetName')), '2018-04-01').routeTable.id)]"
                                        }
                                    }
                                    type       = "Microsoft.Network/virtualNetworks/subnets"
                                },
                            ]
                        }
                    }
                    resourceGroup = "[parameters('virtualNetworkResourceGroupName')]"
                    type          = "Microsoft.Resources/deployments"
                },
                {
                    apiVersion = "2015-05-01-preview"
                    dependsOn  = [
                        "updateSubnetTemplate",
                    ]
                    identity   = {
                        type = "SystemAssigned"
                    }
                    location   = "[parameters('location')]"
                    name       = "[parameters('managedInstanceName')]"
                    properties = {
                        administratorLogin         = "[parameters('administratorLogin')]"
                        administratorLoginPassword = "[parameters('administratorLoginPassword')]"
                        collation                  = "[parameters('collation')]"
                        dnsZonePartner             = "[parameters('dnsZonePartner')]"
                        hardwareFamily             = "[parameters('hardwareFamily')]"
                        licenseType                = "[parameters('licenseType')]"
                        proxyOverride              = "[parameters('proxyOverride')]"
                        publicDataEndpointEnabled  = "[parameters('publicDataEndpointEnabled')]"
                        storageSizeInGB            = "[parameters('storageSizeInGB')]"
                        subnetId                   = "[resourceId(parameters('virtualNetworkResourceGroupName'), 'Microsoft.Network/virtualNetworks/subnets', parameters('virtualNetworkName'), parameters('subnetName'))]"
                        timezoneId                 = "[parameters('timezoneId')]"
                        vCores                     = "[parameters('vCores')]"
                    }
                    sku        = {
                        name = "[parameters('skuName')]"
                        tier = "[parameters('skuEdition')]"
                    }
                    type       = "Microsoft.Sql/managedInstances"
                },
            ]
            variables      = {
                AustraliaCentral             = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "13.72.242.159/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "20.36.46.90/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "20.36.105.0/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az01"
                            properties = {
                                addressPrefix = "20.36.108.0/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "20.36.75.75/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "20.36.46.220/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                AustraliaCentral2            = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "13.72.246.181/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "20.36.75.170/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "20.36.113.0/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az01"
                            properties = {
                                addressPrefix = "20.36.115.160/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "20.36.46.202/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "20.36.75.114/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                AustraliaEast                = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "191.239.183.225/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "52.187.228.131/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "13.75.149.87/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup1"
                            properties = {
                                addressPrefix = "40.79.161.1/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az01"
                            properties = {
                                addressPrefix = "13.70.72.160/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az02"
                            properties = {
                                addressPrefix = "40.79.170.160/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az03"
                            properties = {
                                addressPrefix = "40.79.162.64/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "52.243.87.200/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "40.126.238.47/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                AustraliaSoutheast           = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "40.126.247.207/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "52.255.58.135/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "13.73.109.251/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup1"
                            properties = {
                                addressPrefix = "13.77.48.10/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az00"
                            properties = {
                                addressPrefix = "13.77.50.192/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "52.237.244.169/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "52.255.51.21/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                BrazilSouth                  = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "23.97.103.225/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "104.214.15.225/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "104.41.11.5/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az01"
                            properties = {
                                addressPrefix = "191.233.203.160/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "40.74.254.227/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "191.232.163.58/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                CanadaCentral                = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "40.85.225.6/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "40.79.47.96/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "40.85.224.249/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup1"
                            properties = {
                                addressPrefix = "52.228.35.221/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az01"
                            properties = {
                                addressPrefix = "13.71.170.160/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az02"
                            properties = {
                                addressPrefix = "20.38.146.192/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "52.242.36.170/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "52.233.30.2/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                CanadaEast                   = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "40.86.227.96/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "40.85.225.34/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "40.86.226.166/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup1"
                            properties = {
                                addressPrefix = "52.242.30.154/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az00"
                            properties = {
                                addressPrefix = "40.69.106.192/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "52.233.38.82/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "52.235.36.131/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                CentralIndia                 = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "52.172.153.14/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "52.172.13.240/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "104.211.96.159/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az01"
                            properties = {
                                addressPrefix = "104.211.81.160/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "13.71.119.167/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "52.172.193.99/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                CentralUS                    = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "40.113.223.225/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "40.122.151.225/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "23.99.160.139/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup1"
                            properties = {
                                addressPrefix = "13.67.215.62/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup2"
                            properties = {
                                addressPrefix = "52.182.137.15/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az01"
                            properties = {
                                addressPrefix = "104.208.16.96/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az02"
                            properties = {
                                addressPrefix = "52.182.138.224/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az03"
                            properties = {
                                addressPrefix = "13.89.170.224/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "40.70.72.228/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "52.165.237.178/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                CentralUSeuap                = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "52.180.179.200/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "52.180.179.241/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "52.180.176.154/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az00"
                            properties = {
                                addressPrefix = "40.78.203.128/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "40.70.72.228/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "40.69.161.215/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                EastAsia                     = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "13.70.7.154/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "13.70.7.192/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "191.234.2.139/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup1"
                            properties = {
                                addressPrefix = "52.175.33.150/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az00"
                            properties = {
                                addressPrefix = "13.75.36.32/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "52.187.185.17/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "13.94.47.38/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                EastUS                       = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "23.96.103.225/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "52.170.92.194/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "191.238.6.43/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup1"
                            properties = {
                                addressPrefix = "40.121.158.30/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup2"
                            properties = {
                                addressPrefix = "40.79.153.12/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az01"
                            properties = {
                                addressPrefix = "40.71.10.224/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az02"
                            properties = {
                                addressPrefix = "40.78.226.224/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az03"
                            properties = {
                                addressPrefix = "40.79.154.0/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az04"
                            properties = {
                                addressPrefix = "40.79.154.224/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "13.64.155.40/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "40.71.215.148/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                EastUS2                      = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "191.236.199.225/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "104.209.149.14/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "191.239.224.107/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup1"
                            properties = {
                                addressPrefix = "40.79.84.180/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup2"
                            properties = {
                                addressPrefix = "52.177.185.181/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup3"
                            properties = {
                                addressPrefix = "52.167.104.0/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az01"
                            properties = {
                                addressPrefix = "104.208.144.96/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az02"
                            properties = {
                                addressPrefix = "52.167.106.96/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az03"
                            properties = {
                                addressPrefix = "40.70.146.96/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "52.173.243.204/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "52.225.130.171/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                EastUS2euap                  = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "52.225.186.89/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "52.225.191.250/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "52.225.188.46/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup1"
                            properties = {
                                addressPrefix = "52.138.89.3/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az01"
                            properties = {
                                addressPrefix = "40.75.34.64/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az02"
                            properties = {
                                addressPrefix = "40.74.147.0/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az03"
                            properties = {
                                addressPrefix = "52.138.90.96/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "52.173.243.204/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "40.79.32.162/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                FranceCentral                = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "52.166.115.40/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "40.79.137.0/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup1"
                            properties = {
                                addressPrefix = "40.79.129.1/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az01"
                            properties = {
                                addressPrefix = "40.79.130.160/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az02"
                            properties = {
                                addressPrefix = "40.79.138.64/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az03"
                            properties = {
                                addressPrefix = "40.79.146.64/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "52.136.139.224/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "52.143.139.82/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                FranceSouth                  = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "52.233.155.183/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "40.79.177.0/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az00"
                            properties = {
                                addressPrefix = "40.79.178.192/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "52.143.136.162/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "52.136.140.157/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                GermanyNorth                 = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "\u200b40.90.140.88/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "51.116.56.0/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az00"
                            properties = {
                                addressPrefix = "51.116.58.32/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "51.116.156.0/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "51.116.60.1/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                GermanyWestCentral           = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "40.90.141.43/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "51.116.152.0/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az00"
                            properties = {
                                addressPrefix = "51.116.154.96/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "51.116.60.0/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "51.116.156.1/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                JapanEast                    = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "104.41.167.225/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "104.215.60.165/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "191.237.240.43/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup1"
                            properties = {
                                addressPrefix = "13.78.61.196/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup2"
                            properties = {
                                addressPrefix = "40.79.184.8/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az01"
                            properties = {
                                addressPrefix = "13.78.106.224/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az02"
                            properties = {
                                addressPrefix = "40.79.186.96/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az03"
                            properties = {
                                addressPrefix = "40.79.194.0/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "52.175.156.251/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "52.185.145.40/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                JapanWest                    = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "40.74.112.5/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "104.215.7.192/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "191.238.68.11/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup1"
                            properties = {
                                addressPrefix = "104.214.148.156/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az00"
                            properties = {
                                addressPrefix = "40.74.100.192/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "52.185.154.136/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "104.215.17.87/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                KoreaCentral                 = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "52.231.35.156/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "52.231.201.121/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "52.231.32.42/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az01"
                            properties = {
                                addressPrefix = "52.231.18.160/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az02"
                            properties = {
                                addressPrefix = "20.44.26.192/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "52.231.202.76/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "52.231.30.200/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                KoreaSouth                   = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "52.231.207.95/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "52.231.39.180/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "52.231.200.86/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az00"
                            properties = {
                                addressPrefix = "52.231.146.224/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "52.231.34.21/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "52.231.206.187/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                NorthCentralUS               = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "65.52.59.57/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "168.62.244.242/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "23.98.55.75/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup1"
                            properties = {
                                addressPrefix = "23.96.178.199/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az00"
                            properties = {
                                addressPrefix = "52.162.107.128/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "40.74.254.227/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "23.96.185.63/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                NorthEurope                  = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "104.46.95.225/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "40.85.81.65/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "191.235.193.75/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup1"
                            properties = {
                                addressPrefix = "40.113.93.91/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az01"
                            properties = {
                                addressPrefix = "13.69.227.96/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az02"
                            properties = {
                                addressPrefix = "52.138.226.96/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az03"
                            properties = {
                                addressPrefix = "13.74.107.96/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "52.233.130.100/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "52.164.200.174/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                NorwayEast                   = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "13.104.148.66/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "51.120.96.0/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az00"
                            properties = {
                                addressPrefix = "51.120.98.32/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "51.120.218.128/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "51.120.100.1/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                NorwayWest                   = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "13.104.146.196/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "51.120.216.0/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az00"
                            properties = {
                                addressPrefix = "51.120.218.32/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "51.120.100.0/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "51.120.218.129/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                SouthAfricaNorth             = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "104.211.228.159/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "102.133.167.242/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "102.133.152.0/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az00"
                            properties = {
                                addressPrefix = "102.133.155.224/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "102.133.72.35/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "40.127.3.232/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                SouthAfricaWest              = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "40.90.17.10/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "\u200b40.90.143.143/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "102.133.24.0/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az00"
                            properties = {
                                addressPrefix = "102.133.27.224/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "102.133.160.35/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "102.133.72.42/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                SouthCentralUS               = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "104.215.79.225/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "23.102.135.225/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "23.98.162.75/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup1"
                            properties = {
                                addressPrefix = "13.66.62.124/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az01"
                            properties = {
                                addressPrefix = "104.214.19.0/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "23.96.243.93/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "13.84.52.76/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                SouthIndia                   = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "52.172.13.242/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "52.172.152.94/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "104.211.224.146/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az00"
                            properties = {
                                addressPrefix = "40.78.194.192/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "52.172.204.185/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "13.71.123.234/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                SoutheastAsia                = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "104.215.175.225/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "13.67.54.32/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "23.100.117.95/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup1"
                            properties = {
                                addressPrefix = "104.43.15.0/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az01"
                            properties = {
                                addressPrefix = "40.78.234.64/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az02"
                            properties = {
                                addressPrefix = "13.67.8.192/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az03"
                            properties = {
                                addressPrefix = "23.98.82.128/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "23.99.97.255/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "52.230.122.197/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                SwitzerlandNorth             = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "40.90.136.81/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "51.107.56.0/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az00"
                            properties = {
                                addressPrefix = "51.107.58.32/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "51.107.156.0/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "51.107.60.1/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                SwitzerlandWest              = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "\u200b40.90.136.207/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "51.107.152.0/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az00"
                            properties = {
                                addressPrefix = "51.107.154.32/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "51.107.60.0/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "51.107.156.1/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                UAECentral                   = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "40.90.16.78/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "40.90.16.107/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "20.37.72.64/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az00"
                            properties = {
                                addressPrefix = "20.37.76.0/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "40.123.219.239/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "20.45.75.230/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                UAENorth                     = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "40.90.16.106/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "40.90.16.77/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "65.52.248.0/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az01"
                            properties = {
                                addressPrefix = "65.52.252.0/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "20.45.75.228/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "40.123.207.224/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                UKSouth                      = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "51.140.187.124/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "51.141.11.149/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "51.140.184.11/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup1"
                            properties = {
                                addressPrefix = "51.105.64.0/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az01"
                            properties = {
                                addressPrefix = "51.140.146.224/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az02"
                            properties = {
                                addressPrefix = "51.105.66.192/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az03"
                            properties = {
                                addressPrefix = "51.105.74.192/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "51.142.215.251/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "51.140.127.51/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                UKWest                       = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "51.141.12.46/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "51.140.189.63/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "51.141.8.11/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az00"
                            properties = {
                                addressPrefix = "51.140.210.224/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "13.87.39.133/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "51.141.39.175/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                WestCentralUS                = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "52.161.24.60/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "40.77.22.227/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "13.78.145.25/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup1"
                            properties = {
                                addressPrefix = "52.161.100.158/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az00"
                            properties = {
                                addressPrefix = "13.71.195.0/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "52.183.64.43/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "13.78.182.82/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                WestEurope                   = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "104.214.215.225/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "52.232.84.151/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "191.237.232.75/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup1"
                            properties = {
                                addressPrefix = "40.68.37.158/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az01"
                            properties = {
                                addressPrefix = "13.69.64.96/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az02"
                            properties = {
                                addressPrefix = "52.236.186.96/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az03"
                            properties = {
                                addressPrefix = "13.69.106.96/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "52.169.6.70/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "52.166.50.138/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                WestIndia                    = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "104.211.161.111/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "13.76.96.63/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "104.211.160.80/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az00"
                            properties = {
                                addressPrefix = "104.211.146.192/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "13.71.119.167/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "104.211.187.232/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                WestUS                       = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "104.42.23.250/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "13.64.66.183/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "23.99.34.75/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_backup1"
                            properties = {
                                addressPrefix = "104.42.238.205/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az00"
                            properties = {
                                addressPrefix = "40.112.243.128/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "13.92.242.41/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "104.42.96.175/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                WestUS2                      = {
                    DSMS                          = [
                        {
                            name       = "SqlManagement_security_primary"
                            properties = {
                                addressPrefix = "13.66.230.240/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_security_backup"
                            properties = {
                                addressPrefix = "104.40.19.34/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane                  = [
                        {
                            name       = "SqlManagement_controlPlane_primary"
                            properties = {
                                addressPrefix = "13.66.226.202/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    controlPlane_SqlManagementTag = [
                        {
                            name       = "SqlManagement_controlPlane_az01"
                            properties = {
                                addressPrefix = "13.66.140.96/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az02"
                            properties = {
                                addressPrefix = "40.78.242.192/27"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_controlPlane_az03"
                            properties = {
                                addressPrefix = "40.78.250.128/27"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                    runners                       = [
                        {
                            name       = "SqlManagement_automation_backup"
                            properties = {
                                addressPrefix = "13.78.181.246/32"
                                nextHopType   = "Internet"
                            }
                        },
                        {
                            name       = "SqlManagement_automation_primary"
                            properties = {
                                addressPrefix = "40.65.124.161/32"
                                nextHopType   = "Internet"
                            }
                        },
                    ]
                }
                allowFromAzureCloudTo3342NSG = [
                    {
                        name       = "public_endpoint_inbound"
                        properties = {
                            access                   = "Allow"
                            description              = "Allow inbound traffic to Managed Instance through public endpoint"
                            destinationAddressPrefix = "*"
                            destinationPortRange     = "3342"
                            direction                = "Inbound"
                            priority                 = 1300
                            protocol                 = "Tcp"
                            sourceAddressPrefix      = "AzureCloud"
                            sourcePortRange          = "*"
                        }
                    },
                ]
                allowFromInternetTo3342NSG   = [
                    {
                        name       = "public_endpoint_inbound"
                        properties = {
                            access                   = "Allow"
                            description              = "Allow inbound traffic to Managed Instance through public endpoint"
                            destinationAddressPrefix = "*"
                            destinationPortRange     = "3342"
                            direction                = "Inbound"
                            priority                 = 1300
                            protocol                 = "Tcp"
                            sourceAddressPrefix      = "Internet"
                            sourcePortRange          = "*"
                        }
                    },
                ]
                defaultNSGs                  = [
                    {
                        name       = "allow_tds_inbound"
                        properties = {
                            access                   = "Allow"
                            description              = "Allow access to data"
                            destinationAddressPrefix = "<subnet_range>"
                            destinationPortRange     = "1433"
                            direction                = "Inbound"
                            priority                 = 1000
                            protocol                 = "Tcp"
                            sourceAddressPrefix      = "VirtualNetwork"
                            sourcePortRange          = "*"
                        }
                    },
                    {
                        name       = "allow_redirect_inbound"
                        properties = {
                            access                   = "Allow"
                            description              = "Allow inbound redirect traffic to Managed Instance inside the virtual network"
                            destinationAddressPrefix = "<subnet_range>"
                            destinationPortRange     = "11000-11999"
                            direction                = "Inbound"
                            priority                 = 1100
                            protocol                 = "Tcp"
                            sourceAddressPrefix      = "VirtualNetwork"
                            sourcePortRange          = "*"
                        }
                    },
                    {
                        name       = "allow_geodr_inbound"
                        properties = {
                            access                   = "Allow"
                            description              = "Allow inbound geodr traffic inside the virtual network"
                            destinationAddressPrefix = "<subnet_range>"
                            destinationPortRange     = "5022"
                            direction                = "Inbound"
                            priority                 = 1200
                            protocol                 = "Tcp"
                            sourceAddressPrefix      = "VirtualNetwork"
                            sourcePortRange          = "*"
                        }
                    },
                    {
                        name       = "deny_all_inbound"
                        properties = {
                            access                   = "Deny"
                            description              = "Deny all other inbound traffic"
                            destinationAddressPrefix = "*"
                            destinationPortRange     = "*"
                            direction                = "Inbound"
                            priority                 = 4096
                            protocol                 = "*"
                            sourceAddressPrefix      = "*"
                            sourcePortRange          = "*"
                        }
                    },
                    {
                        name       = "allow_linkedserver_outbound"
                        properties = {
                            access                   = "Allow"
                            description              = "Allow outbound linkedserver traffic inside the virtual network"
                            destinationAddressPrefix = "VirtualNetwork"
                            destinationPortRange     = "1433"
                            direction                = "Outbound"
                            priority                 = 1000
                            protocol                 = "Tcp"
                            sourceAddressPrefix      = "<subnet_range>"
                            sourcePortRange          = "*"
                        }
                    },
                    {
                        name       = "allow_redirect_outbound"
                        properties = {
                            access                   = "Allow"
                            description              = "Allow outbound redirect traffic to Managed Instance inside the virtual network"
                            destinationAddressPrefix = "VirtualNetwork"
                            destinationPortRange     = "11000-11999"
                            direction                = "Outbound"
                            priority                 = 1100
                            protocol                 = "Tcp"
                            sourceAddressPrefix      = "<subnet_range>"
                            sourcePortRange          = "*"
                        }
                    },
                    {
                        name       = "allow_geodr_outbound"
                        properties = {
                            access                   = "Allow"
                            description              = "Allow outbound geodr traffic inside the virtual network"
                            destinationAddressPrefix = "VirtualNetwork"
                            destinationPortRange     = "5022"
                            direction                = "Outbound"
                            priority                 = 1200
                            protocol                 = "Tcp"
                            sourceAddressPrefix      = "<subnet_range>"
                            sourcePortRange          = "*"
                        }
                    },
                    {
                        name       = "deny_all_outbound"
                        properties = {
                            access                   = "Deny"
                            description              = "Deny all other outbound traffic"
                            destinationAddressPrefix = "*"
                            destinationPortRange     = "*"
                            direction                = "Outbound"
                            priority                 = 4096
                            protocol                 = "*"
                            sourceAddressPrefix      = "*"
                            sourcePortRange          = "*"
                        }
                    },
                ]
                disallowTrafficTo3342NSG     = [
                    {
                        name       = "public_endpoint_inbound"
                        properties = {
                            access                   = "Deny"
                            description              = "Deny inbound traffic to Managed Instance through public endpoint"
                            destinationAddressPrefix = "*"
                            destinationPortRange     = "3342"
                            direction                = "Inbound"
                            priority                 = 1300
                            protocol                 = "*"
                            sourceAddressPrefix      = "*"
                            sourcePortRange          = "*"
                        }
                    },
                ]
                locations                    = [
                    "australiacentral",
                    "australiacentral2",
                    "australiaeast",
                    "australiasoutheast",
                    "brazilsouth",
                    "canadacentral",
                    "canadaeast",
                    "centralus",
                    "eastasia",
                    "eastus",
                    "eastus2",
                    "francecentral",
                    "francesouth",
                    "centralindia",
                    "southindia",
                    "westindia",
                    "japaneast",
                    "japanwest",
                    "koreacentral",
                    "koreasouth",
                    "northcentralus",
                    "northeurope",
                    "southafricanorth",
                    "southafricawest",
                    "southcentralus",
                    "southeastasia",
                    "uksouth",
                    "ukwest",
                    "centraluseuap",
                    "eastus2euap",
                    "westcentralus",
                    "westeurope",
                    "westus",
                    "westus2",
                    "uaenorth",
                    "uaecentral",
                    "switzerlandnorth",
                    "switzerlandwest",
                    "germanynorth",
                    "germanywestcentral",
                    "norwayeast",
                    "norwaywest",
                ]
                networkSecurityGroupName     = "[concat('nsg-', parameters('managedInstanceName'))]"
                routeTableName               = "[concat('rt-', parameters('managedInstanceName'))]"
                routesDSMS                   = [
                    {
                        name       = "SqlManagement_security_global_1"
                        properties = {
                            addressPrefix = "52.179.184.76/32"
                            nextHopType   = "Internet"
                        }
                    },
                    {
                        name       = "SqlManagement_security_global_2"
                        properties = {
                            addressPrefix = "52.187.116.202/32"
                            nextHopType   = "Internet"
                        }
                    },
                    {
                        name       = "SqlManagement_security_global_3"
                        properties = {
                            addressPrefix = "52.177.202.6/32"
                            nextHopType   = "Internet"
                        }
                    },
                ]
                routesJumpboxes              = [
                    {
                        name       = "SqlManagement_deployment"
                        properties = {
                            addressPrefix = "65.55.188.0/24"
                            nextHopType   = "Internet"
                        }
                    },
                ]
                routesRunners                = [
                    {
                        name       = "SqlManagement_automation_global"
                        properties = {
                            addressPrefix = "104.214.108.80/32"
                            nextHopType   = "Internet"
                        }
                    },
                ]
                routesSAW                    = [
                    {
                        name       = "SqlManagement_supportability_1"
                        properties = {
                            addressPrefix = "207.68.190.32/27"
                            nextHopType   = "Internet"
                        }
                    },
                    {
                        name       = "SqlManagement_supportability_2"
                        properties = {
                            addressPrefix = "13.106.78.32/27"
                            nextHopType   = "Internet"
                        }
                    },
                    {
                        name       = "SqlManagement_supportability_3"
                        properties = {
                            addressPrefix = "13.106.174.32/27"
                            nextHopType   = "Internet"
                        }
                    },
                    {
                        name       = "SqlManagement_supportability_4"
                        properties = {
                            addressPrefix = "13.106.4.96/27"
                            nextHopType   = "Internet"
                        }
                    },
                ]
                routesUnion                  = "[if(contains(variables('locations'), tolower(parameters('location'))), union(variables('routesJumpboxes'), variables('routesSAW'), variables('routesRunners'), variables('routesDSMS'), variables(parameters('location')).controlPlane, variables(parameters('location')).controlPlane_SqlManagementTag, variables(parameters('location')).runners, variables(parameters('location')).DSMS), union(variables('routesJumpboxes'), variables('routesSAW'), variables('routesRunners')))]"
                unionNSGs                    = "[if(and(parameters('publicDataEndpointEnabled'), not(empty(parameters('nsgForPublicEndpoint')))), union(variables('defaultNSGs'), variables(parameters('nsgForPublicEndpoint'))), variables('defaultNSGs'))]"
            }
        }
    )

    depends_on = [
        module.databricksnsgsqlmi,
        azurerm_subnet.sqlmi,
        module.sqlmi_subnet_nsg_association,
        azurerm_route_table.routetablesqlmi,
        azurerm_subnet_route_table_association.sqlmi,
    ]

    timeouts {
        create = "15h"
        delete = "360m"
    }

    lifecycle {
    ignore_changes = [
      parameters_content,
      timeouts
    ]
  }
}