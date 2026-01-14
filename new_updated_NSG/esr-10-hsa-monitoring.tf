# HSA Monitoring Enterprise Security Rule Rules (ESR 10)
# This file contains enterprise-managed rules for HSA (Health Savings Account)
# monitoring from the HSA admin server.
#
# Region Mapping:
#   - Region-01 (AWS us-east-1 Virginia) → Azure eastus
#   - Region-02 (AWS us-east-2 Ohio) → Azure eastus2
#
#
# Priority Block: 1000-1039 (40 total slots)
#   - Currently used: 1000-1002 (3 rules)
#   - Reserved for future: 1003-1039 (37 slots)
#
# Rule Distribution:
#   - Common rules: 3 (apply to both regions)
#   - Region-01 only: 0 (eastus2 only - AWS Virginia)
#   - Region-02 only: 0 (centralus only - AWS Ohio)
#
#
# Variable Naming: enterprise_10_hsa_monitoring_rules

locals {
  # =========================================================================
  # COMMON RULES - Apply to BOTH Region-01 and Region-02
  # =========================================================================
  # These 3 rules are identical in both AWS regions

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

  # =========================================================================
  # REGION-01 ONLY RULES - Apply ONLY to Region-01 (eastus2)
  # =========================================================================
  # These 0 rules exist only in AWS us-east-1 (Virginia)
  # or have different definitions than Region-02
  # 
  # Note: Can reuse priorities 1000-1039 because this deploys to DIFFERENT NSG
  # than Region-02 rules (different Azure region = different NSG instance)

  hsa_monitoring_10_region_01 = {
    for k, v in {
      # No Region-01 specific rules currently
      # 
      # EXAMPLE: How to add a new Region-01 only rule:
      # 
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
    } : k => v if contains(local.region_01_locations, var.location)
  }

  # =========================================================================
  # REGION-02 ONLY RULES - Apply ONLY to Region-02 (centralus)
  # =========================================================================
  # These 0 rules exist only in AWS us-east-2 (Ohio)
  # or have different definitions than Region-01
  # 
  # Note: Can reuse priorities 1000-1039 for Region-02 only rules

  hsa_monitoring_10_region_02 = {
    for k, v in {
      # No Region-02 specific rules currently
      # 
      # EXAMPLE: How to add a new Region-02 only rule:
      # 
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
    } : k => v if contains(local.region_02_locations, var.location)
  }

  # =========================================================================
  # MERGE ALL HSA MONITORING ESR 10 RULES
  # =========================================================================

  enterprise_10_hsa_monitoring_rules = merge(
    local.hsa_monitoring_10_common,
    local.hsa_monitoring_10_region_01,
    local.hsa_monitoring_10_region_02
  )
}
