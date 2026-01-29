resource "random_id" "this" {
  keepers = {
    description         = local.tags["purpose"]
    environment         = var.environment
    location            = var.location
    namespace           = var.namespace
    resource_group_name = var.resource_group_name
  }

  byte_length = 3
}

resource "azurerm_network_security_group" "this" {
  name                = local.nsg_tags["Name"]
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = local.nsg_tags

  lifecycle {
    create_before_destroy = true
  }
}

# Enterprise Security Rules (Priority 100-1499)
resource "azurerm_network_security_rule" "enterprise_rules" {
  for_each = local.all_enterprise_rules

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  access    = each.value.access
  direction = each.value.direction
  priority  = each.value.priority
  protocol  = each.value.protocol

  destination_address_prefix = each.value.destination_address_prefix
  destination_port_ranges    = each.value.destination_port_ranges
  source_address_prefixes    = each.value.source_address_prefixes
  source_port_range = each.value.source_port_range

  description = each.value.description
}

# User-Defined Security Rules - Split by protocol/direction/type
# Priority ranges: ICMP 1500+, TCP 1600+, UDP 1700+, ASG-TCP 1800+, ASG-UDP 1900+
# Egress: ICMP 2000+, TCP 2100+, UDP 2200+, ASG-TCP 2300+, ASG-UDP 2400+

# Ingress ICMP from CIDRs
resource "azurerm_network_security_rule" "icmp_from_cidrs" {
  for_each = try(var.ingress_rules["from_cidrs"]["icmp"], {})

  name                        = "${each.key}-icmp"
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  access    = "Allow"
  direction = "Inbound"
  priority  = 1500 + index(keys(try(var.ingress_rules["from_cidrs"]["icmp"], {})), each.key)
  protocol  = each.value["protocol"]

  destination_address_prefix = "*"
  destination_port_range     = "*"
  source_address_prefixes    = each.value["cidrs"]
  source_port_range          = "*"
}

# Ingress TCP from CIDRs
resource "azurerm_network_security_rule" "tcp_from_cidrs" {
  for_each = try(var.ingress_rules["from_cidrs"]["tcp"], {})

  name                        = "${each.key}-tcp"
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  access    = "Allow"
  direction = "Inbound"
  priority  = 1600 + index(keys(try(var.ingress_rules["from_cidrs"]["tcp"], {})), each.key)
  protocol  = each.value["protocol"]

  destination_address_prefix = "*"
  destination_port_ranges    = [each.value["to_port"] != null ? "${each.key}-${each.value["to_port"]}" : each.key]
  source_address_prefixes    = each.value["cidrs"]
  source_port_range          = "*"
}

# Ingress UDP from CIDRs
resource "azurerm_network_security_rule" "udp_from_cidrs" {
  for_each = try(var.ingress_rules["from_cidrs"]["udp"], {})

  name                        = "${each.key}-udp"
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  access    = "Allow"
  direction = "Inbound"
  priority  = 1700 + index(keys(try(var.ingress_rules["from_cidrs"]["udp"], {})), each.key)
  protocol  = each.value["protocol"]

  destination_address_prefix = "*"
  destination_port_ranges    = [each.value["to_port"] != null ? "${each.key}-${each.value["to_port"]}" : each.key]
  source_address_prefixes    = each.value["cidrs"]
  source_port_range          = "*"
}

# Ingress TCP from ASGs (requires locals for flattening multiple ASG IDs)
resource "azurerm_network_security_rule" "tcp_from_asgs" {
  for_each = local.ingress_rules_from_asgs_tcp

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  access    = "Allow"
  direction = "Inbound"
  priority  = each.value.priority
  protocol  = each.value.protocol

  destination_address_prefix            = "*"
  destination_port_ranges               = [each.value.from_port == each.value.to_port ? tostring(each.value.from_port) : "${each.value.from_port}-${each.value.to_port}"]
  source_application_security_group_ids = each.value.source_application_security_group_ids
  source_port_range                     = "*"
}

