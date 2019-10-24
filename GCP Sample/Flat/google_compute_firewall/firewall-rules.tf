variable network  {
}
variable "project" {  
}

variable fw_name {
}
variable allow_ports {
  type = "list" 
  default = []
}
variable allow_protocol {
}
variable source_tags {
  type = "list" 
  default = []
}
variable target_tags {
  type = "list" 
  default = []
}
variable source_ranges {
  type = "list" 
  default = []
}
variable priority {
  default = "1000"
}

resource "google_compute_firewall" "firewall_rule" {
  name     = var.fw_name
  project  = var.project
  network  = var.network
  priority = var.priority

  allow {
    protocol = var.allow_protocol
    ports    = var.allow_ports
  }

  source_tags   = var.source_tags

  target_tags   = var.target_tags

  source_ranges = var.source_ranges
}
