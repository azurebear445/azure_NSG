variable "environment" {
  type        = string
  description = "The environment where the resources created by this Terraform configuration will be deployed. Must be one of: box|dev|dr|prod|qa|stage|uat."

  validation {
    condition = (
      var.environment == "box" ||
      var.environment == "dev" ||
      var.environment == "dr" ||
      var.environment == "prod" ||
      var.environment == "qa" ||
      var.environment == "stage" ||
      var.environment == "uat"
    )

    error_message = "The environment variable must be one of: box, dev, dr, prod, qa, stage, or uat."
  }
}

variable "ingress_rules" {
  description = "Object to define ingress rules including the from_cidrs rule objects (Map of objects by protocol to define rules from list of CIDRs and port) and from_nsgs rule objects (Map of objects by protocol to define rules from NSGs)."
  type = object({
    from_cidrs = optional(object({
      icmp = optional(map(object({
        cidrs    = list(string)
        protocol = optional(string, "Icmp")
        to_port  = optional(number, null)
      })), {}),
      tcp = optional(map(object({
        cidrs    = list(string)
        protocol = optional(string, "Tcp")
        to_port  = optional(number, null)
      })), {}),
      udp = optional(map(object({
        cidrs    = list(string)
        protocol = optional(string, "Udp")
        to_port  = optional(number, null)
      })), {})
    }), {}),
    from_nsgs = optional(object({
      tcp = optional(map(object({
        source_nsg_ids = list(string)
        protocol       = optional(string, "Tcp")
        to_port        = optional(number, null)
      })), {}),
      udp = optional(map(object({
        source_nsg_ids = list(string)
        protocol       = optional(string, "Udp")
        to_port        = optional(number, null)
      })), {})
    }), {})
  })

  default = {}
}

variable "egress_rules" {
  description = "Object to define egress rules including the to_cidrs rule objects (Map of objects by protocol to define rules to list of CIDRs and port) and to_nsgs rule objects (Map of objects by protocol to define rules to NSGs)."
  type = object({
    to_cidrs = optional(object({
      cidrs    = list(string)
      protocol = string
      to_port  = optional(number, null)
    })),
    to_nsgs = optional(map(object({
      source_nsg_ids = list(string)
      protocol       = string
      to_port        = optional(number, null)
    })))
  })

  default = {
    to_cidrs = null
    to_nsgs  = {}
  }
}

variable "enable_any_egress" {
  description = "If set to false, do not allow all ports to 0.0.0.0/0."
  type        = bool
  default     = true
}

variable "enable_any_nsg_to_self" {
  description = "If set to true, NSG can talk to itself on any ports."
  type        = bool
  default     = true
}

variable "location" {
  type        = string
  description = "Azure location for the NSG"

  validation {
    condition = (
      var.location == "eastus" ||
      var.location == "eastus2" ||
      var.location == "northcentralus"
    )
    error_message = "Location must be one of: eastus, eastus2, northcentralus."
  }
}

variable "namespace" {
  type        = string
  description = "Namespace for resources created by this Terraform configuration. Used to group related resources. Must contain only lowercase letters and dashes, and be under 32 characters."

  validation {
    condition = (
      length(var.namespace) < 32 &&
      can(regex("^[a-z-]+$", var.namespace))
    )

    error_message = "The namespace variable must contain only lowercase letters and dashes, and be under 32 characters."
  }
}

variable "nsg_custom_name" {
  description = "Set a custom name for the network security group if it is being imported so the suffix is not randomly generated."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where NSG will be created"
}

variable "enable_diagnostic_settings" {
  type        = bool
  description = "Enable diagnostic settings for the NSG. When enabled, Azure Policy will automatically configure the Log Analytics Workspace."
  default     = false
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "Log Analytics Workspace ID for diagnostic settings. Required when enable_diagnostic_settings is true. Azure Policy may override this with the organization's centralized workspace."
  default     = null
}

variable "tags" {
  type = object({
    architecture              = string
    owner                     = string
    purpose                   = string
    terraform_resource        = string
    appid                     = optional(string)
    appgid                    = optional(string)
    custom_tags               = optional(map(any), {})
    project                   = optional(string)
    serviceid                 = optional(string)
    tag_formatting_exceptions = optional(list(string), [])
  })

  description = "Map of tags to apply to module resources. Must include architecture, owner, purpose, terraform_resource, and one of appid|appgid|project|serviceid."

  validation {
    condition = (
      (
        var.tags["appid"] != null ||
        var.tags["appgid"] != null ||
        var.tags["project"] != null ||
        var.tags["serviceid"] != null
      ) &&
      alltrue([
        for k, v in var.tags : can(regex("^[-@.a-z0-9_]+$", v)) || v == null || contains(var.tags["tag_formatting_exceptions"], k)
        if k != "purpose" && k != "tag_formatting_exceptions" && k != "custom_tags"
      ])
    )

    error_message = "The keys in the tags map must include: architecture, owner, purpose, terraform_resource, and one of appid|appgid|project|serviceid. Values for tags other than \"purpose\" must be all lowercase and use underscores."
  }

  validation {
    condition = (
      (
        var.tags["architecture"] == "native" ||
        var.tags["architecture"] == "legacy" ||
        var.tags["architecture"] == "migrations"
      ) ||
      contains(var.tags["tag_formatting_exceptions"], "architecture")
    )

    error_message = "The architecture tag must have a value of \"native\"|\"legacy\"|\"migrations\"."
  }

  validation {
    condition = (
      (
        length(var.tags["purpose"]) > 40 &&
        can(regex("^[A-Z][-.* A-Za-z]+[.]$", var.tags["purpose"]))
      ) ||
      contains(var.tags["tag_formatting_exceptions"], "purpose")
    )

    error_message = "The purpose tag must begin with a capital letter, be over 40 characters, and end with a period \".\"."
  }

  validation {
    condition     = var.tags["terraform_resource"] == "true"
    error_message = "The terraform_resource tag must have a value of \"true\"."
  }
}

# =============================================================================
# Enterprise Security Rules (ESR) Control Variables
# =============================================================================

variable "enable_enterprise_security_rules" {
  description = "Enable default Enterprise Security Rules (ESR 01, 02, 03, 04, 05, 08). Set to false to exclude all default ESRs."
  type        = bool
  default     = true
}

variable "enable_rubrik_backup" {
  description = "Enable ESR-06: Rubrik Backup rules"
  type        = bool
  default     = false
}

variable "enable_db_admin_access" {
  description = "Enable ESR-07: Database Admin Access rules"
  type        = bool
  default     = false
}

variable "enable_idera_monitoring" {
  description = "Enable ESR-09: Idera Monitoring rules"
  type        = bool
  default     = false
}

variable "enable_hsa_monitoring" {
  description = "Enable ESR-10: HSA Monitoring rules"
  type        = bool
  default     = false
}

variable "enable_citrix_ingress" {
  description = "Enable ESR-11: Citrix Ingress rules"
  type        = bool
  default     = false
}

variable "enable_sailpoint_ingress" {
  description = "Enable ESR-12: SailPoint Ingress rules"
  type        = bool
  default     = false
}

variable "enable_varonis_ingress" {
  description = "Enable ESR-13: Varonis Ingress rules"
  type        = bool
  default     = false
}
