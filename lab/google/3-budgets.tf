/* resource "google_billing_budget" "budget" {
    billing_account = "your-billing-account-id"
    display_name    = "Monthly Budget"

    amount {
        specified_amount {
            currency_code = "USD"
            units         = 10
        }
    }

    threshold_rules {
        threshold_percent = 0.5
    }

    threshold_rules {
        threshold_percent = 0.9
    }

    all_updates_rule {
        pubsub_topic = "projects/${var.GC_PROJECT_ID}/topics/your-topic"
        schema_version = "1.0"
    }
}
*/