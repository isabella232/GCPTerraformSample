### Using GCS (Google Storage Bucket) to store state files.

1.  Create a new bucket 

2. Give the created service account the appropiate premissions. 

   ​	Service account need devstorage.read_write scope and WRITER permissions on the bucket.

3. Create a refference to the bucket for terraform.



Here is a sample of GCS backend file:

gcs_state.tf

```
terraform {
  backend "gcs" {
  
    credentials = "${file("${var.credentials}")}"
    bucket  = "tf-state-sample"
    prefix  = "terraform/state"
  }
}

```

If you are using Github (or similar) to store the Terraform files it’s recommended that it will not include the credentials file (JSON). You can store it in an upper folder but remember that the path to it is relative to current directory.