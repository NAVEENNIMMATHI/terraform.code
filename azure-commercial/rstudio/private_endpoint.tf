# Private EndPoint MongoDB Cluster
resource "mongodbatlas_privatelink_endpoint" "mongodb_private_endpoint" {
  project_id    = var.mongodb_atlas_cluster_project_id
  provider_name = "AZURE"
  region        = var.location
}


# Private EndPoint Azure
resource "azurerm_private_endpoint" "azure_mongodb_private_endpoint" {
  name                = "pe-${var.application_acronym}-mongodb-${var.environment_acronym}"
  location            = var.location
  resource_group_name = var.spi_vnet_resource_group_name
  subnet_id           = module.mongodb_subnet.subnet_id
  tags                = var.tags

  private_service_connection {
    name                           = mongodbatlas_privatelink_endpoint.mongodb_private_endpoint.private_link_service_name
    is_manual_connection           = true
    private_connection_resource_id = mongodbatlas_privatelink_endpoint.mongodb_private_endpoint.private_link_service_resource_id
    request_message                = "It is PE for MongoDB Cluster to Azure"
  }
  depends_on          = [module.mongodb_subnet, mongodbatlas_privatelink_endpoint.mongodb_private_endpoint]
}


# Link MongoDB Private Endpoint & Azure Private EndPoint
resource "mongodbatlas_privatelink_endpoint_service" "connect_mongodb_azure_pe_dev" {
  project_id                  = mongodbatlas_privatelink_endpoint.mongodb_private_endpoint.project_id
  private_link_id             = mongodbatlas_privatelink_endpoint.mongodb_private_endpoint.private_link_id
  endpoint_service_id         = azurerm_private_endpoint.azure_mongodb_private_endpoint.id
  private_endpoint_ip_address = azurerm_private_endpoint.azure_mongodb_private_endpoint.private_service_connection[0].private_ip_address
  provider_name               = "AZURE"

  depends_on          = [azurerm_private_endpoint.azure_mongodb_private_endpoint]
}
