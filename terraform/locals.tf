locals {
  resource_lowercase_array  = [lower(var.environment), lower(var.region), lower(var.application), var.resource_group_name_suffix]
  resource_suffix_kebabcase = join("-", local.resource_lowercase_array)
  resource_suffix_lowercase = join("", local.resource_lowercase_array)

  tags = merge(
    var.tags,
    tomap(
      {
        "Creator"     = var.creator,
        "Environment" = var.environment,
        "Region"      = var.region,
        "Repository"  = var.repository,
        "Application" = var.application,
      }
    )
  )
}
