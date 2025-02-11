resource "azurerm_resource_group" "i2lab" {
  name     = "i2lab"
  location = "eastus"
}

resource "azurerm_monitor_action_group" "i2lab" {
  name                = "i2lab"
  resource_group_name = azurerm_resource_group.i2lab-rg.name
  short_name          = "i2lab"
}

resource "azurerm_consumption_budget_resource_group" "i2lab" {
  name              = "i2lab"
  resource_group_id = azurerm_resource_group.i2lab-rg.id

  amount     = 1000
  time_grain = "Monthly"

  time_period {
    start_date = "2025-02-01T00:00:00Z"
    end_date   = "2025-11-01T00:00:00Z"
  }

  filter {
    dimension {
      name = "ResourceId"
      values = [
        azurerm_monitor_action_group.i2lab.id,
      ]
    }
  }

  notification {
    enabled        = true
    threshold      = 75.0
    operator       = "EqualTo"
    threshold_type = "Forecasted"

    contact_emails = [var.EMAIL]

    contact_groups = [
      azurerm_monitor_action_group.i2lab.id,
    ]

    contact_roles = [
      "Owner",
    ]
  }

  notification {
    enabled   = true
    threshold = 100.0
    operator  = "GreaterThan"

    contact_emails = [var.EMAIL]
  }
}
