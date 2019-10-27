/*
module  "compute_firewall" {
  source         = "../../Using Modules/google_compute_firewall"
  project        = "${var.gcp_project}"
  fw_name        = "${var.fw_name}"
  project        = "${var.gcp_project}" 
  network        = "${module.staging_vpc.new_vpc}"
  priority       = "1000"
  allow_protocol = "TCP"
  allow_ports    = ["22","80","443"]
  source_tags    = ["allow-ssh","allow-http"]
  target_tags    = ["servers"]
  source_ranges  = ["0.0.0.0/24"]
}
*/