project_id = "gcp-devops-project-501115"

region = "asia-south1"

zone = "asia-south1-a"

vpc_name = "gcp-devops-vpc"

public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"

router_name = "gcp-cloud-router"

nat_name = "gcp-cloud-nat"

artifact_repository_name = "employee-app-repo"
artifact_location        = "asia-south1"

bucket_name = "gcp-devops-project-501115-employee-docs"

private_service_range_name   = "private-service-range"
private_service_prefix_length = 16

db_instance_name = "employee-db"

db_version = "MYSQL_8_0"

db_name = "employee"

db_user = "employeeadmin"

db_password = "Employee@123"

db_secret_name = "employee-db-password"

topic_name        = "employee-upload-topic"
subscription_name = "employee-upload-subscription"

backend_service_account_name = "employee-backend-sa"

backend_service_account_display_name = "Employee Backend Service Account"