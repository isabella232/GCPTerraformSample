variable "prod_vpc" {
  default = "prod-vpc"
}

variable "subnet_vpc" {
  default = ""
}

variable "subnet_name" {
  default = "prod-subnet"
}

variable "subnet_cidr" {
  default = "10.12.0.0/16"
}

module "prod_vpc" {
  source   = "../Modules/google_compute_network-vpc"
  vpc_name = var.prod_vpc
}



module "prod_subnet" {
  source      = "../Modules/google_compute_subnetwork"
  subnet_vpc  = module.prod_vpc.new_vpc
  subnet_name = var.subnet_name
  region      = var.region
  subnet_cidr = var.subnet_cidr
}

output "new_vpc" {
  value = module.prod_vpc.new_vpc
}

output "prod_vpc_subnet" {
  value = module.prod_subnet.vpc_subnet
}


