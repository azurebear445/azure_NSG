# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2024-12-23

### Added
- Initial release of Azure Network Security Group (NSG) Terraform module
- Support for comprehensive ingress and egress rules
- CIDR-based rule management for TCP, UDP, and ICMP protocols
- Application Security Group (ASG) based rule management
- Automatic priority management for NSG rules
- Random ID generation for unique NSG naming
- Custom name override capability
- Comprehensive tag management with validation
- Tag formatting exceptions support
- Self-to-self communication rules
- Allow-all egress option
- Module structured to mirror AWS Security Group module
- Complete examples (simple and complete)
- Test configuration
- Comprehensive README documentation
- Migration guide from AWS to Azure
- Proper outputs (id, name, resource_group_name, location)

### Features
- **Protocol Support**: TCP, UDP, ICMP, and wildcard (*)
- **Rule Types**:
  - Ingress from CIDR blocks
  - Ingress from Application Security Groups
  - Egress to CIDR blocks
  - Egress to Application Security Groups
- **Tag Validation**: Enforces organizational tagging standards
- **Environment Validation**: Restricts to: box, dev, dr, prod, qa, stage, uat
- **Namespace Validation**: Lowercase letters and dashes only, under 32 characters

### Documentation
- README.md with comprehensive usage examples
- MIGRATION.md for AWS to Azure migration guidance
- Inline code documentation
- Example configurations in `examples/` directory
- Test configuration in `tests/` directory

### Requirements
- Terraform >= 1.5.0
- AzureRM Provider ~> 3.0
- Random Provider ~> 3.0

[1.0.0]: https://github.com/your-org/terraform-azurerm-network_security_group/releases/tag/v1.0.0
