module "abla_app_service" {
  source                  = "../../modules/app_service"
  name                    = "${var.abla_ase_app_service_name}"
  resource_group_name     = "${module.applicationrg.resource_group_name}"
  resource_group_location = "${module.applicationrg.resource_group_location}"
  app_service_plan_id     = "${module.ablaappserviceplan.app_service_plan_id}"
  tags                    = "${var.tags}"
}

#app_settings = {
  #   azSAAccountKey = "${var.storageaccountaccesskey}"
  #   azSAAccountName = "${module.storageaccount.storage_account_name}"
  #   azSADefaultEndpointsProtocol = "https"
  #   azSAEndpointSuffix = "core.windows.net"
  #   AzureDatabase = "YES"
  #   ENVIRONMENT = "${var.appenvironment}"
  #   EnvironmentVersion = "${var.appenvironmentversion}"
  #   MembershipServicesEmailHeader = "ms-email"
  #   MicrosoftLogin= "YES"
  #   OutputFilesContainer= "worksheets"
  #   SessionTime=15
  #   SSOUser= "ablaadmin@kpmg.com"
  #   UploadFilesContainer= "uploadfiles"
  #   UploadFilesTemplateContainer= "uploadingfilestemplates"
  #   UserNamePassword= "NO"
  #   DiagnosticServices_EXTENSION_VERSION = 3
  #   InstrumentationEngine_EXTENSION_VERSION = 1
  #   SnapshotDebugger_EXTENSION_VERSION = 1
  # }