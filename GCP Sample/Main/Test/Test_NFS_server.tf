variable "instance_name" {
    default = "test-nfs-server"
}

variable "machine_type" {
  default = "n1-standard-1"
}

variable "boot_disk_image" {
  default = "debian-cloud/debian-9"
}

variable "boot_disk_size" {
    default = "30"
}

variable "boot_disk_type" {
  default = "pd-standard"
}

variable "second_disk" {
   default = "yes"
}

variable "second_disk_image" {
   default = ""
}
variable "second_disk_size" {
   default = "100"
}

variable "second_disk_type" {
  default = "pd-standard"
}

variable "network_tags" {  # Use when building firewall rules
   type = "list"
   default = ["allow-ssh","allow-nfs"]
}

variable "init_script" {
  default = "ls -la / \n whoami \n"
}

module  "Test_NFS_server" {
  source         = "../Modules/google_compute"

  instance_name = var.instance_name
  machine_type = var.machine_type
  zone = var.zone
  boot_disk_image = var.boot_disk_image
  boot_disk_size = var.boot_disk_size
  boot_disk_type = var.boot_disk_type
  subnetwork = module.test_subnet.vpc_subnet
  project = var.project_id
  additional_disk = var.second_disk 
  second_disk_image = var.second_disk_image
  second_disk_size = var.second_disk_size
  second_disk_type = var.second_disk_type 
  network_tags = var.network_tags
  init_script = var.init_script
  }