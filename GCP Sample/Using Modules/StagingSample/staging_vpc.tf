module  "staging_vpc" {
  source         = "../../Using Modules/google_compute_network-vpc"
  vpc_name = "${var.vpc_name}"
}  

