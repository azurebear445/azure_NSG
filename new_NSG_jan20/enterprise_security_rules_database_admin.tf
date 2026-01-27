# Enterprise Security Rules - Database Admin
# Priority Block: 479-524
#   Currently used: 479-484 (6 rules)
#   Reserved for future: 485-524 (40 slots)

locals {
  # Common rules - Apply to all regions
  database_admin_common = {
    "Allow-DatabaseAdmin_TCP_1433" = {
      access                         = "Allow"
      description                    = "Ingress from Database Admin servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["1433"]
      direction                      = "Inbound"
      priority                       = 479
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.110.28.197/32", "10.110.28.214/32", "10.111.123.145/32", "10.111.123.182/32", "10.111.88.85/32", "10.20.68.14/32", "10.211.123.156/32", "10.211.123.197/32", "10.211.88.4/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-DatabaseAdmin_TCP_5102" = {
      access                         = "Allow"
      description                    = "Ingress from Database Admin servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["5102"]
      direction                      = "Inbound"
      priority                       = 480
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.110.28.197/32", "10.110.28.214/32", "10.111.123.145/32", "10.111.123.182/32", "10.111.88.85/32", "10.211.123.156/32", "10.211.123.197/32", "10.211.88.4/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-DatabaseAdmin_TCP_5986" = {
      access                         = "Allow"
      description                    = "Ingress from Database Admin servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["5986"]
      direction                      = "Inbound"
      priority                       = 481
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.20.68.14/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-DatabaseAdmin_TCP_52731" = {
      access                         = "Allow"
      description                    = "Ingress from Database Admin servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["52731"]
      direction                      = "Inbound"
      priority                       = 482
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.110.28.197/32", "10.110.28.214/32", "10.111.123.145/32", "10.111.123.182/32", "10.111.88.85/32", "10.20.68.14/32", "10.211.123.156/32", "10.211.123.197/32", "10.211.88.4/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-DatabaseAdmin_TCP_52733" = {
      access                         = "Allow"
      description                    = "Ingress from Database Admin servers."
      destination_address_prefix     = "*"
      destination_port_ranges        = ["52733"]
      direction                      = "Inbound"
      priority                       = 483
      protocol                       = "Tcp"
      source_address_prefixes        = ["10.110.28.197/32", "10.110.28.214/32", "10.111.123.145/32", "10.111.123.182/32", "10.111.88.85/32", "10.211.123.156/32", "10.211.123.197/32", "10.211.88.4/32"]
      source_port_ranges             = ["*"]
    }
    "Allow-DatabaseAdmin_All_AllPorts" = {
      access                         = "Allow"
      description                    = "Egress to Database Admin servers."
      destination_address_prefix     = "0.0.0.0/0"
      destination_port_ranges        = ["*"]
      direction                      = "Outbound"
      priority                       = 484
      protocol                       = "*"
      source_address_prefixes        = ["*"]
      source_port_ranges             = ["*"]
    }
  }

  # Region-01 only (eastus)
  database_admin_region_eastus = {
    # No eastus-specific rules currently
  }

  # Region-02 only (northcentralus)
  database_admin_region_northcentralus = {
    # No northcentralus-specific rules currently
  }

  enterprise_database_admin_rules = merge(
    local.database_admin_common,
    var.location == "eastus" ? local.database_admin_region_eastus : {},
    var.location == "northcentralus" ? local.database_admin_region_northcentralus : {}
  )
}