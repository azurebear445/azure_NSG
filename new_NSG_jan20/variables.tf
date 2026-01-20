variable "egress_rules" {
  type = object({
    to_asgs = optional(object({
      tcp = optional(map(object({
        destination_asg_ids = list(string)
        protocol            = optional(string, "Tcp")
        to_port             = optional(number, null)
      })), {}),
      udp = optional(map(object({
        destination_asg_ids = list(string)
        protocol            = optional(string, "Udp")
        to_port             = optional(number, null)
      })), {})
    }), {}),
    to_cidrs = optional(object({
      icmp = optional(map(object({
        cidrs    = list(string)
        protocol = optional(string, "Icmp")
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
    }), {})
  })
  description = "Object to define egress rules including the to_cidrs rule objects and to_asgs rule objects."
  default     = {}
}

variable "enable_any_egress" {
  type        = bool
  description = "If set to false, do not allow all ports to 0.0.0.0/0."
  default     = true
}

variable "enable_any_nsg_to_self" {
  type        = bool
  description = "If set to true, NSG can talk to itself on any ports."
  default     = true
}

variable "enable_citrix_ingress" {
  type        = bool
  description = "If set to true, enables Enterprise Security rules for Citrix."
  default     = false
}

variable "enable_db_admin_access" {
  type        = bool
  description = "If set to true, enables Enterprise Security rules for Database Admin Access."
  default     = false
}

variable "enable_enterprise_security_rules" {
  type        = bool
  description = "If set to false, disables the standard set of Enterprise Security rules."
  default     = true
}

variable "enable_hsa_monitoring" {
  type        = bool
  description = "If set to true, enables Enterprise Security rules for HSA Monitoring."
  default     = false
}

variable "enable_idera_monitoring" {
  type        = bool
  description = "If set to true, enables Enterprise Security rules for Idera Monitoring."
  default     = false
}

variable "enable_rubrik_backup" {
  type        = bool
  description = "If set to true, enables Enterprise Security rules for Rubrik Backup."
  default     = false
}

variable "enable_sailpoint_ingress" {
  type        = bool
  description = "If set to true, enables Enterprise Security rules for SailPoint."
  default     = false
}

variable "enable_varonis_ingress" {
  type        = bool
  description = "If set to true, enables Enterprise Security rules for Varonis."
  default     = false
}

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
  type = object({
    from_asgs = optional(object({
      tcp = optional(map(object({
        source_asg_ids = list(string)
        protocol       = optional(string, "Tcp")
        to_port        = optional(number, null)
      })), {}),
      udp = optional(map(object({
        source_asg_ids = list(string)
        protocol       = optional(string, "Udp")
        to_port        = optional(number, null)
      })), {})
    }), {}),
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
    }), {})
  })
  description = "Object to define ingress rules including the from_cidrs rule objects and from_asgs rule objects."
  default     = {}
}

variable "location" {
  type        = string
  description = "Azure location for the NSG."

  validation {
    condition = (
      var.location == "eastus" ||
      var.location == "northcentralus"
    )
    error_message = "Location must be one of: eastus, northcentralus."
  }
}

variable "namespace" {
  type        = string
  description = "Namespace for resources created by this Terraform configuration."

  validation {
    condition     = length(var.namespace) < 32 && can(regex("^[a-z-]+$", var.namespace))
    error_message = "Must contain only lowercase letters and dashes, under 32 characters."
  }
}

variable "nsg_custom_name" {
  type        = string
  description = "Set a custom name for the network security group if it is being imported so the suffix is not randomly generated."
  default     = ""
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where NSG will be created."
}

variable "tags" {
  type = object({
    appgid                    = optional(string)
    appid                     = optional(string)
    architecture              = string
    custom_tags               = optional(map(any), {})
    owner                     = string
    project                   = optional(string)
    purpose                   = string
    repo                      = optional(string)
    serviceid                 = optional(string)
    tag_formatting_exceptions = optional(list(string), [])
    terraform_resource        = string
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
