resource "random_id" "this" {
  keepers = {
    description         = local.tags["purpose"]
    namespace           = var.namespace
    environment         = var.environment
    resource_group_name = var.resource_group_name
    location            = var.location
  }

  byte_length = 3
}

resource "azurerm_network_security_group" "this" {
  name                = local.nsg_tags["Name"]
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = local.nsg_tags
}

# Enterprise Security Rules (Priority 100-1499)
resource "azurerm_network_security_rule" "enterprise_rules" {
  for_each = local.all_enterprise_rules

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  direction = each.value.direction
  access    = each.value.access
  priority  = each.value.priority
  protocol  = each.value.protocol

  source_port_ranges      = each.value.source_port_ranges
  destination_port_ranges = each.value.destination_port_ranges

  source_address_prefix      = try(each.value.source_address_prefix, null)
  destination_address_prefix = try(each.value.destination_address_prefix, null)

  source_application_security_group_ids      = try(each.value.source_application_security_group_ids, null)
  destination_application_security_group_ids = try(each.value.destination_application_security_group_ids, null)

  description = each.value.description
}

# User-Defined Security Rules - Split by protocol/direction/type (Change 27)

# Ingress ICMP from CIDRs
resource "azurerm_network_security_rule" "icmp_from_cidrs" {
  for_each = local.ingress_rules_from_cidrs_icmp_map

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  direction = each.value.direction
  access    = each.value.access
  priority  = each.value.priority
  protocol  = each.value.protocol

  source_port_range          = "*"
  destination_port_range     = "*"
  source_address_prefix      = each.value.source_address_prefix
  destination_address_prefix = each.value.destination_address_prefix

  description = ""
}

# Ingress TCP from CIDRs
resource "azurerm_network_security_rule" "tcp_from_cidrs" {
  for_each = local.ingress_rules_from_cidrs_tcp_map

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  direction = each.value.direction
  access    = each.value.access
  priority  = each.value.priority
  protocol  = each.value.protocol

  source_port_range      = "*"
  destination_port_range = each.value.from_port == each.value.to_port ? tostring(each.value.from_port) : "${each.value.from_port}-${each.value.to_port}"
  source_address_prefix      = each.value.source_address_prefix
  destination_address_prefix = each.value.destination_address_prefix

  description = ""
}

# Ingress UDP from CIDRs
resource "azurerm_network_security_rule" "udp_from_cidrs" {
  for_each = local.ingress_rules_from_cidrs_udp_map

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  direction = each.value.direction
  access    = each.value.access
  priority  = each.value.priority
  protocol  = each.value.protocol

  source_port_range      = "*"
  destination_port_range = each.value.from_port == each.value.to_port ? tostring(each.value.from_port) : "${each.value.from_port}-${each.value.to_port}"
  source_address_prefix      = each.value.source_address_prefix
  destination_address_prefix = each.value.destination_address_prefix

  description = ""
}

# Ingress TCP from ASGs
resource "azurerm_network_security_rule" "tcp_from_asgs" {
  for_each = local.ingress_rules_from_asgs_tcp_map

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  direction = each.value.direction
  access    = each.value.access
  priority  = each.value.priority
  protocol  = each.value.protocol

  source_port_range      = "*"
  destination_port_range = each.value.from_port == each.value.to_port ? tostring(each.value.from_port) : "${each.value.from_port}-${each.value.to_port}"
  source_application_security_group_ids = each.value.source_application_security_group_ids
  destination_address_prefix            = each.value.destination_address_prefix

  description = ""
}

# Ingress UDP from ASGs
resource "azurerm_network_security_rule" "udp_from_asgs" {
  for_each = local.ingress_rules_from_asgs_udp_map

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  direction = each.value.direction
  access    = each.value.access
  priority  = each.value.priority
  protocol  = each.value.protocol

  source_port_range      = "*"
  destination_port_range = each.value.from_port == each.value.to_port ? tostring(each.value.from_port) : "${each.value.from_port}-${each.value.to_port}"
  source_application_security_group_ids = each.value.source_application_security_group_ids
  destination_address_prefix            = each.value.destination_address_prefix

  description = ""
}

