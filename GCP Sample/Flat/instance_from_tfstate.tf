
    {
      "mode": "managed",
      "type": "google_compute_instance",
      "name": "vpn-test-1",
      "provider": "provider.google",

      "instances": [
        {
          "schema_version": 6,
          "attributes": {
            "allow_stopping_for_update": null,
            "attached_disk": [],
            "boot_disk": [
              {
                "auto_delete": true,
                "device_name": "vpn-test-1",
                "disk_encryption_key_raw": "",
                "disk_encryption_key_sha256": "",
                "initialize_params": [
                  {
                    "image": "https://www.googleapis.com/compute/v1/projects/dani-playground/global/images/vpn-test",
                    "labels": {},
                    "size": 10,
                    "type": "pd-standard"
                  }
                ],
                "kms_key_self_link": "",
                "mode": "READ_WRITE",
                "source": "https://www.googleapis.com/compute/v1/projects/dani-playground/zones/us-central1-b/disks/vpn-test-1"
              }
            ],
            "can_ip_forward": false,
            "cpu_platform": "Intel Haswell",
            "deletion_protection": false,
            "description": "",
            "disk": [],
            "guest_accelerator": [],
            "hostname": "",
            "id": "vpn-test-1",
            "instance_id": "5905461776570225828",
            "label_fingerprint": "42WmSpB8rSM=",
            "labels": {},
            "machine_type": "n1-standard-1",
            "metadata": {},
            "metadata_fingerprint": "iMSwFEW1-Ok=",
            "metadata_startup_script": "",
            "min_cpu_platform": "",
            "name": "vpn-test-1",
            "network_interface": [
              {
                "access_config": [
                  {
                    "assigned_nat_ip": "",
                    "nat_ip": "35.224.199.122",
                    "network_tier": "PREMIUM",
                    "public_ptr_domain_name": ""
                  }
                ],
                "address": "",
                "alias_ip_range": [],
                "name": "nic0",
                "network": "https://www.googleapis.com/compute/v1/projects/dani-playground/global/networks/default",
                "network_ip": "10.128.0.91",
                "subnetwork": "https://www.googleapis.com/compute/v1/projects/dani-playground/regions/us-central1/subnetworks/default",
                "subnetwork_project": "dani-playground"
              }
            ],
            "project": "dani-playground",
            "scheduling": [
              {
                "automatic_restart": true,
                "node_affinities": [],
                "on_host_maintenance": "MIGRATE",
                "preemptible": false
              }
            ],
            "scratch_disk": [],
            "self_link": "https://www.googleapis.com/compute/v1/projects/dani-playground/zones/us-central1-b/instances/vpn-test-1",
            "service_account": [
              {
                "email": "1020012444732-compute@developer.gserviceaccount.com",
                "scopes": [
                  "https://www.googleapis.com/auth/devstorage.read_only",
                  "https://www.googleapis.com/auth/logging.write",
                  "https://www.googleapis.com/auth/monitoring.write",
                  "https://www.googleapis.com/auth/service.management.readonly",
                  "https://www.googleapis.com/auth/servicecontrol",
                  "https://www.googleapis.com/auth/trace.append"
                ]
              }
            ],
            "shielded_instance_config": [],
            "tags": [],
            "tags_fingerprint": "42WmSpB8rSM=",
            "timeouts": {
              "create": null,
              "delete": null,
              "update": null
            },
            "zone": "us-central1-b"
          },
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiNiJ9"
        }
      ]
    },
    {
      "mode": "managed",
      "type": "google_compute_instance",
      "name": "vpn-test-2",
      "provider": "provider.google",
      "instances": [
        {
          "schema_version": 6,
          "attributes": {
            "allow_stopping_for_update": null,
            "attached_disk": [
              {
                "device_name": "vpn-1-new-disk",
                "disk_encryption_key_raw": "",
                "disk_encryption_key_sha256": "",
                "kms_key_self_link": "",
                "mode": "READ_WRITE",
                "source": "https://www.googleapis.com/compute/v1/projects/dani-playground/zones/us-central1-b/disks/vpn-1-new-disk"
              }
            ],
            "boot_disk": [
              {
                "auto_delete": true,
                "device_name": "vpn-test-1",
                "disk_encryption_key_raw": "",
                "disk_encryption_key_sha256": "",
                "initialize_params": [
                  {
                    "image": "https://www.googleapis.com/compute/v1/projects/dani-playground/global/images/vpn-test",
                    "labels": {},
                    "size": 10,
                    "type": "pd-standard"
                  }
                ],
                "kms_key_self_link": "",
                "mode": "READ_WRITE",
                "source": "https://www.googleapis.com/compute/v1/projects/dani-playground/zones/us-central1-b/disks/vpn-test-1"
              }
            ],
            "can_ip_forward": false,
            "cpu_platform": "Intel Haswell",
            "deletion_protection": false,
            "description": "",
            "disk": [],
            "guest_accelerator": [],
            "hostname": "",
            "id": "vpn-test-1",
            "instance_id": "5905461776570225828",
            "label_fingerprint": "15_cis1gkbU=",
            "labels": {
              "tf": "yes"
            },
            "machine_type": "n1-standard-1",
            "metadata": {
              "serial-port-enable": "true"
            },
            "metadata_fingerprint": "6AfJDgSzO6M=",
            "metadata_startup_script": "#! /bin/bash\napt-get update\napt-get install -y apache2\ncat \u003c\u003cEOF \u003e /var/www/html/index.html\n\u003chtml\u003e\u003cbody\u003e\u003ch1\u003eHello World\u003c/h1\u003e\n\u003cp\u003eThis page was created from a simple startup script!\u003c/p\u003e\n\u003c/body\u003e\u003c/html\u003e",
            "min_cpu_platform": "",
            "name": "vpn-test-1",
            "network_interface": [
              {
                "access_config": [
                  {
                    "assigned_nat_ip": "",
                    "nat_ip": "35.222.209.238",
                    "network_tier": "PREMIUM",
                    "public_ptr_domain_name": ""
                  }
                ],
                "address": "",
                "alias_ip_range": [],
                "name": "nic0",
                "network": "https://www.googleapis.com/compute/v1/projects/dani-playground/global/networks/default",
                "network_ip": "10.128.0.91",
                "subnetwork": "https://www.googleapis.com/compute/v1/projects/dani-playground/regions/us-central1/subnetworks/default",
                "subnetwork_project": "dani-playground"
              }
            ],
            "project": "dani-playground",
            "scheduling": [
              {
                "automatic_restart": true,
                "node_affinities": [],
                "on_host_maintenance": "MIGRATE",
                "preemptible": false
              }
            ],
            "scratch_disk": [],
            "self_link": "https://www.googleapis.com/compute/v1/projects/dani-playground/zones/us-central1-b/instances/vpn-test-1",
            "service_account": [
              {
                "email": "terraform@dani-playground.iam.gserviceaccount.com",
                "scopes": [
                  "https://www.googleapis.com/auth/cloud-platform"
                ]
              }
            ],
            "shielded_instance_config": [],
            "tags": [
              "vpn-1-nw-tag"
            ],
            "tags_fingerprint": "IEyPWjIn0cI=",
            "timeouts": {
              "create": null,
              "delete": null,
              "update": null
            },
            "zone": "us-central1-b"
          },
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiNiJ9"
        }
      ]
    }
  ]
}
