output "login_server" {
  value = azurerm_container_registry.container_registry[*].login_server
}

output "id" {
  value = azurerm_container_registry.container_registry[*].id
}
