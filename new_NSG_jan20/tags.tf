locals {
  module_name    = "terraform-azurerm-network_security_group"
  module_version = "0.0.1"

  namespace = "${var.namespace}-${var.environment}-${local.location[var.location]}"

  custom_tags = {
    for k, v in var.tags["custom_tags"] : k => v
  }

  stripped_tags = {
    for k, v in var.tags : k => v
    if k != "tag_formatting_exceptions" && k != "custom_tags"
  }

  tag_formatting_exceptions = (
    length(var.tags["tag_formatting_exceptions"]) > 0 ?
    { tag_formatting_exceptions = join(",", var.tags["tag_formatting_exceptions"]) } :
    {}
  )

  tags = merge(
    {
      environment    = var.environment,
      module_name    = local.module_name,
      module_version = local.module_version
    },
    local.stripped_tags,
    local.custom_tags,
    local.tag_formatting_exceptions
  )

  nsg_tags = merge(
    local.tags,
    {
      Name = var.nsg_custom_name != "" ? var.nsg_custom_name : "${local.namespace}-nsg-${random_id.this.hex}"
    }
  )
}
