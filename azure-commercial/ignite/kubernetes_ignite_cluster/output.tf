#output "client_certificate" {
#  value = azurerm_kubernetes_cluster.kubernetes_cluster.kube_config.0.client_certificate
#}

#output "kube_config" {
#  value = azurerm_kubernetes_cluster.kubernetes_cluster.kube_config_raw
#}

output "id" {
  value = azurerm_kubernetes_cluster.kubernetes_cluster.id
}

output "principal_id" {
  value = azurerm_kubernetes_cluster.kubernetes_cluster.identity.0.principal_id
}
