# Azure NSG Module - Summary and AWS Comparison

## Executive Summary

This Azure Network Security Group (NSG) Terraform module has been created to replicate the functionality and structure of your existing AWS Security Group module. The module maintains consistency in:

- Variable structure and naming
- Tag management and validation
- Rule organization (ingress/egress, CIDR/NSG-based)
- Naming conventions
- Documentation standards

## Module Comparison: AWS vs Azure

### File Structure
Both modules follow identical organization:

```
AWS Module                      Azure Module
├── main.tf                     ├── main.tf
├── variables.tf                ├── variables.tf
├── outputs.tf                  ├── outputs.tf
├── locals.tf                   ├── locals.tf
├── tags.tf                     ├── tags.tf
├── versions.tf                 ├── versions.tf
├── README.md                   ├── README.md
├── examples/                   ├── examples/
│   └── ...                     │   ├── complete/
└── tests/                      │   └── simple/
    └── ...                     ├── tests/
                                ├── MIGRATION.md
                                ├── VARIABLES.md
                                ├── IMPLEMENTATION.md
                                └── CHANGELOG.md
```

### Core Functionality Mapping

| Feature | AWS Module | Azure Module | Status |
|---------|------------|--------------|--------|
| **Resource Creation** | aws_security_group | azurerm_network_security_group | ✅ Implemented |
| **Rule Management** | aws_security_group_rule | azurerm_network_security_rule | ✅ Implemented |
| **Random ID** | random_id | random_id | ✅ Identical |
| **CIDR Ingress (TCP)** | ✅ | ✅ | ✅ Identical structure |
| **CIDR Ingress (UDP)** | ✅ | ✅ | ✅ Identical structure |
| **CIDR Ingress (ICMP)** | ✅ | ✅ | ✅ Identical structure |
| **NSG/SG Ingress (TCP)** | ✅ | ✅ (via ASG) | ✅ Adapted for Azure |
| **NSG/SG Ingress (UDP)** | ✅ | ✅ (via ASG) | ✅ Adapted for Azure |
| **CIDR Egress** | ✅ | ✅ | ✅ Identical structure |
| **NSG/SG Egress** | ✅ | ✅ (via ASG) | ✅ Adapted for Azure |
| **Self-to-Self Rules** | ✅ | ✅ | ✅ Identical |
| **Allow-All Egress** | ✅ | ✅ | ✅ Identical |
| **Tidal Rules** | ✅ | ❌ | N/A for Azure |
| **Instance Attachments** | ✅ | N/A | Azure uses different model |

### Variable Comparison

#### Identical Variables
These variables work exactly the same in both modules:

```hcl
# Same structure, same behavior
environment         # box|dev|dr|prod|qa|stage|uat
namespace           # lowercase, dashes, <32 chars
tags                # Identical structure and validation
enable_any_egress   # Same behavior
enable_any_nsg_to_self  # Same as enable_any_sg_to_self
ingress_rules       # Same structure
egress_rules        # Same structure
```

#### Platform-Specific Variables

**AWS Only:**
- `vpc_id` - VPC association
- `revoke_rules_on_delete` - Rule cleanup behavior
- `legacy_instance_id_attachments` - EC2 attachments
- `legacy_instance_name_attachments` - EC2 attachments

**Azure Only:**
- `location` - Azure region (required)
- `resource_group_name` - Resource group (required)
- `name` - Base name for NSG (required)

**Name Override:**
- AWS: `sg_custom_name`
- Azure: `nsg_custom_name`

### Tags - Completely Identical

Both modules use the exact same tag structure:

```hcl
tags = {
  architecture       = "native|legacy|migrations"
  owner              = "team-name"
  purpose            = "Description >40 chars, starts capital, ends period."
  terraform_resource = "true"
  appid              = "app-xxx"  # OR
  appgid             = "appgid-xxx"  # OR
  project            = "project-xxx"  # OR
  serviceid          = "svc-xxx"
  custom_tags = {
    key = "value"
  }
  tag_formatting_exceptions = ["key1", "key2"]
}
```

**Validation Rules - Identical:**
- ✅ Architecture: "native", "legacy", or "migrations"
- ✅ Purpose: >40 chars, capital first letter, ends with period
- ✅ terraform_resource: Must be "true"
- ✅ One of: appid, appgid, project, serviceid required
- ✅ Custom tags support
- ✅ Tag formatting exceptions

### Rule Structure Comparison

#### Ingress from CIDRs - Identical

**AWS:**
```hcl
ingress_rules = {
  from_cidrs = {
    tcp = {
      "443" = { cidrs = ["10.0.0.0/8"], to_port = 443 }
    }
    udp = {}
    icmp = {}
  }
}
```

**Azure:**
```hcl
ingress_rules = {
  from_cidrs = {
    tcp = {
      "443" = { cidrs = ["10.0.0.0/8"], to_port = 443 }
    }
    udp = {}
    icmp = {}
  }
  from_nsgs = { tcp = {}, udp = {} }  # Additional empty block
}
```

#### Ingress from Security Groups/NSGs

**AWS:**
```hcl
ingress_rules = {
  from_sec_groups = {
    tcp = {
      "3306" = {
        source_sg_ids = ["sg-xxx"]
        to_port = 3306
      }
    }
  }
}
```

**Azure (requires ASG):**
```hcl
ingress_rules = {
  from_nsgs = {
    tcp = {
      "3306" = {
        source_nsg_ids = ["<asg-id>"]  # Application Security Group ID
        to_port = 3306
      }
    }
  }
}
```

### Outputs - Similar

