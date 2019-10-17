// Dependency
variable "my_network" {}

// Variables
variable "name" {}
variable "region" {}
variable "subnet_cidr" {}
variable "cidr_subnets" { type = "map" }

// Create Subnets
resource "google_compute_subnetwork" "subnet" {
  count         = "${length(var.cidr_subnets)}"
  name          = "${var.name}-subnet-${element(split(",",var.cidr_subnets[count.index]),0)}"
  ip_cidr_range = "${element(split(",",var.cidr_subnets[count.index]),1)}"
  network       = "${var.my_network}"
  region        = "${var.region}"
}
