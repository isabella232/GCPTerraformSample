variable vpc_subnet {}
variable subnet_name {}
variable reserve_int_ip {}

resource "google_compute_address" "reserve_int_ip" {
  name         = "${var.subnet_name}-reserve-ip"
  address_type = "INTERNAL"
  subnetwork   = "${var.vpc_subnet}"
  address      = "${var.reserve_int_ip}"
}

resource "google_compute_address" "reserve_ext_ip" {
  name         = "${var.subnet_name}-ext-reserve-ip"
  address_type = "EXTERNAL"
}

resource "google_compute_global_address" "reserve_glob_ip" {
  name         = "${var.subnet_name}-global-reserve-ip"
  ip_version = "IPV4"
}
