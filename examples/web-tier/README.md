# Web Tier Example

NSG for web applications with user-defined rules for internal traffic.

## User-Defined Rules

- HTTPS (443) from internal network (10.0.0.0/8)
- HTTP (80) from internal network (10.0.0.0/8)
- SSH (22) from bastion subnet (10.100.0.0/24)
- Custom app port (8080) from app subnet (10.200.0.0/24)
- Health check (8443) from load balancer subnet (10.50.0.0/24)
- DNS (53/UDP) from internal network (10.0.0.0/8)

## Usage

```bash
terraform init
terraform plan
terraform apply
```

## Resources Created

- Resource Group
- Random ID
- Network Security Group
- Enterprise security rules (applied automatically based on region)
- User-defined security rules
