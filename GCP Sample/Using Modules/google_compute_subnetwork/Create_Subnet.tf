// Dependency
variable "subnet_vpc" {}

// Variables
variable "subnet_name" {}
variable "region" {}
variable "subnet_cidr" {}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.subnet_name}"
  ip_cidr_range = "${var.subnet_cidr}"
  network       = "${var.subnet_vpc}"
  region        = "${var.region}"
}
