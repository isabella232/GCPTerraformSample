terraform {
  required_version = ">= 0.12"
}

variable "name" {}

// Create VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.name}-vpc"
  auto_create_subnetworks = "false"
}

output "vpc_name" {
  value = google_compute_network.vpc.self_link
  }

