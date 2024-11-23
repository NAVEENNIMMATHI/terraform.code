locals {
  aks_resource_group_local  = module.mathworks_rg_client.resource_group_name
  aks_cluster_name_local    = "aks-${var.location_acronym}-${var.application_acronym}-${var.client}-${var.environment_acronym}"
}


# We need to link the cluster's DNS Zone to the DNS server's Vnet since we use custom DNS servers on our Vnet

resource "null_resource" "dns_zone_link_sh" {
  provisioner "local-exec" {
    interpreter = ["bash"]
    command     = "dns_zone_link.sh"

    environment = {
      DNS_VNET           = "${var.dns_vnet}"
      AKS_RESOURCE_GROUP = local.aks_resource_group_local
      AKS_CLUSTER_NAME   = local.aks_cluster_name_local
      NODE_SUBSCRIPTION  = var.subscription_id
    }
  }
}
