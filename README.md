# Azure Network Security Group Module

Terraform module for creating Azure Network Security Groups with support for enterprise-managed rules and user-defined rules.

## Features

- **Enterprise Security Group Rules**: Pre-configured enterprise-managed rules with automatic priority assignment
- **User-Defined Rules**: Application-specific rules with automatic priority assignment to avoid conflicts
- **Region-Specific Rules**: Support for different rule sets based on deployment region
- **Content-Based Deduplication**: Automatic deduplication of rules across multiple Enterprise Security Groups
- **Flexible Priority Management**: Reserved priority ranges for enterprise (100-1499) and user rules (1500+)
- **Tag Validation**: Required tags with validation for compliance

## Architecture

```
Priority Range  | Purpose                      | Managed By
----------------|------------------------------|-------------
100-1499        | Enterprise Security Groups   | Platform Team
1500-3999       | User/Application Rules       | Application Teams
4000-4096       | Reserved                     | -
```

## Usage

### Basic Example

```hcl
module "nsg_web" {
  source = "git::ssh://git@gitlab.com/your-org/terraform-azurerm-network_security_group.git?ref=v1.0.0"

  name                = "web-tier"
  resource_group_name = azurerm_resource_group.example.name
  location            = "eastus2"
  environment         = "prod"
  namespace           = "myapp"

  # User-defined ingress rules
  ingress_rules = {
    from_cidrs = {
      tcp = {
        "443" = {
          cidrs   = ["0.0.0.0/0"]
          to_port = 443
        }
        "80" = {
          cidrs   = ["0.0.0.0/0"]
          to_port = 80
        }
      }
      udp  = {}
      icmp = {}
    }
    from_nsgs = {
      tcp = {}
      udp = {}
    }
  }

  # Egress rules
  egress_rules = {
    to_cidrs = null
    to_nsgs  = {}
  }

  enable_any_egress      = true
  enable_any_nsg_to_self = false

  tags = {
    architecture       = "native"
    owner              = "platform-team"
    purpose            = "web-frontend"
    terraform_resource = "true"
    appid              = "app-12345"
  }
}
```

## Enterprise Security Group Rules

Enterprise rules are automatically applied based on deployment region. These rules are managed by the platform team.

### Region Mapping

| AWS Region | Azure Region | Location |
|------------|--------------|----------|
| us-east-1  | eastus2      | Virginia |
| us-east-2  | centralus    | Iowa     |

Enterprise rules use priorities 100-1499 and are automatically deduplicated across multiple ESGs.

## Priority Assignment

Priorities are automatically assigned to prevent conflicts:

- **Enterprise Rules**: 100-1499 (managed by platform, content-based keys ensure deduplication)
- **User Ingress Rules**: 1500+ (auto-incremented)
- **User Egress Rules**: 2000+ (auto-incremented)
- **Allow Any Egress**: 2500 (if enabled)

Users cannot specify priorities directly, ensuring no conflicts occur.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| name | Name of the NSG | `string` | n/a | yes |
| resource_group_name | Resource group name | `string` | n/a | yes |
| location | Azure region | `string` | n/a | yes |
| environment | Environment (dev/qa/prod) | `string` | n/a | yes |
| namespace | Application namespace | `string` | n/a | yes |
| ingress_rules | Ingress rule configuration | `object` | n/a | yes |
| egress_rules | Egress rule configuration | `object` | n/a | yes |
| enable_any_egress | Allow all outbound traffic | `bool` | `false` | no |
| enable_any_nsg_to_self | Allow VirtualNetwork to VirtualNetwork | `bool` | `false` | no |
| tags | Resource tags | `map(string)` | n/a | yes |

### Ingress Rules Structure

```hcl
ingress_rules = {
  from_cidrs = {
    tcp = {
      "<port>" = {
        cidrs   = ["<cidr1>", "<cidr2>"]
        to_port = <end_port>  # Optional, for port ranges
      }
    }
    udp = {
      "<port>" = {
        cidrs   = ["<cidr1>", "<cidr2>"]
        to_port = <end_port>  # Optional
      }
    }
    icmp = {
      "<type>" = {
        cidrs   = ["<cidr1>", "<cidr2>"]
        to_port = <code>  # Optional
      }
    }
  }
  from_nsgs = {
    tcp = {
      "<port>" = {
        source_nsg_ids = ["<asg_id1>", "<asg_id2>"]
        to_port        = <end_port>  # Optional
      }
    }
    udp = {}
  }
}
```

## Outputs

| Name | Description |
|------|-------------|
| nsg_id | Network Security Group ID |
| nsg_name | Network Security Group name |
| enterprise_rule_count | Number of enterprise rules applied |
| user_rule_count | Number of user-defined rules |

## Tag Requirements

The following tags are required and validated:

- `architecture`: Must be "native" or "vendor"
- `owner`: Owner or team name
- `purpose`: Purpose of the resource
- `terraform_resource`: Must be "true"
- `appid`: Application ID

## Examples

See the `examples/` directory for complete working examples:

- `examples/nsg/`: Basic NSG with web tier rules

## Enterprise Security Groups

### Available ESGs

| ESG | File | Priority Range | Service |
|-----|------|----------------|---------|
| 01 | esg-01-servicenow.tf | 100-159 | ServiceNow |
| 02 | esg-02-solarwinds.tf | 200-261 | SolarWinds |
| 03 | esg-03-multi-service.tf | 300-361 | Multi Service |
| 04 | esg-04-multi-service.tf | 400-458 | Multi Service |
| 05 | esg-05-multi-service.tf | 500-563 | Multi Service |
| 06 | esg-06-rubrik-backup.tf | 600-603 | Rubrik Backup |
| 07 | esg-07-database-admin.tf | 700-736 | Database Admin |
| 08 | esg-08-multi-service.tf | 800-854 | Multi Service |
| 09 | esg-09-idera-monitoring.tf | 900-944 | Idera Monitoring |
| 10 | esg-10-hsa-monitoring.tf | 1000-1003 | HSA Monitoring |
| 11 | esg-11-citrix.tf | 1040-1051 | Citrix |
| 12 | esg-12-sailpoint.tf | 1090-1110 | SailPoint |
| 13 | esg-13-varonis-collectors.tf | 1150-1164 | Varonis Collectors |

ESGs are merged in `locals.tf`:

```hcl
# locals.tf
all_enterprise_rules = merge(
  local.enterprise_01_servicenow_rules,
  local.enterprise_02_solarwinds_rules,
  local.enterprise_03_multi_service_rules,
  local.enterprise_04_multi_service_rules,
  local.enterprise_05_multi_service_rules,
  local.enterprise_06_rubrik_backup_rules,
  local.enterprise_07_database_admin_rules,
  local.enterprise_08_multi_service_rules,
  local.enterprise_09_idera_monitoring_rules,
  local.enterprise_10_hsa_monitoring_rules,
  local.enterprise_11_citrix_rules,
  local.enterprise_12_sailpoint_rules,
  local.enterprise_13_varonis_collectors_rules
)
```

## Testing

```bash
cd examples/nsg
terraform init
terraform plan
terraform apply
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| azurerm | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 3.0 |

## Resources

- `azurerm_network_security_group`
- `azurerm_network_security_rule` (enterprise rules)
- `azurerm_network_security_rule` (user rules)
