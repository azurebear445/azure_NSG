# =============================================================================
# Citrix Application Enterprise Security Group Rules (ESG 11)
# =============================================================================
# This file contains enterprise-managed rules for Citrix application access
# and publishing.
#
# Region Mapping:
#   - Region-01 (AWS us-east-1 Virginia) → Azure eastus2 (Virginia)
#   - Region-02 (AWS us-east-2 Ohio) → Azure centralus (Iowa)
#
# Note: Azure has no Ohio datacenter. AWS Ohio maps to Azure Central US (Iowa)
#       for optimal network latency to Midwest regions.
#
# Priority Block: 1040-1089 (50 total slots)
#   - Currently used: 1040-1050 (11 rules)
#   - Reserved for future: 1051-1089 (39 slots)
#
# Rule Distribution:
#   - Common rules: 11 (apply to both regions)
#   - Region-01 only: 1 (eastus2 only - AWS Virginia) - COMMENTED OUT, NEEDS VERIFICATION
#   - Region-02 only: 0 (centralus only - AWS Ohio)
#
# Note: Region-01 and Region-02 can reuse same priorities (1040-1089) because
#       they deploy to DIFFERENT NSGs in DIFFERENT Azure regions - no conflicts!
#
# Variable Naming: enterprise_11_citrix_rules
# =============================================================================

locals {
  # =========================================================================
  # COMMON RULES - Apply to BOTH Region-01 and Region-02
  # =========================================================================
  # These 11 rules are identical in both AWS regions

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
      description                = "ESG 11 - Citrix Rule"
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
      description                = "ESG 11 - Citrix Rule"
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
      description                = "ESG 11 - Citrix Rule"
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
      description                = "ESG 11 - Citrix Rule"
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
      description                = "ESG 11 - Citrix Rule"
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
      description                = "ESG 11 - Citrix Rule"
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
      description                = "ESG 11 - Citrix Rule"
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
      description                = "ESG 11 - Citrix Rule"
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
      description                = "ESG 11 - Citrix Rule"
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
      description                = "ESG 11 - Citrix Rule"
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
      description                = "ESG 11 - Citrix Rule"
    }
  }

  # =========================================================================
  # REGION-01 ONLY RULES - Apply ONLY to Region-01 (eastus2)
  # =========================================================================
  # These rules exist only in AWS us-east-1 (Virginia)
  # or have different definitions than Region-02
  # 
  # Note: Can reuse priorities 1040-1089 because this deploys to DIFFERENT NSG
  # than Region-02 rules (different Azure region = different NSG instance)

  citrix_11_region_01 = {
    for k, v in {
      # =====================================================================
      # NEEDS VERIFICATION: The following rule exists in AWS TF file for
      # Virginia region only, but was NOT included in the Excel migration data.
      # Uncomment after verifying this rule should be migrated to Azure.
      # =====================================================================
      # "tcp-5985-10-120-191-12-32-ingress" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 1051
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "5985"
      #   source_address_prefix      = "10.120.191.12/32"
      #   destination_address_prefix = "*"
      #   description                = "ESG 11 - Citrix Rule"
      # }
    } : k => v if contains(local.region_01_locations, var.location)
  }

  # =========================================================================
  # REGION-02 ONLY RULES - Apply ONLY to Region-02 (centralus)
  # =========================================================================
  # These 0 rules exist only in AWS us-east-2 (Ohio)
  # or have different definitions than Region-01
  # 
  # Note: Can reuse priorities 1040-1089 for Region-02 only rules

  citrix_11_region_02 = {
    for k, v in {
      # No Region-02 specific rules currently
      # 
      # EXAMPLE: How to add a new Region-02 only rule:
      # 
      # "tcp-8080-10-1-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 1051  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "8080"
      #   source_address_prefix      = "10.1.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESG 11 - Citrix Rule"
      # }
    } : k => v if contains(local.region_02_locations, var.location)
  }

  # =========================================================================
  # MERGE ALL CITRIX ESG 11 RULES
  # =========================================================================

  enterprise_11_citrix_rules = merge(
    local.citrix_11_common,
    local.citrix_11_region_01,
    local.citrix_11_region_02
  )
}
