variable network  {
  default = ""
}
variable "project" {  
}

variable fw_name {
  default = ""
}
variable allow_ports {
  type = "list" 
  default = []
}
variable allow_protocol-1 {
  default = ""
}
variable allow_protocol-2 {
  default = ""
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
