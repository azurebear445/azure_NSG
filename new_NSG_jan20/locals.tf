locals {
  # Module metadata
  module_name    = "terraform-azurerm-network_security_group"
  module_version = "0.0.1"

  # Region Configuration
  location = var.location == "eastus" ? var.location : "ncus"

  is_region_eastus         = var.location == "eastus"
  is_region_northcentralus = var.location == "northcentralus"

  # Enterprise Security Rules - Conditional merge
  all_enterprise_rules = merge(
    var.enable_default_enterprise_security_rules ? merge(
      local.enterprise_servicenow_rules,
      local.enterprise_solarwinds_rules,
      local.enterprise_multi_service_one_rules,
      local.enterprise_multi_service_two_rules,
      local.enterprise_multi_service_three_rules,
      local.enterprise_multi_service_four_rules
    ) : {},
    var.enable_rubrik_backup ? local.enterprise_rubrik_backup_rules : {},
    var.enable_db_admin_access ? local.enterprise_database_admin_rules : {},
    var.enable_idera_monitoring ? local.enterprise_idera_monitoring_rules : {},
    var.enable_hsa_monitoring ? local.enterprise_hsa_monitoring_rules : {},
    var.enable_citrix_ingress ? local.enterprise_citrix_rules : {},
    var.enable_sailpoint_ingress ? local.enterprise_sailpoint_rules : {},
    var.enable_varonis_ingress ? local.enterprise_varonis_collectors_rules : {}
  )

  # User-Defined Rules - ASG rules require flattening (multiple ASG IDs per port)
  # CIDR rules use direct for_each in main.tf

  # Flatten ingress rules from ASGs for TCP
  ingress_rules_from_asgs_tcp = {
    for idx, rule in flatten([
      for port, x in try(var.ingress_rules["from_asgs"]["tcp"], {}) : [
        for y, asg_id in x["source_asg_ids"] : {
          key                                    = "${port}-tcp-asg-${y}"
          protocol                               = x["protocol"]
          from_port                              = tonumber(port)
          to_port                                = x["to_port"] != null ? tonumber(x["to_port"]) : tonumber(port)
          source_application_security_group_ids = [asg_id]
        }
      ]
    ]) : rule.key => merge(rule, { priority = 1800 + idx })
  }

  # Flatten ingress rules from ASGs for UDP
  ingress_rules_from_asgs_udp = {
    for idx, rule in flatten([
      for port, x in try(var.ingress_rules["from_asgs"]["udp"], {}) : [
        for y, asg_id in x["source_asg_ids"] : {
          key                                    = "${port}-udp-asg-${y}"
          protocol                               = x["protocol"]
          from_port                              = tonumber(port)
          to_port                                = x["to_port"] != null ? tonumber(x["to_port"]) : tonumber(port)
          source_application_security_group_ids = [asg_id]
        }
      ]
    ]) : rule.key => merge(rule, { priority = 1900 + idx })
  }

  # Flatten egress rules to ASGs for TCP
  egress_rules_to_asgs_tcp = {
    for idx, rule in flatten([
      for port, v in try(var.egress_rules["to_asgs"]["tcp"], {}) : [
        for k, asg_id in v["destination_asg_ids"] : {
          key                                        = "egress-${port}-tcp-asg-${k}"
          protocol                                   = "Tcp"
          from_port                                  = tonumber(port)
          to_port                                    = v["to_port"] != null ? tonumber(v["to_port"]) : tonumber(port)
          destination_application_security_group_ids = [asg_id]
        }
      ]
    ]) : rule.key => merge(rule, { priority = 2300 + idx })
  }

  # Flatten egress rules to ASGs for UDP
  egress_rules_to_asgs_udp = {
    for idx, rule in flatten([
      for port, v in try(var.egress_rules["to_asgs"]["udp"], {}) : [
        for k, asg_id in v["destination_asg_ids"] : {
          key                                        = "egress-${port}-udp-asg-${k}"
          protocol                                   = "Udp"
          from_port                                  = tonumber(port)
          to_port                                    = v["to_port"] != null ? tonumber(v["to_port"]) : tonumber(port)
          destination_application_security_group_ids = [asg_id]
        }
      ]
    ]) : rule.key => merge(rule, { priority = 2400 + idx })
  }
}
