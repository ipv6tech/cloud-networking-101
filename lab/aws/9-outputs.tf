output "instance_ids" {
  description = "ID of EC2 i2lab instance"
  value       = aws_instance.i2lab.id
}

output "public_dns" {
  description = "Public DNS name assigned to i2lab"
  value       = aws_instance.i2lab.public_dns
}

output "public_ip" {
  description = "Public IP address assigned to i2lab"
  value       = aws_instance.i2lab.public_ip
}

output "budget_id" {
  value = aws_budgets_budget.budget_alerts.id
}
