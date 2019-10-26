variable region {
    default = "us-central1"
}
variable zone {
    default = "b"
}
variable gcp_project {
    default = "dani-playground"
}
variable credentials {
    default = "terraform-dani-playground.json"
}

provider "google" {
  credentials = "${file("${var.credentials}")}"
  project     = "${var.gcp_project}"
  region      = "${var.region}"
}
