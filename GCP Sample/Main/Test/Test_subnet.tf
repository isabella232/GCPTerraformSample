variable "subnet_vpc" {
  default = ""
}

variable "subnet_name" {
  default = "test-subnet"
}

variable "subnet_cidr" {
  default = "10.12.0.0/16"
}

module "test_subnet" {
  source      = "../Modules/google_compute_subnetwork"
  subnet_vpc  = module.test_vpc.new_vpc
  subnet_name = var.subnet_name
  region      = var.region
  subnet_cidr = var.subnet_cidr
}

output "test_vpc_subnet" {
  value = module.test_subnet.vpc_subnet
}


