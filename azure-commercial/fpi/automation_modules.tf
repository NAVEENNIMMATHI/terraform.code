resource "azurerm_automation_module" "Azure_AnalysisServices" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "Azure.AnalysisServices"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azure.analysisservices.0.5.4.nupkg"
  }
}

resource "azurerm_automation_module" "Azure_Storage" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "Azure.Storage"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azure.storage.4.6.1.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.6.13.2.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_AnalysisServices" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.AnalysisServices"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.analysisservices.0.6.15.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_ApiManagement" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.ApiManagement"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.apimanagement.6.1.8.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_ApplicationInsights" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.ApplicationInsights"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.applicationinsights.0.1.9.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_Automation" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.Automation"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.automation.6.1.2.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_Batch" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.Batch"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.batch.4.1.6.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_Billing" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.Billing"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.billing.0.14.7.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_Cdn" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.Cdn"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.cdn.5.0.7.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_CognitiveServices" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.CognitiveServices"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.cognitiveservices.0.9.13.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_Compute" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.Compute"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.compute.5.9.2.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_Consumption" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.Consumption"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.consumption.0.3.8.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_ContainerInstance" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.ContainerInstance"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.containerinstance.0.2.13.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_ContainerRegistry" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.ContainerRegistry"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.containerregistry.1.0.11.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_DataFactories" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.DataFactories"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.datafactories.5.0.4.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_DataFactoryV2" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.DataFactoryV2"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.datafactoryv2.0.5.12.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_DataLakeAnalytics" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.DataLakeAnalytics"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.datalakeanalytics.5.1.5.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_DataLakeStore" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.DataLakeStore"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.datalakestore.6.2.2.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_DevTestLabs" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.DevTestLabs"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.devtestlabs.4.0.10.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_Dns" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.Dns"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.dns.5.1.1.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_EventGrid" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.EventGrid"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.eventgrid.0.3.8.nupkg"
  }
}


resource "azurerm_automation_module" "AzureRM_EventHub" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.EventHub"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.eventhub.0.7.1.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_HDInsight" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.HDInsight"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.hdinsight.4.1.9.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_Insights" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.Insights"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.insights.5.1.6.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_IotHub" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.IotHub"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.iothub.3.1.9.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_KeyVault" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.KeyVault"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.keyvault.5.2.2.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_LogicApp" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.LogicApp"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.logicapp.4.1.5.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_MachineLearning" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.MachineLearning"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.machinelearning.0.18.6.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_MarketplaceOrdering" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.MarketplaceOrdering"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.marketplaceordering.0.2.8.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_Media" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.Media"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.media.0.10.5.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_Network" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.Network"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.network.6.11.2.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_NotificationHubs" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.NotificationHubs"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.notificationhubs.5.0.4.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_OperationalInsights" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.OperationalInsights"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.operationalinsights.5.0.7.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_PolicyInsights" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.PolicyInsights"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.policyinsights.1.1.1.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_PowerBIEmbedded" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.PowerBIEmbedded"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.powerbiembedded.4.1.11.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_Profile" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.Profile"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.profile.5.8.4.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_RecoveryServices" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.RecoveryServices"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.recoveryservices.4.1.10.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_RecoveryServices_Backup" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.RecoveryServices.Backup"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.recoveryservices.backup.4.5.3.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_RecoveryServices_SiteRecovery" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.RecoveryServices.SiteRecovery"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.recoveryservices.siterecovery.0.2.13.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_RedisCache" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.RedisCache"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.rediscache.5.1.1.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_Relay" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.Relay"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.relay.0.3.13.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_Resources" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.Resources"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.resources.6.7.4.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_ServiceBus" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.ServiceBus"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.servicebus.0.6.14.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_ServiceFabric" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.ServiceFabric"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.servicefabric.0.3.16.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_SignalR" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.SignalR"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.signalr.1.0.1.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_Sql" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.Sql"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.sql.4.12.2.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_Storage" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.Storage"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.storage.5.2.1.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_StreamAnalytics" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.StreamAnalytics"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.streamanalytics.4.0.11.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_Tags" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.Tags"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.tags.4.0.6.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_TrafficManager" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.TrafficManager"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.trafficmanager.4.1.4.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_UsageAggregates" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.UsageAggregates"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.usageaggregates.4.0.6.nupkg"
  }
}

resource "azurerm_automation_module" "AzureRM_Websites" {
  resource_group_name     = module.rgfpi.resource_group_name
  automation_account_name = module.fpiaa.automation_account_name
  name                    = "AzureRM.Websites"

  module_link {
    uri = "https://devopsgallerystorage.blob.core.windows.net/packages/azurerm.websites.5.2.1.nupkg"
  }
}

