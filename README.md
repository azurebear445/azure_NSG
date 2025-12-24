# Azure Network Security Group (NSG) Terraform Module

This Terraform module creates and manages Azure Network Security Groups (NSGs) with comprehensive rule management capabilities. It is designed to mirror the functionality and structure of the AWS Security Group module.

## Features

- **Comprehensive Rule Management**: Support for ingress and egress rules with CIDR blocks and Application Security Groups
- **Protocol Support**: TCP, UDP, and ICMP protocols
- **Flexible Configuration**: Separate configuration for CIDR-based and NSG-based rules
- **Tag Management**: Comprehensive tagging strategy with validation
- **Self-to-Self Communication**: Optional allow rules for NSG to communicate with itself
- **Default Egress**: Optional allow-all egress rule
- **Naming Strategy**: Random ID generation for unique NSG names with custom name override option

## Usage

### Basic Example

```hcl
module "nsg_web" {
  source = "path/to/module"

  name                = "nsg-web-tier"
  location            = "East US"
  resource_group_name = "rg-production"
  environment         = "prod"
  namespace           = "myapp"

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

  egress_rules = {
    to_cidrs = {}
    to_nsgs  = {}
  }

  enable_any_egress = true

  tags = {
    architecture       = "native"
    owner              = "platform-team"
    purpose            = "Network security group for web tier to control HTTP and HTTPS traffic."
    terraform_resource = "true"
    appid              = "app-001"
  }
}
```

### Advanced Example with Multiple Rule Types

```hcl
module "nsg_app" {
  source = "path/to/module"

  name                = "nsg-app-tier"
  location            = "East US"
  resource_group_name = "rg-production"
  environment         = "prod"
  namespace           = "myapp"

  ingress_rules = {
    from_cidrs = {
      tcp = {
        "443" = {
          cidrs   = ["10.0.0.0/8", "172.16.0.0/12"]
          to_port = 443
        }
        "8080" = {
          cidrs   = ["10.1.0.0/16"]
          to_port = 8080
        }
      }
      udp = {
        "53" = {
          cidrs   = ["10.0.0.0/8"]
          to_port = 53
        }
      }
      icmp = {}
    }
    from_nsgs = {
      tcp = {
        "3306" = {
          source_nsg_ids = ["<application-security-group-id>"]
          to_port        = 3306
        }
      }
      udp = {}
    }
  }

  egress_rules = {
    to_cidrs = {
      cidrs    = ["0.0.0.0/0"]
      protocol = "*"
    }
    to_nsgs = {}
  }

  enable_any_nsg_to_self = true
  enable_any_egress      = true

  tags = {
    architecture       = "native"
    owner              = "platform-team"
    purpose            = "Network security group for application tier with database and API access controls."
    terraform_resource = "true"
    appid              = "app-002"
    custom_tags = {
      team        = "backend"
      cost_center = "engineering"
    }
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name of the Network Security Group | `string` | n/a | yes |
| location | Azure location for the NSG | `string` | n/a | yes |
| resource_group_name | Name of the resource group where NSG will be created | `string` | n/a | yes |
| environment | Environment designation (box\|dev\|dr\|prod\|qa\|stage\|uat) | `string` | n/a | yes |
| namespace | Namespace for resources (lowercase, dashes, <32 chars) | `string` | n/a | yes |
| ingress_rules | Object defining ingress rules from CIDRs and NSGs | `object` | `{}` | no |
| egress_rules | Object defining egress rules to CIDRs and NSGs | `object` | `{}` | no |
| enable_any_egress | Allow all egress traffic to 0.0.0.0/0 | `bool` | `true` | no |
| enable_any_nsg_to_self | Allow NSG to communicate with itself | `bool` | `true` | no |
| nsg_custom_name | Custom name for NSG (overrides random generation) | `string` | `""` | no |
| tags | Map of tags with required fields | `object` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the NSG created |
| name | The name of the NSG created |
| resource_group_name | The resource group name where the NSG was created |
| location | The Azure location where the NSG was created |

## Rule Structure

### Ingress Rules from CIDRs

```hcl
ingress_rules = {
  from_cidrs = {
    tcp = {
      "<port>" = {
        cidrs   = ["<cidr1>", "<cidr2>"]
        to_port = <port>  # Optional, defaults to from_port
      }
    }
    udp = {
      # Same structure as TCP
    }
    icmp = {
      # Same structure, protocol is ICMP
    }
  }
}
```

### Ingress Rules from NSGs (Application Security Groups)

```hcl
ingress_rules = {
  from_nsgs = {
    tcp = {
      "<port>" = {
        source_nsg_ids = ["<asg-id-1>", "<asg-id-2>"]
        to_port        = <port>  # Optional
      }
    }
    udp = {
      # Same structure as TCP
    }
  }
}
```

### Egress Rules

```hcl
egress_rules = {
  to_cidrs = {
    cidrs    = ["<cidr1>", "<cidr2>"]
    protocol = "Tcp|Udp|Icmp|*"
    to_port  = <port>  # Optional
  }
  to_nsgs = {
    "<port>" = {
      source_nsg_ids = ["<asg-id>"]
      protocol       = "Tcp|Udp|*"
      to_port        = <port>  # Optional
    }
  }
}
```

## Tag Requirements

The module enforces strict tagging requirements similar to the AWS module:

**Required Tags:**
- `architecture`: Must be "native", "legacy", or "migrations"
- `owner`: Owner/team identifier (lowercase with underscores)
- `purpose`: Detailed description (>40 chars, starts with capital, ends with period)
- `terraform_resource`: Must be "true"
- One of: `appid`, `appgid`, `project`, or `serviceid`

**Optional Tags:**
- `custom_tags`: Map of additional custom tags
- `tag_formatting_exceptions`: List of tag keys exempt from formatting rules

## Priority Management

The module automatically manages NSG rule priorities:
- Ingress rules: Start at priority 100
- Self-to-self rule: After ingress rules
- Egress rules: Start at priority 200
- Allow-all egress: Priority 300

## Examples

See the `examples/` directory for complete working examples:
- `examples/simple/`: Basic NSG with SSH and HTTPS
- `examples/complete/`: Comprehensive NSG with multiple rule types

## Azure NSG vs AWS Security Group Mapping

| AWS SG Concept | Azure NSG Equivalent | Notes |
|----------------|----------------------|-------|
| Security Group | Network Security Group | Similar concept |
| Ingress Rule | Inbound Security Rule | Direction: Inbound |
| Egress Rule | Outbound Security Rule | Direction: Outbound |
| Source SG | Application Security Group | Requires ASG resource |
| CIDR Block | Address Prefix | Direct mapping |
| Protocol | Protocol | TCP, UDP, ICMP, * |
| Port Range | Port Range | Single or range |

## Migration from AWS

Key differences to consider when migrating:
1. **Application Security Groups**: Azure requires explicit ASG resources for NSG-to-NSG communication
2. **Priority Management**: Azure uses priorities (100-4096), managed automatically by this module
3. **Default Rules**: Azure has built-in default rules that can't be deleted
4. **Rule Limits**: Azure has a limit of 1000 rules per NSG

## Requirements

- Terraform >= 1.5.0
- AzureRM Provider ~> 3.0
- Random Provider ~> 3.0

## License

This module follows the same licensing as your organization's Terraform modules.
