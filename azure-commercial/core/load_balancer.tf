# resource "azurerm_lb" "aaddslb1" {
#   name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "aadds-f483e5cf3afa462687c4bfb3186f7deb-lb" : "alb-${var.location_acronym}-int-aadds-${var.environment_acronym}"
#   resource_group_name = azurerm_resource_group.aadds.name
#   location            = azurerm_resource_group.aadds.location

#   frontend_ip_configuration {
#     name                 = "MG5D1-61CRBE0ZBFe"
#     public_ip_address_id = azurerm_public_ip.aadspip.id
#   }
#   lifecycle {
#     ignore_changes = [
#       frontend_ip_configuration
#     ]
#   }
#   tags = var.tags
# }

resource "azurerm_lb" "rdsgw_lb" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${upper(var.legacy_env_acronym_ns)}-${var.location}-RDSGW-EXTERNAL-nlb" : "alb-${var.location_acronym}-ext-rdsgw-${var.environment_acronym}"
  location            = azurerm_resource_group.rds.location
  resource_group_name = azurerm_resource_group.rds.name

  frontend_ip_configuration {
    name                 = "LoadBalancerFrontEnd"
    public_ip_address_id = azurerm_public_ip.rdsgwnlbpip.id
  }
  lifecycle {
    ignore_changes = [
      frontend_ip_configuration
    ]
  }

  tags = var.tags
}

resource "azurerm_lb" "rdsgw_lb2" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${upper(var.legacy_env_acronym_ns)}-${var.location}-RDSGW-nlb" : "alb-${var.location_acronym}-int-rdsgw-${var.environment_acronym}"
  location            = azurerm_resource_group.rds.location
  resource_group_name = azurerm_resource_group.rds.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name               = "LoadBalancerFrontEnd"
    private_ip_address = var.rds_gateway_load_balancer_2_private_static_ip
    subnet_id          = azurerm_subnet.rdgw.id
  }
  lifecycle {
    ignore_changes = [
      frontend_ip_configuration
    ]
  }
  tags = var.tags
}

resource "azurerm_lb" "rdsgw_lb3" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${upper(var.legacy_env_acronym_ns)}-${var.location}-RDSGWHub-ELB" : "alb-${var.location_acronym}-ext-rdsgwcore-${var.environment_acronym}"
  location            = azurerm_resource_group.rds.location
  resource_group_name = azurerm_resource_group.rds.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "LoadBalancerFrontEnd"
    public_ip_address_id = azurerm_public_ip.rdsgwhubpip.id
  }
  lifecycle {
    ignore_changes = [
      frontend_ip_configuration
    ]
  }
  tags = var.tags
}

###Health Probes

resource "azurerm_lb_probe" "rdsgw_lb_probe1" {
  name                = "HTTPS_Probe"
  resource_group_name = azurerm_resource_group.rds.name
  port                = 443
  loadbalancer_id     = azurerm_lb.rdsgw_lb.id
  number_of_probes    = 2
  interval_in_seconds = "5"
  protocol            = "Tcp"
  request_path        = ""
}

resource "azurerm_lb_probe" "rdsgw_lb2_probe1" {
  name                = "HTTPS_Probe"
  resource_group_name = azurerm_resource_group.rds.name
  port                = 443
  loadbalancer_id     = azurerm_lb.rdsgw_lb2.id
  number_of_probes    = 2
  interval_in_seconds = "5"
  protocol            = "Tcp"
  request_path        = ""
}

resource "azurerm_lb_probe" "rdsgw_lb3_probe1" {
  name                = "https_probe"
  resource_group_name = azurerm_resource_group.rds.name
  port                = 443
  loadbalancer_id     = azurerm_lb.rdsgw_lb3.id
  number_of_probes    = 2
  interval_in_seconds = "5"
  protocol            = "Tcp"
  request_path        = ""
}

