

data "google_compute_image" "image" {
  family    = "${element ( split ("/", var.boot_disk_image),1)}"
  project = "${element ( split ("/", var.boot_disk_image),0)}"
}

resource "google_compute_instance" "compute_single_disk" {
  count = "${var.additional_disk == "no" ? 1 : 0 }"
  project      = var.project  
  name         = var.instance_name
  machine_type = var.machine_type       # Optional
  zone         = var.zone

  tags         = var.network_tags     # Optional

  boot_disk {
    initialize_params {
      image = data.google_compute_image.image.self_link
      size  = "${var.boot_disk_size > 1 ? var.boot_disk_size : data.google_compute_image.image.disk_size_gb}"        # Optional 
      type  = var.boot_disk_type        # Optional
    }
  }

  network_interface {
    subnetwork         = var.subnetwork
    subnetwork_project = var.project
    access_config {} 
  }
  
    metadata = var.metadata
    metadata_startup_script = var.init_script
}

resource "google_compute_disk" "additional_disk" {
  count = "${var.additional_disk == "no" ? 0 : 1 }"
  name  = "${var.instance_name}-disk-2"
  type  = var.second_disk_type
  zone  = var.zone
  size  = var.second_disk_size
}

resource "google_compute_instance" "compute_additional_disk" {
  count = "${var.additional_disk == "no" ? 0 : 1 }"
  project      = var.project  
  name         = var.instance_name
  machine_type = var.machine_type       # Optional
  zone         = var.zone

  tags         = var.network_tags     # Optional

  boot_disk {
    initialize_params {
      image = data.google_compute_image.image.self_link
      size  = "${var.boot_disk_size > 1 ? var.boot_disk_size : data.google_compute_image.image.disk_size_gb}"        # Optional 
      type  = var.boot_disk_type        # Optional
    }
  }

  network_interface {
    subnetwork         = var.subnetwork
    subnetwork_project = var.project
    access_config {} 
  }
  
  attached_disk { source = google_compute_disk.additional_disk.0.self_link }

  metadata = var.metadata
  metadata_startup_script = var.init_script
}

