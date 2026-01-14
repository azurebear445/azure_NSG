# Database Administration Enterprise Security Rule Rules (ESR 07)
# This file contains enterprise-managed database administration rules.
#
# Region Mapping:
# Region-01: eastus | Region-02: eastus2 | Region-03: northcentralus (common only)
#
#
# Priority Block: 700-799 (100 total slots)
#   - Currently used: 700-735 (36 rules)
#   - Reserved for future: 736-799 (64 slots)
#
# Rule Distribution:
#   - Common rules: 36 (apply to both regions)
#   - Region-01 only: 0 (eastus only)
#   - Region-02 only: 0 (eastus only)
#
#
# Variable Naming: enterprise_07_database_admin_rules
locals {
    # Common rules - Apply to all regions
     36 rules are identical in both AWS regions
  database_admin_07_common = {
    "tcp-1433-10-110-28-197-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 700
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.110.28.197/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-1433-10-110-28-214-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 701
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.110.28.214/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-1433-10-111-123-145-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 702
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.123.145/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-1433-10-111-123-182-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 703
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.123.182/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-1433-10-111-88-85-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 704
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.88.85/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-1433-10-20-68-14-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 705
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.20.68.14/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-1433-10-211-123-156-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 706
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.211.123.156/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-1433-10-211-123-197-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 707
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.211.123.197/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-1433-10-211-88-4-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 708
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.211.88.4/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-5102-10-110-28-197-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 709
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.110.28.197/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-5102-10-110-28-214-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 710
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.110.28.214/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-5102-10-111-123-145-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 711
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.111.123.145/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-5102-10-111-123-182-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 712
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.111.123.182/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-5102-10-111-88-85-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 713
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.111.88.85/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-5102-10-211-123-156-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 714
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.211.123.156/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-5102-10-211-123-197-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 715
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.211.123.197/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-5102-10-211-88-4-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 716
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.211.88.4/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-5986-10-20-68-14-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 717
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5986"
      source_address_prefix      = "10.20.68.14/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-52731-10-110-28-197-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 718
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.110.28.197/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-52731-10-110-28-214-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 719
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.110.28.214/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-52731-10-111-123-145-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 720
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.111.123.145/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-52731-10-111-123-182-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 721
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.111.123.182/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-52731-10-111-88-85-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 722
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.111.88.85/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-52731-10-20-68-14-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 723
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.20.68.14/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-52731-10-211-123-156-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 724
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.211.123.156/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-52731-10-211-123-197-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 725
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.211.123.197/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-52731-10-211-88-4-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 726
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.211.88.4/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-52733-10-110-28-197-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 727
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52733"
      source_address_prefix      = "10.110.28.197/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-52733-10-110-28-214-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 728
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52733"
      source_address_prefix      = "10.110.28.214/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-52733-10-111-123-145-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 729
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52733"
      source_address_prefix      = "10.111.123.145/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-52733-10-111-123-182-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 730
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52733"
      source_address_prefix      = "10.111.123.182/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-52733-10-111-88-85-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 731
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52733"
      source_address_prefix      = "10.111.88.85/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-52733-10-211-123-156-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 732
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52733"
      source_address_prefix      = "10.211.123.156/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-52733-10-211-123-197-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 733
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52733"
      source_address_prefix      = "10.211.123.197/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "tcp-52733-10-211-88-4-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 734
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52733"
      source_address_prefix      = "10.211.88.4/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule"
    }
    "all-all-0-0-0-0-0-egress" = {
      direction                  = "Outbound"
      access                     = "Allow"
      priority                   = 735
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "0.0.0.0/0"
      description                = "ESR 07 - Database Admin Rule"
    }
  }
    # Region-01 only (eastus)
     0 rules exist only in AWS us-east-1 (Virginia)
  # than Region-02 rules (different Azure region = different NSG instance)
  database_admin_07_region_01 = {
      # No Region-01 specific rules currently
          # EXAMPLE: How to add a new Region-01 only rule:
          # "tcp-3306-192-168-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 736  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "3306"
      #   source_address_prefix      = "192.168.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 07 - Database Admin Rule"
      # }
  }
    # Region-02 only (eastus2)
     0 rules exist only in AWS us-east-2 (Ohio)
  database_admin_07_region_02 = {
      # No Region-02 specific rules currently
          # EXAMPLE: How to add a new Region-02 only rule:
          # "tcp-8080-10-1-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 736  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "8080"
      #   source_address_prefix      = "10.1.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 07 - Database Admin Rule"
      # }
  }
  enterprise_07_database_admin_rules = merge(
    local.database_admin_07_common,
    var.location == "eastus" ? local.database_admin_07_region_01 : {},
    var.location == "eastus2" ? local.database_admin_07_region_02 : {}
  )
}
