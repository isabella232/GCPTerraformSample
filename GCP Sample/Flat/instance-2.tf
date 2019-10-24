resource "google_compute_instance" "sample-instance-1" {
  name         = "test"
  machine_type = "n1-standard-1"
  zone         = "us-central1-b"

  tags = ["sample-1"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
Argument Reference:
The following arguments are supported:

boot_disk - (Required) The boot disk for the instance. Structure is documented below.
    The boot_disk block supports:
    auto_delete - (Optional) (Default true) Whether the disk will be auto-deleted when the instance is deleted. 
    device_name - (Optional) Name with which attached disk will be accessible. On the instance, this device will be /dev/disk/by-id/google-{{device_name}}.
    mode - (Optional) (Default READ_WRITE) The mode in which to attach this disk, either READ_WRITE or READ_ONLY. 
    disk_encryption_key_raw - (Optional) A 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to encrypt this disk. Only one of kms_key_self_link and 
        disk_encryption_key_raw may be set.
    kms_key_self_link - (Optional) The self_link of the encryption key that is stored in Google Cloud KMS to encrypt this disk. Only one of kms_key_self_link and 
        disk_encryption_key_raw may be set.
    initialize_params - (Optional) Parameters for a new disk that will be created alongside the new instance. Either initialize_params or source must be set. Structure is 
        documented below:
        The initialize_params block supports:
        size - (Optional) The size of the image in gigabytes. If not specified, it will inherit the size of its base image.
        type - (Optional) The GCE disk type. May be set to pd-standard or pd-ssd.
        image - (Optional) The image from which to initialize this disk. This can be one of: the image's self_link, projects/{project}/global/images/{image},   
            projects/{project}/global/images/family/{family}, global/images/{image}, global/images/family/{family}, family/{family}, {project}/{family}, {project}/{image},
            {family}, or {image}. If referred by family, the images names must include the family name. If they don't, use the google_compute_image data source. For instance, 
            the image centos-6-v20180104 includes its family name centos-6. These images can be referred by family name here.
        source - (Optional) The name or self_link of the existing disk (such as those managed by google_compute_disk) or disk image. To create an instance from a snapshot, 
            first create a google_compute_disk from a snapshot and reference it here.
Sample:
            boot_disk {
                auto_delete = "true"
                device_name = "vpn-test-1"
                initialize_params {
                    image = "https://www.googleapis.com/compute/v1/projects/dani-playground/global/images/vpn-test"
                    size = "10"
                    type = "pd-standard" }
                mode = "READ_WRITE"
                source = "https://www.googleapis.com/compute/v1/projects/dani-playground/zones/us-central1-b/disks/vpn-test-1" }
            

machine_type - (Required) The machine type to create.
    https://cloud.google.com/compute/docs/machine-types#predefined_machine_types
    Custom machine types can be formatted as custom-NUMBER_OF_CPUS-AMOUNT_OF_MEMORY_MB, e.g. custom-6-20480 for 6 vCPU and 20GB of RAM.
    There is a limit of 6.5 GB per CPU unless you add extended memory. You must do this explicitly by adding the suffix -ext, e.g. custom-2-15360-ext for 2 vCPU and 15 
        GB of memory.
Sample:
            machine_type = "n1-standard-1"        

name - (Required) A unique name for the resource, required by GCE. Changing this forces a new resource to be created.
Sample:
            name = "vpn-test-1"

zone - (Required) The zone that the machine should be created in.
Sample:
            zone = "us-central1-b"

network_interface - (Required) Networks to attach to the instance. This can be specified multiple times. Structure is documented below.
    The network_interface block supports:
    network - (Optional) The name or self_link of the network to attach this interface to. Either network or subnetwork must be provided.
    subnetwork - (Optional) The name or self_link of the subnetwork to attach this interface to. The subnetwork must exist in the same region this instance will be 
        created in. Either network or subnetwork must be provided.
    subnetwork_project - (Optional) The project in which the subnetwork belongs. If the subnetwork is a self_link, this field is ignored in favor of the project defined 
        in the subnetwork self_link. If the subnetwork is a name and this field is not provided, the provider project is used.
    network_ip - (Optional) The private IP address to assign to the instance. If empty, the address will be automatically assigned.
    access_config - (Optional) Access configurations, i.e. IPs via which this instance can be accessed via the Internet. Omit to ensure that the instance is not accessible 
        from the Internet. If omitted, ssh provisioners will not work unless Terraform can send traffic to the instance's network (e.g. via tunnel or because it is running 
        on another cloud instance on that network). This block can be repeated multiple times. 
        Structure documented below:
            The access_config block supports:
            nat_ip - (Optional) The IP address that will be 1:1 mapped to the instance's network ip. If not given, one will be generated.
            public_ptr_domain_name - (Optional) The DNS domain name for the public PTR record. To set this field on an instance, you must be verified as the owner of the 
                domain. See the docs for how to become verified as a domain owner.
            network_tier - (Optional) The networking tier used for configuring this instance. This field can take the following values: PREMIUM or STANDARD. If this field 
                is not specified, it is assumed to be PREMIUM.
Sample:
            network_interface
              {
                access_config
                  {
                    "network_tier": "PREMIUM",
                  }
                name = "nic0",
                network = "default"
                subnetwork = "default"
                subnetwork_project = "dani-playground"
              }

alias_ip_range - (Optional) An array of alias IP ranges for this network interface. Can only be specified for network interfaces on subnet-mode networks. 
Structure documented below:
The alias_ip_range block supports:
    ip_cidr_range - The IP CIDR range represented by this alias IP range. This IP CIDR range must belong to the specified subnetwork and cannot contain IP addresses 
        reserved by system or used by other network interfaces. This range may be a single IP address (e.g. 10.2.3.4), a netmask (e.g. /24) or a CIDR format 
        string (e.g. 10.1.2.0/24).
    subnetwork_range_name - (Optional) The subnetwork secondary range name specifying the secondary range from which to allocate the IP CIDR range for this alias IP range. 
        If left unspecified, the primary range of the subnetwork will be used.

allow_stopping_for_update - (Optional) If true, allows Terraform to stop the instance to update its properties. If you try to update a property that requires stopping 
    the instance without setting this field, the update will fail.

attached_disk - (Optional) Additional disks to attach to the instance. Can be repeated multiple times for multiple disks. 
Structure is documented below:
The attached_disk block supports:
    source - (Required) The name or self_link of the disk to attach to this instance.
    device_name - (Optional) Name with which the attached disk will be accessible under /dev/disk/by-id/
    mode - (Optional) (Default "READ_WRITE") Either "READ_ONLY" or "READ_WRITE", If you have a persistent disk with data that you want to share between multiple 
        instances, detach it from any read-write instances and attach it to one or more instances in read-only mode.
    disk_encryption_key_raw - (Optional) A 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to encrypt this disk. Only one of kms_key_self_link and 
        disk_encryption_key_raw may be set.
    kms_key_self_link - (Optional) The self_link of the encryption key that is stored in Google Cloud KMS to encrypt this disk. Only one of kms_key_self_link and 
        disk_encryption_key_raw may be set.
Sample:
            attached_disk
              {
                device_name = "vpn-1-new-disk"
                mode = "READ_WRITE"
                source = "https://www.googleapis.com/compute/v1/projects/dani-playground/zones/us-central1-b/disks/vpn-1-new-disk"
              }

can_ip_forward - (Optional) (Default false) Whether to allow sending and receiving of packets with non-matching source or destination IPs. 
Sample:
            can_ip_forward = "false"

description - (Optional) A brief description of this resource.

deletion_protection - (Optional) (Default false) Enable deletion protection on this instance. Note: you must disable deletion protection before removing the 
    resource (e.g., via terraform destroy), or the instance cannot be deleted and the Terraform run will not complete successfully.
Sample:
            deletion_protection = "false"

hostname - (Optional) A custom hostname for the instance. Must be a fully qualified DNS name and RFC-1035-valid. Valid format is a series of labels 1-63 characters 
    long matching the regular expression [a-z]([-a-z0-9]*[a-z0-9]), concatenated with periods. The entire hostname must not exceed 253 characters. Changing this 
    forces a new resource to be created.

guest_accelerator - (Optional) List of the type and count of accelerator cards attached to the instance. Structure documented below. Note: GPU accelerators can only be 
    used with on_host_maintenance option set to TERMINATE.

labels - (Optional) A map of key/value label pairs to assign to the instance.
Sample: 
            labels {
              "tf" = "yes"
            }

metadata - (Optional) Metadata key/value pairs to make available from within the instance. Ssh keys attached in the Cloud Console will be removed. Add them to your 
    config in order to keep them attached to your instance.
    On import, metadata_startup_script will be set while metadata.startup-script will not be. You'll need to match metadata_startup_script to your startup-script value.
Sample:
            metadata {
              "serial-port-enable" = "true"
            }

metadata_startup_script - (Optional) An alternative to using the startup-script metadata key, except this one forces the instance to be recreated (thus re-running the 
    script) if it is changed. This replaces the startup-script metadata key on the created instance and thus the two mechanisms are not allowed to be used simultaneously.
Sample:
      metadata_startup_script = "#! /bin/bash
                                apt-get update
                                apt-get install -y apache2
                                cat \u003c\u003cEOF \u003e /var/www/html/index.html
                                003chtml\u003e\u003cbody\u003e\u003ch1\u003eHello World\u003c/h1\u003e
                                \u003cp\u003eThis page was created from a simple startup script!\u003c/p\u003e
                                \u003c/body\u003e\u003c/html\u003e"

min_cpu_platform - (Optional) Specifies a minimum CPU platform for the VM instance. Applicable values are the friendly names of CPU platforms, such as Intel Haswell 
    or Intel Skylake. See the complete list here. Note: allow_stopping_for_update must be set to true in order to update this field.

project - (Optional) The ID of the project in which the resource belongs. If it is not provided, the provider project is used.
Sample:
            project = "dani-playground"

scheduling - (Optional) The scheduling strategy to use. 
More details about this configuration option are detailed below:
The scheduling block supports:
    preemptible - (Optional) (Default false) Specifies if the instance is preemptible. If this field is set to true, then automatic_restart must be set to false. 
    on_host_maintenance - (Optional) Describes maintenance behavior for the instance. Can be MIGRATE or TERMINATE, for more info, read here.
    automatic_restart - (Optional) (Default true) Specifies if the instance should be restarted if it was terminated by Compute Engine (not a user). 
    node_affinities - (Optional) Specifies node affinities or anti-affinities to determine which sole-tenant nodes your instances and managed instance groups 
        will use as host systems. Read more on sole-tenant node creation here. 
        Structure documented below:
            The node_affinities block supports:
            key (Required) - The key for the node affinity label.
            operator (Required) - The operator. Can be IN for node-affinities or NOT for anti-affinities.
            value (Required) - The values for the node affinity label.
Sample:
            scheduling
              {
                automatic_restart = "true"
                on_host_maintenance = "MIGRATE"
                preemptible = "false"
              }

scratch_disk - (Optional) Scratch disks to attach to the instance. This can be specified multiple times for multiple scratch disks. 
    Structure is documented below:
    The scratch_disk block supports:
    interface - (Optional) (Default SCSI) The disk interface to use for attaching this disk; either SCSI or NVME. 

service_account - (Optional) Service account to attach to the instance. 
    Structure is documented below: (Note: allow_stopping_for_update must be set to true in order to update this field.)
    The service_account block supports:
    scopes - (Required) A list of service scopes. Both OAuth2 URLs and gcloud short names are supported. To allow full access to all Cloud APIs, use the cloud-platform 
        scope. See a complete list of scopes here. Note: allow_stopping_for_update must be set to true in order to update this field.
    email - (Optional) The service account e-mail address. If not given, the default Google Compute Engine service account is used. Note: allow_stopping_for_update 
        must be set to true in order to update this field.
Sample:
            service_account
              {
                email = "terraform@dani-playground.iam.gserviceaccount.com"
                scopes [
                  "https://www.googleapis.com/auth/cloud-platform"]
              }

tags - (Optional) A list of tags to attach to the instance.
Sample:
            tags [
              "vpn-1-nw-tag"
            ]

shielded_instance_config - (Optional) (Default disabled) Enable Shielded VM on this instance. Shielded VM provides verifiable integrity to prevent against malware and rootkits.  
    Structure is documented below: (Note: shielded_instance_config can only be used with boot images with shielded vm support. See the complete list here.)
    The shielded_instance_config block supports:
    enable_secure_boot (Optional) (Default false) -- Verify the digital signature of all boot components, and halt the boot process if signature verification fails. 
    enable_vtpm (Optional) (Default true) -- Use a virtualized trusted platform module, which is a specialized computer chip you can use to encrypt objects like keys and 
        certificates. 
    enable_integrity_monitoring (Optional) (Default true) -- Compare the most recent boot measurements to the integrity policy baseline and return a pair of pass/fail results 
        depending on whether they match or not. 