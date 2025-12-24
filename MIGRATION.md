# Migration Guide: AWS Security Group to Azure NSG Module

This guide helps you migrate from the AWS Security Group module to the Azure NSG module.

## Key Differences

### 1. Resource Naming
**AWS:**
- Security Group ID
- Associated with VPC

**Azure:**
- Network Security Group (NSG) ID
- Associated with Resource Group and Location (region)

### 2. Rule Management
**AWS:**
- Separate ingress and egress rule resources
- Source Security Groups referenced by ID

**Azure:**
- Security Rules are child resources of NSG
- Application Security Groups (ASG) needed for NSG-to-NSG communication
- Rules have priorities (100-4096)

### 3. Required Parameters

| AWS Parameter | Azure Equivalent | Notes |
|---------------|------------------|-------|
| `vpc_id` | `resource_group_name` + `location` | Azure uses RG instead of VPC |
| `name` | `name` | Same concept |
| `description` | Tags | Use `purpose` tag |
| `revoke_rules_on_delete` | N/A | Azure handles automatically |

## Variable Mapping

### Basic Configuration

**AWS:**
```hcl
module "sg" {
  vpc_id      = "vpc-xxx"
  namespace   = "myapp"
  environment = "prod"
}
```

**Azure:**
```hcl
module "nsg" {
  resource_group_name = "rg-prod"
  location           = "East US"
  namespace          = "myapp"
  environment        = "prod"
  name               = "web-tier"  # Additional required field
}
```

### Ingress Rules from CIDRs

**AWS:**
```hcl
ingress_rules = {
  from_cidrs = {
    tcp = {
      "443" = {
        cidrs   = ["10.0.0.0/8"]
        to_port = 443
      }
    }
  }
}
```

**Azure (Identical Structure):**
```hcl
ingress_rules = {
  from_cidrs = {
    tcp = {
      "443" = {
        cidrs   = ["10.0.0.0/8"]
        to_port = 443
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
```

### Ingress Rules from Security Groups/NSGs

**AWS:**
```hcl
ingress_rules = {
  from_sec_groups = {
    tcp = {
      "3306" = {
        source_sg_ids = ["sg-xxx", "sg-yyy"]
        to_port       = 3306
      }
    }
  }
}
```

**Azure:**
```hcl
ingress_rules = {
  from_nsgs = {
    tcp = {
      "3306" = {
        source_nsg_ids = ["<asg-id-1>", "<asg-id-2>"]  # ASG IDs, not NSG IDs
        to_port        = 3306
      }
    }
    udp = {}
  }
  from_cidrs = {
    tcp  = {}
    udp  = {}
    icmp = {}
  }
}
```

**Important:** Azure requires Application Security Groups (ASGs) for NSG-to-NSG communication. You need to create ASGs separately:

```hcl
resource "azurerm_application_security_group" "app" {
  name                = "asg-app-tier"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}
```

### Egress Rules

**AWS:**
```hcl
egress_rules = {
  to_cidrs = {
    cidrs    = ["0.0.0.0/0"]
    protocol = "tcp"
    to_port  = 443
  }
}
```

**Azure (Same Structure):**
```hcl
egress_rules = {
  to_cidrs = {
    cidrs    = ["0.0.0.0/0"]
    protocol = "Tcp"  # Note: Capital T
    to_port  = 443
  }
  to_nsgs = {}
}
```

### Tags

The tag structure is **identical** between AWS and Azure modules:

```hcl
tags = {
  architecture       = "native"
  owner              = "platform-team"
  purpose            = "Network security group for web tier applications."
  terraform_resource = "true"
  appid              = "app-12345"
  custom_tags = {
    team        = "infrastructure"
    cost_center = "engineering"
  }
}
```

## Step-by-Step Migration

### Step 1: Identify AWS Resources
Review your AWS Security Group configuration:
```bash
cd aws-infrastructure
terraform state list | grep aws_security_group
```

### Step 2: Create Azure Resource Group
Azure requires a resource group:
```hcl
resource "azurerm_resource_group" "main" {
  name     = "rg-${var.environment}-${var.namespace}"
  location = "East US"  # Choose appropriate region
}
```

### Step 3: Convert Security Group References
For any rules referencing other security groups, create ASGs:
```hcl
resource "azurerm_application_security_group" "db" {
  name                = "asg-${var.environment}-database"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}
```

