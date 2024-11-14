// aws budget alert set to $10, with low threshold at 50% and high threshold at 80%
resource "aws_budgets_budget" "budget_alerts" {
  name         = "i2lab BudgetAlerts"
  budget_type  = "COST"
  limit_amount = var.BUDGET_AMOUNT
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "ACTUAL"
    threshold_type             = "PERCENTAGE"
    threshold                  = var.LOW_THRESHOLD
    subscriber_email_addresses = [var.EMAIL]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "ACTUAL"
    threshold_type             = "PERCENTAGE"
    threshold                  = var.HIGH_THRESHOLD
    subscriber_email_addresses = [var.EMAIL]
  }
}