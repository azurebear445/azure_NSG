# =============================================================================
# SailPoint Identity Management Enterprise Security Group Rules (ESG 12)
# =============================================================================
# This file contains enterprise-managed rules for SailPoint identity management
# services for database user and role configuration.
#
# Region Mapping:
#   - Region-01 (AWS us-east-1 Virginia) → Azure eastus2 (Virginia)
#   - Region-02 (AWS us-east-2 Ohio) → Azure centralus (Iowa)
#
# Note: Azure has no Ohio datacenter. AWS Ohio maps to Azure Central US (Iowa)
#       for optimal network latency to Midwest regions.
#
# Priority Block: 1090-1149 (60 total slots)
#   - Currently used: 1090-1109 (20 rules)
#   - Reserved for future: 1110-1149 (40 slots)
#
# Rule Distribution:
#   - Common rules: 20 (apply to both regions)
#   - Region-01 only: 0 (eastus2 only - AWS Virginia)
#   - Region-02 only: 0 (centralus only - AWS Ohio)
#
# Note: Region-01 and Region-02 can reuse same priorities (1090-1149) because
#       they deploy to DIFFERENT NSGs in DIFFERENT Azure regions - no conflicts!
#
# Variable Naming: enterprise_12_sailpoint_rules
# =============================================================================

locals {
  # =========================================================================
  # COMMON RULES - Apply to BOTH Region-01 and Region-02
  # =========================================================================
  # These 20 rules are identical in both AWS regions

  sailpoint_12_common = {
    "tcp-1433-10-110-117-157-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1090
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.110.117.157/32"
      destination_address_prefix = "*"
      description                = "ESG 12 - SailPoint Rule"
    }
    "tcp-1433-10-110-117-164-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1091
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.110.117.164/32"
      destination_address_prefix = "*"
      description                = "ESG 12 - SailPoint Rule"
    }
    "tcp-1433-10-111-95-173-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1092
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.95.173/32"
      destination_address_prefix = "*"
      description                = "ESG 12 - SailPoint Rule"
    }
    "tcp-1433-10-111-95-176-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1093
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.95.176/32"
      destination_address_prefix = "*"
      description                = "ESG 12 - SailPoint Rule"
    }
    "tcp-1433-10-211-42-149-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1094
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.211.42.149/32"
      destination_address_prefix = "*"
      description                = "ESG 12 - SailPoint Rule"
    }
    "tcp-5102-10-110-117-157-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1095
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.110.117.157/32"
      destination_address_prefix = "*"
      description                = "ESG 12 - SailPoint Rule"
    }
    "tcp-5102-10-110-117-164-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1096
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.110.117.164/32"
      destination_address_prefix = "*"
      description                = "ESG 12 - SailPoint Rule"
    }
    "tcp-5102-10-111-95-173-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1097
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.111.95.173/32"
      destination_address_prefix = "*"
      description                = "ESG 12 - SailPoint Rule"
    }
    "tcp-5102-10-111-95-176-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1098
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.111.95.176/32"
      destination_address_prefix = "*"
      description                = "ESG 12 - SailPoint Rule"
    }
    "tcp-5102-10-211-42-149-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1099
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.211.42.149/32"
      destination_address_prefix = "*"
      description                = "ESG 12 - SailPoint Rule"
    }
    "tcp-5432-10-110-117-157-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1100
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5432"
      source_address_prefix      = "10.110.117.157/32"
      destination_address_prefix = "*"
      description                = "ESG 12 - SailPoint Rule"
    }
    "tcp-5432-10-110-117-164-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1101
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5432"
      source_address_prefix      = "10.110.117.164/32"
      destination_address_prefix = "*"
      description                = "ESG 12 - SailPoint Rule"
    }
    "tcp-5432-10-111-95-173-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1102
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5432"
      source_address_prefix      = "10.111.95.173/32"
      destination_address_prefix = "*"
      description                = "ESG 12 - SailPoint Rule"
    }
    "tcp-5432-10-111-95-176-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1103
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5432"
      source_address_prefix      = "10.111.95.176/32"
      destination_address_prefix = "*"
      description                = "ESG 12 - SailPoint Rule"
    }
    "tcp-5432-10-211-42-149-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1104
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5432"
      source_address_prefix      = "10.211.42.149/32"
      destination_address_prefix = "*"
      description                = "ESG 12 - SailPoint Rule"
    }
    "tcp-52731-10-110-117-157-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1105
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.110.117.157/32"
      destination_address_prefix = "*"
      description                = "ESG 12 - SailPoint Rule"
    }
    "tcp-52731-10-110-117-164-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1106
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.110.117.164/32"
      destination_address_prefix = "*"
      description                = "ESG 12 - SailPoint Rule"
    }
    "tcp-52731-10-111-95-173-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1107
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.111.95.173/32"
      destination_address_prefix = "*"
      description                = "ESG 12 - SailPoint Rule"
    }
    "tcp-52731-10-111-95-176-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1108
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.111.95.176/32"
      destination_address_prefix = "*"
      description                = "ESG 12 - SailPoint Rule"
    }
    "tcp-52731-10-211-42-149-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1109
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.211.42.149/32"
      destination_address_prefix = "*"
      description                = "ESG 12 - SailPoint Rule"
    }
  }

  # =========================================================================
  # REGION-01 ONLY RULES - Apply ONLY to Region-01 (eastus2)
  # =========================================================================
  # These 0 rules exist only in AWS us-east-1 (Virginia)
  # or have different definitions than Region-02
  # 
  # Note: Can reuse priorities 1090-1149 because this deploys to DIFFERENT NSG
  # than Region-02 rules (different Azure region = different NSG instance)

  sailpoint_12_region_01 = {
    for k, v in {
      # No Region-01 specific rules currently
      # 
      # EXAMPLE: How to add a new Region-01 only rule:
      # 
      # "tcp-3306-192-168-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 1110  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "3306"
      #   source_address_prefix      = "192.168.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESG 12 - SailPoint Rule"
      # }
    } : k => v if contains(local.region_01_locations, var.location)
  }

  # =========================================================================
  # REGION-02 ONLY RULES - Apply ONLY to Region-02 (centralus)
  # =========================================================================
  # These 0 rules exist only in AWS us-east-2 (Ohio)
  # or have different definitions than Region-01
  # 
  # Note: Can reuse priorities 1090-1149 for Region-02 only rules

  sailpoint_12_region_02 = {
    for k, v in {
      # No Region-02 specific rules currently
      # 
      # EXAMPLE: How to add a new Region-02 only rule:
      # 
      # "tcp-8080-10-1-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 1110  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "8080"
      #   source_address_prefix      = "10.1.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESG 12 - SailPoint Rule"
      # }
    } : k => v if contains(local.region_02_locations, var.location)
  }

  # =========================================================================
  # MERGE ALL SAILPOINT ESG 12 RULES
  # =========================================================================

  enterprise_12_sailpoint_rules = merge(
    local.sailpoint_12_common,
    local.sailpoint_12_region_01,
    local.sailpoint_12_region_02
  )
}
