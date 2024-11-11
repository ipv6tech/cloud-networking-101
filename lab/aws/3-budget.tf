// aws budget alert set to $10, with low threshold at 50% and high threshold at 80%
resource "aws_budgets_budget" "budget_alerts" {
  name         = "i2lab BudgetAlerts"
  budget_type  = "COST"
  limit_amount = var.budget_amount
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "ACTUAL"
    threshold_type             = "PERCENTAGE"
    threshold                  = var.low_threshold
    subscriber_email_addresses = [var.email]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "ACTUAL"
    threshold_type             = "PERCENTAGE"
    threshold                  = var.high_threshold
    subscriber_email_addresses = [var.email]
  }
}