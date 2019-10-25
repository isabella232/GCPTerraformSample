variable "test_vpc" {
    default = "testing-vpc" 
}
module  "test_vpc" {
  source         = "../Modules/google_compute_network-vpc"
  vpc_name = "${var.test_vpc}"
} 

