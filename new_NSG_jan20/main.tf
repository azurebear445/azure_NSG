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
  source_port_ranges         = each.value.source_port_ranges

  description = each.value.description
}

# User-Defined Security Rules - Split by protocol/direction/type

# Ingress ICMP from CIDRs
resource "azurerm_network_security_rule" "icmp_from_cidrs" {
  for_each = local.ingress_rules_from_cidrs_icmp_map

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  access    = each.value.access
  direction = each.value.direction
  priority  = each.value.priority
  protocol  = each.value.protocol

  destination_address_prefix = each.value.destination_address_prefix
  destination_port_range     = "*"
  source_address_prefixes    = each.value.source_address_prefixes
  source_port_range          = "*"
}

# Ingress TCP from CIDRs
resource "azurerm_network_security_rule" "tcp_from_cidrs" {
  for_each = local.ingress_rules_from_cidrs_tcp_map

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  access    = each.value.access
  direction = each.value.direction
  priority  = each.value.priority
  protocol  = each.value.protocol

  destination_address_prefix = each.value.destination_address_prefix
  destination_port_ranges    = [each.value.from_port == each.value.to_port ? tostring(each.value.from_port) : "${each.value.from_port}-${each.value.to_port}"]
  source_address_prefixes    = each.value.source_address_prefixes
  source_port_ranges         = ["*"]
}

# Ingress UDP from CIDRs
resource "azurerm_network_security_rule" "udp_from_cidrs" {
  for_each = local.ingress_rules_from_cidrs_udp_map

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  access    = each.value.access
  direction = each.value.direction
  priority  = each.value.priority
  protocol  = each.value.protocol

  destination_address_prefix = each.value.destination_address_prefix
  destination_port_ranges    = [each.value.from_port == each.value.to_port ? tostring(each.value.from_port) : "${each.value.from_port}-${each.value.to_port}"]
  source_address_prefixes    = each.value.source_address_prefixes
  source_port_ranges         = ["*"]
}

# Ingress TCP from ASGs
resource "azurerm_network_security_rule" "tcp_from_asgs" {
  for_each = local.ingress_rules_from_asgs_tcp_map

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  access    = each.value.access
  direction = each.value.direction
  priority  = each.value.priority
  protocol  = each.value.protocol

  destination_address_prefix            = each.value.destination_address_prefix
  destination_port_ranges               = [each.value.from_port == each.value.to_port ? tostring(each.value.from_port) : "${each.value.from_port}-${each.value.to_port}"]
  source_application_security_group_ids = each.value.source_application_security_group_ids
  source_port_ranges                    = ["*"]
}

# Ingress UDP from ASGs
resource "azurerm_network_security_rule" "udp_from_asgs" {
  for_each = local.ingress_rules_from_asgs_udp_map

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  access    = each.value.access
  direction = each.value.direction
  priority  = each.value.priority
  protocol  = each.value.protocol

  destination_address_prefix            = each.value.destination_address_prefix
  destination_port_ranges               = [each.value.from_port == each.value.to_port ? tostring(each.value.from_port) : "${each.value.from_port}-${each.value.to_port}"]
  source_application_security_group_ids = each.value.source_application_security_group_ids
  source_port_ranges                    = ["*"]
}

# Egress ICMP to CIDRs
resource "azurerm_network_security_rule" "icmp_to_cidrs" {
  for_each = local.egress_rules_to_cidrs_icmp_map

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  access    = each.value.access
  direction = each.value.direction
  priority  = each.value.priority
  protocol  = each.value.protocol

  destination_address_prefixes = each.value.destination_address_prefixes
  destination_port_range       = "*"
  source_address_prefix        = each.value.source_address_prefix
  source_port_range            = "*"
}

# Egress TCP to CIDRs
resource "azurerm_network_security_rule" "tcp_to_cidrs" {
  for_each = local.egress_rules_to_cidrs_tcp_map

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  access    = each.value.access
  direction = each.value.direction
  priority  = each.value.priority
  protocol  = each.value.protocol

  destination_address_prefixes = each.value.destination_address_prefixes
  destination_port_ranges      = [each.value.from_port == each.value.to_port ? tostring(each.value.from_port) : "${each.value.from_port}-${each.value.to_port}"]
  source_address_prefix        = each.value.source_address_prefix
  source_port_ranges           = ["*"]
}

# Egress UDP to CIDRs
resource "azurerm_network_security_rule" "udp_to_cidrs" {
  for_each = local.egress_rules_to_cidrs_udp_map

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  access    = each.value.access
  direction = each.value.direction
  priority  = each.value.priority
  protocol  = each.value.protocol

  destination_address_prefixes = each.value.destination_address_prefixes
  destination_port_ranges      = [each.value.from_port == each.value.to_port ? tostring(each.value.from_port) : "${each.value.from_port}-${each.value.to_port}"]
  source_address_prefix        = each.value.source_address_prefix
  source_port_ranges           = ["*"]
}

# Egress TCP to ASGs
resource "azurerm_network_security_rule" "tcp_to_asgs" {
  for_each = local.egress_rules_to_asgs_tcp_map

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  access    = each.value.access
  direction = each.value.direction
  priority  = each.value.priority
  protocol  = each.value.protocol

  destination_application_security_group_ids = each.value.destination_application_security_group_ids
  destination_port_ranges                    = [each.value.from_port == each.value.to_port ? tostring(each.value.from_port) : "${each.value.from_port}-${each.value.to_port}"]
  source_address_prefix                      = each.value.source_address_prefix
  source_port_ranges                         = ["*"]
}

# Egress UDP to ASGs
resource "azurerm_network_security_rule" "udp_to_asgs" {
  for_each = local.egress_rules_to_asgs_udp_map

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  access    = each.value.access
  direction = each.value.direction
  priority  = each.value.priority
  protocol  = each.value.protocol

  destination_application_security_group_ids = each.value.destination_application_security_group_ids
  destination_port_ranges                    = [each.value.from_port == each.value.to_port ? tostring(each.value.from_port) : "${each.value.from_port}-${each.value.to_port}"]
  source_address_prefix                      = each.value.source_address_prefix
  source_port_ranges                         = ["*"]
}

# Any egress rule
resource "azurerm_network_security_rule" "any_egress" {
  count = var.enable_any_egress ? 1 : 0

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
