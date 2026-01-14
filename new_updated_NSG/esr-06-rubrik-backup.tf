# Rubrik Backup Enterprise Security Rule Rules (ESR 06)
# This file contains enterprise-managed Rubrik backup and data protection rules.
#
# Region Mapping:
#   - Region-01 (AWS us-east-1 Virginia) → Azure eastus
#   - Region-02 (AWS us-east-2 Ohio) → Azure eastus2
#
#
# Priority Block: 600-639 (40 total slots)
#   - Currently used: 600-602 (3 rules)
#   - Reserved for future: 603-639 (37 slots)
#
# Rule Distribution:
#   - Common rules: 3 (apply to both regions)
#   - Region-01 only: 0 (eastus2 only - AWS Virginia)
#   - Region-02 only: 0 (centralus only - AWS Ohio)
#
#
# Variable Naming: enterprise_06_rubrik_backup_rules

locals {
  # =========================================================================
  # COMMON RULES - Apply to BOTH Region-01 and Region-02
  # =========================================================================
  # These 3 rules are identical in both AWS regions

  rubrik_backup_06_common = {
    "tcp-12800-12801-10-111-51-0-27-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 600
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "12800-12801"
      source_address_prefix      = "10.111.51.0/27"
      destination_address_prefix = "*"
      description                = "ESR 06 - Rubrik Backup Rule"
    }
    "tcp-12800-12801-10-111-51-128-27-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 601
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "12800-12801"
      source_address_prefix      = "10.111.51.128/27"
      destination_address_prefix = "*"
      description                = "ESR 06 - Rubrik Backup Rule"
    }
    "all-all-0-0-0-0-0-egress" = {
      direction                  = "Outbound"
      access                     = "Allow"
      priority                   = 602
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "0.0.0.0/0"
      description                = "ESR 06 - Rubrik Backup Rule"
    }
  }

  # =========================================================================
  # REGION-01 ONLY RULES - Apply ONLY to Region-01 (eastus2)
  # =========================================================================
  # These 0 rules exist only in AWS us-east-1 (Virginia)
  # or have different definitions than Region-02
  # 
  # Note: Can reuse priorities 600-639 because this deploys to DIFFERENT NSG
  # than Region-02 rules (different Azure region = different NSG instance)

  rubrik_backup_06_region_01 = {
    for k, v in {
      # No Region-01 specific rules currently
      # 
      # EXAMPLE: How to add a new Region-01 only rule:
      # 
      # "tcp-3306-192-168-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 603  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "3306"
      #   source_address_prefix      = "192.168.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 06 - Rubrik Backup Rule"
      # }
    } : k => v if contains(local.region_01_locations, var.location)
  }

  # =========================================================================
  # REGION-02 ONLY RULES - Apply ONLY to Region-02 (centralus)
  # =========================================================================
  # These 0 rules exist only in AWS us-east-2 (Ohio)
  # or have different definitions than Region-01
  # 
  # Note: Can reuse priorities 600-639 for Region-02 only rules

  rubrik_backup_06_region_02 = {
    for k, v in {
      # No Region-02 specific rules currently
      # 
      # EXAMPLE: How to add a new Region-02 only rule:
      # 
      # "tcp-8080-10-1-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 603  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "8080"
      #   source_address_prefix      = "10.1.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 06 - Rubrik Backup Rule"
      # }
    } : k => v if contains(local.region_02_locations, var.location)
  }

  # =========================================================================
  # MERGE ALL RUBRIK BACKUP ESR 06 RULES
  # =========================================================================

  enterprise_06_rubrik_backup_rules = merge(
    local.rubrik_backup_06_common,
    local.rubrik_backup_06_region_01,
    local.rubrik_backup_06_region_02
  )
}
