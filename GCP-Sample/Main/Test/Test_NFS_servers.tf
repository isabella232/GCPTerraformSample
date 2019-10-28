variable "instance_name" {
    default = "test-nfs"
}

variable "machine_type" {
  default = "n1-standard-1"
}

variable "server_init_script_file" {
  default = "./nfs_server_init_script"
}

variable "client_init_script_file" {
  default = "./nfs_client_init_script"
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
  default = ""
}

module  "Test_NFS_server" {
  source         = "../Modules/google_compute"

  instance_name = "${var.instance_name}-server"
  machine_type = var.machine_type
  zone = var.zone
  boot_disk_image = var.boot_disk_image
  boot_disk_size = var.boot_disk_size
  boot_disk_type = var.boot_disk_type
  subnetwork = module.test_subnet.vpc_subnet
  project = var.project_id
  additional_disk = "var.second_disk "
  second_disk_image = var.second_disk_image
  second_disk_size = var.second_disk_size
  second_disk_type = var.second_disk_type 
  network_tags = var.network_tags
  init_script = file(var.server_init_script_file)
  }

module  "Test_NFS_client" {
  source         = "../Modules/google_compute"

  instance_name = "${var.instance_name}-client"
  machine_type = var.machine_type
  zone = var.zone
  boot_disk_image = var.boot_disk_image
  boot_disk_size = var.boot_disk_size
  boot_disk_type = var.boot_disk_type
  subnetwork = module.test_subnet.vpc_subnet
  project = var.project_id
  additional_disk = "no" 
  second_disk_image = var.second_disk_image
  second_disk_size = var.second_disk_size
  second_disk_type = var.second_disk_type 
  network_tags = var.network_tags
  init_script = file(var.client_init_script_file)
  metadata = {nfs-server-name = "${module.Test_NFS_server.instance_name}"}
  }


output "internal_ip_server" {
  value = module.Test_NFS_server.internal_ip
} 

output "external_ip_server" {
  value = module.Test_NFS_server.external_ip
} 

output "instance_name_server" {
  value = module.Test_NFS_server.instance_name
}

output "internal_ip_client" {
  value = module.Test_NFS_client.internal_ip
} 

output "external_ip_client" {
  value = module.Test_NFS_client.external_ip
} 

output "instance_name_client" {
  value = module.Test_NFS_client.instance_name
}



