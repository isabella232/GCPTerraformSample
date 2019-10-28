

resource "google_compute_firewall" "firewall_rule" {
  name     = var.fw_name
  project  = var.project
  network  = var.network
  priority = var.priority

  allow {
    protocol = var.allow_protocol-1
    ports    = var.allow_ports
  }

  allow {
    protocol = var.allow_protocol-2
    ports    = var.allow_ports
  }

  source_tags   = var.source_tags

  target_tags   = var.target_tags

  source_ranges = var.source_ranges
}
