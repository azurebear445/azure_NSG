resource "random_id" "this" {
  keepers = {
    # Generate a new id each time we modify attributes that will re-create NSG
    description         = local.tags["purpose"]
    environment         = var.environment
    namespace           = var.namespace
    resource_group_name = var.resource_group_name
  }

  byte_length = 3
}

resource "azurerm_network_security_group" "this" {
  name                = local.nsg_tags["Name"]
  location            = var.location
  resource_group_name = var.resource_group_name


