# Multi-Service Enterprise Security Rule Rules (ESR 08)
# This file contains enterprise-managed rules for SolarWinds monitoring with
# Azure and on-premises pollers, and Tenable security scanning.
#
# Region Mapping:
# Region-01: eastus | Region-02: eastus2 | Region-03: northcentralus (common only)
#
#
# Priority Block: 800-899 (100 total slots)
#   - Currently used: 800-853 (54 rules)
#   - Reserved for future: 854-899 (46 slots)
#
# Rule Distribution:
#   - Common rules: 48 (apply to both regions)
#   - Region-01 only: 0 (eastus only)
#   - Region-02 only: 6 (eastus only)
#
#
# Variable Naming: enterprise_08_multi_service_rules
locals {
    # Common rules - Apply to all regions
  multi_service_08_common = {
    "tcp-22-23-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 800
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22-23"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-22-23-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 801
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22-23"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-25-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 802
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "25"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-25-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 803
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "25"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-53-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 804
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-53-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 805
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-80-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 806
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-80-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 807
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-135-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 808
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-135-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 809
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-139-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 810
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-139-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 811
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-443-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 812
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-443-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 813
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-445-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 814
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-445-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 815
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-465-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 816
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "465"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-465-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 817
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "465"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-587-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 818
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "587"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-587-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 819
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "587"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-1024-1034-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 820
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1024-1034"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-1024-1034-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 821
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1024-1034"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-1433-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 822
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-1433-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 823
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-1801-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 824
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1801"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-1801-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 825
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1801"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-5671-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 826
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5671"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-5671-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 827
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5671"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-17777-17778-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 828
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17777-17778"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-17777-17778-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 829
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17777-17778"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-17791-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 830
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17791"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-17791-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 831
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "17791"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-49152-65535-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 832
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-49152-65535-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 833
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-65535-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 834
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "65535"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "tcp-65535-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 835
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "65535"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "udp-53-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 836
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "udp-53-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 837
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "53"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "udp-137-139-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 838
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "137-139"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "udp-137-139-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 839
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "137-139"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "udp-161-162-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 840
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "161-162"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "udp-161-162-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 841
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "161-162"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "udp-1024-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 842
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1024"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "udp-1024-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 843
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1024"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "udp-1434-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 844
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1434"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "udp-1434-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 845
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1434"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "icmp--1-10-111-14-237-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 846
      protocol                   = "Icmp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "10.111.14.237/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
    "icmp--1-10-120-7-154-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 847
      protocol                   = "Icmp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "10.120.7.154/32"
      destination_address_prefix = "*"
      description                = "ESR 08 - Multi-Service Rule"
    }
  }
    # Region-01 only (eastus)
  multi_service_08_region_01 = {
      # No Region-01 specific rules currently
          # EXAMPLE: How to add a new Region-01 only rule:
          # "tcp-3306-192-168-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 854  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "3306"
      #   source_address_prefix      = "192.168.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 08 - Multi-Service Rule"
      # }
  }
    # Region-02 only (eastus2)
  multi_service_08_region_02 = {
      "tcp-0-65535-10-111-100-235-32-ingress" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 848
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "0-65535"
        source_address_prefix      = "10.111.100.235/32"
        destination_address_prefix = "*"
        description                = "ESR 08 - Multi-Service Rule"
      }
      "tcp-0-65535-10-111-100-244-32-ingress" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 849
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "0-65535"
        source_address_prefix      = "10.111.100.244/32"
        destination_address_prefix = "*"
        description                = "ESR 08 - Multi-Service Rule"
      }
      "tcp-0-65535-10-111-100-246-32-ingress" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 850
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "0-65535"
        source_address_prefix      = "10.111.100.246/32"
        destination_address_prefix = "*"
        description                = "ESR 08 - Multi-Service Rule"
      }
      "tcp-0-65535-10-111-100-247-32-ingress" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 851
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "0-65535"
        source_address_prefix      = "10.111.100.247/32"
        destination_address_prefix = "*"
        description                = "ESR 08 - Multi-Service Rule"
      }
      "tcp-49152-65535-10-111-14-232-32-ingress" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 852
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "49152-65535"
        source_address_prefix      = "10.111.14.232/32"
        destination_address_prefix = "*"
        description                = "ESR 08 - Multi-Service Rule"
      }
      "tcp-49152-65535-10-120-7-135-32-ingress" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 853
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "49152-65535"
        source_address_prefix      = "10.120.7.135/32"
        destination_address_prefix = "*"
        description                = "ESR 08 - Multi-Service Rule"
      }
  }
  enterprise_08_multi_service_rules = merge(
    local.multi_service_08_common,
    var.location == "eastus" ? local.multi_service_08_region_01 : {},
    var.location == "eastus2" ? local.multi_service_08_region_02 : {}
  )
}