resource "azurerm_lb_probe" "rdsgw_lb3_probe2" {
  name                = "RDP_Probe"
  resource_group_name = azurerm_resource_group.rds.name
  port                = 3389
  loadbalancer_id     = azurerm_lb.rdsgw_lb3.id
  number_of_probes    = 2
  request_path        = ""
  interval_in_seconds = "5"
  protocol            = "Tcp"
}

#NAT Rules

# resource "azurerm_lb_nat_rule" "aaddslb1_natrule1" {
#   name                           = "B-KEF3BC0EWFU3HPsh"
#   resource_group_name            = azurerm_resource_group.aadds.name
#   loadbalancer_id                = azurerm_lb.aaddslb1.id
#   protocol                       = "Tcp"
#   frontend_port                  = 5987
#   backend_port                   = 5986
#   frontend_ip_configuration_name = "MG5D1-61CRBE0ZBFe"
#   enable_floating_ip             = "false"
# }

# resource "azurerm_lb_nat_rule" "aaddslb1_natrule2" {
#   resource_group_name            = azurerm_resource_group.aadds.name
#   loadbalancer_id                = azurerm_lb.aaddslb1.id
#   name                           = "L614WOABPBSJOB9Https"
#   protocol                       = "Tcp"
#   frontend_port                  = 443
#   backend_port                   = 443
#   frontend_ip_configuration_name = "MG5D1-61CRBE0ZBFe"
#   enable_floating_ip             = "false"
# }

# resource "azurerm_lb_nat_rule" "aaddslb1_natrule3" {
#   name                           = "L614WOABPBSJOB9Psh"
#   frontend_ip_configuration_name = "MG5D1-61CRBE0ZBFe"
#   frontend_port                  = "5986"
#   backend_port                   = "5986"
#   loadbalancer_id                = azurerm_lb.aaddslb1.id
#   protocol                       = "Tcp"
#   resource_group_name            = azurerm_resource_group.aadds.name
# }

#Backend Address Pools

# resource "azurerm_lb_backend_address_pool" "aaddslb1_beap1" {
#   resource_group_name = azurerm_resource_group.aadds.name
#   loadbalancer_id     = azurerm_lb.aaddslb1.id
#   name                = "MG5D1-61CRBE0ZBBe"
# }

resource "azurerm_lb_backend_address_pool" "rdsgw_lb_beap1" {
  name                = "RDGW_Pool"
  resource_group_name = azurerm_resource_group.rds.name
  loadbalancer_id     = azurerm_lb.rdsgw_lb.id
}

resource "azurerm_lb_backend_address_pool" "rdsgw_lb2_beap1" {
  name                = "RDGW-Pool"
  resource_group_name = azurerm_resource_group.rds.name
  loadbalancer_id     = azurerm_lb.rdsgw_lb2.id
}

resource "azurerm_lb_backend_address_pool" "rdsgw_lb3_beap1" {
  name                = "RDGWServersPool"
  resource_group_name = azurerm_resource_group.rds.name
  loadbalancer_id     = azurerm_lb.rdsgw_lb3.id
}

#NIC Pool Associations

resource "azurerm_network_interface_backend_address_pool_association" "rdsgw_lb2_poolassociation2" {
  count = var.environment_acronym == "pd" ? 1 : 0

  #network_interface_id    = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-rds-rg/providers/Microsoft.Network/networkInterfaces/UEMCRDSGW2P1-nic"
  network_interface_id = element(azurerm_network_interface.rdgw2nic.*.id, count.index)
  
  ip_configuration_name   = "${element(azurerm_virtual_machine.rdgw2vm.*.name, count.index)}-config"
  backend_address_pool_id = azurerm_lb_backend_address_pool.rdsgw_lb2_beap1.id
}

resource "azurerm_network_interface_backend_address_pool_association" "rdsgw_lb3_poolassociation1" {
  count = var.environment_acronym == "pd" ? 1 : 0

  #network_interface_id    = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-rds-rg/providers/Microsoft.Network/networkInterfaces/UEMCRDSGW1P1-nic"
  network_interface_id = element(azurerm_network_interface.rdgw1nic.*.id, count.index)
  
  ip_configuration_name   = "${element(azurerm_virtual_machine.rdgw1vm.*.name, count.index)}-config"
  backend_address_pool_id = azurerm_lb_backend_address_pool.rdsgw_lb3_beap1.id
}

