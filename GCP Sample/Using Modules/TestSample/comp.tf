module  "compute_instance" {
  source         = "../../Using Modules/google_compute"

  instance_name = "${var.instance_name}"
  machine_type = "${var.machine_type}"
  zone = "${var.region}-${var.zone}"
  boot_disk_image = "${var.boot_disk_image}"
  boot_disk_size = "${var.boot_disk_size}"
  subnetwork = "${var.subnet_name}"
  project = "${var.gcp_project}"
  additional_disk = "yes" 
  second_disk_image = "dani-playground/centos7"
  }