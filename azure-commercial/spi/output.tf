output "powerbi_subnet_id" {
  value = azurerm_subnet.spiapp1_subnet.id
}

output "vm_storage_uri" {
  value = azurerm_storage_account.copeuscospivmlog01sa.primary_blob_endpoint
}

output "spi_vnet_name" {
  value = azurerm_virtual_network.spivnet.name
}

output "spi_rg_name" {
  value = azurerm_resource_group.cospivnetrg.name
}

