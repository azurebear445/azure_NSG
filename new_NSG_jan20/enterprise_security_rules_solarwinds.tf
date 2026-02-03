# Enterprise Security Rules - SolarWinds
# Priority Block: 164-240
#   Currently used: 164-200 (37 rules)
#   Reserved for future: 201-240 (40 slots)

locals {
  # Common rules - Apply to all regions
  solarwinds_common = var.enable_default_enterprise_security_rules ? {
    "Allow-SolarWinds_TCP_22" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["22"]
      direction                      = "Inbound"
      priority                       = 164
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_23" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["23"]
      direction                      = "Inbound"
      priority                       = 165
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_25" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["25"]
      direction                      = "Inbound"
      priority                       = 166
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_53" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["53"]
      direction                      = "Inbound"
      priority                       = 167
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_80" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["80"]
      direction                      = "Inbound"
      priority                       = 168
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_135" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["135"]
      direction                      = "Inbound"
      priority                       = 169
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_139" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["139"]
      direction                      = "Inbound"
      priority                       = 170
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_443" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["443"]
      direction                      = "Inbound"
      priority                       = 171
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_445" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["445"]
      direction                      = "Inbound"
      priority                       = 172
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_465" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["465"]
      direction                      = "Inbound"
      priority                       = 173
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_587" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["587"]
      direction                      = "Inbound"
      priority                       = 174
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_1024" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1024"]
      direction                      = "Inbound"
      priority                       = 175
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_1025" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1025"]
      direction                      = "Inbound"
      priority                       = 176
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_1026" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1026"]
      direction                      = "Inbound"
      priority                       = 177
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_1027" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1027"]
      direction                      = "Inbound"
      priority                       = 178
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_1028" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1028"]
      direction                      = "Inbound"
      priority                       = 179
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_1029" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1029"]
      direction                      = "Inbound"
      priority                       = 180
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_1030" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1030"]
      direction                      = "Inbound"
      priority                       = 181
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_1031" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1031"]
      direction                      = "Inbound"
      priority                       = 182
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_1032" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1032"]
      direction                      = "Inbound"
      priority                       = 183
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_1033" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1033"]
      direction                      = "Inbound"
      priority                       = 184
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_1034" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1034"]
      direction                      = "Inbound"
      priority                       = 185
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_1433" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1433"]
      direction                      = "Inbound"
      priority                       = 186
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_1801" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1801"]
      direction                      = "Inbound"
      priority                       = 187
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_5671" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["5671"]
      direction                      = "Inbound"
      priority                       = 188
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_17777" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["17777"]
      direction                      = "Inbound"
      priority                       = 189
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_17778" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["17778"]
      direction                      = "Inbound"
      priority                       = 190
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_TCP_17791" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["17791"]
      direction                      = "Inbound"
      priority                       = 191
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.14.232/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_UDP_53" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["53"]
      direction                      = "Inbound"
      priority                       = 192
      protocol                       = "Udp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_UDP_137" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["137"]
      direction                      = "Inbound"
      priority                       = 193
      protocol                       = "Udp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_UDP_138" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["138"]
      direction                      = "Inbound"
      priority                       = 194
      protocol                       = "Udp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_UDP_161" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["161"]
      direction                      = "Inbound"
      priority                       = 195
      protocol                       = "Udp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_UDP_162" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["162"]
      direction                      = "Inbound"
      priority                       = 196
      protocol                       = "Udp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_UDP_1024" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1024"]
      direction                      = "Inbound"
      priority                       = 197
      protocol                       = "Udp"
      source_address_prefixes        = ["10.111.14.232/32", "10.111.14.233/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_UDP_1434" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1434"]
      direction                      = "Inbound"
      priority                       = 198
      protocol                       = "Udp"
      source_address_prefixes        = ["10.111.14.232/32"]
      source_port_range             = "*"
    }
    "Allow-SolarWinds_ICMP_AllPorts" = {
      access                         = "Allow"
      description                    = "Ingress from SolarWinds servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["*"]
      direction                      = "Inbound"
      priority                       = 199
      protocol                       = "Icmp"
      source_address_prefixes        = ["10.111.14.232/32"]
      source_port_range             = "*"
    }
    "Allow-All_Egress" = {
      access                         = "Allow"
      description                    = "Egress to SolarWinds servers."
      destination_address_prefix     = "0.0.0.0/0"
      destination_port_ranges        = ["*"]
      direction                      = "Outbound"
      priority                       = 200
      protocol                       = "*"
      source_address_prefixes = ["0.0.0.0/0"]
      source_port_range             = "*"
    }
  } : {}

  # Region-01 only (eastus)
  solarwinds_region_eastus = {
    # No eastus-specific rules currently
  }

  # Region-02 only (northcentralus)
  solarwinds_region_northcentralus = {
    # No northcentralus-specific rules currently
  }

  enterprise_solarwinds_rules = merge(
    local.solarwinds_common,
    local.is_region_eastus ? local.solarwinds_region_eastus : {},
    local.is_region_northcentralus ? local.solarwinds_region_northcentralus : {}
  )
}