**AWS:**
```hcl
output "id"   { value = aws_security_group.this.id }
output "name" { value = aws_security_group.this.name }
```

**Azure:**
```hcl
output "id"                  { value = azurerm_network_security_group.this.id }
output "name"                { value = azurerm_network_security_group.this.name }
output "resource_group_name" { value = azurerm_network_security_group.this.resource_group_name }
output "location"            { value = azurerm_network_security_group.this.location }
```

## Key Differences to Understand

### 1. Application Security Groups (ASGs)
**AWS**: Security groups can reference other security groups directly
**Azure**: Requires explicit Application Security Group (ASG) resources

**Impact**: You must create ASGs before using them in NSG rules

### 2. Priority Management
**AWS**: No priority concept, rules evaluated together
**Azure**: Each rule has a priority (100-4096), lower = higher precedence

**Impact**: Module auto-manages priorities, starting at 100

### 3. VPC vs Resource Group
**AWS**: Security groups are VPC-scoped
**Azure**: NSGs are Resource Group-scoped with location

**Impact**: Must specify both resource group and location

### 4. Instance Attachments
**AWS**: Security groups attach to EC2 instances via the module
**Azure**: NSGs attach to subnets or NICs (handled separately)

**Impact**: No attachment logic in Azure module

## Migration Path

### Step 1: Understand Current AWS Setup
```bash
# List your AWS security groups
terraform state list | grep aws_security_group
```

### Step 2: Create Azure Prerequisites
```hcl
# Resource group
resource "azurerm_resource_group" "main" {
  name     = "rg-${var.environment}"
  location = "East US"
}

# ASGs for NSG-to-NSG communication
resource "azurerm_application_security_group" "app" {
  name                = "asg-${var.environment}-app"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}
```

### Step 3: Convert Module Calls
Use MIGRATION.md for detailed conversion patterns

### Step 4: Test Incrementally
Start with simple NSGs, then move to complex ones

## Usage Patterns

### Pattern 1: Simple Web NSG
```hcl
module "nsg_web" {
  source = "./azure-nsg-module"

  name                = "web"
  location            = "East US"
  resource_group_name = "rg-prod"
  environment         = "prod"
  namespace           = "myapp"

  ingress_rules = {
    from_cidrs = {
      tcp = {
        "443" = { cidrs = ["0.0.0.0/0"], to_port = 443 }
        "80"  = { cidrs = ["0.0.0.0/0"], to_port = 80 }
      }
      udp  = {}
      icmp = {}
    }
    from_nsgs = { tcp = {}, udp = {} }
  }

  egress_rules = {
    to_cidrs = {}
    to_nsgs  = {}
  }

  enable_any_egress = true

  tags = { /* same as AWS */ }
}
```

### Pattern 2: Database NSG with ASG
```hcl
module "nsg_db" {
  source = "./azure-nsg-module"

  name                = "database"
  location            = "East US"
  resource_group_name = "rg-prod"
  environment         = "prod"
  namespace           = "myapp"

  ingress_rules = {
    from_cidrs = {
      tcp  = {}
      udp  = {}
      icmp = {}
    }
    from_nsgs = {
      tcp = {
        "3306" = {
          source_nsg_ids = [azurerm_application_security_group.app.id]
          to_port        = 3306
        }
      }
      udp = {}
    }
  }

  egress_rules = {
    to_cidrs = {}
    to_nsgs  = {}
  }

  enable_any_egress = false

  tags = { /* same as AWS */ }
}
```

## Testing in Sandbox

See IMPLEMENTATION.md for complete testing guide.

**Quick Test:**
```bash
cd azure-nsg-module/examples/simple
terraform init
terraform plan
terraform apply
# Verify in Azure Portal
terraform destroy
```

## Documentation Files

| File | Purpose |
|------|---------|
| **README.md** | Main module documentation with examples |
| **MIGRATION.md** | Detailed AWS to Azure migration guide |
| **VARIABLES.md** | Comprehensive variable documentation |
| **IMPLEMENTATION.md** | Testing and deployment guide |
| **CHANGELOG.md** | Version history |
| **This file** | Summary and comparison |

## Validation Before Production

- [ ] Test in sandbox subscription
- [ ] Verify all tags appear correctly
- [ ] Confirm naming convention follows pattern
- [ ] Test ASG-based rules (if used)
- [ ] Validate priority auto-assignment
- [ ] Test with different environments
- [ ] Review Azure Portal for correct configuration
- [ ] Run `terraform plan` against existing resources
- [ ] Document any custom patterns for your organization

## Benefits of This Module

1. **Consistency**: Same structure as AWS module
2. **Maintainability**: Familiar to team already using AWS module
3. **Tag Compliance**: Enforces same standards across clouds
4. **Flexibility**: Supports all NSG rule types
5. **Documentation**: Comprehensive guides and examples
6. **Tested**: Includes test configurations and examples

## Next Steps

1. **Review**: Read through all documentation files
2. **Test**: Deploy to sandbox using IMPLEMENTATION.md guide
3. **Customize**: Adapt examples for your use cases
4. **Deploy**: Roll out to dev → qa → stage → prod
5. **Monitor**: Verify NSG behavior in Azure
6. **Document**: Add organization-specific patterns
7. **Share**: Distribute to team members

## Support Resources

- **Module Files**: All files in `/azure-nsg-module/`
- **Examples**: See `examples/` directory
- **Tests**: See `tests/` directory
- **Migration**: See MIGRATION.md
- **Variables**: See VARIABLES.md
- **Implementation**: See IMPLEMENTATION.md

---

**Version**: 1.0.0  
**Created**: December 2024  
**Compatible With**: AWS Security Group Module v1.x
