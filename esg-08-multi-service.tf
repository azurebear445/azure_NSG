# =============================================================================
# Multi-Service Enterprise Security Group Rules (ESG 08)
# =============================================================================
# This file contains enterprise-managed rules for SolarWinds monitoring with
# Azure and on-premises pollers, and Tenable security scanning.
#
# Region Mapping:
#   - Region-01 (AWS us-east-1 Virginia) → Azure eastus2 (Virginia)
#   - Region-02 (AWS us-east-2 Ohio) → Azure centralus (Iowa)
#
# Note: Azure has no Ohio datacenter. AWS Ohio maps to Azure Central US (Iowa)
#       for optimal network latency to Midwest regions.
#
# Priority Block: 800-899 (100 total slots)
#   - Currently used: 800-853 (54 rules)
#   - Reserved for future: 854-899 (46 slots)
#
# Rule Distribution:
#   - Common rules: 48 (apply to both regions)
#   - Region-01 only: 0 (eastus2 only - AWS Virginia)
#   - Region-02 only: 6 (centralus only - AWS Ohio)
#
# Note: Region-01 and Region-02 can reuse same priorities (800-899) because
#       they deploy to DIFFERENT NSGs in DIFFERENT Azure regions - no conflicts!
#
# Variable Naming: enterprise_08_multi_service_rules
# =============================================================================

locals {
  # =========================================================================
  # COMMON RULES - Apply to BOTH Region-01 and Region-02
  # =========================================================================
  # These 48 rules are identical in both AWS regions

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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
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
      description                = "ESG 08 - Multi-Service Rule"
    }
  }

  # =========================================================================
  # REGION-01 ONLY RULES - Apply ONLY to Region-01 (eastus2)
  # =========================================================================
  # These 0 rules exist only in AWS us-east-1 (Virginia)
  # or have different definitions than Region-02
  # 
  # Note: Can reuse priorities 800-899 because this deploys to DIFFERENT NSG
  # than Region-02 rules (different Azure region = different NSG instance)

  multi_service_08_region_01 = {
    for k, v in {
      # No Region-01 specific rules currently
      # 
      # EXAMPLE: How to add a new Region-01 only rule:
      # 
      # "tcp-3306-192-168-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 854  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "3306"
      #   source_address_prefix      = "192.168.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESG 08 - Multi-Service Rule"
      # }
    } : k => v if contains(local.region_01_locations, var.location)
  }

  # =========================================================================
  # REGION-02 ONLY RULES - Apply ONLY to Region-02 (centralus)
  # =========================================================================
  # These 6 rules exist only in AWS us-east-2 (Ohio)
  # or have different definitions than Region-01
  # 
  # Note: Can reuse priorities 800-899 for Region-02 only rules

  multi_service_08_region_02 = {
    for k, v in {
      "tcp-0-65535-10-111-100-235-32-ingress" = {
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 848
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "0-65535"
        source_address_prefix      = "10.111.100.235/32"
        destination_address_prefix = "*"
        description                = "ESG 08 - Multi-Service Rule"
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
        description                = "ESG 08 - Multi-Service Rule"
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
        description                = "ESG 08 - Multi-Service Rule"
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
        description                = "ESG 08 - Multi-Service Rule"
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
        description                = "ESG 08 - Multi-Service Rule"
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
        description                = "ESG 08 - Multi-Service Rule"
      }
    } : k => v if contains(local.region_02_locations, var.location)
  }

  # =========================================================================
  # MERGE ALL MULTI-SERVICE ESG 08 RULES
  # =========================================================================

  enterprise_08_multi_service_rules = merge(
    local.multi_service_08_common,
    local.multi_service_08_region_01,
    local.multi_service_08_region_02
  )
}
