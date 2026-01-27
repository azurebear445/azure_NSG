# Enterprise Security Rules - Varonis Collectors
# Priority Block: 776-822
#   Currently used: 776-782 (7 rules)
#   Reserved for future: 783-822 (40 slots)

locals {
  # Common rules - Apply to all regions
  varonis_collectors_common = {
    "Allow-VaronisCollectors_TCP_22" = {
      access                         = "Allow"
      description                    = "Ingress from Varonis Collectors servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["22"]
      direction                      = "Inbound"
      priority                       = 776
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.19.0/24", "10.112.1.153/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-VaronisCollectors_TCP_80" = {
      access                         = "Allow"
      description                    = "Ingress from Varonis Collectors servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["80"]
      direction                      = "Inbound"
      priority                       = 777
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.19.0/24", "10.112.1.153/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-VaronisCollectors_TCP_111" = {
      access                         = "Allow"
      description                    = "Ingress from Varonis Collectors servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["111"]
      direction                      = "Inbound"
      priority                       = 778
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.19.0/24", "10.112.1.153/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-VaronisCollectors_TCP_445" = {
      access                         = "Allow"
      description                    = "Ingress from Varonis Collectors servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["445"]
      direction                      = "Inbound"
      priority                       = 779
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.19.0/24", "10.112.1.153/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-VaronisCollectors_TCP_2049" = {
      access                         = "Allow"
      description                    = "Ingress from Varonis Collectors servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["2049"]
      direction                      = "Inbound"
      priority                       = 780
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.19.0/24", "10.112.1.153/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-VaronisCollectors_TCP_137-139" = {
      access                         = "Allow"
      description                    = "Ingress from Varonis Collectors servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["137-139"]
      direction                      = "Inbound"
      priority                       = 781
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.19.0/24", "10.112.1.153/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-VaronisCollectors_TCP_4972-4973" = {
      access                         = "Allow"
      description                    = "Ingress from Varonis Collectors servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["4972-4973"]
      direction                      = "Inbound"
      priority                       = 782
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.111.19.0/24", "10.112.1.153/32"]
      source_port_ranges             = ["*"]
    }
  }

  # Region-01 only (eastus)
  varonis_collectors_region_eastus = {
    # No eastus-specific rules currently
  }

  # Region-02 only (northcentralus)
  varonis_collectors_region_northcentralus = {
    # No northcentralus-specific rules currently
  }

  enterprise_varonis_collectors_rules = merge(
    local.varonis_collectors_common,
    var.location == "eastus" ? local.varonis_collectors_region_eastus : {},
    var.location == "northcentralus" ? local.varonis_collectors_region_northcentralus : {}
  )
}