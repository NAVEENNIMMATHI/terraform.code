#Shared
resource "azuread_group" "aad_mip_cluster_admin" {
  name = "aad-${var.application_name}-cluster-admin"
}

resource "azuread_group" "aad_mip_global_license_manager" {
  name = "aad-${var.application_name}-global-license-manager"
}

resource "azuread_group" "aad_mip_postgres_admin" {
  name = "aad-${var.application_name}-postgres-admin"
}

resource "azuread_group" "aad_mip_global_admin" {
  name = "aad-${var.application_name}-global-admin"
}

resource "azuread_group" "aad_mip_global_user" {
  name = "aad-${var.application_name}-global-user"
}

resource "azuread_group" "aad_mip_global_reader" {
  name = "aad-${var.application_name}-global-reader"
}

#Clients 
resource "azuread_group" "aad_mip_client_admin" {
  name = "aad-${var.application_name}-${var.client}-admin"
}

resource "azuread_group" "aad_mip_client_user" {
  name = "aad-${var.application_name}-${var.client}-user"
}

resource "azuread_group" "aad_mip_client_reader" {
  name = "aad-${var.application_name}-${var.client}-reader"
}
