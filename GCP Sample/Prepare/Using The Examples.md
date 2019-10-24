

Terraform Modules registry:
https://registry.terraform.io/browse/modules?provider=google&verified=true

Google Cloud own Terraform modules:

https://github.com/terraform-google-modules

Google Cloud Terraform examples:

https://github.com/GoogleCloudPlatform/terraform-google-examples

Not everything needs to be a module:
See "When to Write a module"  https://www.terraform.io/docs/modules/index.html#when-to-write-a-module

The primary Google provider: https://www.terraform.io/docs/providers/google/index.html

Google Cloud Platform Data Sources:
  Data Sources are a reference to existing resources and can be used just like resources.

Google Cloud Platform Resources:
     	Resources have an exact match with google APIs. Resources are divided into categories.  		

​		Many resources have an API reference and a link to the relevant documentation.

My Example:

- Create new VPC 
- Create new subnet
- Create new Compute Instance with 2 disks and install as NFS server. Use the VPC and subnet created.
- Create new Compute Instance and install as NFS client. Use the VPC and subnet created.
- Create firewall rule to allow connection between the two VM’s.
- Create firewall rule to allow remote ssh connection from known external IP to the VM’s. 