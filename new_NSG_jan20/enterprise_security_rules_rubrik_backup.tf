# Enterprise Security Rules - Rubrik Backup
# Priority Block: 437-478
#   Currently used: 437-438 (2 rules)
#   Reserved for future: 439-478 (40 slots)

locals {
  # Common rules - Apply to all regions
  rubrik_backup_common = {
    "Allow-RubrikBackup_TCP_12800-12801" = {
      access                         = "Allow"
      description                    = "Ingress from Rubrik Backup servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["12800-12801"]
      direction                      = "Inbound"
      priority                       = 437
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.51.0/27", "10.111.51.128/27"]
      source_port_ranges             = ["*"]
    }
    "Allow-All_Egress" = {
      access                         = "Allow"
      description                    = "Egress to Rubrik Backup servers."
      destination_address_prefix     = "0.0.0.0/0"
      destination_port_ranges        = ["*"]
      direction                      = "Outbound"
      priority                       = 438
      protocol                       = "*"
      source_address_prefixes        = ["*"]
      source_port_ranges             = ["*"]
    }
  }

  # Region-01 only (eastus)
  rubrik_backup_region_eastus = {
    # No eastus-specific rules currently
  }

  # Region-02 only (northcentralus)
  rubrik_backup_region_northcentralus = {
    # No northcentralus-specific rules currently
  }

  enterprise_rubrik_backup_rules = merge(
    local.rubrik_backup_common,
    var.location == "eastus" ? local.rubrik_backup_region_eastus : {},
    var.location == "northcentralus" ? local.rubrik_backup_region_northcentralus : {}
  )
}