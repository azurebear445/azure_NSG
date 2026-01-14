# ServiceNow Enterprise Security Rule Rules (ESR 01)
# This file contains enterprise-managed ServiceNow rules.
#
# Region Mapping:
# Region-01: eastus | Region-02: eastus2 | Region-03: northcentralus (common only)
#
#
# Priority Block: 100-199 (100 total slots)
#   - Currently used: 100-159 (60 rules)
#   - Reserved for future: 160-199 (40 slots)
#
# Rule Distribution:
#   - Common rules: 58 (apply to both regions)
#   - Region-01 only: 2 (eastus only)
#   - Region-02 only: 2 (eastus only)
#
#
# Variable Naming: enterprise_01_servicenow_rules
locals {
    # Common rules - Apply to all regions
  servicenow_01_common = {
    "all-all-0-0-0-0-0-outbound" = {
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "0.0.0.0/0"
      destination_address_prefix = "*"
      direction                  = "Outbound"
      access                     = "Allow"
      priority                   = 100
      description                = "ESR 01 - ServiceNow Rule"
    }
    "all-all-10-111-14-251-32-inbound" = {
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "10.111.14.251/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 101
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-135-10-1-248-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.1.248.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 102
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-135-10-110-34-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.110.34.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 103
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-135-10-111-19-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 104
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-135-10-111-32-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.111.32.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 105
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-135-10-20-60-101-32-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "135"
      source_address_prefix      = "10.20.60.101/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 106
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-13724-10-20-60-182-32-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "13724"
      source_address_prefix      = "10.20.60.182/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 107
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-13724-10-20-60-203-32-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "13724"
      source_address_prefix      = "10.20.60.203/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 108
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-13782-10-20-60-182-32-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "13782"
      source_address_prefix      = "10.20.60.182/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 109
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-13782-10-20-60-203-32-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "13782"
      source_address_prefix      = "10.20.60.203/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 110
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-139-10-1-248-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.1.248.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 111
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-139-10-111-19-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 112
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-139-10-20-60-101-32-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "139"
      source_address_prefix      = "10.20.60.101/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 113
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-1556-10-20-60-182-32-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1556"
      source_address_prefix      = "10.20.60.182/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 114
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-1556-10-20-60-203-32-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1556"
      source_address_prefix      = "10.20.60.203/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 115
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-15671-10-111-19-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "15671"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 116
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-1858-10-71-44-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1858"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 117
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-1858-10-72-44-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1858"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 118
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-22-10-110-34-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.110.34.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 119
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-22-10-111-32-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.111.32.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 120
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-22-10-71-44-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 121
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-22-10-72-44-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 122
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-3389-10-71-44-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 123
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-3389-10-72-44-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 124
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-443-10-71-44-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 125
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-443-10-72-44-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 126
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-445-10-1-248-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.1.248.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 127
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-445-10-110-34-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.110.34.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 128
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-445-10-111-19-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 129
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-445-10-111-32-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.111.32.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 130
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-445-10-20-60-101-32-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "445"
      source_address_prefix      = "10.20.60.101/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 131
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-4699-10-111-19-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4699"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 132
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-4972-10-1-248-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4972"
      source_address_prefix      = "10.1.248.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 133
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-4972-10-111-19-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4972"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 134
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-4972-10-20-60-101-32-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4972"
      source_address_prefix      = "10.20.60.101/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 135
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-4974-10-1-248-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4974"
      source_address_prefix      = "10.1.248.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 136
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-4974-10-111-19-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4974"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 137
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-4974-10-20-60-101-32-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "4974"
      source_address_prefix      = "10.20.60.101/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 138
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-5500-10-71-44-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5500"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 139
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-5500-10-72-44-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5500"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 140
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-5985-10-110-34-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5985"
      source_address_prefix      = "10.110.34.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 141
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-5985-10-111-32-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5985"
      source_address_prefix      = "10.111.32.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 142
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-5986-10-110-34-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5986"
      source_address_prefix      = "10.110.34.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 143
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-5986-10-111-32-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5986"
      source_address_prefix      = "10.111.32.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 144
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-60777-10-1-248-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "60777"
      source_address_prefix      = "10.1.248.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 145
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-60777-10-111-19-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "60777"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 146
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-60777-10-20-60-101-32-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "60777"
      source_address_prefix      = "10.20.60.101/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 147
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-636-10-71-44-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "636"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 148
      description                = "ESR 01 - ServiceNow Rule"
    }
    "tcp-636-10-72-44-0-24-inbound" = {
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "636"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 149
      description                = "ESR 01 - ServiceNow Rule"
    }
    "udp-137-10-1-248-0-24-inbound" = {
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "137"
      source_address_prefix      = "10.1.248.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 150
      description                = "ESR 01 - ServiceNow Rule"
    }
    "udp-137-10-111-19-0-24-inbound" = {
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "137"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 151
      description                = "ESR 01 - ServiceNow Rule"
    }
    "udp-137-10-20-60-101-32-inbound" = {
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "137"
      source_address_prefix      = "10.20.60.101/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 152
      description                = "ESR 01 - ServiceNow Rule"
    }
    "udp-138-10-1-248-0-24-inbound" = {
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "138"
      source_address_prefix      = "10.1.248.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 153
      description                = "ESR 01 - ServiceNow Rule"
    }
    "udp-138-10-111-19-0-24-inbound" = {
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "138"
      source_address_prefix      = "10.111.19.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 154
      description                = "ESR 01 - ServiceNow Rule"
    }
    "udp-138-10-20-60-101-32-inbound" = {
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "138"
      source_address_prefix      = "10.20.60.101/32"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 155
      description                = "ESR 01 - ServiceNow Rule"
    }
    "udp-1813-10-71-44-0-24-inbound" = {
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1813"
      source_address_prefix      = "10.71.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 156
      description                = "ESR 01 - ServiceNow Rule"
    }
    "udp-1813-10-72-44-0-24-inbound" = {
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "1813"
      source_address_prefix      = "10.72.44.0/24"
      destination_address_prefix = "*"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 157
      description                = "ESR 01 - ServiceNow Rule"
    }
  }
    # Region-01 only (eastus)
  servicenow_01_region_01 = {
      "tcp-49152-10-110-34-0-24-inbound" = {
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "49152"
        source_address_prefix      = "10.110.34.0/24"
        destination_address_prefix = "*"
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 158
        description                = "ESR 01 - ServiceNow Rule"
      }
      "tcp-49152-10-111-32-0-24-inbound" = {
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "49152"
        source_address_prefix      = "10.111.32.0/24"
        destination_address_prefix = "*"
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 159
        description                = "ESR 01 - ServiceNow Rule"
      }
  }
    # Region-02 only (eastus2)
  servicenow_01_region_02 = {
      "tcp-49152-65535-10-110-34-0-24-inbound" = {
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "49152-65535"
        source_address_prefix      = "10.110.34.0/24"
        destination_address_prefix = "*"
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 158
        description                = "ESR 01 - ServiceNow Rule"
      }
      "tcp-49152-65535-10-111-32-0-24-inbound" = {
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "49152-65535"
        source_address_prefix      = "10.111.32.0/24"
        destination_address_prefix = "*"
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 159
        description                = "ESR 01 - ServiceNow Rule"
      }
  }
  enterprise_01_servicenow_rules = merge(
    local.servicenow_01_common,
    var.location == "eastus" ? local.servicenow_01_region_01 : {},
    var.location == "eastus2" ? local.servicenow_01_region_02 : {}
  )
}
