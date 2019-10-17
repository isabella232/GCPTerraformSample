terraform {
  backend "gcs" {
    credentials = "/mnt/c/Clients/DoiT/Terraform on GCP/GCP Sample/Flat/terraform-service-account.json" 
    bucket  = "tf-state-sample"
    prefix  = "terraform/state"
  }
}
