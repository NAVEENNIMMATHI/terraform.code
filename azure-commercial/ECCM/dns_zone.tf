# We need to link the cluster's DNS Zone to the DNS server's Vnet since we use custom DNS servers on our Vnet

resource "null_resource" "dns_zone_link_sh" {
  provisioner "local-exec" {
    interpreter = ["bash"]
    command     = "dns_zone_link.sh"

    environment = {
      DNS_VNET           = "${var.dns_vnet}"
      AKS_RESOURCE_GROUP = module.eccm_rg.resource_group_name
      AKS_CLUSTER_NAME   = "aks-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
      NODE_SUBSCRIPTION  = var.aks_node_subscription
    }
  }
}