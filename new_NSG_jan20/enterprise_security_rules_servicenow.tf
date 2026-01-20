# Enterprise Security Rules - ServiceNow
# Priority Block: 100-199
#   Currently used: 100-159 (60 rules)
#   Reserved for future: 160-199 (40 slots)

locals {
    # Common rules - Apply to all regions
  servicenow_one_common = var.enable_enterprise_security_rules ? {
    "Allow-ServiceNow_All_AllPorts_Out" = {
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "0.0.0.0/0"
      destination_address_prefix = "*"
      direction                  = "Outbound"
      access                     = "Allow"
      priority                   = 100
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_All_AllPorts_In" = {
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "10.111.14.251/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 101
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_135_In" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.1.248.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 102
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_135_In_1" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.110.34.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 103
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_135_In_2" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 104
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_135_In_3" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.111.32.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 105
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_135_In_4" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.20.60.101/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 106
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_13724_In" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "13724"
      source_address_prefix      = "10.20.60.182/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 107
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_13724_In_1" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "13724"
      source_address_prefix      = "10.20.60.203/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 108
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_13782_In" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "13782"
      source_address_prefix      = "10.20.60.182/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 109
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_13782_In_1" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "13782"
      source_address_prefix      = "10.20.60.203/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 110
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_139_In" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.1.248.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 111
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_139_In_1" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 112
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_139_In_2" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.20.60.101/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 113
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_1556_In" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1556"
      source_address_prefix      = "10.20.60.182/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 114
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_1556_In_1" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1556"
      source_address_prefix      = "10.20.60.203/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 115
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_15671_In" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "15671"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 116
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_1858_In" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1858"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 117
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_1858_In_1" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1858"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 118
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_22_In" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.110.34.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 119
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_22_In_1" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.111.32.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 120
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_22_In_2" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 121
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_22_In_3" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 122
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_3389_In" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 123
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_3389_In_1" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 124
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_443_In" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 125
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_443_In_1" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 126
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_445_In" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.1.248.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 127
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_445_In_1" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.110.34.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 128
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_445_In_2" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 129
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_445_In_3" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.111.32.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 130
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_445_In_4" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.20.60.101/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 131
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_4699_In" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4699"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 132
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_4972_In" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4972"
      source_address_prefix      = "10.1.248.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 133
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_4972_In_1" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4972"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 134
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_4972_In_2" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4972"
      source_address_prefix      = "10.20.60.101/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 135
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_4974_In" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4974"
      source_address_prefix      = "10.1.248.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 136
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_4974_In_1" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4974"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 137
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_4974_In_2" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4974"
      source_address_prefix      = "10.20.60.101/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 138
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_5500_In" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5500"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 139
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_5500_In_1" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5500"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 140
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_5985_In" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5985"
      source_address_prefix      = "10.110.34.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 141
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_5985_In_1" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5985"
      source_address_prefix      = "10.111.32.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 142
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_5986_In" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5986"
      source_address_prefix      = "10.110.34.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 143
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_5986_In_1" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5986"
      source_address_prefix      = "10.111.32.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 144
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_60777_In" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "60777"
      source_address_prefix      = "10.1.248.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 145
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_60777_In_1" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "60777"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 146
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_60777_In_2" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "60777"
      source_address_prefix      = "10.20.60.101/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 147
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_636_In" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "636"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 148
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_TCP_636_In_1" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "636"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 149
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_UDP_137_In" = {
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "137"
      source_address_prefix      = "10.1.248.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 150
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_UDP_137_In_1" = {
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "137"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 151
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_UDP_137_In_2" = {
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "137"
      source_address_prefix      = "10.20.60.101/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 152
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_UDP_138_In" = {
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "138"
      source_address_prefix      = "10.1.248.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 153
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_UDP_138_In_1" = {
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "138"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 154
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_UDP_138_In_2" = {
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "138"
      source_address_prefix      = "10.20.60.101/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 155
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_UDP_1813_In" = {
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1813"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 156
      description                = "ESR 01 - ServiceNow Rule."
    }
    "Allow-ServiceNow_UDP_1813_In_1" = {
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1813"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 157
      description                = "ESR 01 - ServiceNow Rule."
    }
  } : {}
    # Region-01 only (eastus)
  servicenow_one_region_eastus = var.enable_enterprise_security_rules ? {
      "Allow-ServiceNow_TCP_49152_In" = {
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "49152"
        source_address_prefix      = "10.110.34.0/24"
        destination_address_prefix = "*"
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 158
        description                = "ESR 01 - ServiceNow Rule."
      }
      "Allow-ServiceNow_TCP_49152_In_1" = {
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "49152"
        source_address_prefix      = "10.111.32.0/24"
        destination_address_prefix = "*"
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 159
        description                = "ESR 01 - ServiceNow Rule."
      }
  } : {}
    # Region-02 only (northcentralus)
  servicenow_one_region_northcentralus = var.enable_enterprise_security_rules ? {
      "Allow-ServiceNow_TCP_49152to65535_In" = {
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "49152-65535"
        source_address_prefix      = "10.110.34.0/24"
        destination_address_prefix = "*"
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 158
        description                = "ESR 01 - ServiceNow Rule."
      }
      "Allow-ServiceNow_TCP_49152to65535_In_1" = {
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "49152-65535"
        source_address_prefix      = "10.111.32.0/24"
        destination_address_prefix = "*"
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 159
        description                = "ESR 01 - ServiceNow Rule."
      }
  } : {}
  enterprise_servicenow_one_rules = merge(
    local.servicenow_one_common,
    var.location == "eastus" ? local.servicenow_one_region_eastus : {},
    var.location == "northcentralus" ? local.servicenow_one_region_northcentralus : {}
  )
}
