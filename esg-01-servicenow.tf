# =============================================================================
# ServiceNow Enterprise Security Group Rules (ESG 01)
# =============================================================================
# This file contains enterprise-managed ServiceNow rules.
#
# Region Mapping:
#   - Primary regions   → Currently: eastus2 (was AWS us-east-1 Virginia)
#   - Secondary regions → Currently: centralus (was AWS us-east-2 Ohio)
#
# Note: Region names are kept in comments. Code uses generic primary/secondary.
#
# Priority Block: 100-199 (100 total slots)
#   - Currently used: 100-159 (60 rules)
#   - Reserved for future: 160-199 (40 slots)
#
# Rule Distribution:
#   - Common rules: 58 (apply to both regions)
#   - Primary-only: 2 (eastus2 only)
#   - Secondary-only: 2 (centralus only)
#
# Note: Primary and secondary can reuse same priorities (100-199) because
#       they deploy to DIFFERENT NSGs in DIFFERENT regions - no conflicts!
#
# Variable Naming: enterprise_01_servicenow_rules
# =============================================================================

locals {
  # =========================================================================
  # COMMON RULES - Apply to BOTH Primary and Secondary
  # =========================================================================
  # These 58 rules are identical in both regions
  
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
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
      description                = "ServiceNow Enterprise Rule"
    }
  }

  # =========================================================================
  # PRIMARY-ONLY RULES - Apply ONLY to Primary Regions (eastus2)
  # =========================================================================
  # These 2 rules exist only in primary or differ from secondary
  # 
  # Note: Can reuse priorities 100-199 because this deploys to DIFFERENT NSG
  # than secondary (different region = different NSG instance)
  
  servicenow_01_primary = {
    for k, v in {
      "tcp-49152-10-110-34-0-24-inbound" = {
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "49152"
        source_address_prefix      = "10.110.34.0/24"
        destination_address_prefix = "*"
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 158
        description                = "ServiceNow Enterprise Rule"
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
        description                = "ServiceNow Enterprise Rule"
      }
    } : k => v if contains(local.primary_regions, var.location)
  }

  # =========================================================================
  # SECONDARY-ONLY RULES - Apply ONLY to Secondary Regions (centralus)
  # =========================================================================
  # These 2 rules exist only in secondary or differ from primary
  # 
  # Note: Can reuse priorities 100-199 because this deploys to DIFFERENT NSG
  # than primary (different region = different NSG instance)
  
  servicenow_01_secondary = {
    for k, v in {
      "tcp-49152-65535-10-110-34-0-24-inbound" = {
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "49152-65535"
        source_address_prefix      = "10.110.34.0/24"
        destination_address_prefix = "*"
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 158
        description                = "ServiceNow Enterprise Rule"
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
        description                = "ServiceNow Enterprise Rule"
      }
    } : k => v if contains(local.secondary_regions, var.location)
  }

  # =========================================================================
  # MERGE ALL SERVICENOW ESG 01 RULES
  # =========================================================================
  
  enterprise_01_servicenow_rules = merge(
    local.servicenow_01_common,
    local.servicenow_01_primary,
    local.servicenow_01_secondary
  )
}
