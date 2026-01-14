# Idera Database Monitoring Enterprise Security Rule Rules (ESR 09)
# This file contains enterprise-managed rules for Idera database monitoring.
#
# Region Mapping:
# Region-01: eastus | Region-02: eastus2 | Region-03: northcentralus (common only)
#
#
# Priority Block: 900-999 (100 total slots)
#   - Currently used: 900-943 (44 rules)
#   - Reserved for future: 944-999 (56 slots)
#
# Rule Distribution:
#   - Common rules: 44 (apply to both regions)
#   - Region-01 only: 0 (eastus only)
#   - Region-02 only: 0 (eastus only)
#
#
# Variable Naming: enterprise_09_idera_monitoring_rules
locals {
    # Common rules - Apply to all regions
     44 rules are identical in both AWS regions
  idera_monitoring_09_common = {
    "tcp-135-10-111-14-6-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 900
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.111.14.6/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-135-10-111-26-8-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 901
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.111.26.8/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-135-10-111-41-145-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 902
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.111.41.145/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-135-10-111-71-30-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 903
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.111.71.30/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-1024-65535-10-111-14-6-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 904
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1024-65535"
      source_address_prefix      = "10.111.14.6/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-1024-65535-10-111-26-8-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 905
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1024-65535"
      source_address_prefix      = "10.111.26.8/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-1024-65535-10-111-41-145-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 906
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1024-65535"
      source_address_prefix      = "10.111.41.145/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-1024-65535-10-111-71-30-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 907
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1024-65535"
      source_address_prefix      = "10.111.71.30/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-1433-10-111-14-6-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 908
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.14.6/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-1433-10-111-26-8-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 909
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.26.8/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-1433-10-111-41-145-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 910
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.41.145/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-1433-10-111-71-30-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 911
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "10.111.71.30/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-5166-10-111-14-6-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 912
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5166"
      source_address_prefix      = "10.111.14.6/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-5166-10-111-26-8-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 913
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5166"
      source_address_prefix      = "10.111.26.8/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-5166-10-111-41-145-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 914
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5166"
      source_address_prefix      = "10.111.41.145/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-5166-10-111-71-30-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 915
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5166"
      source_address_prefix      = "10.111.71.30/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-5167-10-111-14-6-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 916
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5167"
      source_address_prefix      = "10.111.14.6/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-5167-10-111-26-8-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 917
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5167"
      source_address_prefix      = "10.111.26.8/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-5167-10-111-41-145-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 918
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5167"
      source_address_prefix      = "10.111.41.145/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-5167-10-111-71-30-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 919
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5167"
      source_address_prefix      = "10.111.71.30/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-5169-10-111-14-6-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 920
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5169"
      source_address_prefix      = "10.111.14.6/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-5169-10-111-26-8-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 921
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5169"
      source_address_prefix      = "10.111.26.8/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-5169-10-111-41-145-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 922
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5169"
      source_address_prefix      = "10.111.41.145/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-5169-10-111-71-30-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 923
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5169"
      source_address_prefix      = "10.111.71.30/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-5200-10-111-14-6-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 924
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5200"
      source_address_prefix      = "10.111.14.6/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-5200-10-111-26-8-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 925
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5200"
      source_address_prefix      = "10.111.26.8/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-5200-10-111-41-145-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 926
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5200"
      source_address_prefix      = "10.111.41.145/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-5200-10-111-71-30-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 927
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5200"
      source_address_prefix      = "10.111.71.30/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-5201-10-111-14-6-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 928
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5201"
      source_address_prefix      = "10.111.14.6/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-5201-10-111-26-8-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 929
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5201"
      source_address_prefix      = "10.111.26.8/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-5201-10-111-41-145-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 930
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5201"
      source_address_prefix      = "10.111.41.145/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-5201-10-111-71-30-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 931
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5201"
      source_address_prefix      = "10.111.71.30/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-49152-65535-10-111-14-6-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 932
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "10.111.14.6/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-49152-65535-10-111-26-8-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 933
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "10.111.26.8/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-49152-65535-10-111-41-145-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 934
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "10.111.41.145/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-49152-65535-10-111-71-30-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 935
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "49152-65535"
      source_address_prefix      = "10.111.71.30/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-52731-10-111-14-6-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 936
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.111.14.6/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-52731-10-111-26-8-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 937
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.111.26.8/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-52731-10-111-41-145-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 938
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.111.41.145/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "tcp-52731-10-111-71-30-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 939
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "52731"
      source_address_prefix      = "10.111.71.30/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "icmp--1-10-111-14-6-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 940
      protocol                   = "Icmp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "10.111.14.6/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "icmp--1-10-111-26-8-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 941
      protocol                   = "Icmp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "10.111.26.8/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "icmp--1-10-111-41-145-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 942
      protocol                   = "Icmp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "10.111.41.145/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
    "icmp--1-10-111-71-30-32-ingress" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 943
      protocol                   = "Icmp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "10.111.71.30/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule"
    }
  }
    # Region-01 only (eastus)
     0 rules exist only in AWS us-east-1 (Virginia)
  # than Region-02 rules (different Azure region = different NSG instance)
  idera_monitoring_09_region_01 = {
      # No Region-01 specific rules currently
          # EXAMPLE: How to add a new Region-01 only rule:
          # "tcp-3306-192-168-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 944  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "3306"
      #   source_address_prefix      = "192.168.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 09 - Idera Monitoring Rule"
      # }
  }
    # Region-02 only (eastus2)
     0 rules exist only in AWS us-east-2 (Ohio)
  idera_monitoring_09_region_02 = {
      # No Region-02 specific rules currently
          # EXAMPLE: How to add a new Region-02 only rule:
          # "tcp-8080-10-1-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 944  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "8080"
      #   source_address_prefix      = "10.1.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 09 - Idera Monitoring Rule"
      # }
  }
  enterprise_09_idera_monitoring_rules = merge(
    local.idera_monitoring_09_common,
    var.location == "eastus" ? local.idera_monitoring_09_region_01 : {},
    var.location == "eastus2" ? local.idera_monitoring_09_region_02 : {}
  )
}
