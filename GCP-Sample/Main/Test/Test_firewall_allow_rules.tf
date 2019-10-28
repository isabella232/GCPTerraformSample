variable "fw_name" {
  default = ""
}
variable network  {
  default = ""
}
variable "project" {
  default = ""  
}
variable allow_ports {
  type = "list" 
  default = []
}
variable allow_protocol-1 {
  default = "tcp"
}

variable allow_protocol-2 {
  default = "tcp"
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

module  "test_firewall_allow_ssh" {
  source         = "../Modules/google_compute_firewall"
  project        = var.project_id
  fw_name        = "test-allow-ssh"
  network        = module.test_vpc.new_vpc
  priority       = var.priority
  allow_protocol-1 = "tcp"
  allow_protocol-2 = var.allow_protocol-2
  allow_ports    = ["22"] 
  source_tags    = var.source_tags
  target_tags    = ["allow-ssh"]
  source_ranges  = ["192.115.200.197"]   # Office external IP
}

module  "test_firewall_allow_nfs" {
  source         = "../Modules/google_compute_firewall"
  project        = var.project_id
  fw_name        = "test-allow-nfs"
  network        = module.test_vpc.new_vpc
  priority       = var.priority
  allow_protocol-1 = "tcp"
  allow_protocol-2 = "udp"
  allow_ports    = var.allow_ports 
  source_tags    = ["allow-nfs"]
  target_tags    = ["allow-nfs"]
  source_ranges  = var.source_ranges 
}

