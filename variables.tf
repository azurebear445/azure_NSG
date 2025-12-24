variable "name" {
  type        = string
  description = "Name of the Network Security Group (will be prefixed with namespace and environment if nsg_custom_name is not set)"
}

variable "environment" {
  type        = string
  description = "The environment where the resources created by this Terraform configuration will be deployed. Must be one of: dr|prod|qa|stage|uat."

  validation {
    condition = (
    
      var.environment == "dr" ||
      var.environment == "prod" ||
      var.environment == "qa" ||
      var.environment == "stage" ||
      var.environment == "uat"





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