### Step 4: Migrate Module Call
**Before (AWS):**
```hcl
module "sg_web" {
  source = "../terraform-aws-security_group"

  vpc_id      = module.vpc.vpc_id
  namespace   = "myapp"
  environment = "prod"

  ingress_rules = {
    from_cidrs = {
      tcp = {
        "443" = { cidrs = ["0.0.0.0/0"], to_port = 443 }
        "80"  = { cidrs = ["0.0.0.0/0"], to_port = 80 }
      }
    }
  }

  tags = {
    architecture       = "native"
    owner              = "platform"
    purpose            = "Web tier security group for HTTPS traffic."
    terraform_resource = "true"
    appid              = "app-001"
  }
}
```

**After (Azure):**
```hcl
module "nsg_web" {
  source = "../terraform-azurerm-network_security_group"

  name                = "web"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  namespace           = "myapp"
  environment         = "prod"

  ingress_rules = {
    from_cidrs = {
      tcp = {
        "443" = { cidrs = ["0.0.0.0/0"], to_port = 443 }
        "80"  = { cidrs = ["0.0.0.0/0"], to_port = 80 }
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
    owner              = "platform"
    purpose            = "Web tier network security group for HTTPS traffic."
    terraform_resource = "true"
    appid              = "app-001"
  }
}
```

### Step 5: Update References
**AWS output reference:**
```hcl
security_group_id = module.sg_web.id
```

**Azure output reference:**
```hcl
nsg_id = module.nsg_web.id
```

## Common Patterns

### Pattern 1: Database Security Group → Database NSG

**AWS:**
```hcl
module "sg_database" {
  source = "../terraform-aws-security_group"

  vpc_id      = module.vpc.vpc_id
  namespace   = "myapp"
  environment = "prod"

  ingress_rules = {
    from_sec_groups = {
      tcp = {
        "3306" = {
          source_sg_ids = [module.sg_web.id]
          to_port       = 3306
        }
      }
    }
  }

  enable_any_egress = false

  tags = { /* ... */ }
}
```

**Azure:**
```hcl
# First, create ASG for web tier
resource "azurerm_application_security_group" "web" {
  name                = "asg-${var.environment}-web"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

module "nsg_database" {
  source = "../terraform-azurerm-network_security_group"

  name                = "database"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  namespace           = "myapp"
  environment         = "prod"

  ingress_rules = {
    from_nsgs = {
      tcp = {
        "3306" = {
          source_nsg_ids = [azurerm_application_security_group.web.id]
          to_port        = 3306
        }
      }
      udp = {}
    }
    from_cidrs = {
      tcp  = {}
      udp  = {}
      icmp = {}
    }
  }

  egress_rules = {
    to_cidrs = {}
    to_nsgs  = {}
  }

  enable_any_egress = false

  tags = { /* ... */ }
}
```

### Pattern 2: Allow Self-to-Self Communication

**Both AWS and Azure (identical):**
```hcl
enable_any_nsg_to_self = true
```

### Pattern 3: Conditional Egress

**Both AWS and Azure (identical):**
```hcl
enable_any_egress = var.environment == "prod" ? false : true
```

## Validation Checklist

- [ ] All required Azure resources created (Resource Group, ASGs)
- [ ] Module source path updated
- [ ] `name`, `location`, `resource_group_name` parameters added
- [ ] `vpc_id` parameter replaced
- [ ] Empty protocol blocks added (`udp = {}`, `icmp = {}`)
- [ ] Security Group IDs replaced with ASG IDs where applicable
- [ ] Protocol names capitalized (Tcp, Udp, Icmp)
- [ ] Tags structure verified (should be identical)
- [ ] Output references updated
- [ ] Dependencies updated

## Testing Strategy

1. **Plan Review**: Run `terraform plan` and review all changes
2. **Staged Deployment**: Deploy to dev/qa first
3. **Connectivity Tests**: Verify network connectivity post-deployment
4. **Rule Validation**: Ensure all security rules are created correctly
5. **Tag Verification**: Confirm all tags are applied

## Troubleshooting

### Issue: "Priority already exists"
**Cause:** Azure automatically manages priorities
**Solution:** The module handles this automatically, no action needed

### Issue: "Cannot use security group ID for source"
**Cause:** Azure requires ASG for NSG-to-NSG communication
**Solution:** Create ASG resources and use their IDs

### Issue: "Invalid CIDR block"
**Cause:** Azure may have different CIDR validation
**Solution:** Verify CIDR blocks follow Azure format

### Issue: "Too many rules"
**Cause:** Azure has a 1000 rule limit per NSG
**Solution:** Split into multiple NSGs or consolidate rules

## Additional Resources

- Azure NSG Documentation: https://docs.microsoft.com/en-us/azure/virtual-network/network-security-groups-overview
- Application Security Groups: https://docs.microsoft.com/en-us/azure/virtual-network/application-security-groups
- Module README: See README.md in this repository
