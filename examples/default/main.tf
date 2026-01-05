# =============================================================================
# Default Example - Enterprise Security Group Rules Only
# =============================================================================
# This example creates an NSG with only enterprise-managed rules.
# No user-defined ingress rules are added.
# =============================================================================

resource "azurerm_resource_group" "this" {
  name     = "rg-nsg-default-example"
  location = "centralus"
}

module "nsg_default" {
  source = "../../"

  name                = "default"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  environment         = "dev"
  namespace           = "example"

  # No user-defined ingress rules - only enterprise rules will be applied
  ingress_rules = {
    from_cidrs = {
      tcp  = {}
      udp  = {}
      icmp = {}
    }
    from_nsgs = {
      tcp = {}
      udp = {}
    }
  }

  egress_rules = {
    to_cidrs = null
    to_nsgs  = {}
  }

  enable_any_egress      = true
  enable_any_nsg_to_self = false

  tags = {
    architecture       = "native"
    owner              = "platform_team"
    purpose            = "Default NSG example demonstrating enterprise security group rules only."
    terraform_resource = "true"
    appid              = "app-default-001"
  }
}
