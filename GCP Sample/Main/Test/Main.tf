variable "gcp_credentials" {
  #    description = "Full path to the Service Account json file , keep it in a safe location"
  default = "/home/dani/TF_CRED/dani-playground-terraform.json"
}

variable "project_id" {
  #    description = "The unique name of your project"
  default = "dani-playground"
}

variable "region" {
  #    description = "The name of the region to build resources in"    
  default = "us-central1"
}

variable "zone" {
  #    description = "The name of the zone in the region to build resources in"    
  default = "us-central1-b"
}

provider "google" {
  credentials = file(var.gcp_credentials)

  #  credentials = file("/home/dani/TF_CRED/dani-playground-terraform.json")
  project = var.project_id
  region  = var.region
}

