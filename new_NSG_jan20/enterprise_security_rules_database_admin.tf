# Enterprise Security Rules - Database Admin
# Priority Block: 700-799
#   Currently used: 700-735 (36 rules)
#   Reserved for future: 736-799 (64 slots)

locals {
    # Common rules - Apply to all regions
  database_admin_common = {
    "Allow-DatabaseAdmin_TCP_1433_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 700
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.110.28.197/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_1433_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 701
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.110.28.214/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_1433_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 702
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.123.145/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_1433_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 703
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.123.182/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_1433_In_4" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 704
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.88.85/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_1433_In_5" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 705
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.20.68.14/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_1433_In_6" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 706
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.211.123.156/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_1433_In_7" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 707
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.211.123.197/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_1433_In_8" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 708
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.211.88.4/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_5102_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 709
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.110.28.197/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_5102_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 710
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.110.28.214/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_5102_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 711
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.111.123.145/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_5102_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 712
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.111.123.182/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_5102_In_4" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 713
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.111.88.85/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_5102_In_5" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 714
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.211.123.156/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_5102_In_6" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 715
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.211.123.197/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_5102_In_7" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 716
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5102"
      source_address_prefix      = "10.211.88.4/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_5986_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 717
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5986"
      source_address_prefix      = "10.20.68.14/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_52731_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 718
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.110.28.197/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_52731_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 719
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.110.28.214/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_52731_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 720
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.111.123.145/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_52731_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 721
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.111.123.182/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_52731_In_4" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 722
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.111.88.85/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_52731_In_5" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 723
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.20.68.14/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_52731_In_6" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 724
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.211.123.156/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_52731_In_7" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 725
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.211.123.197/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_52731_In_8" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 726
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.211.88.4/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_52733_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 727
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52733"
      source_address_prefix      = "10.110.28.197/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_52733_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 728
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52733"
      source_address_prefix      = "10.110.28.214/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_52733_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 729
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52733"
      source_address_prefix      = "10.111.123.145/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_52733_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 730
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52733"
      source_address_prefix      = "10.111.123.182/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_52733_In_4" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 731
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52733"
      source_address_prefix      = "10.111.88.85/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_52733_In_5" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 732
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52733"
      source_address_prefix      = "10.211.123.156/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_52733_In_6" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 733
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52733"
      source_address_prefix      = "10.211.123.197/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_TCP_52733_In_7" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 734
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52733"
      source_address_prefix      = "10.211.88.4/32"
      destination_address_prefix = "*"
      description                = "ESR 07 - Database Admin Rule."
    }
    "Allow-DatabaseAdmin_All_AllPorts_Out" = {
      direction                  = "Outbound"
      access                     = "Allow"
      priority                   = 735
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "0.0.0.0/0"
      description                = "ESR 07 - Database Admin Rule."
    }
  }
    # Region-01 only (eastus)
  database_admin_region_eastus = {
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
      #   description                = "ESR 07 - Database Admin Rule."
      # }
  }
    # Region-02 only (northcentralus)
  database_admin_region_northcentralus = {
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
      #   description                = "ESR 07 - Database Admin Rule."
      # }
  }
  enterprise_database_admin_rules = merge(
    local.database_admin_common,
    var.location == "eastus" ? local.database_admin_region_eastus : {},
    var.location == "northcentralus" ? local.database_admin_region_northcentralus : {}
  )
}
