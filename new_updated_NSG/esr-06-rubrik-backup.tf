# Rubrik Backup Enterprise Security Rule Rules (ESR 06)
# This file contains enterprise-managed Rubrik backup and data protection rules.
#
# Region Mapping:
# Region-01: eastus | Region-02: eastus2 | Region-03: northcentralus (common only)
#
#
# Priority Block: 600-639 (40 total slots)
#   - Currently used: 600-602 (3 rules)
#   - Reserved for future: 603-639 (37 slots)
#
# Rule Distribution:
#   - Common rules: 3 (apply to both regions)
#   - Region-01 only: 0 (eastus only)
#   - Region-02 only: 0 (eastus only)
#
#
# Variable Naming: enterprise_06_rubrik_backup_rules
locals {
    # Common rules - Apply to all regions
     3 rules are identical in both AWS regions
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
    # Region-01 only (eastus)
     0 rules exist only in AWS us-east-1 (Virginia)
  # than Region-02 rules (different Azure region = different NSG instance)
  rubrik_backup_06_region_01 = {
      # No Region-01 specific rules currently
          # EXAMPLE: How to add a new Region-01 only rule:
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
  }
    # Region-02 only (eastus2)
     0 rules exist only in AWS us-east-2 (Ohio)
  rubrik_backup_06_region_02 = {
      # No Region-02 specific rules currently
          # EXAMPLE: How to add a new Region-02 only rule:
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
  }
  enterprise_06_rubrik_backup_rules = merge(
    local.rubrik_backup_06_common,
    var.location == "eastus" ? local.rubrik_backup_06_region_01 : {},
    var.location == "eastus2" ? local.rubrik_backup_06_region_02 : {}
  )
}
