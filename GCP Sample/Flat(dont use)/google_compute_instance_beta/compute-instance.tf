variable project {}

variable instance_name {}
variable machine_type {
    default = "n1-standard-1"
}
variable zone {
}
variable network_tags {
    type = "list"
    default = []
}
variable boot_disk_image {
}
variable boot_disk_type {
    default = "pd-standard"
}
variable boot_disk_size {
    default = 1
}
variable subnetwork {  
}
variable subnetwork_project {
}
variable metadata {
    type    = "map"
    default = {}
}

variable hostname {}

data "google_compute_image" "image" {
  name    = "${element ( split ("/", var.boot_disk_image),1)}"
  project = "${element ( split ("/", var.boot_disk_image),0)}"
}

resource "google_compute_instance" "compute" {
  project      = "${var.project}"  
  name         = "${var.instance_name}"
  machine_type = "${var.machine_type}"       # Optional
  zone         = "${var.zone}"
  hostname     = "${var.hostname}" 
  tags         = ["${var.network_tags}"]     # Optional

  boot_disk {
    initialize_params {
      image = "${var.boot_disk_image}"
      size  = "${var.boot_disk_size > 1 ? var.boot_disk_size : data.google_compute_image.image.disk_size_gb}"        # Optional 
      type  = "${var.boot_disk_type}"        # Optional
    }
  }

  network_interface {
    subnetwork         = "${var.subnetwork}"
    subnetwork_project = "${var.subnetwork_project}"
    access_config {} 
  }

  metadata = "${var.metadata}"
}

output private_ip {
  value = "${google_compute_instance.compute.network_interface.0.address}"
}

output public_ip {
  value = "${google_compute_instance.compute.network_interface.0.access_config.0.assigned_nat_ip}"
}
