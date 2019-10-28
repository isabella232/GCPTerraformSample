output "internal_ip" {
  value = "${var.additional_disk == "no" ? google_compute_instance.compute_single_disk.0.network_interface.0.network_ip : google_compute_instance.compute_additional_disk.0.network_interface.0.network_ip}"
} 

output "external_ip" {
  value = "${var.additional_disk == "no" ? google_compute_instance.compute_single_disk.0.network_interface.0.access_config.0.nat_ip : google_compute_instance.compute_additional_disk.0.network_interface.0.access_config.0.nat_ip}"
} 

output "instance_name" {
  value = var.instance_name
}


