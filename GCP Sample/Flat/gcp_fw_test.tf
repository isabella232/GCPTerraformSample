variable "network" {
  default = "https://www.googleapis.com/compute/v1/projects/dani-playground/global/networks/my-custom-network"
}

module "fw_test" {
  source = "./google_compute_firewall"

  # Required
  fw_name        = "internal-allow-2"
  network        = var.network
  allow_protocol = "udp" # tcp,udp,icmp
  project        = var.gcp_project
  allow_ports    = ["80,90,100"]
  # Optional
  #  source_tags     = ["tag1","tag2"]
  #  target_tags     = ["tag3","tag4"]
  #  source_ranges   = ["192.168.16.0/24"]
  #  priority        = "800"
}

