variable "fw_name" {
  default = "test-allow-ssh"
}
variable network  {
  default = ""
}
variable "project" {
  default = ""  
}
variable allow_ports {
  type = "list" 
  default = ["22"]
}
variable allow_protocol {
  default = "TCP"
}
variable source_tags {
  type = "list" 
  default = []
}
variable target_tags {
  type = "list" 
  default = ["allow-ssh"]
}
variable source_ranges {
  type = "list" 
  default = ["192.115.200.197"]
}
variable priority {
  default = "1000"
}

module  "test_firewall_allow_ssh" {
  source         = "../Modules/google_compute_firewall"
  project        = var.project_id
  fw_name        = var.fw_name
  network        = module.test_vpc.new_vpc
  priority       = var.priority
  allow_protocol = var.allow_protocol
  allow_ports    = var.allow_ports 
  source_tags    = var.source_tags
  target_tags    = var.target_tags
  source_ranges  = var.source_ranges
}



