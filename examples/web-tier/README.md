# Web Tier Example

This example demonstrates the NSG module with user-defined ingress rules for web applications. Enterprise security group rules are also applied automatically based on the deployment region (eastus2 or centralus).

## What This Example Does

- Creates a Resource Group in centralus
- Creates an NSG with user-defined rules for web traffic
- Applies all 13 Enterprise Security Group rule sets automatically
- Enables outbound traffic to all destinations
- Enables self-to-self communication within the VNet

## User-Defined Rules

| Port | Protocol | Source | Purpose |
|------|----------|--------|---------|
| 443 | TCP | 10.0.0.0/8 | HTTPS from internal network |
| 80 | TCP | 10.0.0.0/8 | HTTP from internal network |
| 22 | TCP | 10.100.0.0/24 | SSH from bastion subnet |
| 8080 | TCP | 10.200.0.0/24 | Custom app port from app subnet |
| 8443 | TCP | 10.50.0.0/24 | Health check from load balancer |
| 53 | UDP | 10.0.0.0/8 | DNS from internal network |

## Resources Created

| Resource | Description |
|----------|-------------|
| azurerm_resource_group | Resource group for the NSG |
| random_id | Unique suffix for NSG naming |
| azurerm_network_security_group | The NSG resource |
| azurerm_network_security_rule | Enterprise rules (470+ rules based on region) |
| azurerm_network_security_rule | User-defined rules (6 rules) |
| azurerm_network_security_rule | Allow any egress rule |
| azurerm_network_security_rule | Allow self-to-self rule |

## Usage

```bash
terraform init
terraform plan
terraform apply
```

## Clean Up

```bash
terraform destroy
```
