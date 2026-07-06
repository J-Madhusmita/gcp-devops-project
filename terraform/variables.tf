variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "zone" {
  description = "GCP Zone"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "routing_mode" {
  description = "VPC Routing Mode"
  type        = string
  default     = "REGIONAL"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
}

variable "allowed_ports" {
  description = "Ports allowed from the internet"
  type        = list(string)
  default     = ["22", "80", "443"]
}

variable "router_name" {
  description = "Cloud Router Name"
  type        = string
}

variable "nat_name" {
  description = "Cloud NAT name"
  type        = string
}

## Artifact Registry Variables

variable "artifact_repository_name" {
  description = "Artifact Registry repository name"
  type        = string
}

variable "artifact_location" {
  description = "Artifact Registry location"
  type        = string
}

## Storage Bucket Variables

variable "bucket_name" {
  description = "Cloud Storage bucket name"
  type        = string
}

## Private Service Access Variables

variable "private_service_range_name" {
  description = "Reserved IP range for Private Service Access"
  type        = string
}

variable "private_service_prefix_length" {
  description = "CIDR prefix length for PSA"
  type        = number
}

## Cloud SQL Variables

variable "db_instance_name" {
  description = "Cloud SQL instance name"
  type        = string
}

variable "db_version" {
  description = "Database version"
  type        = string
}

variable "db_name" {
  description = "Application database"
  type        = string
}

variable "db_user" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

## Secret Manager Variable

variable "db_secret_name" {
  description = "Secret Manager secret name for database password"
  type        = string
}

## Pub/Sub Variables
variable "topic_name" {
  description = "Pub/Sub topic name"
  type        = string
}

variable "subscription_name" {
  description = "Pub/Sub subscription name"
  type        = string
}

## Backend Service Account Variables

variable "backend_service_account_name" {
  description = "Backend Service Account"
  type        = string
}

variable "backend_service_account_display_name" {
  description = "Display name"
  type        = string
}