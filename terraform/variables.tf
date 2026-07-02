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