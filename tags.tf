locals {
  # Extract custom tags from var.tags
  custom_tags = {
    for k, v in var.tags["custom_tags"] : k => v
  }

  # Strip out tag_formatting_exceptions and custom_tags from main tags
  stripped_tags = {
    for k, v in var.tags : k => v
    if k != "tag_formatting_exceptions" && k != "custom_tags"
  }

  # Join tag_formatting_exceptions into a comma-separated string or return empty
  tag_formatting_exceptions = length(var.tags["tag_formatting_exceptions"]) > 0 ? join(",", var.tags["tag_formatting_exceptions"]) : ""

  # Merge all tags together
  tags = merge(
    local.stripped_tags,
    local.custom_tags,
    local.tag_formatting_exceptions != "" ? { tag_formatting_exceptions = local.tag_formatting_exceptions } : {},
    { Environment = var.environment }
  )

  # Resource-specific tags with Name
  nsg_tags = merge(
    local.tags,
    {
      Name = var.nsg_custom_name != "" ? var.nsg_custom_name : "${random_id.this.keepers.namespace}-${random_id.this.keepers.environment}-${var.name}-${random_id.this.hex}"
    }
  )
}
