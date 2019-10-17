

Modules registry:
https://registry.terraform.io/browse/modules?provider=google&verified=true

See "When to Write a module"  https://www.terraform.io/docs/modules/index.html#when-to-write-a-module

The main Google provider: https://www.terraform.io/docs/providers/google/index.html

Google Cloud Platform Data Sources:
  Data Sources are referance to existing resources and can be used just like resorces.   

Google Cloud Platform Resources:
  Resources have exact match with google APIs. Resouces are divided to categories.
  Many resources has an API reference and a link to the relevent documentation.

The Flat directory has a single directory with all resources files in it. Terraform will automaticaly deploy the elements in the right order and even use parllelism when it can. 

The "Using Modules" directory is an example of using modules.  

In this module, we‘re creating a new compute instance and apply firewall rules to access this instance on port 80 and 22. We pass to the module the following parameters:

Instance Name,Instance Type,disk size,disk type,fw port list.

