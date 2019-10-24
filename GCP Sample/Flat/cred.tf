variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-b"
}

variable "gcp_project" {
  default = "dani-playground"
}

variable "svc_credentials" {
  default = "../Cred/terraform-service-account.json"
}

provider "google" {
  credentials = var.svc_credentials
  project = var.gcp_project
  region  = var.region
}

provider "google-beta" {
  credentials = var.svc_credentials
  project = var.gcp_project
  region  = var.region
}

