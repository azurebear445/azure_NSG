output "id" {
  value       = azurerm_network_security_group.this.id
  description = "(string) - The ID of the NSG created."
}

output "name" {
  value       = azurerm_network_security_group.this.name
  description = "(string) - The name of the NSG created."
}
