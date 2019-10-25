variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "b"
}

variable "gcp_project" {
  default = "dani-playground"
}

variable "credentials" {
  default = "/home/dani/TF_CRED/dani-playground-terraform.json"
}

provider "google" {
  credentials = file(var.credentials)
  project     = var.gcp_project
  region      = var.region
}

