resource "google_pubsub_topic" "employee_upload" {

  name = var.topic_name
}

resource "google_pubsub_subscription" "employee_subscription" {

  name = var.subscription_name

  topic = google_pubsub_topic.employee_upload.name

  ack_deadline_seconds = 20
}