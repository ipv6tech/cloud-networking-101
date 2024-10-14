output "instance_ids" {
  description = "ID of EC2 i2-lab instance"
  value       = aws_instance.i2-lab.id
}

output "public_dns" {
  description = "Public DNS name assigned to i2-lab"
  value       = aws_instance.i2-lab.public_dns
}
output "public_ip" {
  description = "Public IP address assigned to i2-lab"
  value       = aws_instance.i2-lab.public_ip
}
