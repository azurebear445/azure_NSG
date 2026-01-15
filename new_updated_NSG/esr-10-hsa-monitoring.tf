# HSA Monitoring Enterprise Security Rules (ESR 10)
# This file contains enterprise-managed rules for HSA (Health Savings Account)
# monitoring from the HSA admin server.
#
# Priority Block: 1000-1039 (40 total slots)
#   - Currently used: 1000-1002 (3 rules)
#   - Reserved for future: 1003-1039 (37 slots)
#
# Rule Distribution:
#   - Common rules: 3 (apply to both regions)
#   - Region-01 only: 0 (eastus only)
#   - Region-02 only: 0 (northcentralus only)
#
#
# Variable Naming: enterprise_10_hsa_monitoring_rules
locals {
    # Common rules - Apply to all regions
  hsa_monitoring_10_common = {
    "tcp-135-10-111-41-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1000
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.111.41.153/32"
      destination_address_prefix = "*"
      description                = "ESR 10 - HSA Monitoring Rule"
    }
    "tcp-1024-65535-10-111-41-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1001
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1024-65535"
      source_address_prefix      = "10.111.41.153/32"
      destination_address_prefix = "*"
      description                = "ESR 10 - HSA Monitoring Rule"
    }
    "icmp--1-10-111-41-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1002
      protocol                   = "Icmp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "10.111.41.153/32"
      destination_address_prefix = "*"
      description                = "ESR 10 - HSA Monitoring Rule"
    }
  }
    # Region-01 only (eastus)
  hsa_monitoring_10_region_01 = {
      # No Region-01 specific rules currently
          # EXAMPLE: How to add a new Region-01 only rule:
          # "tcp-3306-192-168-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 1003  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "3306"
      #   source_address_prefix      = "192.168.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 10 - HSA Monitoring Rule"
      # }
  }
    # Region-02 only (northcentralus)
  hsa_monitoring_10_region_02 = {
      # No Region-02 specific rules currently
          # EXAMPLE: How to add a new Region-02 only rule:
          # "tcp-8080-10-1-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 1003  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "8080"
      #   source_address_prefix      = "10.1.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 10 - HSA Monitoring Rule"
      # }
  }
  enterprise_10_hsa_monitoring_rules = merge(
    local.hsa_monitoring_10_common,
    var.location == "eastus" ? local.hsa_monitoring_10_region_01 : {},
    var.location == "northcentralus" ? local.hsa_monitoring_10_region_02 : {}
  )
}
