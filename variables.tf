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
  
