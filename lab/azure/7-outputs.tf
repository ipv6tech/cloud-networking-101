# public ip
output "public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}
# output ssh command to connect to i2lab instance
output "ssh_command" {
  value = "ssh -i ${var.PRIVATE_KEY} adminuser@${azurerm_public_ip.public_ip.ip_address}"
}