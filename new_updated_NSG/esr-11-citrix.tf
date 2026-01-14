# Citrix Application Enterprise Security Rule Rules (ESR 11)
# This file contains enterprise-managed rules for Citrix application access
# and publishing.
#
# Region Mapping:
# Region-01: eastus | Region-02: eastus2 | Region-03: northcentralus (common only)
#
#
# Priority Block: 1040-1089 (50 total slots)
#   - Currently used: 1040-1050 (11 rules)
#   - Reserved for future: 1051-1089 (39 slots)
#
# Rule Distribution:
#   - Common rules: 11 (apply to both regions)
#   - Region-01 only: 1 (eastus only) - COMMENTED OUT, NEEDS VERIFICATION
#   - Region-02 only: 0 (eastus only)
#
#
# Variable Naming: enterprise_11_citrix_rules
locals {
    # Common rules - Apply to all regions
     11 rules are identical in both AWS regions
  citrix_11_common = {
    "tcp-80-10-111-124-135-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1040
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "10.111.124.135/32"
      destination_address_prefix = "*"
      description                = "ESR 11 - Citrix Rule"
    }
    "tcp-80-10-111-124-176-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1041
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "10.111.124.176/32"
      destination_address_prefix = "*"
      description                = "ESR 11 - Citrix Rule"
    }
    "tcp-80-10-120-191-8-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1042
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "10.120.191.8/32"
      destination_address_prefix = "*"
      description                = "ESR 11 - Citrix Rule"
    }
    "tcp-80-10-120-191-9-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1043
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "10.120.191.9/32"
      destination_address_prefix = "*"
      description                = "ESR 11 - Citrix Rule"
    }
    "tcp-1494-10-0-0-0-8-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1044
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1494"
      source_address_prefix      = "10.0.0.0/8"
      destination_address_prefix = "*"
      description                = "ESR 11 - Citrix Rule"
    }
    "tcp-2598-10-0-0-0-8-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1045
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "2598"
      source_address_prefix      = "10.0.0.0/8"
      destination_address_prefix = "*"
      description                = "ESR 11 - Citrix Rule"
    }
    "tcp-8008-10-0-0-0-8-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1046
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "8008"
      source_address_prefix      = "10.0.0.0/8"
      destination_address_prefix = "*"
      description                = "ESR 11 - Citrix Rule"
    }
    "tcp-9988-10-0-0-0-8-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1047
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "9988"
      source_address_prefix      = "10.0.0.0/8"
      destination_address_prefix = "*"
      description                = "ESR 11 - Citrix Rule"
    }
    "udp-1494-10-0-0-0-8-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1048
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1494"
      source_address_prefix      = "10.0.0.0/8"
      destination_address_prefix = "*"
      description                = "ESR 11 - Citrix Rule"
    }
    "udp-2598-10-0-0-0-8-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1049
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "2598"
      source_address_prefix      = "10.0.0.0/8"
      destination_address_prefix = "*"
      description                = "ESR 11 - Citrix Rule"
    }
    "udp-9988-10-0-0-0-8-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1050
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "9988"
      source_address_prefix      = "10.0.0.0/8"
      destination_address_prefix = "*"
      description                = "ESR 11 - Citrix Rule"
    }
  }
    # Region-01 only (eastus)
     rules exist only in AWS us-east-1 (Virginia)
  # than Region-02 rules (different Azure region = different NSG instance)
  citrix_11_region_01 = {
            # NEEDS VERIFICATION: The following rule exists in AWS TF file for
      # Virginia region only, but was NOT included in the Excel migration data.
      # Uncomment after verifying this rule should be migrated to Azure.
            # "tcp-5985-10-120-191-12-32-ingress" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 1051
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "5985"
      #   source_address_prefix      = "10.120.191.12/32"
      #   destination_address_prefix = "*"
      #   description                = "ESR 11 - Citrix Rule"
      # }
  }
    # Region-02 only (eastus2)
     0 rules exist only in AWS us-east-2 (Ohio)
  citrix_11_region_02 = {
      # No Region-02 specific rules currently
          # EXAMPLE: How to add a new Region-02 only rule:
          # "tcp-8080-10-1-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 1051  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "8080"
      #   source_address_prefix      = "10.1.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 11 - Citrix Rule"
      # }
  }
  enterprise_11_citrix_rules = merge(
    local.citrix_11_common,
    var.location == "eastus" ? local.citrix_11_region_01 : {},
    var.location == "eastus2" ? local.citrix_11_region_02 : {}
  )
}
