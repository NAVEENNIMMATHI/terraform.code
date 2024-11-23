resource "azuread_group" "dfusers_group" {
  name =  var.environment == "production" ? "CO-SPI-DataFactory-KeyMng" :  "CO-SPI-DataFactory-KeyMng${upper(var.environment_acronym)}"
  description             = "CO-SPI-DataFactory-KeyMng"
}