# Egress ICMP to CIDRs
resource "azurerm_network_security_rule" "icmp_to_cidrs" {
  for_each = local.egress_rules_to_cidrs_icmp_map

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  direction = each.value.direction
  access    = each.value.access
  priority  = each.value.priority
  protocol  = each.value.protocol

  source_port_range          = "*"
  destination_port_range     = "*"
  source_address_prefix      = each.value.source_address_prefix
  destination_address_prefix = each.value.destination_address_prefix

  description = ""
}

# Egress TCP to CIDRs
resource "azurerm_network_security_rule" "tcp_to_cidrs" {
  for_each = local.egress_rules_to_cidrs_tcp_map

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  direction = each.value.direction
  access    = each.value.access
  priority  = each.value.priority
  protocol  = each.value.protocol

  source_port_range      = "*"
  destination_port_range = each.value.from_port == each.value.to_port ? tostring(each.value.from_port) : "${each.value.from_port}-${each.value.to_port}"
  source_address_prefix      = each.value.source_address_prefix
  destination_address_prefix = each.value.destination_address_prefix

  description = ""
}

# Egress UDP to CIDRs
resource "azurerm_network_security_rule" "udp_to_cidrs" {
  for_each = local.egress_rules_to_cidrs_udp_map

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  direction = each.value.direction
  access    = each.value.access
  priority  = each.value.priority
  protocol  = each.value.protocol

  source_port_range      = "*"
  destination_port_range = each.value.from_port == each.value.to_port ? tostring(each.value.from_port) : "${each.value.from_port}-${each.value.to_port}"
  source_address_prefix      = each.value.source_address_prefix
  destination_address_prefix = each.value.destination_address_prefix

  description = ""
}

# Egress TCP to ASGs
resource "azurerm_network_security_rule" "tcp_to_asgs" {
  for_each = local.egress_rules_to_asgs_tcp_map

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  direction = each.value.direction
  access    = each.value.access
  priority  = each.value.priority
  protocol  = each.value.protocol

  source_port_range      = "*"
  destination_port_range = each.value.from_port == each.value.to_port ? tostring(each.value.from_port) : "${each.value.from_port}-${each.value.to_port}"
  source_address_prefix                      = each.value.source_address_prefix
  destination_application_security_group_ids = each.value.destination_application_security_group_ids

  description = ""
}

# Egress UDP to ASGs
resource "azurerm_network_security_rule" "udp_to_asgs" {
  for_each = local.egress_rules_to_asgs_udp_map

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  direction = each.value.direction
  access    = each.value.access
  priority  = each.value.priority
  protocol  = each.value.protocol

  source_port_range      = "*"
  destination_port_range = each.value.from_port == each.value.to_port ? tostring(each.value.from_port) : "${each.value.from_port}-${each.value.to_port}"
  source_address_prefix                      = each.value.source_address_prefix
  destination_application_security_group_ids = each.value.destination_application_security_group_ids

  description = ""
}

# Self-to-self rule
resource "azurerm_network_security_rule" "self_to_self" {
  for_each = local.self_to_self_rule

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  direction = each.value.direction
  access    = each.value.access
  priority  = each.value.priority
  protocol  = each.value.protocol

  source_port_range          = "*"
  destination_port_range     = "*"
  source_address_prefix      = each.value.source_address_prefix
  destination_address_prefix = each.value.destination_address_prefix

  description = ""
}

# Any egress rule
resource "azurerm_network_security_rule" "any_egress" {
  for_each = local.any_egress_rule

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  direction = each.value.direction
  access    = each.value.access
  priority  = each.value.priority
  protocol  = each.value.protocol

  source_port_range          = "*"
  destination_port_range     = "*"
  source_address_prefix      = each.value.source_address_prefix
  destination_address_prefix = each.value.destination_address_prefix

  description = ""
}