resource "azurerm_network_interface_backend_address_pool_association" "rdsgw_lb3_poolassociation2" {
  count = var.environment_acronym == "pd" ? 1 : 0

  #network_interface_id    = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-rds-rg/providers/Microsoft.Network/networkInterfaces/UEMCRDSGW2P1-nic"
  network_interface_id = element(azurerm_network_interface.rdgw2nic.*.id, count.index)
  
  ip_configuration_name   = "${element(azurerm_virtual_machine.rdgw2vm.*.name, count.index)}-config"
  backend_address_pool_id = azurerm_lb_backend_address_pool.rdsgw_lb3_beap1.id
}

resource "azurerm_network_interface_backend_address_pool_association" "rdsgw_lb2_poolassociation1" {
  count = var.environment_acronym == "pd" ? 1 : 0

  #network_interface_id    = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-rds-rg/providers/Microsoft.Network/networkInterfaces/UEMCRDSGW1P1-nic"
  network_interface_id = element(azurerm_network_interface.rdgw1nic.*.id, count.index)
  
  ip_configuration_name   = "${element(azurerm_virtual_machine.rdgw1vm.*.name, count.index)}-config"
  backend_address_pool_id = azurerm_lb_backend_address_pool.rdsgw_lb2_beap1.id
}

#Load Balancing Rules

resource "azurerm_lb_rule" "rdsgw_lb2_rule1" {
  resource_group_name            = azurerm_resource_group.rds.name
  name                           = "HTTPS_Rule"
  protocol                       = "All"
  loadbalancer_id                = azurerm_lb.rdsgw_lb2.id
  backend_port                   = 0
  frontend_ip_configuration_name = "LoadBalancerFrontEnd"
  frontend_port                  = 0
  probe_id                       = azurerm_lb_probe.rdsgw_lb2_probe1.id
  backend_address_pool_id        = azurerm_lb_backend_address_pool.rdsgw_lb2_beap1.id
  enable_floating_ip             = "false"
  idle_timeout_in_minutes        = 30
  load_distribution              = "SourceIP"
  disable_outbound_snat          = "false"
}

resource "azurerm_lb_rule" "rdsgw_lb_rule3" {
  resource_group_name            = azurerm_resource_group.rds.name
  name                           = "UDP_Rule"
  protocol                       = "Tcp"
  loadbalancer_id                = azurerm_lb.rdsgw_lb.id
  backend_port                   = 3391
  frontend_port                  = 3391
  frontend_ip_configuration_name = "LoadBalancerFrontEnd"
  probe_id                       = azurerm_lb_probe.rdsgw_lb_probe1.id
  backend_address_pool_id        = azurerm_lb_backend_address_pool.rdsgw_lb_beap1.id
  enable_floating_ip             = "false"
  idle_timeout_in_minutes        = 4
  load_distribution              = "Default"
  disable_outbound_snat          = "false"
}

resource "azurerm_lb_rule" "rdsgw_lb3_rule1" {
  resource_group_name            = azurerm_resource_group.rds.name
  name                           = "HTTPS_rule"
  protocol                       = "Tcp"
  loadbalancer_id                = azurerm_lb.rdsgw_lb3.id
  backend_port                   = 443
  frontend_ip_configuration_name = "LoadBalancerFrontEnd"
  frontend_port                  = 443
  probe_id                       = azurerm_lb_probe.rdsgw_lb3_probe1.id
  backend_address_pool_id        = azurerm_lb_backend_address_pool.rdsgw_lb3_beap1.id
  enable_floating_ip             = "false"
  idle_timeout_in_minutes        = 30
  load_distribution              = "SourceIP"
  disable_outbound_snat          = "false"
}

