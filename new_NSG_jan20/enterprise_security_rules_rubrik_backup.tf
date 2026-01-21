# Enterprise Security Rules - Rubrik Backup
# Priority Block: 600-639
#   Currently used: 600-602 (3 rules)
#   Reserved for future: 603-639 (37 slots)

locals {
    # Common rules - Apply to all regions
  rubrik_backup_common = {
    "Allow-RubrikBackup_TCP_12800to12801_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 600
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["12800-12801"]
      source_address_prefix      = "10.111.51.0/27"
      destination_address_prefix = "*"
      description                = "ESR 06 - Rubrik Backup Rule."
    }
    "Allow-RubrikBackup_TCP_12800to12801_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 601
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["12800-12801"]
      source_address_prefix      = "10.111.51.128/27"
      destination_address_prefix = "*"
      description                = "ESR 06 - Rubrik Backup Rule."
    }
    "Allow-RubrikBackup_All_AllPorts_Out" = {
      direction                  = "Outbound"
      access                     = "Allow"
      priority                   = 602
      protocol                   = "*"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["*"]
      source_address_prefix      = "*"
      destination_address_prefix = "0.0.0.0/0"
      description                = "ESR 06 - Rubrik Backup Rule."
    }
  }
    # Region-01 only (eastus)
  rubrik_backup_region_eastus = {
      # No Region-01 specific rules currently
          # EXAMPLE: How to add a new Region-01 only rule:
          # "tcp-3306-192-168-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 603  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_ranges          = ["*"]
      #   destination_port_ranges     = ["3306"]
      #   source_address_prefix      = "192.168.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 06 - Rubrik Backup Rule."
      # }
  }
    # Region-02 only (northcentralus)
  rubrik_backup_region_northcentralus = {
      # No Region-02 specific rules currently
          # EXAMPLE: How to add a new Region-02 only rule:
          # "tcp-8080-10-1-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 603  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_ranges          = ["*"]
      #   destination_port_ranges     = ["8080"]
      #   source_address_prefix      = "10.1.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 06 - Rubrik Backup Rule."
      # }
  }
  enterprise_rubrik_backup_rules = merge(
    local.rubrik_backup_common,
    var.location == "eastus" ? local.rubrik_backup_region_eastus : {},
    var.location == "northcentralus" ? local.rubrik_backup_region_northcentralus : {}
  )
}
