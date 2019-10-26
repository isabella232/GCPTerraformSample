
module  "compute_address" {
  source = "../../Using Modules/google_compute_address"
  reserve_int_ip = "${var.reserve_int_ip}"
  vpc_subnet = "${module.staging_subnet.vpc_subnet}"
  subnet_name = "${var.subnet_name}"
}

