variable project {}

variable instance_name {}
variable machine_type {
    default = ""
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
variable metadata {
    type    = "map"
    default = {}
}

variable additional_disk { default = "no" }
variable second_disk_image { default = "" }

data "google_compute_image" "image" {
  name    = "${element ( split ("/", var.boot_disk_image),1)}"
  project = "${element ( split ("/", var.boot_disk_image),0)}"
}

resource "google_compute_instance" "compute_single_disk" {
  count = "${var.additional_disk == "no" ? 1 : 0 }"
  project      = "${var.project}"  
  name         = "${var.instance_name}"
  machine_type = "${var.machine_type}"       # Optional
  zone         = "${var.zone}"

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
    subnetwork_project = "${var.project}"
    access_config {} 
  }
  
  #attached_disk { source = "${var.second_disk_image}" }

  metadata = "${var.metadata}"
}

resource "google_compute_instance" "compute_additional_disk" {
  count = "${var.additional_disk == "no" ? 0 : 1 }"
  project      = "${var.project}"  
  name         = "${var.instance_name}"
  machine_type = "${var.machine_type}"       # Optional
  zone         = "${var.zone}"

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
    subnetwork_project = "${var.project}"
    access_config {} 
  }
  
  attached_disk { source = "${var.second_disk_image}" }

  metadata = "${var.metadata}"
}
