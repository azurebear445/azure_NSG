# Enterprise Security Rules - Idera Monitoring
# Priority Block: 900-999
#   Currently used: 900-943 (44 rules)
#   Reserved for future: 944-999 (56 slots)

locals {
    # Common rules - Apply to all regions
  idera_monitoring_common = {
    "Allow_IderaMonitoring_TCP_135_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 900
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["135"]
      source_address_prefix      = "10.111.14.6/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_135_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 901
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["135"]
      source_address_prefix      = "10.111.26.8/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_135_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 902
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["135"]
      source_address_prefix      = "10.111.41.145/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_135_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 903
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["135"]
      source_address_prefix      = "10.111.71.30/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_1024to65535_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 904
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1024-65535"]
      source_address_prefix      = "10.111.14.6/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_1024to65535_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 905
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1024-65535"]
      source_address_prefix      = "10.111.26.8/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_1024to65535_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 906
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1024-65535"]
      source_address_prefix      = "10.111.41.145/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_1024to65535_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 907
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1024-65535"]
      source_address_prefix      = "10.111.71.30/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_1433_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 908
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1433"]
      source_address_prefix      = "10.111.14.6/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_1433_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 909
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1433"]
      source_address_prefix      = "10.111.26.8/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_1433_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 910
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1433"]
      source_address_prefix      = "10.111.41.145/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_1433_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 911
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["1433"]
      source_address_prefix      = "10.111.71.30/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_5166_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 912
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5166"]
      source_address_prefix      = "10.111.14.6/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_5166_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 913
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5166"]
      source_address_prefix      = "10.111.26.8/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_5166_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 914
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5166"]
      source_address_prefix      = "10.111.41.145/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_5166_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 915
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5166"]
      source_address_prefix      = "10.111.71.30/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_5167_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 916
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5167"]
      source_address_prefix      = "10.111.14.6/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_5167_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 917
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5167"]
      source_address_prefix      = "10.111.26.8/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_5167_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 918
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5167"]
      source_address_prefix      = "10.111.41.145/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_5167_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 919
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5167"]
      source_address_prefix      = "10.111.71.30/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_5169_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 920
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5169"]
      source_address_prefix      = "10.111.14.6/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_5169_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 921
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5169"]
      source_address_prefix      = "10.111.26.8/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_5169_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 922
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5169"]
      source_address_prefix      = "10.111.41.145/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_5169_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 923
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5169"]
      source_address_prefix      = "10.111.71.30/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_5200_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 924
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5200"]
      source_address_prefix      = "10.111.14.6/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_5200_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 925
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5200"]
      source_address_prefix      = "10.111.26.8/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_5200_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 926
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5200"]
      source_address_prefix      = "10.111.41.145/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_5200_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 927
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5200"]
      source_address_prefix      = "10.111.71.30/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_5201_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 928
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5201"]
      source_address_prefix      = "10.111.14.6/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_5201_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 929
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5201"]
      source_address_prefix      = "10.111.26.8/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_5201_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 930
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5201"]
      source_address_prefix      = "10.111.41.145/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_5201_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 931
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["5201"]
      source_address_prefix      = "10.111.71.30/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_49152to65535_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 932
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["49152-65535"]
      source_address_prefix      = "10.111.14.6/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_49152to65535_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 933
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["49152-65535"]
      source_address_prefix      = "10.111.26.8/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_49152to65535_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 934
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["49152-65535"]
      source_address_prefix      = "10.111.41.145/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_49152to65535_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 935
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["49152-65535"]
      source_address_prefix      = "10.111.71.30/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_52731_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 936
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["52731"]
      source_address_prefix      = "10.111.14.6/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_52731_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 937
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["52731"]
      source_address_prefix      = "10.111.26.8/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_52731_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 938
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["52731"]
      source_address_prefix      = "10.111.41.145/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_TCP_52731_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 939
      protocol                   = "Tcp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["52731"]
      source_address_prefix      = "10.111.71.30/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_ICMP_AllPorts_In" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 940
      protocol                   = "Icmp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["*"]
      source_address_prefix      = "10.111.14.6/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_ICMP_AllPorts_In_1" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 941
      protocol                   = "Icmp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["*"]
      source_address_prefix      = "10.111.26.8/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_ICMP_AllPorts_In_2" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 942
      protocol                   = "Icmp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["*"]
      source_address_prefix      = "10.111.41.145/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
    "Allow_IderaMonitoring_ICMP_AllPorts_In_3" = {
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 943
      protocol                   = "Icmp"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["*"]
      source_address_prefix      = "10.111.71.30/32"
      destination_address_prefix = "*"
      description                = "ESR 09 - Idera Monitoring Rule."
    }
  }
    # Region-01 only (eastus)
  idera_monitoring_region_eastus = {
      # No Region-01 specific rules currently
          # EXAMPLE: How to add a new Region-01 only rule:
          # "tcp-3306-192-168-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 944  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_ranges          = ["*"]
      #   destination_port_ranges     = ["3306"]
      #   source_address_prefix      = "192.168.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 09 - Idera Monitoring Rule."
      # }
  }
    # Region-02 only (northcentralus)
  idera_monitoring_region_northcentralus = {
      # No Region-02 specific rules currently
          # EXAMPLE: How to add a new Region-02 only rule:
          # "tcp-8080-10-1-1-0-24-inbound" = {
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   priority                   = 944  # Next available priority
      #   protocol                   = "Tcp"
      #   source_port_ranges          = ["*"]
      #   destination_port_ranges     = ["8080"]
      #   source_address_prefix      = "10.1.1.0/24"
      #   destination_address_prefix = "*"
      #   description                = "ESR 09 - Idera Monitoring Rule."
      # }
  }
  enterprise_idera_monitoring_rules = merge(
    local.idera_monitoring_common,
    var.location == "eastus" ? local.idera_monitoring_region_eastus : {},
    var.location == "northcentralus" ? local.idera_monitoring_region_northcentralus : {}
  )
}
