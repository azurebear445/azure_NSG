# Enterprise Security Rules - SailPoint
# Priority Block: 732-775
#   Currently used: 732-735 (4 rules)
#   Reserved for future: 736-775 (40 slots)

locals {
  # Common rules - Apply to all regions
  sailpoint_common = {
    "Allow-SailPoint_TCP_1433" = {
      access                         = "Allow"
      description                    = "Ingress from SailPoint servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1433"]
      direction                      = "Inbound"
      priority                       = 732
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.110.117.157/32", "10.110.117.164/32", "10.111.95.173/32", "10.111.95.176/32", "10.211.42.149/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-SailPoint_TCP_5102" = {
      access                         = "Allow"
      description                    = "Ingress from SailPoint servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["5102"]
      direction                      = "Inbound"
      priority                       = 733
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.110.117.157/32", "10.110.117.164/32", "10.111.95.173/32", "10.111.95.176/32", "10.211.42.149/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-SailPoint_TCP_5432" = {
      access                         = "Allow"
      description                    = "Ingress from SailPoint servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["5432"]
      direction                      = "Inbound"
      priority                       = 734
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.110.117.157/32", "10.110.117.164/32", "10.111.95.173/32", "10.111.95.176/32", "10.211.42.149/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-SailPoint_TCP_52731" = {
      access                         = "Allow"
      description                    = "Ingress from SailPoint servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["52731"]
      direction                      = "Inbound"
      priority                       = 735
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.110.117.157/32", "10.110.117.164/32", "10.111.95.173/32", "10.111.95.176/32", "10.211.42.149/32"]
      source_port_ranges             = ["*"]
    }
  }

  # Region-01 only (eastus)
  sailpoint_region_eastus = {
    # No eastus-specific rules currently
  }

  # Region-02 only (northcentralus)
  sailpoint_region_northcentralus = {
    # No northcentralus-specific rules currently
  }

  enterprise_sailpoint_rules = merge(
    local.sailpoint_common,
    var.location == "eastus" ? local.sailpoint_region_eastus : {},
    var.location == "northcentralus" ? local.sailpoint_region_northcentralus : {}
  )
}