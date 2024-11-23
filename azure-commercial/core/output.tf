output "dmappgateway_subnet_id" {
  value = azurerm_subnet.dmappgateway.id
}

output "dmase_subnet_id" {
  value = azurerm_subnet.corease.id
}

output "dmpe_subnet_id" {
  value = azurerm_subnet.dmpe.id
}

output "dmdfir_subnet_id" {
  value = azurerm_subnet.dmdfir.id
}

output "dmworkers_subnet_id" {
  value = azurerm_subnet.dmworkers.id
}

output "shared_rg_name" {
  value = azurerm_resource_group.hubvnet.name
}