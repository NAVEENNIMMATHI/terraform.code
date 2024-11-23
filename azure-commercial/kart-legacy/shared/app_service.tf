module "appservice" {
  source                  = "../../modules12/app_service"
  name                    = var.app_service_name
  resource_group_name     = data.azurerm_resource_group.sharedrg.name
  resource_group_location = data.azurerm_resource_group.sharedrg.location
  app_service_plan_id     = data.azurerm_app_service_plan.appserviceplan.id
  tags                    = var.tags
  app_service_backup_name = var.app_service_name
  storage_account_url     = "${data.azurerm_storage_account.webappbackup.primary_blob_endpoint}${var.webappbackup_storage_container_name}${data.azurerm_storage_account_sas.webappbackupsas.sas}"

  #  app_settings = {
  #    azSAAccountKey                          = "${var.storageaccountaccesskey}"
  #    azSAAccountName                         = "${module.storageaccount.storage_account_name}"
  #    azSADefaultEndpointsProtocol            = "https"
  #    azSAEndpointSuffix                      = "core.windows.net"
  #    AzureDatabase                           = "YES"
  #    ENVIRONMENT                             = "${var.appenvironment}"
  #    EnvironmentVersion                      = "${var.appenvironmentversion}"
  #    MembershipServicesEmailHeader           = "ms-email"
  #    MicrosoftLogin                          = "YES"
  #    OutputFilesContainer                    = "worksheets"
  #    SessionTime                             = 15
  #    SSOUser                                 = "ablaadmin@kpmg.com"
  #    UploadFilesContainer                    = "uploadfiles"
  #    UploadFilesTemplateContainer            = "uploadingfilestemplates"
  #    UserNamePassword                        = "NO"
  #    DiagnosticServices_EXTENSION_VERSION    = 3
  #    InstrumentationEngine_EXTENSION_VERSION = 1
  #    SnapshotDebugger_EXTENSION_VERSION      = 1
  #    userattachmentcontainer                 = "userattachment${var.environment}"
  #    useruploadcontainer                     = "userupload${var.environment}"
  #  }
  #
  #  connection_string {
  #    name  = "ABLAMasterConnection"
  #    type  = "SQLAzure"
  #    value = ""
  #  }
}