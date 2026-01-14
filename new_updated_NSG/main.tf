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

  # Port ranges - already formatted in enterprise-*.tf files
  source_port_range          = try(each.value.source_port_range, null)
  source_port_ranges         = try(each.value.source_port_ranges, null)
  destination_port_range     = try(each.value.destination_port_range, null)
  destination_port_ranges    = try(each.value.destination_port_ranges, null)

  # Address prefixes
  source_address_prefix      = try(each.value.source_address_prefix, null)
  destination_address_prefix = try(each.value.destination_address_prefix, null)

  # Application Security Groups (for NSG-to-NSG rules in Azure)
  source_application_security_group_ids      = try(each.value.source_application_security_group_ids, null)
  destination_application_security_group_ids = try(each.value.destination_application_security_group_ids, null)

  description = each.value.description
}

# User-Defined Security Rules
# These are the application-specific rules provided by teams via variables.
# Priority range: 1500-3999 (user rules start after enterprise rules)
resource "azurerm_network_security_rule" "rules" {
  for_each = local.all_rules_map

  name                        = each.key
  network_security_group_name = azurerm_network_security_group.this.name
  resource_group_name         = var.resource_group_name

  direction = each.value.direction
  access    = each.value.access
  priority  = each.value.priority
  protocol  = each.value.protocol

  # Port ranges - handle both single ports and ranges
  source_port_range      = each.value.from_port == 0 && each.value.to_port == 0 ? "*" : null
  source_port_ranges     = each.value.from_port != 0 || each.value.to_port != 0 ? (each.value.from_port == each.value.to_port ? [tostring(each.value.from_port)] : ["${each.value.from_port}-${each.value.to_port}"]) : null
  destination_port_range = each.value.from_port == 0 && each.value.to_port == 0 ? "*" : null
  destination_port_ranges = each.value.from_port != 0 || each.value.to_port != 0 ? (each.value.from_port == each.value.to_port ? [tostring(each.value.from_port)] : ["${each.value.from_port}-${each.value.to_port}"]) : null

  # Address prefixes
  source_address_prefix      = try(each.value.source_address_prefix, null)
  destination_address_prefix = try(each.value.destination_address_prefix, null)

  # Application Security Groups (for NSG-to-NSG rules in Azure)
  source_application_security_group_ids      = try(each.value.source_application_security_group_ids, null)
  destination_application_security_group_ids = try(each.value.destination_application_security_group_ids, null)

  description = try(each.value.description, "")
}

# NSG Diagnostic Settings (Optional)
# When enabled, creates a diagnostic setting for the NSG.
# Azure Policy may automatically configure the Log Analytics Workspace.
resource "azurerm_monitor_diagnostic_setting" "nsg" {
  count = var.enable_diagnostic_settings ? 1 : 0

  name                       = "${azurerm_network_security_group.this.name}-diagnostics"
  target_resource_id         = azurerm_network_security_group.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category = "NetworkSecurityGroupEvent"
  }

  enabled_log {
    category = "NetworkSecurityGroupRuleCounter"
  }

  lifecycle {
    ignore_changes = [
      log_analytics_workspace_id
    ]
  }
}