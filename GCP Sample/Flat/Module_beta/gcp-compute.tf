module compute_test {
    source = "../google_compute_instance_beta"
# Required
  project            = "dani-playground"
  instance_name      = "test-instance"
  machine_type       = "n1-standard-1"
  zone               = "us-central1-b"
  boot_disk_image    = "centos-cloud/centos-7-v20180716"     # project/image_name
  subnetwork         = "othersubnet"  
  subnetwork_project = "dani-playground"
  hostname           = "new-beta-hostname"

# Optional
#  network_tags = ["tag1","tag2"]
#  boot_disk_type = "pd-ssd"                                 # pd-standard or pd-ssd
#  boot_disk_size = "60"                                     # Default is the original image size
#  metadata = {"key1" = "data1","key2" = "data2"}
}

output private_ip {
  value = "${module.compute_test.private_ip}"
}

output public_ip {
  value = "${module.compute_test.public_ip}"
}




/*
*Argument Reference
 The following arguments are supported:
! boot_disk - (Required) The boot disk for the instance. Structure is documented below.
! machine_type - (Required) (n1-standard-1) The machine type to create.
! name - (Required) A unique name for the resource, required by GCE. Changing this forces a new resource to be created.
! zone - (Required) The zone that the machine should be created in.
! network_interface - (Required) Networks to attach to the instance. This can be specified multiple times. Structure is documented below.
! network - (Required) The name or self_link of the network to attach this interface to. Either network or subnetwork must be provided.
! subnetwork - (Required) The name or self_link of the subnetwork to attach this interface to. The subnetwork must exist in the same region this instance will be created in. Either network or subnetwork must be provided.
! subnetwork_project - (Required) The project in which the subnetwork belongs. If the subnetwork is a self_link, this field is ignored in favor of the project defined in the subnetwork self_link. If the subnetwork is a name and this field is not provided, the provider project is used.
! project - (Required) The ID of the project in which the resource belongs. If it is not provided, the provider project is used.

  can_ip_forward - (Optional) (false) Whether to allow sending and receiving of packets with non-matching source or destination IPs.
  description - (Optional) A brief description of this resource.
  tags - (Optional) A list of network tags to attach to the instance.

  labels - (Optional) A set of key/value label pairs to assign to the instance.
  metadata - (Optional) Metadata key/value pairs to make available from within the instance.

size - (Optional) The size of the image in gigabytes. If not specified, it will inherit the size of its base image.

type - (Optional) The GCE disk type. May be set to pd-standard or pd-ssd.

image - (Optional) The image from which to initialize this disk. This can be one of: the image's self_link, projects/{project}/global/images/{image}, projects/{project}/global/images/family/{family}, global/images/{image}, global/images/family/{family}, family/{family}, {project}/{family}, {project}/{image}, {family}, or {image}. If referred by family, the images names must include the family name. If they don't, use the google_compute_image data source. For instance, the image centos-6-v20180104 includes its family name centos-6. These images can be referred by family name here.

*Attributes Reference
  In addition to the arguments listed above, the following computed attributes are exported:
   instance_id - The server-assigned unique identifier of this instance.
   self_link - The URI of the created resource.
   network_interface.0.address - The internal ip address of the instance, either manually or dynamically assigned.
   network_interface.0.access_config.0.assigned_nat_ip - If the instance has an access config, either the given external ip (in the nat_ip field) or the ephemeral (generated) ip (if you didn't provide one).
*/