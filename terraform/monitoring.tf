resource "google_monitoring_notification_channel" "email" {
  display_name = "Email Notification"
  type         = "email"

  labels = {
    email_address = "jmadhu7121@gmail.com"
  }
}

resource "google_monitoring_alert_policy" "gke_cpu_alert" {
  display_name = "GKE High CPU Alert"

  combiner = "OR"

  conditions {
    display_name = "CPU Utilization > 80%"

    condition_threshold {
      filter = "resource.type=\"k8s_node\" AND metric.type=\"kubernetes.io/node/cpu/core_usage_time\""

      comparison      = "COMPARISON_GT"
      threshold_value = 0.8
      duration        = "300s"

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_RATE"
      }
    }
  }

  notification_channels = [
    google_monitoring_notification_channel.email.id
  ]

  alert_strategy {
    auto_close = "1800s"
  }

  documentation {
    content = "Alert when GKE node CPU utilization exceeds 80%."
  }
}