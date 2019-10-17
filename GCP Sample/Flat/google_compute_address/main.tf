// Dependency
variable "my_network" {}
variable "my_subnet" { type = "list" }

// Variables
variable "name" {}
variable "reserve_int_ip" { type = "map" }
variable "reserve_ext_ip" { type = "map" }
variable "reserve_glob_ip" { type = "map" }
variable "project" {}
variable "region" {}

resource "google_compute_address" "reserve_int_ip" {
  count        = "${length(var.reserve_int_ip)}"
  name         = "${var.name}-${element(split(",",var.reserve_int_ip[count.index]),0)}-reserve-ip-${element(split(",",var.reserve_int_ip[count.index]),1)}"
  address_type = "INTERNAL"
  subnetwork   = "${var.my_subnet["${element(split(",",var.reserve_int_ip[count.index]),3)}"]}"
  address      = "${element(split(",",var.reserve_int_ip[count.index]),2)}"
}

resource "google_compute_address" "reserve_ext_ip" {
  count        = "${length(var.reserve_ext_ip)}"
  name         = "${var.name}-${element(split(",",var.reserve_ext_ip[count.index]),0)}-reserve-ip"
  address_type = "EXTERNAL"
}

resource "google_compute_global_address" "reserve_glob_ip" {
  count      = "${length(var.reserve_glob_ip)}"
  name       = "${var.name}-${element(split(",",var.reserve_glob_ip[count.index]),0)}-global-ip"
  ip_version = "IPV4"
}
