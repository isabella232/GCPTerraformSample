### Using GCS (Google Storage Bucket) to store state files.

1.  Create a new bucket 
2.  Give the created service account the appropriate permissions. 
3.   Service account needs devstorage.read_write scope and WRITER permissions on the bucket.
4.  Create a reference to the bucket for terraform.

Here is a sample of GCS backend file:

gcs_state.tf

```
terraform {
  backend "gcs" {
    bucket  = "tf-state-sample"
    prefix  = "terraform/state"
  }
}
```

If you are using Github (or similar) to store the Terraform files, it’s highly recommended that it will not include the credentials file (JSON). You can store it in a folder outside the current directory tree.