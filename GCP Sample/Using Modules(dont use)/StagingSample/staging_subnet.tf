module  "staging_subnet" {
  source         = "../../Using Modules/google_compute_subnetwork"
  subnet_vpc = "${module.staging_vpc.new_vpc}"
  subnet_name = "${var.subnet_name}"
  region = "${var.region}"
  subnet_cidr = "${var.subnet_cidr}"
}