# Ingress UDP from ASGs (requires locals for flattening multiple ASG IDs)
resource "azurerm_network_security_rule" "udp_from_asgs" {
  for_each = local.ingress_rules_from_asgs_udp

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  access    = "Allow"
  direction = "Inbound"
  priority  = each.value.priority
  protocol  = each.value.protocol

  destination_address_prefix            = "*"
  destination_port_ranges               = [each.value.from_port == each.value.to_port ? tostring(each.value.from_port) : "${each.value.from_port}-${each.value.to_port}"]
  source_application_security_group_ids = each.value.source_application_security_group_ids
  source_port_range                     = "*"
}

# Egress ICMP to CIDRs
resource "azurerm_network_security_rule" "icmp_to_cidrs" {
  for_each = try(var.egress_rules["to_cidrs"]["icmp"], {})

  name                        = "egress-${each.key}-icmp"
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  access    = "Allow"
  direction = "Outbound"
  priority  = 2000 + index(keys(try(var.egress_rules["to_cidrs"]["icmp"], {})), each.key)
  protocol  = "Icmp"

  destination_address_prefixes = each.value["cidrs"]
  destination_port_range       = "*"
  source_address_prefix        = "*"
  source_port_range            = "*"
}

# Egress TCP to CIDRs
resource "azurerm_network_security_rule" "tcp_to_cidrs" {
  for_each = try(var.egress_rules["to_cidrs"]["tcp"], {})

  name                        = "egress-${each.key}-tcp"
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  access    = "Allow"
  direction = "Outbound"
  priority  = 2100 + index(keys(try(var.egress_rules["to_cidrs"]["tcp"], {})), each.key)
  protocol  = "Tcp"

  destination_address_prefixes = each.value["cidrs"]
  destination_port_ranges      = [each.value["to_port"] != null ? "${each.key}-${each.value["to_port"]}" : each.key]
  source_address_prefix        = "*"
  source_port_range            = "*"
}

# Egress UDP to CIDRs
resource "azurerm_network_security_rule" "udp_to_cidrs" {
  for_each = try(var.egress_rules["to_cidrs"]["udp"], {})

  name                        = "egress-${each.key}-udp"
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  access    = "Allow"
  direction = "Outbound"
  priority  = 2200 + index(keys(try(var.egress_rules["to_cidrs"]["udp"], {})), each.key)
  protocol  = "Udp"

  destination_address_prefixes = each.value["cidrs"]
  destination_port_ranges      = [each.value["to_port"] != null ? "${each.key}-${each.value["to_port"]}" : each.key]
  source_address_prefix        = "*"
  source_port_range            = "*"
}

# Egress TCP to ASGs (requires locals for flattening multiple ASG IDs)
resource "azurerm_network_security_rule" "tcp_to_asgs" {
  for_each = local.egress_rules_to_asgs_tcp

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  access    = "Allow"
  direction = "Outbound"
  priority  = each.value.priority
  protocol  = each.value.protocol

  destination_application_security_group_ids = each.value.destination_application_security_group_ids
  destination_port_ranges                    = [each.value.from_port == each.value.to_port ? tostring(each.value.from_port) : "${each.value.from_port}-${each.value.to_port}"]
  source_address_prefix                      = "*"
  source_port_range                          = "*"
}

# Egress UDP to ASGs (requires locals for flattening multiple ASG IDs)
resource "azurerm_network_security_rule" "udp_to_asgs" {
  for_each = local.egress_rules_to_asgs_udp

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  access    = "Allow"
  direction = "Outbound"
  priority  = each.value.priority
  protocol  = each.value.protocol

  destination_application_security_group_ids = each.value.destination_application_security_group_ids
  destination_port_ranges                    = [each.value.from_port == each.value.to_port ? tostring(each.value.from_port) : "${each.value.from_port}-${each.value.to_port}"]
  source_address_prefix                      = "*"
  source_port_range                          = "*"
}

# Any egress rule
resource "azurerm_network_security_rule" "any_egress" {
  for_each = var.enable_any_egress ? toset(["enabled"]) : toset([])

  name                        = "Allow-Any_Egress"
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  access    = "Allow"
  direction = "Outbound"
  priority  = 2500
  protocol  = "*"

  destination_address_prefix = "*"
  destination_port_range     = "*"
  source_address_prefix      = "*"
  source_port_range          = "*"
}
