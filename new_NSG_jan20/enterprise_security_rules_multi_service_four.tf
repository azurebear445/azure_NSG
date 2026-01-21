# Enterprise Security Rules - Multi-Service
# Priority Block: 800-899
#   Currently used: 800-853 (54 rules)
#   Reserved for future: 854-899 (46 slots)

locals {
    # Common rules - Apply to all regions
  multi_service_four_common = {
    "Allow-MultiService_TCP_22to23_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 800
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["22-23"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_22to23_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 801
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["22-23"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_25_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 802
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["25"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_25_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 803
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["25"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_53_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 804
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["53"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_53_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 805
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["53"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_80_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 806
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["80"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_80_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 807
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["80"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_135_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 808
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["135"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_135_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 809
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["135"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_139_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 810
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["139"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_139_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 811
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["139"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_443_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 812
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["443"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_443_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 813
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["443"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_445_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 814
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["445"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_445_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 815
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["445"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_465_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 816
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["465"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_465_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 817
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["465"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_587_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 818
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["587"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_587_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 819
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["587"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_1024to1034_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 820
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1024-1034"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_1024to1034_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 821
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1024-1034"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_1433_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 822
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1433"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_1433_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 823
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1433"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_1801_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 824
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1801"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_1801_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 825
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1801"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_5671_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 826
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5671"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_5671_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 827
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5671"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_17777to17778_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 828
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["17777-17778"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_17777to17778_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 829
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["17777-17778"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_17791_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 830
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["17791"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_17791_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 831
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["17791"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_49152to65535_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 832
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["49152-65535"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_49152to65535_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 833
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["49152-65535"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_65535_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 834
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["65535"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_TCP_65535_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 835
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["65535"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_UDP_53_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 836
      protocol                   = "Udp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["53"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_UDP_53_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 837
      protocol                   = "Udp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["53"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_UDP_137to139_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 838
      protocol                   = "Udp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["137-139"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_UDP_137to139_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 839
      protocol                   = "Udp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["137-139"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_UDP_161to162_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 840
      protocol                   = "Udp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["161-162"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_UDP_161to162_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 841
      protocol                   = "Udp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["161-162"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_UDP_1024_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 842
      protocol                   = "Udp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1024"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_UDP_1024_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 843
      protocol                   = "Udp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1024"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_UDP_1434_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 844
      protocol                   = "Udp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1434"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_UDP_1434_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 845
      protocol                   = "Udp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1434"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_ICMP_AllPorts_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 846
      protocol                   = "Icmp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["*"]
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
    "Allow-MultiService_ICMP_AllPorts_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 847
      protocol                   = "Icmp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["*"]
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule."
    }
  }
    # Region-01 only (eastus)
  multi_service_four_region_eastus = {
      # No Region-01 specific rules currently
          # EXAMPLE: How to add a new Region-01 only rule:
          # "tcp-3306-192-168-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 854  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_ranges          = ["*"]
      #   destination_port_ranges     = ["3306"]
      #   source_address_prefix      = "192.168.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 08 - Multi-Service Rule."
      # }
  }
    # Region-02 only (northcentralus)
  multi_service_four_region_northcentralus = {
      "Allow-MultiService_TCP_0to65535_In" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 848
        protocol                   = "Tcp"
        source_port_ranges          = ["*"]
        destination_port_ranges     = ["0-65535"]
        source_address_prefix      = "10.111.100.235/32"
        destination_address_prefix = "*"
        description                = "ESR 08 - Multi-Service Rule."
      }
      "Allow-MultiService_TCP_0to65535_In_1" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 849
        protocol                   = "Tcp"
        source_port_ranges          = ["*"]
        destination_port_ranges     = ["0-65535"]
        source_address_prefix      = "10.111.100.244/32"
        destination_address_prefix = "*"
        description                = "ESR 08 - Multi-Service Rule."
      }
      "Allow-MultiService_TCP_0to65535_In_2" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 850
        protocol                   = "Tcp"
        source_port_ranges          = ["*"]
        destination_port_ranges     = ["0-65535"]
        source_address_prefix      = "10.111.100.246/32"
        destination_address_prefix = "*"
        description                = "ESR 08 - Multi-Service Rule."
      }
      "Allow-MultiService_TCP_0to65535_In_3" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 851
        protocol                   = "Tcp"
        source_port_ranges          = ["*"]
        destination_port_ranges     = ["0-65535"]
        source_address_prefix      = "10.111.100.247/32"
        destination_address_prefix = "*"
        description                = "ESR 08 - Multi-Service Rule."
      }
      "Allow-MultiService_TCP_49152to65535_In_2" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 852
        protocol                   = "Tcp"
        source_port_ranges          = ["*"]
        destination_port_ranges     = ["49152-65535"]
        source_address_prefix      = "10.111.14.232/32"
        destination_address_prefix = "*"
        description                = "ESR 08 - Multi-Service Rule."
      }
      "Allow-MultiService_TCP_49152to65535_In_3" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 853
        protocol                   = "Tcp"
        source_port_ranges          = ["*"]
        destination_port_ranges     = ["49152-65535"]
        source_address_prefix      = "10.120.7.135/32"
        destination_address_prefix = "*"
        description                = "ESR 08 - Multi-Service Rule."
      }
  }
  enterprise_multi_service_four_rules = merge(
    local.multi_service_four_common,
    var.location == "eastus" ? local.multi_service_four_region_eastus : {},
    var.location == "northcentralus" ? local.multi_service_four_region_northcentralus : {}
  )
}