resource "azurerm_lb_rule" "rdsgw_lb3_rule2" {
  resource_group_name            = azurerm_resource_group.rds.name
  name                           = "UDP_Rule"
  protocol                       = "Tcp"
  loadbalancer_id                = azurerm_lb.rdsgw_lb3.id
  backend_port                   = 3391
  frontend_port                  = 3391
  frontend_ip_configuration_name = "LoadBalancerFrontEnd"
  probe_id                       = azurerm_lb_probe.rdsgw_lb3_probe1.id
  backend_address_pool_id        = azurerm_lb_backend_address_pool.rdsgw_lb3_beap1.id
  enable_floating_ip             = "false"
  idle_timeout_in_minutes        = 30
  load_distribution              = "SourceIP"
  disable_outbound_snat          = "false"
}

resource "azurerm_lb_rule" "rdsgw_lb_rule1" {
  resource_group_name            = azurerm_resource_group.rds.name
  name                           = "HTTPS_Rule"
  protocol                       = "Tcp"
  loadbalancer_id                = azurerm_lb.rdsgw_lb.id
  backend_port                   = 443
  frontend_ip_configuration_name = "LoadBalancerFrontEnd"
  frontend_port                  = 443
  probe_id                       = azurerm_lb_probe.rdsgw_lb_probe1.id
  backend_address_pool_id        = azurerm_lb_backend_address_pool.rdsgw_lb_beap1.id
  enable_floating_ip             = "false"
  idle_timeout_in_minutes        = 4
  load_distribution              = "SourceIP"
  disable_outbound_snat          = "false"
}

resource "azurerm_lb_rule" "rdsgw_lb_rule2" {
  resource_group_name            = azurerm_resource_group.rds.name
  name                           = "test-3389"
  protocol                       = "Tcp"
  loadbalancer_id                = azurerm_lb.rdsgw_lb.id
  backend_port                   = 3389
  frontend_ip_configuration_name = "LoadBalancerFrontEnd"
  frontend_port                  = 3389
  probe_id                       = azurerm_lb_probe.rdsgw_lb_probe1.id
  backend_address_pool_id        = azurerm_lb_backend_address_pool.rdsgw_lb_beap1.id
  enable_floating_ip             = "false"
  idle_timeout_in_minutes        = 4
  load_distribution              = "Default"
  disable_outbound_snat          = "false"
}


# Squid load balancer
resource "azurerm_lb" "squid-ilb" {
  name                = "alb-use-int-fw-${var.legacy_env_acronym}"
  location            = azurerm_resource_group.hubvnet.location
  resource_group_name = azurerm_resource_group.hubvnet.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name      = "ipconfig-alb-use-int-fw-${var.legacy_env_acronym}"
    private_ip_address_allocation = "Static"
    private_ip_address = var.squid_proxy_load_balancer_private_static_ip
    subnet_id = azurerm_subnet.squidvmsubnet.id
  }

  tags = var.tags_Networking
}

resource "azurerm_lb_backend_address_pool" "squid-pool" {
  resource_group_name = azurerm_resource_group.hubvnet.name
  loadbalancer_id     = azurerm_lb.squid-ilb.id
  name                = "squid-backend-pool"
}

resource "azurerm_lb_probe" "squid-probe" {
  resource_group_name = azurerm_resource_group.hubvnet.name
  loadbalancer_id     = azurerm_lb.squid-ilb.id
  name                = "squid-running-probe"
  port                = 3128
}

resource "azurerm_lb_rule" "squid-lb-rule" {
  resource_group_name            = azurerm_resource_group.hubvnet.name
  loadbalancer_id                = azurerm_lb.squid-ilb.id
  name                           = "squid-lb-rule"
  protocol                       = "Tcp"
  frontend_port                  = 3128
  backend_port                   = 3128
  frontend_ip_configuration_name = "ipconfig-alb-use-int-fw-${var.legacy_env_acronym}"
  backend_address_pool_id        = azurerm_lb_backend_address_pool.squid-pool.id
  probe_id                       = azurerm_lb_probe.squid-probe.id
}