module  "compute_instance" {
  source         = "../../Using Modules/google_compute_instance"

  instance_name = "${var.instance_name}"
  machine_type = "${var.machine_type}"
  zone = "${var.region}-${var.zone}"
  boot_disk_image = "${var.boot_disk_image}"
  boot_disk_size = "${var.boot_disk_size}"
  subnetwork = "${module.staging_subnet.vpc_subnet}"
  project = "${var.gcp_project}"
  is-private ="false"
}

