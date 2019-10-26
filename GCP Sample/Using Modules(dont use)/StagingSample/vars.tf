variable "reserve_int_ip" { 
    default = "10.31.1.7"
}

variable "fw_name" {
    default = "fw-rule-01"
}

variable "my_vpc" {
    default = "new-vpc" 
}

variable "instance_name" {
    default = "c-instance-01"
}

variable "machine_type" {
  default = "n1-standard-1"
}

variable "boot_disk_image" {
  default = "debian-cloud/debian-9-stretch-v20180911"
}

variable "boot_disk_size" {
    default = "30"
}
variable "vpc_name" {
    default = "my-staging-network"
}

variable "subnet_name" {
    default = "staging-subnet-01"
}

variable "subnet_cidr" {
    default = "10.31.0.0/16"
}
