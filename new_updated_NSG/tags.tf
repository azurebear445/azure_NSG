locals {
  custom_tags = {
    for k, v in var.tags["custom_tags"] : k => v
  }

  stripped_tags = {
    for k, v in var.tags : k => v
    if k != "tag_formatting_exceptions" && k != "custom_tags"
  }

  tag_formatting_exceptions = length(var.tags["tag_formatting_exceptions"]) > 0 ? join(",", var.tags["tag_formatting_exceptions"]) : ""

  namespace = "${var.namespace}-${var.environment}-${local.location[var.location]}"

  tags = merge(
    local.stripped_tags,
    local.custom_tags,
    local.tag_formatting_exceptions != "" ? { tag_formatting_exceptions = local.tag_formatting_exceptions } : {},
    { Environment = var.environment }
  )

  nsg_tags = merge(
    local.tags,
    {
      Name = var.nsg_custom_name != "" ? var.nsg_custom_name : "${local.namespace}-nsg-${random_id.this.hex}"
    }
  )
}
