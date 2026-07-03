resource "google_sql_database_instance" "mysql" {

  name             = var.db_instance_name
  database_version = var.db_version
  region           = var.region

  deletion_protection = false

  settings {

    tier = "db-custom-1-3840"

    availability_type = "ZONAL"

    backup_configuration {
      enabled = true
    }

    ip_configuration {

      ipv4_enabled = false

      private_network = google_compute_network.vpc.id
    }
  }

  depends_on = [
    google_service_networking_connection.private_vpc_connection
  ]
}

resource "google_sql_database" "employee_db" {

  name     = var.db_name
  instance = google_sql_database_instance.mysql.name
}

resource "google_sql_user" "employee_user" {

  name     = var.db_user

  instance = google_sql_database_instance.mysql.name

  password = var.db_password
}