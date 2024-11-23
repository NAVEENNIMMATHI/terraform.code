resource "azurerm_lb" "elb" {
  name                = "CO-${var.environment}-${var.location}-${var.applicationname}-Palo-ELB"
  resource_group_name = "${azurerm_resource_group.transitpalofw.name}"
  location            = "${azurerm_resource_group.transitpalofw.location}"
  sku		      = "Standard"

  frontend_ip_configuration {
    name                 = "${var.elb_frontend_ip_configuration_name}"
    public_ip_address_id = "${azurerm_public_ip.transit-elb-cyberarkippip.id}"
  }
  frontend_ip_configuration {
    name                 = "kpmgleasingtool.kpmgspectrum.com"
    public_ip_address_id = "${azurerm_public_ip.KLTProd-pip.id}"
  }
  frontend_ip_configuration {
    name                 = "kltuats.kpmgspectrum.com"
    public_ip_address_id = "${azurerm_public_ip.KLTUATS-pip.id}"
  }
  frontend_ip_configuration {
    name                 = "gw2.kpmgleasingtool.kpmg.com"
    public_ip_address_id = "${azurerm_public_ip.KLTProdGW2-pip.id}"
  }
  frontend_ip_configuration {
    name                 = "gw2.kltuats.kpmgspectrum.com"
    public_ip_address_id = "${azurerm_public_ip.KLTUATSGW2-pip.id}"
  }
  frontend_ip_configuration {
    name                 = "NATRuleTesting"
    public_ip_address_id = "${azurerm_public_ip.NATTest.id}"
  }

  tags = "${var.tags}"
}

resource "azurerm_lb_backend_address_pool" "elbbap" {
  name                = "${azurerm_availability_set.paloaltofwas.name}"
  resource_group_name = "${azurerm_resource_group.transitpalofw.name}"
  loadbalancer_id     = "${azurerm_lb.elb.id}"
}

resource "azurerm_lb_probe" "elbprobetcp22" {
  name                = "TCP-22"
  resource_group_name = "${azurerm_resource_group.transitpalofw.name}"
  loadbalancer_id     = "${azurerm_lb.elb.id}"
  protocol            = "Tcp"
  port                = 22
  interval_in_seconds = 5
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "elbrule" {
  name                = "${var.elbrule_name}"
  resource_group_name = "${azurerm_resource_group.transitpalofw.name}"
  loadbalancer_id     = "${azurerm_lb.elb.id}"
  frontend_ip_configuration_name  = "${var.elb_frontend_ip_configuration_name}"
  frontend_port       = 80
  backend_port        = 80
  enable_floating_ip  = "true"
  idle_timeout_in_minutes  = "4"
  protocol            = "Tcp"
  load_distribution   = "SourceIP"
  backend_address_pool_id  = "${azurerm_lb_backend_address_pool.elbbap.id}"
  probe_id            = "${azurerm_lb_probe.elbprobetcp22.id}"
}


