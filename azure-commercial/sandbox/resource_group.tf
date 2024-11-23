module "applicationrg"
{
  source = "../../modules/resource_group"
  resource_group_name = "${local.rg-application-name}"  
  resource_group_location = "${local.rg-default-location}"
  tags = "${var.tags}"  
}