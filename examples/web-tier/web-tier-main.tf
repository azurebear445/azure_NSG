# =============================================================================
# Azure NSG Module - Web Tier Example
# =============================================================================
# This example demonstrates the NSG module with user-defined ingress rules
# for web applications. Enterprise security group rules are also applied
# automatically based on deployment region.
# =============================================================================

# Create Resource Group for testing
resource "azurerm_resource_group" "this" {
  name     = "rg-nsg-web-tier-example"
  location = "centralus"
}

# =============================================================================
# Log Analytics Workspace (for NSG Diagnostic Settings)
# =============================================================================
resource "azurerm_log_analytics_workspace" "this" {
  name                = "law-nsg-web-tier-example"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  sku                 = "PerGB2018"
  retention_in_days   = 90
}

# =============================================================================
# NSG with User-Defined Rules + Enterprise Rules
# =============================================================================
module "nsg_web" {
  source = "../../"

  name                = "web-tier"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  environment         = "dev"
  namespace           = "test-app"

  # Log Analytics Workspace for diagnostic settings
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id

  # User-defined ingress rules
  ingress_rules = {
    from_cidrs = {
      tcp = {
        # HTTPS from web subnet
        "443" = {
          cidrs   = ["10.100.1.0/24"]
          to_port = 443
        }
        # HTTP from web subnet
        "80" = {
          cidrs   = ["10.100.1.0/24"]
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
      udp = {
        # DNS from DNS servers
        "53" = {
          cidrs   = ["10.100.2.0/24"]
          to_port = 53
        }
      }
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

  # Enable self-to-self communication
  enable_any_nsg_to_self = true

  # Tags
  tags = {
    architecture       = "native"
    owner              = "platform_team"
    purpose            = "Web tier NSG example with user-defined rules for internal web traffic."
    terraform_resource = "true"
    appid              = "app-web-001"
    custom_tags = {
      team        = "infrastructure"
      cost_center = "engineering"
      example     = "web-tier"
    }
  }
}
