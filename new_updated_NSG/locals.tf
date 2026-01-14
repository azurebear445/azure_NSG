locals {
  # Region Configuration
  location = {
    eastus         = "eastus"
    eastus2        = "eastus2"
    northcentralus = "ncus"
  }

  region_01_locations = ["eastus"]
  region_02_locations = ["eastus2"]
  region_03_locations = ["northcentralus"]

  is_region_01 = contains(local.region_01_locations, var.location)
  is_region_02 = contains(local.region_02_locations, var.location)
  is_region_03 = contains(local.region_03_locations, var.location)

  # Enterprise Security Rules - Conditional merge based on enable flags
  all_enterprise_rules = merge(
    var.enable_enterprise_security_rules ? merge(
      local.enterprise_01_servicenow_rules,
      local.enterprise_02_solarwinds_rules,
      local.enterprise_03_multi_service_rules,
      local.enterprise_04_multi_service_rules,
      local.enterprise_05_multi_service_rules,
      local.enterprise_08_multi_service_rules
    ) : {},
    var.enable_rubrik_backup ? local.enterprise_06_rubrik_backup_rules : {},
    var.enable_db_admin_access ? local.enterprise_07_database_admin_rules : {},
    var.enable_idera_monitoring ? local.enterprise_09_idera_monitoring_rules : {},
    var.enable_hsa_monitoring ? local.enterprise_10_hsa_monitoring_rules : {},
    var.enable_citrix_ingress ? local.enterprise_11_citrix_rules : {},
    var.enable_sailpoint_ingress ? local.enterprise_12_sailpoint_rules : {},
    var.enable_varonis_ingress ? local.enterprise_13_varonis_collectors_rules : {}
  )

  # User-Defined Rules Processing (Priority 1500+)
  ingress_rules_from_cidrs_icmp = flatten([
    for port, rule in var.ingress_rules["from_cidrs"]["icmp"] : [
      for cidr in rule["cidrs"] : {
        key                        = "${port}-icmp-${replace(cidr, "/", "-")}"
        protocol                   = rule["protocol"]
        from_port                  = tonumber(port)
        to_port                    = rule["to_port"] != null ? rule["to_port"] : tonumber(port)
        source_address_prefix      = cidr
        destination_address_prefix = "*"
      }
    ]
  ])

  ingress_rules_from_cidrs_tcp = flatten([
    for port, rule in var.ingress_rules["from_cidrs"]["tcp"] : [
      for cidr in rule["cidrs"] : {
        key                        = "${port}-tcp-${replace(cidr, "/", "-")}"
        protocol                   = rule["protocol"]
        from_port                  = tonumber(port)
        to_port                    = rule["to_port"] != null ? rule["to_port"] : tonumber(port)
        source_address_prefix      = cidr
        destination_address_prefix = "*"
      }
    ]
  ])

  ingress_rules_from_cidrs_udp = flatten([
    for port, rule in var.ingress_rules["from_cidrs"]["udp"] : [
      for cidr in rule["cidrs"] : {
        key                        = "${port}-udp-${replace(cidr, "/", "-")}"
        protocol                   = rule["protocol"]
        from_port                  = tonumber(port)
        to_port                    = rule["to_port"] != null ? rule["to_port"] : tonumber(port)
        source_address_prefix      = cidr
        destination_address_prefix = "*"
      }
    ]
  ])

  ingress_rules_from_nsgs_tcp = flatten([
    for port, x in var.ingress_rules["from_nsgs"]["tcp"] : [
      for y, nsg_id in x["source_nsg_ids"] : {
        key                                    = "${port}-tcp-nsg-${y}"
        protocol                               = x["protocol"]
        from_port                              = tonumber(port)
        to_port                                = x["to_port"] != null ? tonumber(x["to_port"]) : tonumber(port)
        source_application_security_group_ids = [nsg_id]
        destination_address_prefix             = "*"
      }
    ]
  ])

  ingress_rules_from_nsgs_udp = flatten([
    for port, x in var.ingress_rules["from_nsgs"]["udp"] : [
      for y, nsg_id in x["source_nsg_ids"] : {
        key                                    = "${port}-udp-nsg-${y}"
        protocol                               = x["protocol"]
        from_port                              = tonumber(port)
        to_port                                = x["to_port"] != null ? tonumber(x["to_port"]) : tonumber(port)
        source_application_security_group_ids = [nsg_id]
        destination_address_prefix             = "*"
      }
    ]
  ])

  egress_rules_to_cidrs = try(length(var.egress_rules["to_cidrs"]["cidrs"]) > 0 ? flatten([
    for cidr in var.egress_rules["to_cidrs"]["cidrs"] : {
      key                        = "egress-${var.egress_rules["to_cidrs"]["protocol"]}-${replace(cidr, "/", "-")}"
      protocol                   = var.egress_rules["to_cidrs"]["protocol"]
      from_port                  = 0
      to_port                    = var.egress_rules["to_cidrs"]["to_port"] != null ? var.egress_rules["to_cidrs"]["to_port"] : 0
      source_address_prefix      = "*"
      destination_address_prefix = cidr
    }
  ]) : [], [])

  egress_rules_to_nsgs = flatten([
    for port, v in var.egress_rules["to_nsgs"] : [
      for k, nsg_id in v["source_nsg_ids"] : {
        key                                       = "egress-${port}-${v["protocol"]}-nsg-${k}"
        protocol                                  = v["protocol"]
        from_port                                 = tonumber(port)
        to_port                                   = v["to_port"] != null ? tonumber(v["to_port"]) : tonumber(port)
        source_address_prefix                     = "*"
        destination_application_security_group_ids = [nsg_id]
      }
    ]
  ])

  all_ingress_rules = concat(
    local.ingress_rules_from_cidrs_icmp,
    local.ingress_rules_from_cidrs_tcp,
    local.ingress_rules_from_cidrs_udp,
    local.ingress_rules_from_nsgs_tcp,
    local.ingress_rules_from_nsgs_udp
  )

  all_egress_rules = concat(
    local.egress_rules_to_cidrs,
    local.egress_rules_to_nsgs
  )

  # User rules with priorities starting at 1500
  all_rules_map = merge(
    { for idx, rule in local.all_ingress_rules : rule.key => merge(rule, {
      direction = "Inbound"
      access    = "Allow"
      priority  = 1500 + idx
    }) },
    var.enable_any_nsg_to_self ? {
      "allow-self-to-self" = {
        key                        = "allow-self-to-self"
        protocol                   = "*"
        from_port                  = 0
        to_port                    = 0
        source_address_prefix      = "VirtualNetwork"
        destination_address_prefix = "VirtualNetwork"
        direction                  = "Inbound"
        access                     = "Allow"
        priority                   = 1500 + length(local.all_ingress_rules)
      }
    } : {},
    { for idx, rule in local.all_egress_rules : rule.key => merge(rule, {
      direction = "Outbound"
      access    = "Allow"
      priority  = 2000 + idx
    }) },
    var.enable_any_egress ? {
      "allow-any-egress" = {
        key                        = "allow-any-egress"
        protocol                   = "*"
        from_port                  = 0
        to_port                    = 0
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        direction                  = "Outbound"
        access                     = "Allow"
        priority                   = 2500
      }
    } : {}
  )
}
