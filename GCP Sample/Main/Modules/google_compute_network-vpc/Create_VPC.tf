
// Create VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.vpc_name}-vpc"
  auto_create_subnetworks = "false"
}
