# =============================================================================
# Web Tier Example - User-Defined Rules + Enterprise Security Group Rules
# =============================================================================
# This example creates an NSG for web applications with user-defined rules.
# Enterprise-managed rules are applied automatically in addition to user rules.
# =============================================================================

resource "azurerm_resource_group" "this" {
  name     = "rg-nsg-web-tier-example"
  location = "centralus"
}

module "nsg_web" {
  source = "../../"

  name                = "web-tier"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  environment         = "dev"
  namespace           = "example"

  # User-defined ingress rules for web traffic
  ingress_rules = {
    from_cidrs = {
      tcp = {
        # HTTPS from internal network
        "443" = {
          cidrs   = ["10.0.0.0/8"]
          to_port = 443
        }
        # HTTP from internal network
        "80" = {
          cidrs   = ["10.0.0.0/8"]
          to_port = 80
        }
        # SSH from bastion subnet
        "22" = {
          cidrs   = ["10.100.0.0/24"]
          to_port = 22
        }
        # Custom app port from app subnet
        "8080" = {
          cidrs   = ["10.200.0.0/24"]
          to_port = 8080
        }
        # Health check from load balancer subnet
        "8443" = {
          cidrs   = ["10.50.0.0/24"]
          to_port = 8443
        }
      }
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
    purpose            = "Web tier NSG example with user-defined rules for internal traffic."
    terraform_resource = "true"
    appid              = "app-web-001"
  }
}
