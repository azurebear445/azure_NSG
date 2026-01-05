# =============================================================================
# Varonis Collectors Enterprise Security Group Rules (ESG 13)
# =============================================================================
# This file contains enterprise-managed rules for Varonis data security
# platform collectors.
#
# Region Mapping:
#   - Region-01 (AWS us-east-1 Virginia) → Azure eastus2 (Virginia)
#   - Region-02 (AWS us-east-2 Ohio) → Azure centralus (Iowa)
#
# Note: Azure has no Ohio datacenter. AWS Ohio maps to Azure Central US (Iowa)
#       for optimal network latency to Midwest regions.
#
# Priority Block: 1150-1199 (50 total slots)
#   - Currently used: 1150-1163 (14 rules)
#   - Reserved for future: 1164-1199 (36 slots)
#
# Rule Distribution:
#   - Common rules: 14 (apply to both regions)
#   - Region-01 only: 0 (eastus2 only - AWS Virginia)
#   - Region-02 only: 0 (centralus only - AWS Ohio)
#
# Note: Region-01 and Region-02 can reuse same priorities (1150-1199) because
#       they deploy to DIFFERENT NSGs in DIFFERENT Azure regions - no conflicts!
#
# Variable Naming: enterprise_13_varonis_collectors_rules
# =============================================================================

locals {
  # =========================================================================
  # COMMON RULES - Apply to BOTH Region-01 and Region-02
  # =========================================================================
  # These 14 rules are identical in both AWS regions

  varonis_collectors_13_common = {
    "tcp-22-10-111-19-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1150
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      description                = "ESG 13 - Varonis Collectors Rule"
    }
    "tcp-22-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1151
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESG 13 - Varonis Collectors Rule"
    }
    "tcp-80-10-111-19-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1152
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      description                = "ESG 13 - Varonis Collectors Rule"
    }
    "tcp-80-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1153
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESG 13 - Varonis Collectors Rule"
    }
    "tcp-111-10-111-19-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1154
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "111"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      description                = "ESG 13 - Varonis Collectors Rule"
    }
    "tcp-111-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1155
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "111"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESG 13 - Varonis Collectors Rule"
    }
    "tcp-137-139-10-111-19-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1156
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "137-139"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      description                = "ESG 13 - Varonis Collectors Rule"
    }
    "tcp-137-139-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1157
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "137-139"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESG 13 - Varonis Collectors Rule"
    }
    "tcp-445-10-111-19-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1158
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      description                = "ESG 13 - Varonis Collectors Rule"
    }
    "tcp-445-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1159
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESG 13 - Varonis Collectors Rule"
    }
    "tcp-2049-10-111-19-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1160
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "2049"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      description                = "ESG 13 - Varonis Collectors Rule"
    }
    "tcp-2049-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1161
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "2049"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESG 13 - Varonis Collectors Rule"
    }
    "tcp-4972-4973-10-111-19-0-24-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1162
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4972-4973"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      description                = "ESG 13 - Varonis Collectors Rule"
    }
    "tcp-4972-4973-10-112-1-153-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 1163
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4972-4973"
      source_address_prefix      = "10.112.1.153/32"
      destination_address_prefix = "*"
      description                = "ESG 13 - Varonis Collectors Rule"
    }
  }

  # =========================================================================
  # REGION-01 ONLY RULES - Apply ONLY to Region-01 (eastus2)
  # =========================================================================
  # These 0 rules exist only in AWS us-east-1 (Virginia)
  # or have different definitions than Region-02
  # 
  # Note: Can reuse priorities 1150-1199 because this deploys to DIFFERENT NSG
  # than Region-02 rules (different Azure region = different NSG instance)

  varonis_collectors_13_region_01 = {
    for k, v in {
      # No Region-01 specific rules currently
      # 
      # EXAMPLE: How to add a new Region-01 only rule:
      # 
      # "tcp-3306-192-168-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 1164  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "3306"
      #   source_address_prefix      = "192.168.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESG 13 - Varonis Collectors Rule"
      # }
    } : k => v if contains(local.region_01_locations, var.location)
  }

  # =========================================================================
  # REGION-02 ONLY RULES - Apply ONLY to Region-02 (centralus)
  # =========================================================================
  # These 0 rules exist only in AWS us-east-2 (Ohio)
  # or have different definitions than Region-01
  # 
  # Note: Can reuse priorities 1150-1199 for Region-02 only rules

  varonis_collectors_13_region_02 = {
    for k, v in {
      # No Region-02 specific rules currently
      # 
      # EXAMPLE: How to add a new Region-02 only rule:
      # 
      # "tcp-8080-10-1-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 1164  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "8080"
      #   source_address_prefix      = "10.1.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESG 13 - Varonis Collectors Rule"
      # }
    } : k => v if contains(local.region_02_locations, var.location)
  }

  # =========================================================================
  # MERGE ALL VARONIS COLLECTORS ESG 13 RULES
  # =========================================================================

  enterprise_13_varonis_collectors_rules = merge(
    local.varonis_collectors_13_common,
    local.varonis_collectors_13_region_01,
    local.varonis_collectors_13_region_02
  )
}
