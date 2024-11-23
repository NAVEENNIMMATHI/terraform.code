# AAD Group for Explorer Users
resource "azuread_group" "Explorer" {
  name = "CO${upper(var.application_acronym_spi)}_${title(var.application_name)}-Explorer${title(var.environment_acronym_aad_app)}"
}

# AAD Group for ExplorerPublish Users
resource "azuread_group" "ExplorerPublish" {
  name = "CO${upper(var.application_acronym_spi)}_${title(var.application_name)}-Explorer(Publish)${title(var.environment_acronym_aad_app)}"
}

# AAD Group for ServerAdministrator Users
resource "azuread_group" "ServerAdministrator" {
  name = "CO${upper(var.application_acronym_spi)}_${title(var.application_name)}-ServerAdministrator${title(var.environment_acronym_aad_app)}"
}

# AAD Group for ServiceAccounts Users
resource "azuread_group" "ServiceAccounts" {
  name = "CO${upper(var.application_acronym_spi)}_${title(var.application_name)}-ServiceAccounts${title(var.environment_acronym_aad_app)}"
}

# AAD Group for SiteAdministratorExplorer Users
resource "azuread_group" "SiteAdministratorExplorer" {
  name = "CO${upper(var.application_acronym_spi)}_${title(var.application_name)}-SiteAdministratorExplorer${title(var.environment_acronym_aad_app)}"
}

# AAD Group for Unlicensed Users
resource "azuread_group" "Unlicensed" {
  name = "CO${upper(var.application_acronym_spi)}_${title(var.application_name)}-Unlicensed${title(var.environment_acronym_aad_app)}"
}

# AAD Group for Viewer Users
resource "azuread_group" "Viewer" {
  name = "CO${upper(var.application_acronym_spi)}_${title(var.application_name)}-Viewer${title(var.environment_acronym_aad_app)}"
}

# AAD Group for External_Users Users
resource "azuread_group" "External_Users" {
  name = "CO${upper(var.application_acronym_spi)}_${title(var.application_name)}_External_Users${title(var.environment_acronym_aad_app)}"
}

# AAD Group for Internal_Users Users
resource "azuread_group" "Internal_Users" {
  name        = "CO${upper(var.application_acronym_spi)}_${title(var.application_name)}_Internal_Users${title(var.environment_acronym_aad_app)}"
  description = "Tableau_Internal_Users"
}