# =============================================================================
# Azure NSG Module - Default Example
# =============================================================================
# This example demonstrates the NSG module with enterprise security group
# rules only. No user-defined ingress rules are added.
# =============================================================================

# Create Resource Group for testing
resource "azurerm_resource_group" "this" {
  name     = "rg-nsg-default-example"
  location = "centralus"
}

# =============================================================================
# NSG with Enterprise Rules Only
# =============================================================================
module "nsg_default" {
  source = "../../"

  name                = "default"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  environment         = "dev"
  namespace           = "test-app"

  # No user-defined ingress rules
  # Only enterprise security group rules will be applied
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

  # Egress rules
  egress_rules = {
    to_cidrs = null
    to_nsgs  = {}
  }

  # Enable all egress
  enable_any_egress = true

  # Disable self-to-self communication
  enable_any_nsg_to_self = false

  # Tags
  tags = {
    architecture       = "native"
    owner              = "platform_team"
    purpose            = "Default NSG example demonstrating enterprise security group rules only."
    terraform_resource = "true"
    appid              = "app-default-001"
    custom_tags = {
      team        = "infrastructure"
      cost_center = "engineering"
      example     = "default"
    }
  }
}
