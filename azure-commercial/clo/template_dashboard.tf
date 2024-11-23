resource "azurerm_template_deployment" "dashboard_rcdclo" {
  name                = "RCD-CLO_Dashboard"
  resource_group_name = module.loganalyticsrg.resource_group_name

  template_body = <<DEPLOY
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "dashboardName": {
            "type": "string",
            "defaultValue": "[resourceGroup().name]",
            "metadata": {
                "description": "The name of the dashboard"
            }
        },
        "location": {
            "type": "string",
            "defaultValue": "[resourceGroup().location]",
            "metadata": {
                "description": "The location of the resources."
            }
        }
    },
    "variables": {},
    "resources": [
        {
            "apiVersion": "2015-08-01-preview",
            "name": "[concat('SHARED-DASHBOARD-', parameters('dashboardName'))]",
            "type": "Microsoft.Portal/dashboards",
            "location": "[parameters('location')]",
            "tags": {
                "hidden-title": "[parameters('dashboardName')]"
            },
            "properties": {
        "lenses": {
            "0": {
                "order": 0,
                "parts": {
                    "0": {
                        "position": {
                            "x": 0,
                            "y": 0,
                            "rowSpan": 4,
                            "colSpan": 5
                        },
                        "metadata": {
                            "inputs": [
                                {
                                    "name": "ComponentId",
                                    "value": {
                                        "SubscriptionId": "e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2",
                                        "ResourceGroup": "co-p-eastus-rcdloganalytics-rg",
                                        "Name": "co-p-eastus-rcd01-workspace",
                                        "ResourceId": "/subscriptions/e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2/resourcegroups/co-p-eastus-rcdloganalytics-rg/providers/microsoft.operationalinsights/workspaces/co-p-eastus-rcd01-workspace"
                                    }
                                },
                                {
                                    "name": "Query",
                                    "value": "// Availability rate\r\n// Calculate the availability rate of each connected computer\r\nHeartbeat\r\n// bin_at is used to set the time grain to 1 hour, starting exactly 24 hours ago\r\n| summarize heartbeatPerHour = count() by bin_at(TimeGenerated, 1h, ago(24h)), Computer\r\n| extend availablePerHour = iff(heartbeatPerHour > 0, true, false)\r\n| summarize totalAvailableHours = countif(availablePerHour == true) by Computer \r\n| extend availabilityRate = totalAvailableHours*100.0/24\n"
                                },
                                {
                                    "name": "TimeRange",
                                    "value": "PT30M"
                                },
                                {
                                    "name": "Version",
                                    "value": "1.0"
                                },
                                {
                                    "name": "DashboardId",
                                    "value": "/subscriptions/e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2/resourceGroups/dashboards/providers/Microsoft.Portal/dashboards/f4682876-453a-46ed-abe5-60f3463e2853"
                                },
                                {
                                    "name": "PartId",
                                    "value": "47eb356b-8fe7-46d3-87db-03c06683ed9e"
                                },
                                {
                                    "name": "PartTitle",
                                    "value": "Analytics"
                                },
                                {
                                    "name": "PartSubTitle",
                                    "value": "co-p-eastus-rcd01-workspace"
                                },
                                {
                                    "name": "resourceTypeMode",
                                    "value": "workspace"
                                },
                                {
                                    "name": "ControlType",
                                    "value": "AnalyticsGrid"
                                },
                                {
                                    "name": "Dimensions",
                                    "isOptional": true
                                },
                                {
                                    "name": "SpecificChart",
                                    "isOptional": true
                                }
                            ],
                            "type": "Extension/AppInsightsExtension/PartType/AnalyticsPart",
                            "settings": {
                                "content": {
                                    "PartTitle": "Available VMs",
                                    "PartSubTitle": "co-p-eastus-rcd01-workspace",
                                    "Query": "let start_time=startofday(datetime(\"2019-01-01\"));\nHeartbeat\n| where TimeGenerated > start_time\n| summarize heartbeat_per_hour=count() by bin_at(TimeGenerated, 1h, start_time), Computer\n| extend availablePerHour = iff(heartbeat_per_hour > 0, true, false)\n| summarize totalAvailableHours = countif(availablePerHour == true) by Computer \n| extend availabilityRate = totalAvailableHours*100.0/24"
                                }
                            },
                            "asset": {
                                "idInputName": "ComponentId",
                                "type": "ApplicationInsights"
                            },
                            "filters": {
                                "MsPortalFx_TimeRange": {
                                    "model": {
                                        "format": "utc",
                                        "granularity": "auto",
                                        "relative": "7d"
                                    }
                                }
                            }
                        }
                    },
                    "1": {
                        "position": {
                            "x": 5,
                            "y": 0,
                            "rowSpan": 4,
                            "colSpan": 5
                        },
                        "metadata": {
                            "inputs": [
                                {
                                    "name": "ComponentId",
                                    "value": {
                                        "SubscriptionId": "e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2",
                                        "ResourceGroup": "co-p-eastus-rcdloganalytics-rg",
                                        "Name": "co-p-eastus-rcd01-workspace",
                                        "ResourceId": "/subscriptions/e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2/resourcegroups/co-p-eastus-rcdloganalytics-rg/providers/microsoft.operationalinsights/workspaces/co-p-eastus-rcd01-workspace"
                                    }
                                },
                                {
                                    "name": "Query",
                                    "value": "// Availability rate\r\n// Calculate the availability rate of each connected computer\r\nHeartbeat\r\n// bin_at is used to set the time grain to 1 hour, starting exactly 24 hours ago\r\n| summarize heartbeatPerHour = count() by bin_at(TimeGenerated, 1h, ago(24h)), Computer\r\n| extend availablePerHour = iff(heartbeatPerHour > 0, true, false)\r\n| summarize totalAvailableHours = countif(availablePerHour == true) by Computer \r\n| extend availabilityRate = totalAvailableHours*100.0/24\n"
                                },
                                {
                                    "name": "TimeRange",
                                    "value": "P1D"
                                },
                                {
                                    "name": "Dimensions",
                                    "value": {
                                        "xAxis": {
                                            "name": "Computer",
                                            "type": "String"
                                        },
                                        "yAxis": [
                                            {
                                                "name": "totalAvailableHours",
                                                "type": "Int64"
                                            }
                                        ],
                                        "splitBy": [],
                                        "aggregation": "Sum"
                                    }
                                },
                                {
                                    "name": "Version",
                                    "value": "1.0"
                                },
                                {
                                    "name": "DashboardId",
                                    "value": "/subscriptions/e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2/resourceGroups/dashboards/providers/Microsoft.Portal/dashboards/f4682876-453a-46ed-abe5-60f3463e2853"
                                },
                                {
                                    "name": "PartId",
                                    "value": "12d08141-7ecc-498f-b7e4-857f946090f5"
                                },
                                {
                                    "name": "PartTitle",
                                    "value": "Analytics"
                                },
                                {
                                    "name": "PartSubTitle",
                                    "value": "co-p-eastus-rcd01-workspace"
                                },
                                {
                                    "name": "resourceTypeMode",
                                    "value": "workspace"
                                },
                                {
                                    "name": "ControlType",
                                    "value": "AnalyticsDonut"
                                },
                                {
                                    "name": "SpecificChart",
                                    "isOptional": true
                                }
                            ],
                            "type": "Extension/AppInsightsExtension/PartType/AnalyticsPart",
                            "settings": {
                                "content": {
                                    "PartTitle": "Live VMs",
                                    "PartSubTitle": "co-p-eastus-rcd01-workspace",
                                    "Query": "let start_time=startofday(datetime(\"2019-01-01\"));\nHeartbeat\n| where TimeGenerated > start_time\n| summarize heartbeat_per_hour=count() by bin_at(TimeGenerated, 1h, start_time), Computer\n| extend availablePerHour = iff(heartbeat_per_hour > 0, true, false)\n| summarize totalAvailableHours = countif(availablePerHour == true) by Computer \n| extend availabilityRate = totalAvailableHours*100.0/24"
                                }
                            },
                            "asset": {
                                "idInputName": "ComponentId",
                                "type": "ApplicationInsights"
                            }
                        }
                    },
                    "2": {
                        "position": {
                            "x": 10,
                            "y": 0,
                            "rowSpan": 4,
                            "colSpan": 6
                        },
                        "metadata": {
                            "inputs": [
                                {
                                    "name": "options",
                                    "isOptional": true
                                },
                                {
                                    "name": "sharedTimeRange",
                                    "isOptional": true
                                }
                            ],
                            "type": "Extension/HubsExtension/PartType/MonitorChartPart",
                            "settings": {
                                "content": {
                                    "options": {
                                        "chart": {
                                            "metrics": [
                                                {
                                                    "resourceMetadata": {
                                                        "id": "/subscriptions/e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2/resourceGroups/co-p-eastus-rcdclo-rg/providers/Microsoft.Compute/virtualMachines/UEMCCLOAPP1P1"
                                                    },
                                                    "name": "Percentage CPU",
                                                    "aggregationType": 4,
                                                    "namespace": "microsoft.compute/virtualmachines",
                                                    "metricVisualization": {
                                                        "displayName": "Percentage CPU",
                                                        "color": "#47BDF5"
                                                    }
                                                }
                                            ],
                                            "title": "Percentage CPU - Bastion",
                                            "visualization": {
                                                "chartType": 2,
                                                "legendVisualization": {
                                                    "isVisible": true,
                                                    "position": 2,
                                                    "hideSubtitle": false
                                                },
                                                "axisVisualization": {
                                                    "x": {
                                                        "isVisible": true,
                                                        "axisType": 3
                                                    },
                                                    "y": {
                                                        "isVisible": true,
                                                        "axisType": 1
                                                    }
                                                },
                                                "disablePinning": true
                                            }
                                        }
                                    }
                                }
                            },
                            "filters": {
                                "MsPortalFx_TimeRange": {
                                    "model": {
                                        "format": "utc",
                                        "granularity": "auto",
                                        "relative": "1440m"
                                    }
                                }
                            }
                        }
                    },
                    "3": {
                        "position": {
                            "x": 16,
                            "y": 0,
                            "rowSpan": 4,
                            "colSpan": 6
                        },
                        "metadata": {
                            "inputs": [
                                {
                                    "name": "options",
                                    "isOptional": true
                                },
                                {
                                    "name": "sharedTimeRange",
                                    "isOptional": true
                                }
                            ],
                            "type": "Extension/HubsExtension/PartType/MonitorChartPart",
                            "settings": {
                                "content": {
                                    "options": {
                                        "chart": {
                                            "metrics": [
                                                {
                                                    "resourceMetadata": {
                                                        "id": "/subscriptions/e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2/resourceGroups/co-p-eastus-rcdclo-rg/providers/Microsoft.Compute/virtualMachines/UEMCCLOAPP1P1"
                                                    },
                                                    "name": "OS Disk Queue Depth",
                                                    "aggregationType": 4,
                                                    "namespace": "microsoft.compute/virtualmachines",
                                                    "metricVisualization": {
                                                        "displayName": "OS Disk Queue Depth (Preview)",
                                                        "color": "#47BDF5"
                                                    }
                                                }
                                            ],
                                            "title": "OS Disk Queue Depth - Bastion",
                                            "visualization": {
                                                "chartType": 2,
                                                "legendVisualization": {
                                                    "isVisible": true,
                                                    "position": 2,
                                                    "hideSubtitle": false
                                                },
                                                "axisVisualization": {
                                                    "x": {
                                                        "isVisible": true,
                                                        "axisType": 3
                                                    },
                                                    "y": {
                                                        "isVisible": true,
                                                        "axisType": 1
                                                    }
                                                },
                                                "disablePinning": true
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    },
                    "4": {
                        "position": {
                            "x": 0,
                            "y": 4,
                            "rowSpan": 4,
                            "colSpan": 5
                        },
                        "metadata": {
                            "inputs": [
                                {
                                    "name": "ComponentId",
                                    "value": {
                                        "SubscriptionId": "e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2",
                                        "ResourceGroup": "co-p-eastus-rcdloganalytics-rg",
                                        "Name": "co-p-eastus-rcd01-workspace",
                                        "ResourceId": "/subscriptions/e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2/resourceGroups/co-p-eastus-rcdloganalytics-rg/providers/Microsoft.OperationalInsights/workspaces/co-p-eastus-rcd01-workspace"
                                    }
                                },
                                {
                                    "name": "Query",
                                    "value": "// Top 10 computers with the highest disk space\r\n// Show the top 10 computers with the highest available disk space\r\nPerf\r\n| where CounterName == \"Free Megabytes\" and InstanceName == \"_Total\" \r\n| summarize arg_max(TimeGenerated, *) by Computer\r\n| top 10 by CounterValue\n"
                                },
                                {
                                    "name": "TimeRange",
                                    "value": "P1D"
                                },
                                {
                                    "name": "Version",
                                    "value": "1.0"
                                },
                                {
                                    "name": "DashboardId",
                                    "value": "/subscriptions/e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2/resourceGroups/dashboards/providers/Microsoft.Portal/dashboards/f4682876-453a-46ed-abe5-60f3463e2853"
                                },
                                {
                                    "name": "PartId",
                                    "value": "014ecc2c-359d-4648-987b-178af4d782d4"
                                },
                                {
                                    "name": "PartTitle",
                                    "value": "Analytics"
                                },
                                {
                                    "name": "PartSubTitle",
                                    "value": "co-p-eastus-rcd01-workspace"
                                },
                                {
                                    "name": "resourceTypeMode",
                                    "value": "workspace"
                                },
                                {
                                    "name": "ControlType",
                                    "value": "AnalyticsGrid"
                                },
                                {
                                    "name": "Dimensions",
                                    "isOptional": true
                                },
                                {
                                    "name": "SpecificChart",
                                    "isOptional": true
                                }
                            ],
                            "type": "Extension/AppInsightsExtension/PartType/AnalyticsPart",
                            "settings": {
                                "content": {
                                    "PartTitle": "Top 10 computers with the highest disk space",
                                    "PartSubTitle": "co-p-eastus-rcd01-workspace"
                                }
                            },
                            "asset": {
                                "idInputName": "ComponentId",
                                "type": "ApplicationInsights"
                            }
                        }
                    },
                    "5": {
                        "position": {
                            "x": 5,
                            "y": 4,
                            "rowSpan": 4,
                            "colSpan": 5
                        },
                        "metadata": {
                            "inputs": [
                                {
                                    "name": "ComponentId",
                                    "value": {
                                        "SubscriptionId": "e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2",
                                        "ResourceGroup": "co-p-eastus-rcdloganalytics-rg",
                                        "Name": "co-p-eastus-rcd01-workspace",
                                        "ResourceId": "/subscriptions/e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2/resourcegroups/co-p-eastus-rcdloganalytics-rg/providers/microsoft.operationalinsights/workspaces/co-p-eastus-rcd01-workspace"
                                    }
                                },
                                {
                                    "name": "Query",
                                    "value": "// Unavailable computers\n// List all known computers that didn't send a heartbeat in the last 5 hours\nHeartbeat \n| summarize LastHeartbeat=max(TimeGenerated) by Computer \n| where LastHeartbeat < ago(30min)\n"
                                },
                                {
                                    "name": "TimeRange",
                                    "value": "P1D"
                                },
                                {
                                    "name": "Version",
                                    "value": "1.0"
                                },
                                {
                                    "name": "DashboardId",
                                    "value": "/subscriptions/e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2/resourceGroups/dashboards/providers/Microsoft.Portal/dashboards/f4682876-453a-46ed-abe5-60f3463e2853"
                                },
                                {
                                    "name": "PartId",
                                    "value": "bec09d57-05f0-474e-89cc-7e55fa2aea14"
                                },
                                {
                                    "name": "PartTitle",
                                    "value": "Analytics"
                                },
                                {
                                    "name": "PartSubTitle",
                                    "value": "co-p-eastus-rcd01-workspace"
                                },
                                {
                                    "name": "resourceTypeMode",
                                    "value": "workspace"
                                },
                                {
                                    "name": "ControlType",
                                    "value": "AnalyticsGrid"
                                },
                                {
                                    "name": "Dimensions",
                                    "isOptional": true
                                },
                                {
                                    "name": "SpecificChart",
                                    "isOptional": true
                                }
                            ],
                            "type": "Extension/AppInsightsExtension/PartType/AnalyticsPart",
                            "settings": {
                                "content": {
                                    "PartTitle": "Unavailable VMs",
                                    "PartSubTitle": "co-p-eastus-rcd01-workspace"
                                }
                            },
                            "asset": {
                                "idInputName": "ComponentId",
                                "type": "ApplicationInsights"
                            },
                            "filters": {
                                "MsPortalFx_TimeRange": {
                                    "model": {
                                        "format": "utc",
                                        "granularity": "auto",
                                        "relative": "30d"
                                    }
                                }
                            }
                        }
                    },
                    "6": {
                        "position": {
                            "x": 10,
                            "y": 4,
                            "rowSpan": 4,
                            "colSpan": 6
                        },
                        "metadata": {
                            "inputs": [
                                {
                                    "name": "options",
                                    "isOptional": true
                                },
                                {
                                    "name": "sharedTimeRange",
                                    "isOptional": true
                                }
                            ],
                            "type": "Extension/HubsExtension/PartType/MonitorChartPart",
                            "settings": {
                                "content": {
                                    "options": {
                                        "chart": {
                                            "metrics": [
                                                {
                                                    "resourceMetadata": {
                                                        "id": "/subscriptions/e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2/resourceGroups/co-p-eastus-rcdclo-rg/providers/Microsoft.Compute/virtualMachines/UEMCCLOAPP1P1"
                                                    },
                                                    "name": "Data Disk Queue Depth",
                                                    "aggregationType": 7,
                                                    "namespace": "microsoft.compute/virtualmachines",
                                                    "metricVisualization": {
                                                        "displayName": "Data Disk Queue Depth (Preview)",
                                                        "color": "#47BDF5"
                                                    }
                                                }
                                            ],
                                            "title": "Data Disk Queue Depth - Bastion",
                                            "visualization": {
                                                "chartType": 2,
                                                "legendVisualization": {
                                                    "isVisible": true,
                                                    "position": 2,
                                                    "hideSubtitle": false
                                                },
                                                "axisVisualization": {
                                                    "x": {
                                                        "isVisible": true,
                                                        "axisType": 3
                                                    },
                                                    "y": {
                                                        "isVisible": true,
                                                        "axisType": 1
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    },
                    "7": {
                        "position": {
                            "x": 16,
                            "y": 4,
                            "rowSpan": 4,
                            "colSpan": 6
                        },
                        "metadata": {
                            "inputs": [
                                {
                                    "name": "options",
                                    "isOptional": true
                                },
                                {
                                    "name": "sharedTimeRange",
                                    "isOptional": true
                                }
                            ],
                            "type": "Extension/HubsExtension/PartType/MonitorChartPart",
                            "settings": {
                                "content": {
                                    "options": {
                                        "chart": {
                                            "metrics": [
                                                {
                                                    "resourceMetadata": {
                                                        "id": "/subscriptions/e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2/resourceGroups/co-p-eastus-rcdclo-rg/providers/Microsoft.Compute/virtualMachines/UEMCCLOAPP1P1"
                                                    },
                                                    "name": "\\Memory\\Available Bytes",
                                                    "aggregationType": 4,
                                                    "namespace": "microsoft.compute/virtualmachines/guest",
                                                    "metricVisualization": {
                                                        "displayName": "Memory available",
                                                        "color": "#47BDF5"
                                                    }
                                                }
                                            ],
                                            "title": "Memory available - Bastion",
                                            "visualization": {
                                                "chartType": 2,
                                                "legendVisualization": {
                                                    "isVisible": true,
                                                    "position": 2,
                                                    "hideSubtitle": false
                                                },
                                                "axisVisualization": {
                                                    "x": {
                                                        "isVisible": true,
                                                        "axisType": 3
                                                    },
                                                    "y": {
                                                        "isVisible": true,
                                                        "axisType": 1
                                                    }
                                                },
                                                "disablePinning": true
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    },
                    "8": {
                        "position": {
                            "x": 0,
                            "y": 8,
                            "rowSpan": 6,
                            "colSpan": 10
                        },
                        "metadata": {
                            "inputs": [
                                {
                                    "name": "ComponentId",
                                    "value": {
                                        "SubscriptionId": "e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2",
                                        "ResourceGroup": "co-p-eastus-rcdloganalytics-rg",
                                        "Name": "co-p-eastus-rcd01-workspace",
                                        "ResourceId": "/subscriptions/e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2/resourcegroups/co-p-eastus-rcdloganalytics-rg/providers/Microsoft.OperationalInsights/workspaces/co-p-eastus-rcd01-workspace"
                                    }
                                },
                                {
                                    "name": "Query",
                                    "value": "search in (AzureActivity) \"Create or Update Virtual Machine\"\n"
                                },
                                {
                                    "name": "TimeRange",
                                    "value": "P7D"
                                },
                                {
                                    "name": "Version",
                                    "value": "1.0"
                                },
                                {
                                    "name": "DashboardId",
                                    "value": "/subscriptions/e74c5c8b-023e-488f-9c2e-f7dfc9d7acf2/resourceGroups/dashboards/providers/Microsoft.Portal/dashboards/ca38110e-f956-4983-9488-6e7c8f67e03e"
                                },
                                {
                                    "name": "PartId",
                                    "value": "3958b96b-eae1-4afd-a200-dc186891a49b"
                                },
                                {
                                    "name": "PartTitle",
                                    "value": "Analytics"
                                },
                                {
                                    "name": "PartSubTitle",
                                    "value": "co-p-eastus-rcd01-workspace"
                                },
                                {
                                    "name": "resourceTypeMode",
                                    "value": "workspace"
                                },
                                {
                                    "name": "ControlType",
                                    "value": "AnalyticsGrid"
                                },
                                {
                                    "name": "Dimensions",
                                    "isOptional": true
                                },
                                {
                                    "name": "SpecificChart",
                                    "isOptional": true
                                }
                            ],
                            "type": "Extension/AppInsightsExtension/PartType/AnalyticsPart",
                            "settings": {
                                "content": {
                                    "PartTitle": "Event on Azure Resources",
                                    "PartSubTitle": "co-p-eastus-rcd01-workspace",
                                    "Query": "search in (AzureActivity) \"Create or Update\" or \"Delete\" or \"Create\"\n",
                                    "GridColumnsWidth": {
                                        "OperationName": "193px"
                                    }
                                }
                            },
                            "asset": {
                                "idInputName": "ComponentId",
                                "type": "ApplicationInsights"
                            },
                            "filters": {
                                "MsPortalFx_TimeRange": {
                                    "model": {
                                        "format": "utc",
                                        "granularity": "auto",
                                        "relative": "7d"
                                    }
                                }
                            }
                        }
                    }
                }
            }
        },
        "metadata": {
            "model": {
                "timeRange": {
                    "value": {
                        "relative": {
                            "duration": 24,
                            "timeUnit": 1
                        }
                    },
                    "type": "MsPortalFx.Composition.Configuration.ValueTypes.TimeRange"
                },
                "filterLocale": {
                    "value": "en-us"
                },
                "filters": {
                    "value": {
                        "MsPortalFx_TimeRange": {
                            "model": {
                                "format": "utc",
                                "granularity": "auto",
                                "relative": "24h"
                            },
                            "displayCache": {
                                "name": "UTC Time",
                                "value": "Past 24 hours"
                            },
                            "filteredPartIds": [
                                "StartboardPart-AnalyticsPart-ef70fd17-056f-4606-933f-94b33225a004",
                                "StartboardPart-AnalyticsPart-ef70fd17-056f-4606-933f-94b33225a008",
                                "StartboardPart-AnalyticsPart-ca38110e-f956-4983-9488-6e7c8f67e0c7",
                                "StartboardPart-AnalyticsPart-ca38110e-f956-4983-9488-6e7c8f67e26c",
                                "StartboardPart-AnalyticsPart-ca38110e-f956-4983-9488-6e7c8f67e2ba",
                                "StartboardPart-AnalyticsPart-ca38110e-f956-4983-9488-6e7c8f67e2bc",
                                "StartboardPart-AnalyticsPart-ca38110e-f956-4983-9488-6e7c8f67e3bb",
                                "StartboardPart-AnalyticsPart-ca38110e-f956-4983-9488-6e7c8f67e3bd",
                                "StartboardPart-AnalyticsPart-ca38110e-f956-4983-9488-6e7c8f67e3bf",
                                "StartboardPart-AnalyticsPart-ca38110e-f956-4983-9488-6e7c8f67e4ff",
                                "StartboardPart-AnalyticsPart-ca38110e-f956-4983-9488-6e7c8f67e501",
                                "StartboardPart-AnalyticsPart-ca38110e-f956-4983-9488-6e7c8f67e503",
                                "StartboardPart-AnalyticsPart-ca38110e-f956-4983-9488-6e7c8f67e655",
                                "StartboardPart-AnalyticsPart-ca38110e-f956-4983-9488-6e7c8f67e657",
                                "StartboardPart-AnalyticsPart-ca38110e-f956-4983-9488-6e7c8f67e659",
                                "StartboardPart-AnalyticsPart-ca38110e-f956-4983-9488-6e7c8f67e65b",
                                "StartboardPart-AnalyticsPart-ca38110e-f956-4983-9488-6e7c8f67e69e",
                                "StartboardPart-AnalyticsPart-ca38110e-f956-4983-9488-6e7c8f67e6a0",
                                "StartboardPart-AnalyticsPart-ca38110e-f956-4983-9488-6e7c8f67e6a2",
                                "StartboardPart-AnalyticsPart-ca38110e-f956-4983-9488-6e7c8f67e6a6",
                                "StartboardPart-AnalyticsPart-87210c82-54ff-46a9-bbd7-d90815355004",
                                "StartboardPart-AnalyticsPart-87210c82-54ff-46a9-bbd7-d90815355006",
                                "StartboardPart-AnalyticsPart-87210c82-54ff-46a9-bbd7-d90815355008",
                                "StartboardPart-AnalyticsPart-87210c82-54ff-46a9-bbd7-d90815355190",
                                "StartboardPart-AnalyticsPart-87210c82-54ff-46a9-bbd7-d90815355192",
                                "StartboardPart-AnalyticsPart-87210c82-54ff-46a9-bbd7-d90815355194",
                                "StartboardPart-AnalyticsPart-87210c82-54ff-46a9-bbd7-d90815355196",
                                "StartboardPart-AnalyticsPart-da333486-4c69-4311-a45a-b62182ac7004",
                                "StartboardPart-AnalyticsPart-da333486-4c69-4311-a45a-b62182ac7006",
                                "StartboardPart-AnalyticsPart-da333486-4c69-4311-a45a-b62182ac7008",
                                "StartboardPart-AnalyticsPart-da333486-4c69-4311-a45a-b62182ac71ad",
                                "StartboardPart-AnalyticsPart-da333486-4c69-4311-a45a-b62182ac71af",
                                "StartboardPart-AnalyticsPart-da333486-4c69-4311-a45a-b62182ac71b1",
                                "StartboardPart-AnalyticsPart-da333486-4c69-4311-a45a-b62182ac71b3",
                                "StartboardPart-AnalyticsPart-d5ae6022-d05d-46ec-b414-8b0cfc0ad004",
                                "StartboardPart-AnalyticsPart-d5ae6022-d05d-46ec-b414-8b0cfc0ad006",
                                "StartboardPart-AnalyticsPart-d5ae6022-d05d-46ec-b414-8b0cfc0ad008",
                                "StartboardPart-AnalyticsPart-d5ae6022-d05d-46ec-b414-8b0cfc0ad00a",
                                "StartboardPart-AnalyticsPart-607ece7a-9ab5-4ccb-b6ba-e2580283c00a",
                                "StartboardPart-AnalyticsPart-f4682876-453a-46ed-abe5-60f3463e27c3",
                                "StartboardPart-AnalyticsPart-cbab285b-0428-4527-bb5d-ca5d4a2f3eea",
                                "StartboardPart-AnalyticsPart-cbab285b-0428-4527-bb5d-ca5d4a2f3eec",
                                "StartboardPart-AnalyticsPart-cbab285b-0428-4527-bb5d-ca5d4a2f3eee",
                                "StartboardPart-AnalyticsPart-68e56f50-4d13-4699-8e8f-7e6e339c808c",
                                "StartboardPart-AnalyticsPart-68e56f50-4d13-4699-8e8f-7e6e339c808e",
                                "StartboardPart-AnalyticsPart-68e56f50-4d13-4699-8e8f-7e6e339c8090",
                                "StartboardPart-AnalyticsPart-68e56f50-4d13-4699-8e8f-7e6e339c80c3",
                                "StartboardPart-AnalyticsPart-68e56f50-4d13-4699-8e8f-7e6e339c80c5",
                                "StartboardPart-AnalyticsPart-68e56f50-4d13-4699-8e8f-7e6e339c80c7",
                                "StartboardPart-AnalyticsPart-68e56f50-4d13-4699-8e8f-7e6e339c8261",
                                "StartboardPart-AnalyticsPart-68e56f50-4d13-4699-8e8f-7e6e339c8263",
                                "StartboardPart-AnalyticsPart-68e56f50-4d13-4699-8e8f-7e6e339c8265",
                                "StartboardPart-AnalyticsPart-68e56f50-4d13-4699-8e8f-7e6e339c8267",
                                "StartboardPart-AnalyticsPart-dda8b8c0-e4e4-409b-a9dd-c434fff8b004",
                                "StartboardPart-AnalyticsPart-dda8b8c0-e4e4-409b-a9dd-c434fff8b006",
                                "StartboardPart-AnalyticsPart-dda8b8c0-e4e4-409b-a9dd-c434fff8b008",
                                "StartboardPart-AnalyticsPart-dda8b8c0-e4e4-409b-a9dd-c434fff8b00a",
                                "StartboardPart-AnalyticsPart-dda8b8c0-e4e4-409b-a9dd-c434fff8bc41",
                                "StartboardPart-AnalyticsPart-dda8b8c0-e4e4-409b-a9dd-c434fff8bc43",
                                "StartboardPart-AnalyticsPart-dda8b8c0-e4e4-409b-a9dd-c434fff8bc47",
                                "StartboardPart-AnalyticsPart-dda8b8c0-e4e4-409b-a9dd-c434fff8bc4b",
                                "StartboardPart-AnalyticsPart-dda8b8c0-e4e4-409b-a9dd-c434fff8bc4d",
                                "StartboardPart-AnalyticsPart-5db82021-2430-4207-aac0-9f5a3c8e31e8",
                                "StartboardPart-AnalyticsPart-5db82021-2430-4207-aac0-9f5a3c8e31ea",
                                "StartboardPart-AnalyticsPart-5db82021-2430-4207-aac0-9f5a3c8e31ee",
                                "StartboardPart-AnalyticsPart-5db82021-2430-4207-aac0-9f5a3c8e31f0",
                                "StartboardPart-AnalyticsPart-5db82021-2430-4207-aac0-9f5a3c8e31f4",
                                "StartboardPart-AnalyticsPart-9eb17db8-1a69-4433-834d-76faf698a8ca",
                                "StartboardPart-AnalyticsPart-9eb17db8-1a69-4433-834d-76faf698a8cc",
                                "StartboardPart-AnalyticsPart-9eb17db8-1a69-4433-834d-76faf698a8d0",
                                "StartboardPart-AnalyticsPart-9eb17db8-1a69-4433-834d-76faf698a8d2",
                                "StartboardPart-AnalyticsPart-9eb17db8-1a69-4433-834d-76faf698a8d6",
                                "StartboardPart-AnalyticsPart-9e9bdc66-20a0-4361-9d74-3b6c3eb82004",
                                "StartboardPart-AnalyticsPart-9e9bdc66-20a0-4361-9d74-3b6c3eb82006",
                                "StartboardPart-AnalyticsPart-9e9bdc66-20a0-4361-9d74-3b6c3eb8200a",
                                "StartboardPart-AnalyticsPart-9e9bdc66-20a0-4361-9d74-3b6c3eb8200c",
                                "StartboardPart-AnalyticsPart-9e9bdc66-20a0-4361-9d74-3b6c3eb82010",
                                "StartboardPart-AnalyticsPart-ad90e5e5-8578-4035-be96-cff0cb308004",
                                "StartboardPart-AnalyticsPart-ad90e5e5-8578-4035-be96-cff0cb308006",
                                "StartboardPart-AnalyticsPart-ad90e5e5-8578-4035-be96-cff0cb30800a",
                                "StartboardPart-AnalyticsPart-ad90e5e5-8578-4035-be96-cff0cb30800c",
                                "StartboardPart-AnalyticsPart-ad90e5e5-8578-4035-be96-cff0cb308010",
                                "StartboardPart-AnalyticsPart-f71af704-5598-450b-a27a-a839194c228f",
                                "StartboardPart-AnalyticsPart-f71af704-5598-450b-a27a-a839194c2291",
                                "StartboardPart-AnalyticsPart-f71af704-5598-450b-a27a-a839194c2293",
                                "StartboardPart-AnalyticsPart-f71af704-5598-450b-a27a-a839194c2295",
                                "StartboardPart-AnalyticsPart-f71af704-5598-450b-a27a-a839194c2297",
                                "StartboardPart-AnalyticsPart-0f7fbc8c-fab2-4f09-8751-62b3bfb88380",
                                "StartboardPart-AnalyticsPart-0f7fbc8c-fab2-4f09-8751-62b3bfb88382",
                                "StartboardPart-AnalyticsPart-0f7fbc8c-fab2-4f09-8751-62b3bfb88384",
                                "StartboardPart-AnalyticsPart-0f7fbc8c-fab2-4f09-8751-62b3bfb88386",
                                "StartboardPart-AnalyticsPart-0f7fbc8c-fab2-4f09-8751-62b3bfb88388",
                                "StartboardPart-MonitorChartPart-0f7fbc8c-fab2-4f09-8751-62b3bfb88777",
                                "StartboardPart-MonitorChartPart-0f7fbc8c-fab2-4f09-8751-62b3bfb888cc",
                                "StartboardPart-MonitorChartPart-0f7fbc8c-fab2-4f09-8751-62b3bfb88970",
                                "StartboardPart-MonitorChartPart-0f7fbc8c-fab2-4f09-8751-62b3bfb889dd",
                                "StartboardPart-AnalyticsPart-0f7fbc8c-fab2-4f09-8751-62b3bfb88c3f",
                                "StartboardPart-AnalyticsPart-0f7fbc8c-fab2-4f09-8751-62b3bfb88c41",
                                "StartboardPart-MonitorChartPart-0f7fbc8c-fab2-4f09-8751-62b3bfb88c43",
                                "StartboardPart-MonitorChartPart-0f7fbc8c-fab2-4f09-8751-62b3bfb88c45",
                                "StartboardPart-AnalyticsPart-0f7fbc8c-fab2-4f09-8751-62b3bfb88c47",
                                "StartboardPart-AnalyticsPart-0f7fbc8c-fab2-4f09-8751-62b3bfb88c49",
                                "StartboardPart-MonitorChartPart-0f7fbc8c-fab2-4f09-8751-62b3bfb88c4b",
                                "StartboardPart-MonitorChartPart-0f7fbc8c-fab2-4f09-8751-62b3bfb88c4d",
                                "StartboardPart-AnalyticsPart-0f7fbc8c-fab2-4f09-8751-62b3bfb88c4f"
                            ]
                        }
                    }
                }
            }
        }
    }
        }
    ],
    "outputs": {}
}
DEPLOY


  parameters      = {}
  deployment_mode = "Incremental"
}

